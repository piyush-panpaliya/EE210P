`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.08.2024 15:42:49
// Design Name: 
// Module Name: fsubTest
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


module fsubTest;
 reg a,b,bin;
 wire d,bout;

 fsub tesstingg(a,b,bin,d,bout);
 initial begin
    a=0;b=0;bin=0;#10;
    a=0;b=0;bin=1;#10;
    a=0;b=1;bin=0;#10;
    a=0;b=1;bin=1;#10;
    a=1;b=0;bin=0;#10;
    a=1;b=0;bin=1;#10;
    a=1;b=1;bin=0;#10;
    a=1;b=1;bin=1;#10;
    
 end
endmodule
