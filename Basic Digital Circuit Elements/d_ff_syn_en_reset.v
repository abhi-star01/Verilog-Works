`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:15:51 05/25/2021 
// Design Name: 
// Module Name:    d_ff_syn_en_reset 
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
  module d_ff_syn_en_reset
  (
    input wire clk, reset ,
    input wire en ,
    input wire d ,
    output reg q
  );
  // body
  always @(posedge clk, posedge reset )
   if ( reset )
     q <= 1'b0;
   else if (en)
     q <= d ;
  endmodule
