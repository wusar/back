#!/bin/sh
cd nccl
make -j 32 2>&1 | grep error
cd ..
cd nccl-tests
# make clean
make NCCL_HOME=/home/v-lifanwu/nccl/src -j 8
testchannelaftermodify() {

    export NCCL_DEBUG=VERSION
    export LD_LIBRARY_PATH=/home/v-lifanwu/v2.13-memcpy-evopt/nccl/build/lib
    export NCCL_MAX_NCHANNELS=$1
    export NCCL_BUFFSIZE=8388608
    export NCCL_DEBUG_SUBSYS=ALL
    export NCCL_PROTO=Simple
    # export NCCL_PROXY_PROFILE=/home/v-lifanwu/profiler.log
    ./build/all_reduce_perf -b 8 -e 64M --stepfactor=2 --ngpus=8 --iters=20 >../log/aftermodify/log_channel_$1.txt
}

testchannelbeforemodify() {

    export NCCL_DEBUG=VERSION
    export LD_LIBRARY_PATH=/home/v-lifanwu/v2.13-memcpy-evopt-origin/nccl/build/lib
    export NCCL_MAX_NCHANNELS=$1
    export NCCL_BUFFSIZE=8388608
    export NCCL_DEBUG_SUBSYS=ALL
    export NCCL_PROTO=Simple
    # export NCCL_PROXY_PROFILE=/home/v-lifanwu/profiler.log
    ./build/all_reduce_perf -b 8 -e 64M --stepfactor=2 --ngpus=8 --iters=20 >../log/beforemodify/log_channel_$1.txt
}

# python ./python_script/cutbenchmark.py
channel=1
while [ $channel -lt 20 ]
do
    testchannelbeforemodify $channel
    channel=$(($channel + 1))
done

# channel=1
# while [ $channel -lt 20 ]
# do
#     testchannelaftermodify $channel
#     channel=$(($channel + 1))
# done
cd ..
echo finished
