#!/bin/sh

sudo docker run -d -p 8081:8080 -t 2heoh/blink:master
gradle test e2e
sudo docker stop $(sudo docker ps -aq)
