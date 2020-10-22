module piso_4(
    clk,
    reset_n,
	ena,
    din,
    dout);
    //step-1: IO ports
    //input ports
    input clk;
    input reset_n;
	input ena;
    input [3:0] din;
    //output ports
    output dout;
    //reg or wire
    reg reg_dout;
	reg [1:0] cnt;
	reg [3:0] reg_data;


    //step-2: logic
    //counter and refresh reg_data
    always @ (posedge clk, negedge reset_n) begin
        if(!reset_n) begin
            cnt <= 2'd0;
		end
		else if(cnt==2'd3) begin
			cnt <= 2'd0;
			reg_data <= din;
		end
        else begin
			cnt <= cnt + 2'd1;
        end
    end
	//combinational logic: dout
	always @ (*) begin
		case(cnt)
			2'd0: reg_dout <= reg_data[0];
			2'd1: reg_dout <= reg_data[1];
			2'd2: reg_dout <= reg_data[2];
			2'd3: reg_dout <= reg_data[3];
		endcase
	end

    //step-3: output
	assign dout = (ena) ? reg_dout : 0;

endmodule
