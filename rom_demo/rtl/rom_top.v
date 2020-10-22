/************************************************************
* Filename  :  "rom_top.v"
* Author    :  yang jiangtao
* Description  :  top module of project "rom_demo"
* Called by :  None
* Last modified: 2020/10/18/10:08
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


/*module*/
module rom_top
    (
        input iws_clk,
        input [7:0] iwv_addr,
        
        output [7:0] owv_q        
    );

    //step-1: Internal reg or wire

   
    //step-2: Main logic
    //2-1: 8 bits counter
    reg [7:0] rv_addr;
    always@(posedge iws_clk) begin
        rv_addr <= rv_addr + 1'b1;
    end

    //2-2: instantiate "rom_1port.v"
    rom_1port u0_rom_1port(
	.address(rv_addr),
	.clock(iws_clk),
	.q(owv_q));

    //step-3: Module output   
    //3-1: Output owv_q

    //3-2: Output ows_q7
    
    
endmodule
