#!/bin/sh

./gradlew build docker
#docker login --username=2heoh --password=blink1234
#docker tag uc/blink 2heoh/blink
#docker push 2heoh/blink