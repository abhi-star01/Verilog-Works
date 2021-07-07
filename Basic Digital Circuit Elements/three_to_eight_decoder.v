`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:55:14 03/09/2021 
// Design Name: 
// Module Name:    three_to_eight_decoder 
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
module three_to_eight_decoder(
    input wire [2:0]a,
	 input wire en,
	 output wire [7:0]b
    );
	 
	 assign na = ~a[2] & en;
	 assign ap = a[2] & en;
	 
	 two_to_four_decoder p1(
    .a(a[1:0]), 
    .en(na), 
    .b(b[3:0])
    );
	 
	 two_to_four_decoder p2(
    .a(a[1:0]), 
    .en(ap), 
    .b(b[7:4])
    );
	 	 
endmodule
