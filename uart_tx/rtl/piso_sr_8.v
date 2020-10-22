/************************************************************
* Filename ﹕ "piso_sr_8.v"
* Author ﹕yang jiangtao
* Description ﹕8-bits parallel input serial output
* Called by ﹕"uart_tx.v"
* Revision History ﹕2020.10.8-16:25
* Revision 1.0
* Email ﹕ 
* Company ﹕ 
* Copyright(c) 2019, xxxx Technology Inc, All right reserved
***************************************************************/

`timescale 1ns/1ns
module piso_8(
	clk_baud,
	reset_n,
	data_byte,
	data_serial);
    
	//step-1: IO ports
	//input ports
	input clk_baud;
	input reset_n;
	input [7:0] data_byte;
	//output ports
	output data_serial;
	//reg or wire
	reg reg_serial;
	reg [3:0] count;
	
	//step-2: logic
	//2-1: counter_10
	always @ (posedge clk_baud or negedge reset_n) begin
		if(!reset_n)
			count <= 4'd0;
        else if(count==4'd9)
            count <= 4'd0;
        else 
            count <= count + 1'b1;
	end
	//2-2: shift register
	always @ (*) begin
		case(count)
            4'd0: reg_serial <= 1'b0; //start bit
            4'd1: reg_serial <= data_byte[7];
            4'd2: reg_serial <= data_byte[6];
            4'd3: reg_serial <= data_byte[5];
            4'd4: reg_serial <= data_byte[4];
            4'd5: reg_serial <= data_byte[3];
            4'd6: reg_serial <= data_byte[2];
            4'd7: reg_serial <= data_byte[1];
            4'd8: reg_serial <= data_byte[0];
            4'd9: reg_serial <= 1'b1; //stop bit
            default: reg_serial <= 1'b1;
        endcase
	end
	
	//step-3: output
	assign data_serial = reg_serial;
endmodule
