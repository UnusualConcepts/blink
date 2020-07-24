#!/bin/sh

if [[ -z ${PROD_HOST} ]]; then echo "PROD_HOST is not set!" && exit 1; fi

ssh root@${PROD_HOST} 'bash -s' < prod_update.sh
