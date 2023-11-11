#!/bin/bash
cd ~/websites/azonfoundation
git fetch

REMOTEVERSION=$(git rev-parse origin)
LOCALVERSION=$(git rev-parse HEAD)

if [ "$REMOTEVERSION" != "$LOCALVERSION" ];then
    git pull git@github.com:Rainey254/azonfoundation.git main
    wait
    cat "$SOURCE_FILE" > "$DESTINATION_FILE"
    wait
    # docker-compose -f ~/websites/azonfoundation/docker-compose.yml down #destroy the container
    wait
    docker-compose -f ~/websites/azonfoundation/docker-compose.yml up --build -d #recreate the docker image
fi

