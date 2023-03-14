`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2023 17:44:01
// Design Name: 
// Module Name: pe
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



module pe #( parameter DATA_WIDTH=8)
( input rst,clk,
 input [DATA_WIDTH-1:0] in_a,in_b,
 output reg [2*DATA_WIDTH:0] out_c,
 output reg [DATA_WIDTH-1:0] out_a,out_b
);
 always @(posedge clk)begin
    if(rst) begin
      out_a<=0;
      out_b<=0;
      out_c<=0;
    end
    else begin  
      out_c<=out_c+in_a*in_b;
      out_a<=in_a;
      out_b=in_b;
    end
 end
 
endmodule
