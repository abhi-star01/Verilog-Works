`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:48:00 05/25/2021 
// Design Name: 
// Module Name:    mod_m_counter 
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
//////////////////////////////////////////////////////////////////////////////////  module univ_shift_reg
module mod_m_counter 
 #( 
    parameter M = 10, 
              N = 4 
  )
  (
     input wire clk, reset ,
	  output wire max_tick,
     output wire [N-1:0] q
  );
   // signal declaration
   reg [N-1:0] r_reg ; 
	wire [N-1:0] r_next ;
   // body
   // register (memory kept isolated from the combinational ones) 
   always @(posedge clk, posedge reset)
    if ( reset )
     r_reg <= 0 ;
    else
     r_reg <= r_next ;

   // n e x t - s t a t e logic
   assign r_next = (r_reg == (M-1)) ? 0 : r_reg + 1;
   // output logic
   assign q = r_reg ;
	assign max_tick = (r_reg == (M-1)) ? 1 : 0;

  endmodule
