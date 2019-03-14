#!/usr/bin/env bash

uname -a
sudo docker pull 2heoh/blink
sudo docker stop $(sudo docker ps -q)
sudo docker run -d -p 8080:8080 2heoh/blink