/************************************************************
* Filename ﹕ "m_clk_baud.v"
* Author ﹕yang jiangtao
* Description ﹕generate clock signal "clk_baud"
* Called by ﹕" .v"
* Revision History ﹕2020.10.9-10:25
* Revision 1.0
* Email ﹕ 
* Company ﹕ 
* Copyright(c) 2019, xxxx Technology Inc, All right reserved
***************************************************************/

`timescale 1ns/1ns
module m_clk_baud(
	clk,
	reset_n,
	baudrate_set,
	clk_tx_16baudrate,
    clk_rx_16baudrate);
    
	//step-1: IO ports
	//input ports
	input clk;
	input reset_n;
	input [2:0] baudrate_set;
	//output ports
	output clk_tx_16baudrate;
    output clk_rx_16baudrate;

	//step-2: logic
	//2-1: baudrate_set
	//Bps:              300,     1200,   2400,   9600,  19200, 115200
    //Bps_16:           4800,       
	//clks_16baudrate:  10_417,  2_604,  1_302,  326,   163,   27
	//50MHz/baudrate:  
    reg [13:0] clks_16baudrate; 
	always @ (baudrate_set) begin
		case(baudrate_set)
			3'd0: clks_16baudrate <= 14'd10_417;
			3'd1: clks_16baudrate <= 14'd2_604;
			3'd2: clks_16baudrate <= 14'd1_302;
			3'd3: clks_16baudrate <= 14'd326;
			3'd4: clks_16baudrate <= 14'd163;
			3'd5: clks_16baudrate <= 14'd27;
			default: clks_16baudrate <= 14'd326;
		endcase
	end
	//2-2: clks_count
    reg [14:0] clks_count;
	always @ (posedge clk or negedge reset_n) begin
		if(!reset_n)
			clks_count <= 14'd0;       //不能使用减法计数器，因为溢出会超出范围
		else if(clks_count<clks_16baudrate-1) //when ena==1, start counter
			clks_count <= clks_count + 1'b1; //cannot use count==Bps_count to generate counter
        else                      //不会自动清零
			clks_count <= 14'd0;
	end
	//2-3: generate clk_16baudrate
    //2-3-1: clk_tx_16baudrate
    reg reg_clk_tx_16baudrate;
	always @ (*) begin
		if(clks_count==14'd1)
			reg_clk_tx_16baudrate <= 1'b1;
		else
			reg_clk_tx_16baudrate <= 1'b0;			
	end	
    //2-3-2: clk_rx_16baudrate
    reg reg_clk_rx_16baudrate;
	always @ (*) begin
		if(clks_count==14'd0)
			reg_clk_rx_16baudrate <= 1'b0;
		else
			reg_clk_rx_16baudrate <= 1'b1;			
	end

	//step-3: output
    assign clk_tx_16baudrate = reg_clk_tx_16baudrate;
    assign clk_rx_16baudrate = reg_clk_rx_16baudrate;
endmodule

