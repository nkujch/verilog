/************************************************************
* Filename  :  "rom_top_tb.v"
* Author    :  yang jiangtao
* Description  :  testbench of "rom_top.v"
* Called by :  None
* Last modified: 2020/10/18/15:26
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
module rom_top_tb;	
    //step-1: define input and output signals
    //1-1: excitation signals
    reg rs_clk_50M;
    //1-2: global observation signals

    
    //step-2: module instantiation
    //2-1: instance of "sys_pll.v"
    //2-1-1: observation signals of "sys_pll.v"
    reg [7:0] rv_addr;
    wire [7:0] wv_q;
    //2-1-2: instantiate "sys_pll.v"
    rom_top u0_rom_top
    (
        .iws_clk(rs_clk_50M),
        .iwv_addr(rv_addr),
        
        .owv_q(wv_q)        
    );
    
    
    //step-3: generate excitation
    //3-1: generate clock signal
    initial rs_clk_50M = 1'b1;
    always #(`clk_period/2) rs_clk_50M <= ~rs_clk_50M;
    //3-2: generate reset signal
    initial rv_addr = 0;
    always@(posedge rs_clk_50M) begin
        rv_addr <= rv_addr + 1;
    end
    //3-3: stop simulation
    initial begin
        #(`clk_period*1000);
        $stop;
    end

    //step-4: observe error

    

endmodule
