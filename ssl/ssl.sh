#!/bin/bash
cd ~
sudo apt-get -y install certbot python3-certbot-nginx
wait
sudo certbot --nginx -d azonfoundation.online -d azonfoundation.online --non-interactive --agree-tos --email reinykenya@gmail.com
wait
certbot renew --dry-run