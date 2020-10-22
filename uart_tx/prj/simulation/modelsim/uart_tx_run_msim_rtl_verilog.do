transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Educator-yly/Desktop/verilog_exercises/uart_tx/prj/ip {C:/Users/Educator-yly/Desktop/verilog_exercises/uart_tx/prj/ip/sys_pll.v}
vlog -vlog01compat -work work +incdir+C:/Users/Educator-yly/Desktop/verilog_exercises/uart_tx/prj/db {C:/Users/Educator-yly/Desktop/verilog_exercises/uart_tx/prj/db/sys_pll_altpll.v}

vlog -vlog01compat -work work +incdir+C:/Users/Educator-yly/Desktop/verilog_exercises/uart_tx/prj/../testbench {C:/Users/Educator-yly/Desktop/verilog_exercises/uart_tx/prj/../testbench/sys_pll_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  sys_pll_tb

add wave *
view structure
view signals
run -all
