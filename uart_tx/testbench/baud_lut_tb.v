/************************************************************
* Filename ﹕ "baud_lut_tb.v"
* Author ﹕yang jiangtao
* Description ﹕testbench of "baud_lut.v"
* Called by ﹕None
* Revision History ﹕2020.10.8-18:18
* Revision 1.0
* Email ﹕ 
* Company ﹕ 
* Copyright(c) 2019, xxxx Technology Inc, All right reserved
***************************************************************/

`timescale 1ns/1ns
`define clk_period 20

module baud_lut_tb;	
	//step-1: IO signals
	//stimulus signals
	reg clk_50M;
	reg reset_n;
	reg ena;
	reg [2:0] baud_set;
	//observed signals
	wire clk_baud;
	reg err;
	
	//step-2: instantiation
	baud_lut clk_baud_0(
	.clk(clk_50M),
	.reset_n(reset_n),
	.ena(ena),
	.baud_set(baud_set),
	.clk_baud(clk_baud));
	
	//step-3: generating stimulus
	//3-1: clock
	initial clk_50M = 0;
	always #(`clk_period/2) clk_50M = ~clk_50M;
	//3-2: reset_n
	initial begin
		reset_n = 1'b1;
		#(`clk_period/4);
		reset_n = 1'b0;
		#(`clk_period);
		reset_n = 1'b1;
	end
	//3-3: ena
	initial ena = 1'b1;
	//3-4: baud_set
	initial baud_set = 3'd0;
	
	//step-4: check
	initial err = 0;

endmodule
