# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_profiling/sw/mpsoc_profiling_platform/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_profiling/sw/mpsoc_profiling_platform/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {mpsoc_profiling_platform}\
-hw {/home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_profiling/hw/mpsoc_profiling_hw_export.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -fsbl-target {psu_cortexa53_0} -out {/home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_profiling/sw}

platform write
platform generate -domains 
platform active {mpsoc_profiling_platform}
bsp reload
bsp config enable_sw_intrusive_profiling "true"
bsp config extra_compiler_flags "-mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -nostartfiles -g -Wall -Wextra -pg"
bsp write
bsp reload
catch {bsp regenerate}
platform generate
