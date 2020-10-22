/************************************************************
* Filename ﹕ "uart_tx_top.v"
* Author ﹕yang jiangtao
* Description ﹕top module of "uart_tx"
* Called by ﹕" .v"
* Revision History ﹕2020.10.9-10:29
* Revision 1.0
* Email ﹕ 
* Company ﹕ 
* Copyright(c) 2019, xxxx Technology Inc, All right reserved
***************************************************************/

`timescale 1ns/1ns
module uart_tx_top(
    clk,
	reset_n,
	send_en,
	baud_set,
	data_byte,
	tx,
	send_done,
	uart_state);
    //step-1: IO ports
    //input ports
    input clk;
    input reset_n;
    input send_en;
    input [2:0] baud_set;
    input [7:0] data_byte;
    //output ports
    output tx;
    output send_done;
    output uart_state;
    
    //step-2: logic
    //2-1: instantiation of "m_clk_baud"
    wire clk_16baud;
    m_clk_baud u_clk_baud(
    .clk(send_en&&clk),
	.reset_n(reset_n),
	.baudrate_set(baud_set),
	.clk_tx_16baudrate(clk_16baud));
    
    //2-2: instantiation of "uart_tx_sm"
    uart_tx_sm u_uart_tx_sm( 
    .clk(clk_16baud),
    .reset_n(reset_n),
    .ena(send_en),
    .parity_bit(1'b0),
    .data_in(data_byte),
    .serial_out(tx),
    .send_done(send_done),
	.uart_state(uart_state));
    
    //step-3: output
    


endmodule
