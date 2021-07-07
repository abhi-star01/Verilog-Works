`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:40:48 05/31/2021 
// Design Name: 
// Module Name:    MUX 
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
  module MUX(
    input wire [7:0] In1, In2,
	 input wire sel, 
	 output wire [7:0] muxout
    );
    assign muxout = (sel == 0) ? In1 : In2 ;

  endmodule
