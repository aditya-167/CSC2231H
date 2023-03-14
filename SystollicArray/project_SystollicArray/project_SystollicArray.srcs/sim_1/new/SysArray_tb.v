`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2023 20:24:11
// Design Name: 
// Module Name: SysArray_tb
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


module SysArray_tb;
 // Inputs
 parameter DATA_WIDTH=8,
 parameter SystolicSize = 4
 integer i;
 reg clk;
 reg reset;
 /*reg [7:0] a1;
 reg [7:0] a2;
 reg [7:0] a3;
 reg [7:0] b1;
 reg [7:0] b2;
 reg [7:0] b3;*/
reg [DATA_WIDTH-1:0] in_a[SystolicSize-1:0];
reg in_b[SystolicSize-1:0];
 // Outputs
 wire [2*DATA_WIDTH:0] out_c[SystolicSize*SystolicSize-1:0]);
 /*wire [16:0] c1;
 wire [16:0] c2;
 wire [16:0] c3;
 wire [16:0] c4;
 wire [16:0] c5;
 wire [16:0] c6;
 wire [16:0] c7;
 wire [16:0] c8;
 wire [16:0] c9;
*/
 // Instantiate the Unit Under Test (UUT)
 SystolicMMU uut (
  .clk(clk), 
  .reset(reset), 
  .in_a(in_a), 
  .in_b(in_b), 
  .out_c(out_c));

 initial begin
  // Initialize Inputs
  clk = 0;
  reset = 0;
  for(i=0;i<SystolicSize*SystolicSize;i=i+1) begin
        in_a[i] = 0;
        in_b[i] = 0;
  end

  // Wait 100 ns for global reset to finish
  #5 rst = 1;
  #5 rst = 0;
  #5;  in_a[0] = 1; in_a[1] = 0; in_a[2] = 0;in_a[3] =0; in_b[0] = 1; in_b[1] = 0; in_b[2] = 0; in_b[3] = 0;
  #10; in_a[0] = 2; in_a[1] = 5; in_a[2] = 0; in_a[3]=0; in_b[0] = 5; in_b[1] = 2; in_b[2] = 0; in_b[3] = 0;
  #10; in_a[0] = 3; in_a[1] = 6; in_a[2] = 9; in_a[3]=0; in_b[0] = 9; in_b[1] = 6; in_b[2] = 3; in_b[3] = 0;
  #10; in_a[0] = 4; in_a[1] = 7; in_a[2] = 10; in_a[3]=13; in_b[0] = 13; in_b[1] = 10; in_b[2] = 7; in_b[3] = 4;
  #10; in_a[0] = 0; in_a[1] = 8; in_a[2] = 11; in_a[3]=14; in_b[0] = 0; in_b[1] = 14; in_b[2] = 11; in_b[3] = 8;
  #10; in_a[0] = 0; in_a[1] = 0; in_a[2] = 12; in_a[3]=15; in_b[0] = 0; in_b[1] = 0; in_b[2] = 15; in_b[3] = 12;
  #10; in_a[0] = 0; in_a[1] = 0; in_a[2] = 0; in_a[3]=16; in_b[0] = 0; in_b[1] = 0; in_b[2] = 0; in_b[3] = 16;
  #10; in_a[0] = 0; in_a[1] = 0; in_a[2] = 0; in_a[3]=0; in_b[0] = 0; in_b[1] = 0; in_b[2] = 0; in_b[3] = 0;
  #200;
  $stop;

 end
 
 initial begin
  forever #5 clk = ~clk;
 end
      
endmodule
