import os
import csv
import time
import json
import shutil
import random
import argparse
import threading
from pathlib import Path
from datetime import datetime
from misc.bbid import fetch_images

def info(msg, char = "#", width = 75):
    print("")
    print(char * width)
    print(char + "   %0*s" % ((-1*width)+5, msg) + char)
    print(char * width)

def fetch(target_path, categories, force):
    # Free to share and use filter for bing image search
    LICENSE_FILTER = '+filterui:license-L2_L3_L4_L5_L6_L7'
    categories = sorted([a.strip() for a in categories.split(' ')])

    if not os.path.exists(target_path):
        print('Creating {}'.format(target_path))
        os.makedirs(target_path)

    # storing csv of images
    out_csv = os.path.join(target_path, '{}.csv'.format('files'))
    # fetch metadata
    out_file = os.path.join(target_path, '{}.json'.format('metadata'))

    # clear directory if forced
    if force and os.path.exists(target_path):
        info('Cleanup')
        print('Removing "{}"'.format(target_path))
        shutil.rmtree(target_path, ignore_errors=True)
        if os.path.exists(out_csv):
            print('Removing "{}"'.format(out_csv))
            os.remove(out_csv)
        if os.path.exists(out_file):
            print('Removing "{}"'.format(out_file))
            os.remove(out_file)

    for item in categories:
        info('Fetching images for "{}"'.format(item))
        fetch_images(filters=LICENSE_FILTER, output=os.path.join(target_path, item), search_string=item)
        # need to wait on all threads for each category
        while True:
            threads = [t for t in threading.enumerate() if t.name == 'bbid']
            if len(threads) == 0:
                break
            else:
                print('{} outstanding threads to wait for....'.format(len(threads)))
                for t in threads:
                    print('Waiting on {}'.format(t))
                    t.join()
                time.sleep(0.1)



    info('Generating metadata')
    print('writing out shuffled csv... ', end='')
    raw_path = Path(target_path)
    # labels dictionary (i.e. label to index)
    index = dict((name, index) for index, name in enumerate(categories))
    # list of all image paths (shuffled)
    images = [p for p in list(raw_path.glob('*/*'))]
        
    # shuffle (a couple of times for good measure #YOLO)
    random.shuffle(images)
    random.shuffle(images)
    random.shuffle(images)

    items = [[str(Path(p).relative_to(raw_path)),  # path relative to raw
              p.parts[-2],                   # folder name (label)
              index[p.parts[-2]]]            # index (label)
            for p in images]

    
    with open(out_csv, 'w+', newline='\n', encoding='utf-8') as f:
        wr = csv.writer(f, quoting=csv.QUOTE_NONNUMERIC)
        wr.writerows(items)

    print('Done!\nWriting out metadata')
    output = {
        'file': str(Path(out_csv).relative_to(target_path)),
        'categories': categories,
        'index': dict((name, index) for index, name in enumerate(categories)),
        'generated': datetime.now().strftime('%m/%d/%y %H:%M:%S'),
        'total': len(items)
    }

    for i in output:
        print('   {} => {}'.format(i, output[i]))

    with open(str(out_file), 'w+') as f:
        json.dump(output, f)

    print('\nDownloaded {} total items.'.format(len(items)))

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='data cleaning for binary image task')
    parser.add_argument('-t', '--target_path', help='target file to hold good data', default='data')
    parser.add_argument('-c', '--categories', help='image categories to download', type=str, required=True)
    parser.add_argument('-f', '--force', help='force clear all data', default=False, action='store_true')
    args = parser.parse_args()

    params = vars(args)
    for i in params:
        print('{} => {}'.format(i, params[i]))

    fetch(**params)