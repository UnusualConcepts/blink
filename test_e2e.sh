#!/bin/sh

sudo docker run -d -p 8088:8080 --name e2e_test -t 2heoh/blink:master
nc -z -v -w1 localhost 8088
if [[ "$1" = "local" ]]; then
    ./gradlew build e2eTest
else
    sudo gradle build e2eTest
fi

sudo docker rm $(docker stop $(docker ps -f name=e2e_test --format {{.ID}}))




