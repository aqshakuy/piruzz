#!/bin/bash

. ./ccminer.conf

if [ -z "${DOCKER}" ]; then
        echo "ERROR: Docker does not seem to be installed. Please download and install Docker CE."
        exit 1
else
        if [ ! -z "${WORKER_NAME}" ]; then
                PAYOUT_ADDRESS="${PAYOUT_ADDRESS}.${WORKER_NAME}"
        fi
        ${DOCKER} run --name ccminer-veruscoin --rm -it oink70/ccminer-veruscoin:v3.7.0 -a verus -o stratum+tcp://${POOL_HOST}:${POOL_PORT} -u ${PAYOUT_ADDRESS} -t ${CCMINER_THREADS}
fi
