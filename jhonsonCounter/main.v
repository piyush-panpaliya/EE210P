`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2024 14:24:13
// Design Name: 
// Module Name: main
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module johnsonCounter (
    input clk,          
    input reset,       
    output reg [7:0] q
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        q <= 8'b00000000;    
    end else begin
        q <= {~q[0], q[7:1]}; 
    end
end

endmodule
