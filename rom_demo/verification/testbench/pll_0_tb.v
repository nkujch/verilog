/************************************************************
* Filename  :  "pll_0_tb.v"
* Author    :  yang jiangtao
* Description  :  testbench of "uart_tx.v"
* Called by :  None
* Last modified: 2020/10/15/16:27
* Version  : 0.01
* Info :        
*   version author  desc
*   0.01    yjt     create file
*   
* Email    :  
* Company  :  
* Copyright(c) 2019, xxxx Technology Inc, All right reserved
***************************************************************/

/*timescale*/
`timescale 1ns/1ns

/*define*/
`define clk_period 20 //clock 50MHz

/*module*/
module pll_0_tb;	
    //step-1: define input and output signals
    //1-1: excitation signals
    reg rs_clk_50M;
    reg rs_reset_n;
    //1-2: global observation signals

    
    //step-2: module instantiation
    //2-1: instance of "sys_pll.v"
    //2-1-1: observation signals of "sys_pll.v"
    wire ws_clk0;
    wire ws_clk1;
    wire ws_clk2;
    wire ws_locked;
    //2-1-2: instantiate "pll_0.v"
    pll_top u0_pll_0(
	.iws_reset_n(~rs_reset_n),
	.iws_clk_50M(rs_clk_50M),
    
	.ows_clk0(ws_clk0),
	.ows_clk1(ws_clk1),
	.ows_clk2(ws_clk2),
	.ows_locked(ws_locked));
    
    
    
    //step-3: generate excitation
    //3-1: generate clock signal
    initial rs_clk_50M = 1'b1;
    always #(`clk_period/2) rs_clk_50M <= ~rs_clk_50M;
    //3-2: generate reset signal
    initial begin
        rs_reset_n = 1'b1;
        
        #(`clk_period*3); 
        rs_reset_n = 1'b0;
        
        #(`clk_period); 
        rs_reset_n = 1'b1;               
    end   
    //3-3: stop simulation
    initial begin
        #(`clk_period*1000);
        $stop;
    end

    //step-4: observe error

    

endmodule
