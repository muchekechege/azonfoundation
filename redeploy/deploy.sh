#!/bin/bash
cd ~/websites


git clone -b main git@github.com:Rainey254/azonfoundation.git
wait
docker-compose -f ~/websites/azonfoundation/docker-compose.yml up --build -d #recreate the docker image
wait
chmod +x ~/websites/azonfoundation/redeploy/deploy.sh
chmod +x ~/websites/azonfoundation/redeploy/redeploy.sh
chmod +x ~/websites/azonfoundation/proxy/install.sh
chmod +x ~/websites/azonfoundation/ssl/ssl.sh
chmod +x ~/websites/azonfoundation/ssl/renew.sh



wait
cron_job="* * * * * ~/website/azonfoundation/redeploy/redeploy.sh" #cron job for redeployment
(crontab -l; echo "$cron_job") | crontab -
echo "$cron_job"

# install nginx in host if not installed
./azonfoundation/proxy/install.sh
wait
#location to proxy
PROXY_SOURCE_FILE="azonfoundation/proxy/proxy.conf"
PROXY_DESTINATION_FILE="../../etc/nginx/conf.d/azonfoundation.conf"

cat "$PROXY_SOURCE_FILE" > "$PROXY_DESTINATION_FILE"

# restart/restart nginx
systemctl reload nginx
wait
#install ssl cerificate
./azonfoundation/ssl/ssl.sh
wait
cron_job="0 0 1 */3 * ~/website/azonfoundation/ssl/renew.sh" #cron job for ssl renew
(crontab -l; echo "$cron_job") | crontab -
echo "$cron_job"


