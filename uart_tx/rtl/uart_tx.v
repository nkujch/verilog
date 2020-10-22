/************************************************************
* Filename ﹕ uart_tx.v
* Author ﹕yang jiangtao
* Description ﹕transmit "data_byte" to "tx"
* Called by ﹕None
* Revision History ﹕2020.10.8-16:25
* Revision 1.0
* Email ﹕ 
* Company ﹕ 
* Copyright(c) 2019, xxxx Technology Inc, All right reserved
***************************************************************/    

module uart_tx(
	clk,
	reset_n,
	tx_en,
	baud_set,
	data_byte,
	tx,
	tx_done,
	uart_state);
	//step-1: IO ports
	//input ports
	input clk;  //系统时钟50MHz
	input reset_n;
	input tx_en;
	input [2:0] baud_set;
	input [7:0] data_byte;
	//output ports
	output tx;
	output tx_done;    // 信号发送完毕信号
	output uart_state; // 当发送数据时uart_state=1,发送忙信号
	//reg or wire
	wire clk_baud;
	
	//step-2: main logic
	//2-1: baud_set, generate "clk_baud"
	baud_lut baud_lut_0(
	.clk(clk),
	.reset_n(reset_n),
    .ena(tx_en),
	.baud_set(baud_set),
	.clk_baud(clk_baud));
	//2-2: uart_piso
    piso_8 uart_piso_8(
	.clk_baud(clk_baud),
	.reset_n(reset_n),
	.data_byte(data_byte),
	.data_serial(tx),
    .tx_done(tx_done),
    .uart_state(uart_state));

	//step-3: output

endmodule


