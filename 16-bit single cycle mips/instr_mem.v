`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:57:40 06/18/2021 
// Design Name: 
// Module Name:    instr_mem 
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
  module instr_mem(
     input wire clk,
     //input wire e , le,  //enable and load enable
	  input wire [5:0] addr,// Load_addr,
	  //input wire [31:0] Iin ,
	  output wire [31:0] I  //instruction out
    );
     reg [31:0] imem [63:0];
	  
	  initial
      $readmemh("memfile.txt", imem);
		
	//  always @(posedge clk)
	//	 imem[Load_addr] <= Iin ;
		 
	  assign I = imem[addr] ;
	  
  endmodule

