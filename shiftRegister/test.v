`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2024 14:42:40
// Design Name: 
// Module Name: testBench
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

module testBench(

    );
    reg dataIn;
    reg clk=0;
    wire  dataOut;
    shiftReg u1(.dataIn(dataIn), .clk(clk), .dataOut(dataOut));

    always begin
        #5 clk = ~clk;
    end

    initial begin
        dataIn =0;
        #10 dataIn = 1;
        #10 dataIn = 0;
        #10 dataIn = 1;
        #10 dataIn = 0;
        #10 dataIn = 1;
        #10 dataIn = 0;
        #40 $finish;
        
    end

endmodule
