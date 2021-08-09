# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /home/max/rp_ref/nand/vitis/not_gate_system/_ide/scripts/systemdebugger_not_gate_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source /home/max/rp_ref/nand/vitis/not_gate_system/_ide/scripts/systemdebugger_not_gate_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-SMT2 210251AC3249" && level==0 && jtag_device_ctx=="jsn-JTAG-SMT2-210251AC3249-23731093-0"}
fpga -file /home/max/rp_ref/nand/vitis/not_gate/_ide/bitstream/main_dsn_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/max/rp_ref/nand/vitis/nand/export/nand/hw/main_dsn_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source /home/max/rp_ref/nand/vitis/not_gate/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow /home/max/rp_ref/nand/vitis/not_gate/Debug/not_gate.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
