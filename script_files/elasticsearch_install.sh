#!/bin/bash


cd /home/ubuntu
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.12.1-amd64.deb
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.12.1-amd64.deb.sha512
shasum -a 512 -c elasticsearch-8.12.1-amd64.deb.sha512 
sudo dpkg -i elasticsearch-8.12.1-amd64.deb > install_elastic.log

sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service
