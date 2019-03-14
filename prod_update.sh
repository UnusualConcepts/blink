#!/usr/bin/env bash

docker pull 2heoh/blink
docker stop $(sudo docker ps -q)
docker run -d -p 8080:8080 2heoh/blink