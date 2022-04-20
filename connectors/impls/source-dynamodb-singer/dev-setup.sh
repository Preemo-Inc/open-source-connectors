#!/bin/bash
set -x

python -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
pip install -r requirements.txt

docker build -t preemo/source-dynamodb-singer:dev .