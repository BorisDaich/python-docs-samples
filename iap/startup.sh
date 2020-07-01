#!/bin/bash
apt-get -y update
apt-get -y install git
apt-get -y install virtualenv
apt-get install nodejs
apt-get install npm
npm install -g --unsafe-perm node-red
git clone https://github.com/BorisDaich/python-docs-samples
cd python-docs-samples/iap
virtualenv venv -p python3
source venv/bin/activate
pip install -r requirements.txt
cat example_gce_backend.py > real_backend.py
node-red > /var/log/node-red.log 2>&1 &
gunicorn real_backend:app -b 0.0.0.0:80 --access-logfile /var/log/gunicorn-access.log --error-logfile /var/log/gunicorn-error.log


