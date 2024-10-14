`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2024 14:04:25
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

module binaryCounter #(
    parameter N = 8  
)(
    input wire clk,         
    input wire reset,       
    input wire enable,     
    input wire pause,        
    input wire up_down,     
    output reg [N-1:0] count
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 0; 
    end else if (enable && !pause) begin
        if (up_down) begin
            count <= count + 1; 
        end else begin
            count <= count - 1; 
        end
    end
end

endmodule
