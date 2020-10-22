/************************************************************
* Filename  :  "sys_pll_tb.v"
* Author    :  yang jiangtao
* Description  :  testbench of "uart_tx.v"
* Called by :  None
* Last modified: 2020/10/15/15:45
* Version  : 0.01
* Info :        
    version author  desc
*   0.01    yjt     create file
*   
* Email    :  
* Company  :  
* Copyright(c) 2019, xxxx Technology Inc, All right reserved
***************************************************************/

`timescale 1ns/1ns
`define clk_period 20 //clock 50MHz

module sys_pll_tb;	
    //step-1: define input and output signals
    //1-1: excitation signals
    reg irs_clk_50M;
    reg irs_reset_n;
    //1-2: global observation signals

    
    //step-2: module instantiation
    //2-1: instance of "sys_pll.v"
    //2-1-1: observation signals of "sys_pll.v"
    wire ows_clk0;
    wire ows_clk1;
    wire ows_clk2;
    wire ows_clk3;
    wire ows_locked;
    //2-1-2: instantiate "sys_pll.v"
    sys_pll u0(
    .areset(irs_reset_n),
    .inclk0(irs_clk_50M),
    .c0(ows_clk0),
    .c1(ows_clk1),
    .c2(ows_clk2),
    .c3(ows_clk3),
    .locked(ows_locked));
    
    //step-3: generate excitation
    //3-1: generate clock signal
    initial irs_clk_50M = 1'b1;
    always #(`clk_period) irs_clk_50M <= ~irs_clk_50M;
    //3-2: generate reset signal
    initial begin
        irs_reset_n = 1'b1;
        #(`clk_period*3) irs_clk_50M = 1'b0;
    end   
    //3-3: generate 



    //step-4: observe error

    

endmodule
