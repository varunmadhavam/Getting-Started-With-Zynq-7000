# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_ps_uart/sw/mpsoc_ps_uart_system/_ide/scripts/systemdebugger_mpsoc_ps_uart_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source /home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_ps_uart/sw/mpsoc_ps_uart_system/_ide/scripts/systemdebugger_mpsoc_ps_uart_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Xilinx PYNQ-Z1 003017AD4141A" && level==0 && jtag_device_ctx=="jsn-Xilinx PYNQ-Z1-003017AD4141A-23727093-0"}
fpga -file /home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_ps_uart/sw/mpsoc_ps_uart_app/_ide/bitstream/mpsoc_ps_uart_hw_export.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_ps_uart/sw/mpsoc_ps_uart_platform/export/mpsoc_ps_uart_platform/hw/mpsoc_ps_uart_hw_export.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source /home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_ps_uart/sw/mpsoc_ps_uart_app/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow /home/varun/coding/fpga/xylinx/pynq_z1/mpsoc_ps_uart/sw/mpsoc_ps_uart_app/Debug/mpsoc_ps_uart_app.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
