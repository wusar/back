#!/bin/sh
WORKDIR=/home/v-lifanwu
ARK_ROOT=$WORKDIR/.ark
ARK_DIR=$WORKDIR/ark
LOG_DIR=$WORKDIR/log.txt
export ARK_ROOT=$ARK_ROOT
export LD_LIBRARY_PATH=:/usr/local/cuda/lib64:/usr/local/cuda/lib64:$ARK_ROOT/lib
cd $ARK_DIR/tests/test_merge_com
make
export ARK_LOG_LEVEL=DEBUG

rm /dev/shm/ark.* 2>/dev/null

./build/test_merge_comm_small_tilesize >$LOG_DIR
# ./build/test_merge_com4096 >$LOG_DIR
