`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:21:17 07/10/2021 
// Design Name: 
// Module Name:    CompareAddress 
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
 module CompareAddress
  (
    output wire out,
	 input wire [4:0] A,B
   );
	
  assign out = (A == B) ? 1 : 0;

endmodule
