'''
This script reads in raw json strings in a file, makes it pretty, and writes it out in the same file.
'''

import json
import argparse

parser = argparse.ArgumentParser(description='get input')
parser.add_argument('--json_file', type=str, help='path to json file')

def json_process(path):
    with open(path, "r") as f:
        raw = json.load(f)
        data = json.loads(raw)

    with open(path, "w") as f:
        json.dump(data, f, ensure_ascii=False, indent=4)

if __name__ == "__main__":
    args = parser.parse_args()
    json_process(args.json_file)


