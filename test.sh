#!/bin/sh
cd ark
make -j32 2>&1
export ARK_ROOT=/home/v-lifanwu/.ark
make install
make -j build

cd  /home/v-lifanwu/

export ARK_LOG_LEVEL=DEBUG
export NCCL_DEBUG=INFO
export ARK_ROOT=/home/v-lifanwu/.ark
export LD_LIBRARY_PATH=:/usr/local/cuda/lib64:/usr/local/cuda/lib64:/home/v-lifanwu/.ark/lib
rm /dev/shm/ark.* 2> /dev/null
# /home/v-lifanwu/ark/build/ark/ops/ops_matmul_test > /home/v-lifanwu/log.txt 2>&1
/home/v-lifanwu/ark/build/ark/sched/sched_test > /home/v-lifanwu/log.txt 2>&1