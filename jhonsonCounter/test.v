`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2024 14:31:35
// Design Name: 
// Module Name: test
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
module testJC;

reg clk;
reg reset;
wire [7:0] q;

johnsonCounter uut (
    .clk(clk),
    .reset(reset),
    .q(q)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;  
    #10;
    
    reset = 0;
    #100;      
    reset = 1; 
    #10;
    
    reset = 0; 
    #100;       

    $stop;    
end
endmodule
