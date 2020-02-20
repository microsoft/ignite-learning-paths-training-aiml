import json
import os 
import shutil
import argparse
from pathlib import Path
from nltk import flatten
from azureml.core import Run
from sklearn.metrics import f1_score
from azureml.core.model import Model

# Load NLP Architect
from nlp_architect.models.absa.train.train import TrainSentiment
from nlp_architect.models.absa.inference.inference import SentimentInference

# Inputs
parser = argparse.ArgumentParser(description='ABSA Train')
parser.add_argument('--data_folder', type=str, dest='data_folder', help='data folder mounting point')
parser.add_argument('--asp_thresh', type=int, default=3)
parser.add_argument('--op_thresh', type=int, default=2)
parser.add_argument('--max_iter', type=int, default=3)
parser.add_argument('--large', type=str, default="no")

args = parser.parse_args()

# Download ABSA dependencies including spacy parser and glove embeddings 
from spacy.cli.download import download as spacy_download
from nlp_architect.utils.io import uncompress_file
from nlp_architect.models.absa import TRAIN_OUT, LEXICONS_OUT

spacy_download('en')
GLOVE_ZIP = os.path.join(args.data_folder, 'clothing_data/glove.840B.300d.zip')
EMBEDDING_PATH = TRAIN_OUT / 'word_emb_unzipped' / 'glove.840B.300d.txt'


uncompress_file(GLOVE_ZIP, Path(EMBEDDING_PATH).parent)

clothing_train = os.path.join(args.data_folder, 'clothing_data/clothing_absa_train_small.csv')

if args.large == 'yes':
    print(f'Using large dataset: clothing_data/clothing_absa_train.csv')
    clothing_train = os.path.join(args.data_folder, 'clothing_data/clothing_absa_train.csv')
else:
    print(f'Using small dataset: clothing_data/clothing_absa_train_small.csv')
    clothing_train = os.path.join(args.data_folder, 'clothing_data/clothing_absa_train_small.csv')



train = TrainSentiment(asp_thresh=args.asp_thresh,
                       op_thresh=args.op_thresh, 
                       max_iter=args.max_iter)

os.makedirs('trainingrun', exist_ok=True)
opinion_lex, aspect_lex = train.run(data=clothing_train, out_dir = './trainingrun')

#Copy lexicons to outputs folder
os.makedirs('outputs', exist_ok=True)
asp_lex = shutil.copy(LEXICONS_OUT / 'generated_aspect_lex.csv', './outputs')
op_lex = shutil.copy(LEXICONS_OUT / 'generated_opinion_lex_reranked.csv', './outputs')

# Evaluation 
# Although ABSA is an unsupervised method it can be metriced with a small sample of labeled data
def doc2IO(doc):
    """
    Converts ABSA doc to IO span format for evaluation
    """
    index = 0
    aspect_indexes = []
    doc_json = json.loads(doc.json())
    tokens = doc_json["_doc_text"].split()
    io = [[t,'O'] for t in tokens]
    for t_index, token in enumerate(tokens):
        for s in doc_json["_sentences"]:
            for ev in s["_events"]:
                for e in ev:
                    if e["_type"] == "ASPECT":
                        if e["_start"] == index and all(aspect[0] != t_index for aspect in aspect_indexes):
                            io[t_index][1] = "{}-{}".format(e["_text"], e["_polarity"])
        index += len(token) + 1
    
    return io

inference = SentimentInference(LEXICONS_OUT / 'generated_aspect_lex.csv', 
                               LEXICONS_OUT / 'generated_opinion_lex_reranked.csv')

clothing_val = os.path.join(args.data_folder,'clothing_data/clothing-absa-validation.json')

with open(clothing_val) as json_file:
    val = json.load(json_file)

predictions = []
vals = []
for doc in val["data"]:
    doc_raw = " ".join([token[0] for token in doc])
    sentiment_doc = inference.run(doc=doc_raw)
    if sentiment_doc is not None:
        predictions.append(doc2IO(sentiment_doc))
        vals.append(doc)
        
y_pred = flatten(predictions)[1::2]
y_true = flatten(vals)[1::2]

from sklearn.metrics import f1_score

# Log metrics
run = Run.get_context()
run.log('Aspect Lexicon Size', len(aspect_lex))
run.log('Opinion Lexicon Size', len(opinion_lex))
run.log('f1_weighted', float(f1_score(y_true, y_pred, average='weighted')))
