# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_axi_gpio/sw/mpsoc_axi_gpio_platform/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_axi_gpio/sw/mpsoc_axi_gpio_platform/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {mpsoc_axi_gpio_platform}\
-hw {/home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_axi_gpio/hw/mpsoc_axi_gpio_hw_export.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -fsbl-target {psu_cortexa53_0} -out {/home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_axi_gpio/sw}

platform write
platform generate -domains 
platform active {mpsoc_axi_gpio_platform}
platform generate
