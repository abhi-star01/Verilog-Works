`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:49:27 05/25/2021 
// Design Name: 
// Module Name:    univ_shift_reg 
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
  module univ_shift_reg
  #( parameter N = 8)
   (
     input wire clk, reset ,
     input wire [1:0] ctrl ,
     input wire [N-1:0] d ,
     output wire [N-1:0] q
   );
   // s i g n a l d e c l a r a t i o n
   reg [N-1:0] r_reg , r_next ;
   // body
   // register (memory kept isolated from the combinational ones) 
   always @(posedge clk, posedge reset)
    if ( reset )
     r_reg <= 0 ;
    else
     r_reg <= r_next ;

   // n e x t - s t a t e logic
   always @*
    case (ctrl)
     2'b00: r_next = r_reg; // no operation
     2'b01: r_next = {r_reg[N-2:0], d[0]}; // shift left (assuming lsb of load data inserted via right)
     2'b10: r_next = {d[N-1], r_reg[N-1:1]}; // shift right (assuming msb of load data inserted via left)
     2'b11: r_next = d ; // load (parallel)
    endcase
   // output logic
    assign q = r_reg ;

  endmodule
