`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:46:38 03/10/2021 
// Design Name: 
// Module Name:    four_to_sixteen_decoder 
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
module four_to_sixteen_decoder(
    input wire [3:0]a,
	 input wire en,
	 output wire [15:0]b
    );
	 
	 assign na = ~a[2] & ~a[3] & en;
	 assign ap = a[2] & ~a[3] & en;
	 assign nq = a[3] & ~a[2] & en;
	 assign aq = a[3] & a[2] & en;
	 
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
	 
	 two_to_four_decoder p3(
    .a(a[1:0]), 
    .en(nq), 
    .b(b[11:8])
    );
	 
	 two_to_four_decoder p4(
    .a(a[1:0]), 
    .en(aq), 
    .b(b[15:12])
    );

endmodule
