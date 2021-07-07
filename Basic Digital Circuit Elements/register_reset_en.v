`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:29:46 05/25/2021 
// Design Name: 
// Module Name:    register_reset_en 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
  module register_reset_en
  (
    input wire clk, reset, en,
    input wire [7:0] d ,
    output reg [7:0] q
  );
  // body
   always @(posedge clk , posedge reset)
    if( reset )
     q <= 0 ;
    else if (en)
    q <= d ;
  endmodule

