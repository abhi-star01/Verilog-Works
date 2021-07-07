`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:46:27 05/31/2021 
// Design Name: 
// Module Name:    prog_mem 
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
  module prog_mem(
     input wire clk,
     input wire e , le,  //enable and load enable
	  input wire [7:0] addr, Load_addr,
	  input wire [11:0] Iin ,
	  output wire [11:0] I  //instruction out
    );
     reg [11:0] pmem [255:0];
	  
	  always @(posedge clk)
	   if( e == 1 & le == 1 )
		 pmem[Load_addr] <= Iin ;
		 
	  assign I = (e == 1) ? pmem[addr] : 0 ;
	  
  endmodule
