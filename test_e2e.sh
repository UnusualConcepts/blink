#!/bin/sh

if [ "$1" = "local" ]; then
    docker run -d -p 8088:8080 --name e2e_test -t 2heoh/blink:master
    ./gradlew e2e
    docker rm $(docker stop $(docker ps -f name=e2e_test --format {{.ID}}))
else
    sudo gradle e2e
fi




