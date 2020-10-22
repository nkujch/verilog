/************************************************************
* Filename ﹕ "baud_lut.v"
* Author ﹕yang jiangtao
* Description ﹕generate clock signal "clk_baud"
* Called by ﹕"uart_tx.v"
* Revision History ﹕2020.10.8-16:25
* Revision 1.0
* Email ﹕ 
* Company ﹕ 
* Copyright(c) 2019, xxxx Technology Inc, All right reserved
***************************************************************/

`timescale 1ns/1ns
module baud_lut(
	clk,
	reset_n,
	ena,
	baud_set,
	clk_baud);
	//step-1: IO ports
	//input ports
	input clk;
	input reset_n;
	input ena;
	input [2:0] baud_set;
	//output ports
	output clk_baud;
	//reg or wire
	reg [19:0] count;
	reg [19:0] Bps_count;
	
	//step-2: logic
	//baud_set
	//Bps:         300,     1200,   2400,   9600,  19200, 115200
	//Bps_count:   166_667, 41_667, 20_833, 5_208, 2_604, 434
	//Bps_count-1: 166_666, 41_666, 20_832, 5_207, 2_603, 433
	always @ (baud_set) begin
		case(baud_set)
			3'b000: Bps_count <= 20'd166_666;
			3'b001: Bps_count <= 20'd41_666;
			3'b010: Bps_count <= 20'd20_832;
			3'b011: Bps_count <= 20'd5_207;
			3'b100: Bps_count <= 20'd2_603;
			3'b101: Bps_count <= 20'd433;
			default: Bps_count <= 20'd5_207;
		endcase
	end
	//counter
	always @ (posedge clk or negedge reset_n) begin
		if(!reset_n)
			count <= 20'd0; //不能使用减法计数器，因为溢出会超出范围
		else if(count==Bps_count) //when ena==1, start counter
			count <= 20'd0;
		else
			count <= count + 1'b1;
	end
	//clk_baud
    reg reg_clk_baud;
	always @ (posedge clk or negedge reset_n) begin
		if(!reset_n)
			reg_clk_baud <= 1'b0;
		else if(count==20'd0)
			reg_clk_baud <= 1'b1;
		else if(count==20'd1)
			reg_clk_baud <= 1'b0;
		else
			reg_clk_baud <= reg_clk_baud;			
	end
	
	//step-3: output    
    assign clk_baud = ena & reg_clk_baud;
endmodule
