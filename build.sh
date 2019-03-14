#!/bin/sh

if [ "$1" = "local" ]; then
    ./gradlew build docker || exit 1
else
    sudo gradle build docker || exit 1
fi

echo $DOCKER_HUB_PASSWORD > sudo docker login --username=2heoh --password-stdin || exit 1
sudo docker tag uc/blink 2heoh/blink || exit 1
sudo docker push 2heoh/blink