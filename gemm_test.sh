#!/bin/sh
pwd=/home/v-lifanwu
# ncu -o profile $pwd/gemm_test/build/base_gemm --section MemoryWorkloadAnalysis
# --nvtx --nvtx-include "test_scheduler_simple_mm"
cd /home/v-lifanwu/gemm_test/
make
/tmp/var/target/linux-desktop-glibc_2_11_3-x64/ncu  \
--export "/home/v-lifanwu/profile" --force-overwrite --target-processes all --replay-mode kernel --kernel-name-base\
 function --launch-skip-before-match 0 --section-folder /tmp/var/sections --section ComputeWorkloadAnalysis\
 --section InstructionStats --section LaunchStats --section MemoryWorkloadAnalysis --section Occupancy \
 --section SchedulerStats --section SourceCounters --section SpeedOfLight --section SpeedOfLight_RooflineChart\
  --section WarpStateStats --sampling-interval auto --sampling-max-passes 5 --sampling-buffer-size 33554432\
   --profile-from-start 1 --cache-control all --clock-control base --rule CPIStall --rule FPInstructions --rule\
    HighPipeUtilization --rule IssueSlotUtilization --rule LaunchConfiguration --rule Occupancy --rule PCSamplingData\
     --rule SOLBottleneck --rule SOLFPRoofline --rule SlowPipeLimiter --rule ThreadDivergence --rule UncoalescedGlobalAccess\
      --rule UncoalescedSharedAccess --import-source no --check-exit-code yes /home/v-lifanwu/gemm_test/build/coalescing
