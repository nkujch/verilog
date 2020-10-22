transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {rom_demo_8_1200mv_85c_slow.vo}

vlog -vlog01compat -work work +incdir+C:/Users/Educator-yly/Desktop/verilog_exercises/rom_demo/prj/../verification/testbench {C:/Users/Educator-yly/Desktop/verilog_exercises/rom_demo/prj/../verification/testbench/pll_0_tb.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  pll_0_tb

add wave *
view structure
view signals
run -all
