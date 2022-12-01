#!/bin/sh
DOCKER_IMAGE="bench.azurecr.io/superbench:cuda11.1.1-20210930"
echo 'JbJoJvo=LDuxqHOVeLqNPXJBTqUEKMgq' | docker login bench.azurecr.io -u bench --password-stdin
# if [ $? == 0 ]; then
docker pull ${DOCKER_IMAGE}
# fi