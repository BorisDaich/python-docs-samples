#!/bin/bash
sudo apt-get -y install nodejs
sudo apt-get -y install npm
sudo npm install -g --unsafe-perm node-red

echo running node-red 
node-red > /var/log/node-red.log 2>&1 &


echo running gunicorn
gunicorn real_backend:app -b 0.0.0.0:80 --access-logfile /var/log/gunicorn-access.log --error-logfile /var/log/gunicorn-error.log


