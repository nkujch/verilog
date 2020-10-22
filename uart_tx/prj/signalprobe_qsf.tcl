# Copyright (C) 1991-2013 Altera Corporation
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, Altera MegaCore Function License 
# Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the 
# applicable agreement for further details.


# Quartus II 64-Bit Version 13.1.0 Build 162 10/23/2013 SJ Full Version
# File: signalprobe_qsf.tcl
# Generated on: Mon Oct 12 17:30:11 2020

# Note: This file contains a Tcl script generated from the SignalProbe Gui.
#       You can use this script to restore SignalProbes after deleting the DB
#       folder; at the command line use "quartus_cdb -t signalprobe_qsf.tcl".

package require ::quartus::chip_planner
package require ::quartus::project
project_open uart_tx -revision uart_tx
read_netlist
set had_failure 0

############
# Index: 1 #
############
set result [ make_sp  -src_name "|uart_tx_top|baud_set\[0\]~input" -loc PIN_A11 -pin_name "baud_set\[0\]_signalProbe" -io_std "2.5 V" ] 
if { $result == 0 } { 
	 puts "FAIL (baud_set\[0\]_signalProbe): make_sp  -src_name \"|uart_tx_top|baud_set\[0\]~input\" -loc PIN_A11 -pin_name \"baud_set\[0\]_signalProbe\" -io_std \"2.5 V\""
} else { 
 	 puts "SET  (baud_set\[0\]_signalProbe): make_sp  -src_name \"|uart_tx_top|baud_set\[0\]~input\" -loc PIN_A11 -pin_name \"baud_set\[0\]_signalProbe\" -io_std \"2.5 V\""
} 

