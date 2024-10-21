`timescale 1ns / 1ps
module tbSeqDetector;
  reg clk;
  reg reset;
  reg din;
  wire doutMoore;
  wire doutMeeley;
  wire doutMeeleyOverlap;
    
  seqDetector #(1,0) uut (
    .clk(clk),
    .reset(reset),
    .din(din),
    .dout(doutMoore)
  );
  seqDetector #(0,0) uutm (
    .clk(clk),
    .reset(reset),
    .din(din),
    .dout(doutMeeley)
  );
  seqDetector #(0,1) uutmo (
    .clk(clk),
    .reset(reset),
    .din(din),
    .dout(doutMeeleyOverlap)
  );
  
  always begin
    #10 clk = ~clk;
  end
    
  initial begin 
    clk = 0;
    reset = 1;
    din = 0;
    #20 reset = 0;

    #20 din = 0;
    #20 din = 1;
    #20 din = 0;
    #20 din = 0;
    #20 din = 1;
    #20 din = 0;
    #20 din = 1;
    #20 din = 1;
    #20 din = 0;
    #20 din = 0;
    #20 din = 1;
    #20 din = 0;
    #20 din = 1;
    #20 din = 1;
    #20 din = 1;
    #20 din = 0;
    #20 din = 1;
    #20 din = 1;
    #20 din = 0;
    #20 din = 1;
    #20 din = 0;
    #20 din = 0;
    #20 din = 1;
    #20 din = 0;
    #20 din = 1;
    #20 din = 0;
    #20 din = 1;
    #20 din = 1;
    #20 din = 0;
    #20 din = 1;
    #20 din = 1;
    #20 din = 0;
    #20 din = 1;
    #20 din = 1;
    #20 din = 0;


    #100;
    $stop;
  end
endmodule
