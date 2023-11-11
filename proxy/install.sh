#!/bin/bash
cd ~
sudo apt-get -y install nginx

sudo rm /etc/nginx/conf.d/default.conf
sudo rm /etc/nginx/sites-available/default
sudo rm /etc/nginx/sites-enabled/default