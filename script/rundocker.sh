#!/bin/sh
DOCKER_IMAGE=bench.azurecr.io/superbench:cuda11.1.1-20210930
DOCKER_CONT_NAME=lifanwu_ark
docker run -it -d --name=${DOCKER_CONT_NAME} --privileged --cap-add=ALL --shm-size=1g --ulimit memlock=-1 --ulimit stack=67108864 --net=host --ipc=host --gpus=all -v ${HOME}:${HOME} -v /dev:/dev -v /lib/modules:/lib/modules -v /usr/src:/usr/src -v /mnt:/mnt ${DOCKER_IMAGE} bash