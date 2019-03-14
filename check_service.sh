#!/usr/bin/env bash

until [ "200" == `curl -s -o /dev/null -w "%{http_code}" http://$(APP_HOST):$(APP_PORT)` ]
do
sleep 0.5
done
