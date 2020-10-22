/************************************************************
* Filename ﹕ "gray_to_bin.v"
* Author ﹕yang jiangtao
* Description ﹕gray code to binary code
* Called by ﹕None
* Revision History ﹕2020.10.11-11:21
* Revision 1.0
* Email ﹕ 
* Company ﹕ 
* Copyright(c) 2019, xxxx Technology Inc, All right reserved
***************************************************************/

`timescale 1ns/1ns
module test(
    gray,
    bin);

    //step-0: parameter
    parameter WIDTH = 8;
    
    //step-1: IO ports
    //1-1: input ports
    input [WIDTH-1:0] gray;
    //1-2: output ports
    output [WIDTH-1:0] bin;
    //reg or wire
//    reg [7:0] bin;
//   
//    //step-2: logic
//    //
//    integer i;
//    always @(*) begin
//        bin[7] <= gray[7];
//        for(i=6;i>=0;i=i-1) begin
//            bin[i] <= gray[i] - bin[i+1]; 
//        end
//    end
//    //step-3: output    
    assign bin[WIDTH-1] = gray[WIDTH-1];
    genvar i;
    generate
        for(i=WIDTH-2; i>=0; i=i-1) begin: gray_to_bin
            assign bin[i] = gray[i] - bin[i+1];
        end    
    endgenerate
    
endmodule
