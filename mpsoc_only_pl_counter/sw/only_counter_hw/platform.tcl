# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_only_pl_counter/sw/only_counter_hw/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_only_pl_counter/sw/only_counter_hw/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {only_counter_hw}\
-hw {/home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_only_pl_counter/hw/mpsoc_only_pl_counter_hw_export.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -fsbl-target {psu_cortexa53_0} -out {/home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_only_pl_counter/sw}

platform write
platform generate -domains 
platform active {only_counter_hw}
platform generate
platform active {only_counter_hw}
