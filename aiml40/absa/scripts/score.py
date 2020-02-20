import os
import json
import time
import spacy
import datetime
import subprocess
from azureml.core.model import Model
from spacy.cli.download import download as spacy_download
from nlp_architect.models.absa.inference.inference import SentimentInference

def download_models():
    print('Downloading models...')
    subprocess.run(["python", "-m", "spacy", "download", "en_core_web_sm"])
    ["python", "-m", "spacy", "download", "en"]
    print('...done downloading.\nImporting and loading model.')
    import en_core_web_sm
    nlp = en_core_web_sm.load()
    print(nlp)

    spacy_download('en')

def init():
    """
    Set up the ABSA model for Inference  
    """
    global SentInference
    try:
        path = Model.get_model_path('absa')
    except:
        path = 'model'

    aspect_lex = os.path.join(path, 'generated_aspect_lex.csv')
    opinion_lex = os.path.join(path, 'generated_opinion_lex_reranked.csv')
    
    download_models()

    SentInference = SentimentInference(aspect_lex, opinion_lex)

def run(raw_data):
    """
    Evaluate the model and return JSON string
    """
    prev_time = time.time()

    post = json.loads(raw_data)

    # get text
    doc = post['text']
    print(f'Processing "{doc}"')

    sentiment_doc = SentInference.run(doc=doc)
    parse = sentiment_doc.json()
    print(json.dumps(json.loads(parse), indent=4))

    resp = doc2IO(parse.replace('doc_text', 'text').replace('"_', '"'))

    current_time = time.time()
    inference_time = datetime.timedelta(seconds=current_time - prev_time)

    resp['time'] = str(inference_time.total_seconds())

    return resp

def doc2IO(doc):
    """
    Converts ABSA doc to html output
    """
    doc_json = json.loads(doc)
    text = doc_json['text']
    aug_text = text
    for d in doc_json['sentences']:
        s = text[d['start']:d['end']+1]
        for ev in d['events']:
            for e in ev:
                typ = e['type']
                pol = e['polarity']
                txt = text[e['start']:e['start']+e['len']]
                s = s.replace(txt, f'<span class="{typ} {pol}">{txt}</span>')
                
        r = f'<span class="sentence">{s}</span>'
        aug_text = aug_text.replace(text[d['start']:d['end']+1], r, 1)

    doc_json['html'] = aug_text
    
    return doc_json

if __name__ == '__main__':
    init()

    docs = ["Loved the sweater but hated the pants"]
        #,
        #"Really great outfit, but the shirt is the wrong size",
        #"I absolutely love this jacket! i wear it almost everyday. works as a cardigan or a jacket. my favorite retailer purchase so far"]

    for d in docs:
        print(f'\n---------------------\n{d}')
        r = run(json.dumps({'text': d}))
        print(json.dumps(r, indent=4))
