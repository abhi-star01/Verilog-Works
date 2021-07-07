`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:18:26 03/07/2021 
// Design Name: 
// Module Name:    four-bit_greater_than 
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
module four_bit_greater_than
   (
   input wire [3:0]a ,b ,
	output wire out
    );
	 
	wire eq1,gr1,eq1gr1,gr2;
	
	Two_bit_greater_than msbgr (
    .a(a[3:2]), 
    .b(b[3:2]), 
    .agrb(gr2)
    );
	 
   eq2 msbeq (
    .a(a[3:2]), 
    .b(b[3:2]), 
    .aeqb(eq1)
    );
	Two_bit_greater_than lsbgr (
    .a(a[1:0]), 
    .b(b[1:0]), 
    .agrb(gr1)
    );
	 
	assign eq1gr1 = eq1 & gr1 ;
	assign out = gr2 | eq1gr1 ;
	
endmodule
