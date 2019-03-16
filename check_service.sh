#!/usr/bin/env bash

echo "waiting for HTTP/200OK from: $1"

until [ "200" == `curl -s -o /dev/null -w "%{http_code}" $1` ]; do sleep 0.5; echo "."
done