`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:04:50 07/10/2021 
// Design Name: 
// Module Name:    zeroext 
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
	
   assign y = {{16{1'b0}}, a};
	
  endmodule
