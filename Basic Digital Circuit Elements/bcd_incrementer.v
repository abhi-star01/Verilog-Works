`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:10:08 05/24/2021 
// Design Name: 
// Module Name:    bcd_incrementer 
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
module bcd_incrementer(
    input wire [11:0] bcd_in,
	 output reg [11:0] bcd_out
    );
    wire [3:0] units, tens, hundreds;
	 reg [3:0] ou, ot, oh; // output's units, tens and hundreds places value
    assign units = bcd_in[3:0];
    assign tens = bcd_in[7:4];
    assign hundreds = bcd_in[11:8];

    always @*
     begin
      if(!(units[3] & units[0]))  // unit digit != 9..ie <9
		 begin
		  ou = units + 1;
		  ot = tens;
		  oh = hundreds;
		 end
		else if(!(tens[3] & tens[0])) // tens digit != 9 ..ie <9 but units digit = 9
		 begin
		  ot = tens + 1;
		  ou = 4'b0000;
		  oh = hundreds;
		 end
		else                          // both units and tens are 9
		 begin
        ou = 4'b0000;
        ot = 4'b0000;
        oh = hundreds + 1;
  		 end
		bcd_out = {oh,ot,ou};
      end		 
endmodule
