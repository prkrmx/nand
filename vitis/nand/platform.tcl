# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/max/rp_ref/nand/vitis/nand/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/max/rp_ref/nand/vitis/nand/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {nand}\
-hw {/home/max/rp_ref/nand/vivado/main_dsn_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {/home/max/rp_ref/nand/vitis}

platform write
platform generate -domains 
platform active {nand}
platform generate
platform active {nand}
