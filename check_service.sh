#!/usr/bin/env bash

echo $1

until [ "200" == `curl -s -o /dev/null -w "%{http_code}" $1` ]
do
sleep 0.5
done
