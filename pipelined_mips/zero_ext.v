`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:03:43 07/10/2021 
// Design Name: 
// Module Name:    zero_ext 
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
  module zeroext(
   input wire [15:0] a,
   output wire [31:0] y
	);
	
   assign y = {{16{a[15]}}, a};
	
  endmodule 
