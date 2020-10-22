/************************************************************
* Filename ﹕ "uart_tx_sm.v"
* Author ﹕yang jiangtao
* Description ﹕state machine of "uart_tx"
* Called by ﹕None
* Revision History ﹕2020.10.9-9:36
* Revision 1.0
* Email ﹕ 
* Company ﹕ 
* Copyright(c) 2019, xxxx Technology Inc, All right reserved
***************************************************************/

`timescale 1ns/1ns
module uart_tx_sm( 
    clk,
    reset_n,
    ena,
    parity_bit,
    data_in,
    serial_out,
    send_done,
	uart_state);
    
    //step-0: IO ports
    //input ports
    input clk;
    input reset_n;
    input ena;
    input parity_bit;
    input [7:0] data_in;
    //output ports
    output serial_out;
    output send_done;
    output uart_state;
    
    //step-1: state code
    //one-hot code
    localparam s_IDLE        = 12'b000_0000_0000_1;
    localparam s_send_start  = 12'b000_0000_0001_0;
    localparam s_send_data_0 = 12'b000_0000_0010_0;
    localparam s_send_data_1 = 12'b000_0000_0100_0;
    localparam s_send_data_2 = 12'b000_0000_1000_0;
    localparam s_send_data_3 = 12'b000_0001_0000_0;
    localparam s_send_data_4 = 12'b000_0010_0000_0;
    localparam s_send_data_5 = 12'b000_0100_0000_0;
    localparam s_send_data_6 = 12'b000_1000_0000_0;
    localparam s_send_data_7 = 12'b001_0000_0000_0;
    localparam s_send_parity = 12'b010_0000_0000_0;
    localparam s_send_stop   = 12'b100_0000_0000_0;
    //current and next
    reg [11:0] s_current;
    reg [11:0] s_next;
    
    SM_Probe sm_probe_0(
    .probe(s_current));
    
    SM_Probe sm_probe_1(
    .probe(s_next));
    
    //step-2: state transition
    reg reg_serial_out;
    reg reg_send_done;
    reg reg_uart_state;
    //when s_send_data_en send data
    reg s_send_data_en;
    always @(*) begin
        case(s_current)
            s_IDLE: begin
                if(ena)
                    s_next <= s_send_start;
                else
                    s_next <= s_IDLE;
                //output logic
                reg_serial_out <= 1'b1;
                reg_send_done <= 1'b0;
                reg_uart_state <= 1'b0; 
            end  
            
            s_send_start: begin
                s_next <= s_send_data_0;
                //output logic
                reg_serial_out <= 1'b0;
                reg_send_done <= 1'b0;
                reg_uart_state <= 1'b1;
            end  
            
            s_send_data_0: begin
                s_next <= s_send_data_1;               
                //output logic
                reg_serial_out <= data_in[0];
                reg_send_done <= 1'b0;
                reg_uart_state <= 1'b1;
            end 

            s_send_data_1: begin
                s_next <= s_send_data_2;               
                //output logic
                reg_serial_out <= data_in[1];
                reg_send_done <= 1'b0;
                reg_uart_state <= 1'b1;
            end 

            s_send_data_2: begin
                s_next <= s_send_data_3;               
                //output logic
                reg_serial_out <= data_in[2];
                reg_send_done <= 1'b0;
                reg_uart_state <= 1'b1;
            end 

            s_send_data_3: begin
                s_next <= s_send_data_4;               
                //output logic
                reg_serial_out <= data_in[3];
                reg_send_done <= 1'b0;
                reg_uart_state <= 1'b1;
            end 

            s_send_data_4: begin
                s_next <= s_send_data_5;               
                //output logic
                reg_serial_out <= data_in[4];
                reg_send_done <= 1'b0;
                reg_uart_state <= 1'b1;
            end 

            s_send_data_5: begin
                s_next <= s_send_data_6;               
                //output logic
                reg_serial_out <= data_in[5];
                reg_send_done <= 1'b0;
                reg_uart_state <= 1'b1;
            end 

            s_send_data_6: begin
                s_next <= s_send_data_7;              
                //output logic
                reg_serial_out <= data_in[6];
                reg_send_done <= 1'b0;
                reg_uart_state <= 1'b1;
            end 
            
            s_send_data_7: begin
                if(parity_bit)
                    s_next <= s_send_parity;
                else 
                    s_next <= s_send_stop;                
                //output logic
                reg_serial_out <= data_in[7];
                reg_send_done <= 1'b0;
                reg_uart_state <= 1'b1;
            end 
            
            s_send_parity: begin
                s_next <= s_send_stop; 
                //output logic
                reg_serial_out <= ^data_in; //parity_bit
                reg_send_done <= 1'b0;
                reg_uart_state <= 1'b1;
            end
                    
            s_send_stop: begin 
                s_next <= s_IDLE;  
               //output logic
                reg_serial_out <= 1'b1;
                reg_send_done <= 1'b1;
                reg_uart_state <= 1'b1; 
            end  
            
            default: begin 
                s_next <= s_IDLE;
                //output logic
                reg_serial_out <= 1'b1;
                reg_send_done <= 1'b0;
                reg_uart_state <= 1'b0;
            end
        endcase
    end
    
    //step-3: state flip-flop
    always @(posedge clk or negedge reset_n) begin
        if(!reset_n)
            s_current <= s_IDLE;
        else 
            s_current <= s_next;
    end
    
    //step-4: output 
    assign serial_out = reg_serial_out;
    assign send_done = reg_send_done;
    assign uart_state = reg_uart_state;
    
endmodule
