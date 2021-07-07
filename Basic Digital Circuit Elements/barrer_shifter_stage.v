`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:29:26 05/23/2021 
// Design Name: 
// Module Name:    barrer_shifter_stage 
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
 module barrel_shifter_stage
 (
   input wire [7:0] a,
   input wire [2:0] amt,
   output wire [7:0] y
 );
// si n a l d e c l a r a t i o n
 wire [7:0] s1, s0;

// body
// s t a g e 0, s h i f t 0 o r 1 b i t
 assign s0 = amt[0] ? {a[0], a[7:1]} : a;
// s t a g e 1 , s h i f t 0 o r 2 b i t s
 assign s1 = amt[1] ? {s0[1:0] , s0[7:2]} : s0;
// s t a g e 2, s h i f t 0 o r 4 b i t s
 assign y = amt[2] ? {s1[3:0], s1[7:4]} : s1;
endmodule
