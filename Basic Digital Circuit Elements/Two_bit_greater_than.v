`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:32:33 03/06/2021 
// Design Name: 
// Module Name:    Two_bit_greater_than 
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

module Two_bit_greater_than
(
  input wire [1:0] a , b ,
  output wire agrb
);


wire p0, p1, p2, p3, p4, p5;

assign agrb = p0 | p1 | p2 | p3 | p4 | p5;

  assign p0 = (~a[1] & a[0]) & (~b[1] & ~b[0]) ;
  assign p1 = (a[1] & ~a[0]) & (~b[1] & ~b[0]) ;
  assign p2 = (a[1] & ~a[0]) & (~b[1] & b[0]);
  assign p3 = (a[1] & a[0]) & (~b[1] & ~b[0]);
  assign p4 = (a[1] & a[0]) & (~b[1] & b[0]);
  assign p5 = (a[1] & a[0]) & (b[1] & ~b[0]);
  
endmodule
