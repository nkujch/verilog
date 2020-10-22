/************************************************************
* Filename ﹕ "uart_tx_tb.v"
* Author ﹕yang jiangtao
* Description ﹕testbench of "uart_tx.v"
* Called by ﹕None
* Revision History ﹕2020.10.8-16:25
* Revision 1.0
* Email ﹕ 
* Company ﹕ 
* Copyright(c) 2019, xxxx Technology Inc, All right reserved
***************************************************************/

`timescale 1ns/1ns
`define clk_period 20

module uart_tx_tb;	
	//step-1: IO signals
	//stimulus signals
	reg clk_50M;
	reg reset_n;
	reg ena;
	reg [2:0] baud_set;
    reg [7:0] data_byte;
	//observed signals
	wire serial_data;
    wire tx_done;
    wire uart_state;
    wire clk_tx_baud;
	reg err;
	
	//step-2: instantiation
    //2-1: uart_tx
	uart_tx_top uart_tx_0(
	.clk(clk_50M),
	.reset_n(reset_n),
	.send_en(ena),
	.baud_set(baud_set),
	.data_byte(data_byte),
	.tx(serial_data),
	.send_done(tx_done),
	.uart_state(uart_state));
    //2_2: baud_lut
    wire clk_rx_baud;
    m_clk_baud u_clk_16baudrate(
	.clk(clk_50M),
	.reset_n(reset_n),
	.baudrate_set(baud_set),
	.clk_tx_16baudrate(clk_tx_baud),
    .clk_rx_16baudrate(clk_rx_baud));
	
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
    initial begin
        ena = 1'b0;
        #(`clk_period);
        ena = 1'b1;
    end
	//3-4: baud_set
	initial baud_set = 3'd5;
    //3-5: data_byte
    initial data_byte = 8'b1010_0101;	
	//step-4: check
	initial err = 1'b0;
	
	
endmodule
