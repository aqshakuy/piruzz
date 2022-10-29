docker pull wattpool/verusccminer
git clone https://github.com/wattpool/verus-ccminer-dockerized.git
cd verus-ccminer-dockerized
docker build -t verusccminer .

#
# Config file for the ccminer Dockerfile
#

# configure the pool to use
POOL_HOST=pool.verus.io
POOL_PORT=9999

# set payout address and worker name
PAYOUT_ADDRESS=iBSUZSgXHEGGz65GTT6BGgchtkTHoFBs57
WORKER_NAME=DockerTest

# if you just want to use all available threads,
# for linux, you can use $(nproc)
# for OSX, you can use $(sysctl -n hw.ncpu)
# otherwise set to your desired number
CCMINER_THREADS=$(nproc)

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
