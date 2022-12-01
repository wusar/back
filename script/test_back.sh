#!/bin/sh
# export ARK_ROOT=/home/v-lifanwu/.ark
# ncu --nvtx --nvtx-include "test_scheduler_simple_mm" --target-processes all --section SchedulerStats --section WarpStateStats --section SourceCounters -o test.ncu-rep -f ./ark/build/ark/scheduler_test
# /tmp/var/target/linux-desktop-glibc_2_11_3-x64/ncu --nvtx --nvtx-include "test_scheduler_simple_mm" --export "/home/v-lifanwu/test" --force-overwrite --target-processes all --replay-mode kernel --kernel-name-base function --launch-skip-before-match 0 --section-folder /tmp/var/sections --section ComputeWorkloadAnalysis --section InstructionStats --section LaunchStats --section MemoryWorkloadAnalysis --section Occupancy --section SchedulerStats --section SourceCounters --section SpeedOfLight --section SpeedOfLight_RooflineChart --section WarpStateStats --sampling-interval auto --sampling-max-passes 5 --sampling-buffer-size 33554432 --profile-from-start 1 --cache-control all --clock-control base --rule CPIStall --rule FPInstructions --rule HighPipeUtilization --rule IssueSlotUtilization --rule LaunchConfiguration --rule Occupancy --rule PCSamplingData --rule SOLBottleneck --rule SOLFPRoofline --rule SlowPipeLimiter --rule ThreadDivergence --rule UncoalescedGlobalAccess --rule UncoalescedSharedAccess --import-source no --check-exit-code yes ./ark/build/ark/scheduler_test