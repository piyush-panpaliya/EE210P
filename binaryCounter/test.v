`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2024 14:06:02
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

module bcounterTest;
    parameter N = 8;

    reg clk;
    reg reset;
    reg enable;
    reg pause;
    reg up_down;
    wire [N-1:0] count;

    binaryCounter #(.N(N)) uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .pause(pause),
        .up_down(up_down),
        .count(count)
    );

    always #10 clk = ~clk;

    initial begin
        clk = 0;
        reset = 0;
        enable = 0;
        pause = 0;
        up_down = 1;

        #20 reset = 1;
        #20 reset = 0;

        #20 enable = 1;
        #100; 

        #20 pause = 1;
        #40 pause = 0;

        #20 up_down = 0; 
        #100; 

        #20 reset = 1;
        #20 reset = 0;

        #20 enable = 0;
        #40;

        $stop;
    end

endmodule
