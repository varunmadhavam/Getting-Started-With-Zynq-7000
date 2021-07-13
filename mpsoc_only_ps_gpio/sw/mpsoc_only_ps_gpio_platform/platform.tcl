# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_only_ps_gpio/sw/mpsoc_only_ps_gpio_platform/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_only_ps_gpio/sw/mpsoc_only_ps_gpio_platform/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {mpsoc_only_ps_gpio_platform}\
-hw {/home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_only_ps_gpio/mpsoc_only_ps_gpio_hw_export.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -fsbl-target {psu_cortexa53_0} -out {/home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_only_ps_gpio/sw}

platform write
platform generate -domains 
platform active {mpsoc_only_ps_gpio_platform}
domain active {zynq_fsbl}
bsp reload
bsp write
platform generate
bsp reload
domain active {standalone_domain}
bsp reload
domain active {zynq_fsbl}
bsp config stdin "ps7_uart_0"
bsp reload
domain active {standalone_domain}
bsp reload
domain active {zynq_fsbl}
bsp reload
platform generate -domains 
platform active {mpsoc_only_ps_gpio_platform}
platform config -updatehw {/home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_only_ps_gpio/mpsoc_only_ps_gpio_hw_export.xsa}
platform generate -domains 
