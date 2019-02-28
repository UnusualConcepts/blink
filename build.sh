#!/bin/sh

gradle build docker
sudo docker login --username=2heoh --password=blink1234
sudo docker tag uc/blink 2heoh/blink
sudo docker push 2heoh/blink