#!/bin/bash

# Ini code buat di dalam worker VM, jalanin satu-satu.

# install all app dependancies
sudo apt-get install nginx
sudo apt-get install python3
sudo apt install python3-pip
pip install Flask Flask-PyMongo
pip install pymongo
pip install gunicorn

mkdir local

# install mongodb
sudo apt-get install gnupg curl
curl -fsSL https://pgp.mongodb.com/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org

# install mongosh
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
sudo apt-get update
sudo apt-get install -y mongodb-mongosh

# Copy configurasi nginx
sudo cd ~/local
sudo cp default /etc/nginx/sites-available/default

# Cek nginx
sudo nginx -t

sudo systemctl start mongod
#------------------------
# d dlm mongosh, akses pake mongosh
#------------------------
# use orders-db
# db.createCollection("orders")
#------------------------

# Run the app
cd ~/local/
gunicorn -w 4 -b 127.0.0.1:5000 app:app --daemon --pid gunicorn.pid