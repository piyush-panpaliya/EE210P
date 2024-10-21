`timescale 1ns / 1ps
module seqDetector #(parameter moore=0, parameter overlap=0) (
  input clk,
  input reset,
  input din,  
  output reg dout  
); 
  parameter IDLE = 3'b000;
  parameter S1 = 3'b001;
  parameter S10 = 3'b010;
  parameter S101 = 3'b011;
  parameter S1011 = 3'b100;
  parameter S10110 = 3'b101;

  reg [2:0] cs, ns;
  always @(posedge clk or posedge reset) begin
    if (reset)
      cs <= IDLE;
    else
      cs <= ns;
  end

  always @(*) begin
    ns = cs;
    dout = 1'b0;  
      
    case (cs)
      IDLE: begin
        if (din == 1'b1)
          ns = S1;
      end
      S1: begin
        if (din == 1'b0) 
          ns = S10;
      end
      
      S10: begin
        if (din == 1'b1)
          ns = S101;
        else
          ns = IDLE;  
      end
      
      S101: begin
        if (din == 1'b1)
          ns = S1011;
        else
          ns = S10;  
      end
      
      S1011: begin
        if (din == 1'b0) begin
          if (moore) 
            ns = S10110;
          else begin 
            dout = 1'b1;  
            ns = (overlap) ? S10 : IDLE; 
          end  
        end
        else
          ns = S1;
      end

      S10110: begin
        dout = 1'b1;  
        if (overlap)
          ns = S10;
        else
          ns = IDLE;  
      end
    endcase
  end

endmodule
