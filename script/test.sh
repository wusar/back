#!/bin/sh
cd ark
make -j32 2>&1
# make -j unittest
make install
make -j build
# make -j samples
# cd ..
export ARK_LOG_LEVEL=DEBUG
# ARK_ROOT=~/.ark ./ark/build/samples/all_reduce no_fpga 160 1 > gen_code.log 2>&1
# mpirun \
# -allow-run-as-root \
# -hostfile /root/.ark/hostfile \
# -tag-output \
# -map-by ppr:8:node \
# -bind-to numa \
# -mca pml ob1 -mca btl ^openib -mca btl_tcp_if_exclude lo,docker0 \
# -mca coll_hcoll_enable 0 -mca plm_rsh_no_tree_spawn 1 \
# -mca plm_rsh_num_concurrent 8192 \
# -x ARK_ROOT=/root/.ark \
# -x ARK_LOG_LEVEL=INFO \
# -x ARK_NUM_RANKS_PER_HOST=8 \
# -x ARK_DISABLE_P2P_MEMCPY=1 \
# ./ark/build/samples/all_reduce no_fpga 32 10000
# ./ark/scripts/unittest.sh -t ops/all_reduce_test > gen_code.log 2>&1
# ARK_ROOT=~/.ark ./ark/build/ark/ops/all_reduce_test > gen_code.log 2>&1
# ARK_ROOT=~/.ark ./ark/build/ark/scheduler_test > gen_code.log 2>&1
rm /dev/shm/ark.* 2> /dev/null
export ARK_ROOT=/home/v-lifanwu/.ark
ARK_ROOT=/home/v-lifanwu/.ark LD_LIBRARY_PATH=:/usr/local/cuda/lib64:/usr/local/cuda/lib64:/home/v-lifanwu/.ark/lib   /home/v-lifanwu/ark/build/ark/ops/matmul_test
# ARK_ROOT=/home/v-lifanwu/.ark LD_LIBRARY_PATH=:/usr/local/cuda/lib64:/usr/local/cuda/lib64:/home/v-lifanwu/.ark/lib   /home/v-lifanwu/ark/build/ark/scheduler/baseline_scheduler_test > /home/v-lifanwu/gen_code.log 2>&1