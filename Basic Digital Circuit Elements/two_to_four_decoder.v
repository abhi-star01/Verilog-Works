`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:55:55 03/09/2021 
// Design Name: 
// Module Name:    two_to_four_decoder 
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
module two_to_four_decoder(
   input wire[1:0] a,
   input wire en,	
	output wire[3:0] b
    );
   
	assign b[0] = en & ~a[1] & ~a[0] ;
	assign b[1] = en & ~a[1] & a[0];
	assign b[2] = en & a[1] & ~a[0];
	assign b[3] = en & a[1] & a[0];

endmodule
