`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:02:02 02/22/2021 
// Design Name: 
// Module Name:    eq2 
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
module eq2
(
  input wire [1:0] a , b ,
  output wire aeqb
);

// i n t e r n a l s i g n a l d e c l a r a t i o n
wire p0, p1, p2, p3;
 // slim o f p r o d u c t t e r m s
assign aeqb = p0 | p1 | p2 | p3;
// product t e r m s
  assign p0 = (~a[1] & ~b[1]) & (~a[0] & ~b[0]) ;
  assign p1 = (~a[1] & ~b[1]) & (a[0] & b[0]) ;
  assign p2 = (a[1] & b[1]) & (~a[0] & ~b[0]);
  assign p3 = (a[1] & b[1]) & (a[0] & b[0]) ;
endmodule