# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_uart_loop/sw/mpsoc_uart_loop_platform/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_uart_loop/sw/mpsoc_uart_loop_platform/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {mpsoc_uart_loop_platform}\
-hw {/home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_uart_loop/hw/mpsoc_uart_loop_hw_export.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -fsbl-target {psu_cortexa53_0} -out {/home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_uart_loop/sw}

platform write
platform generate -domains 
platform active {mpsoc_uart_loop_platform}
platform generate
