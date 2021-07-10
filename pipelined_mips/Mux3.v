`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:27:25 07/10/2021 
// Design Name: 
// Module Name:    Mux3 
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
 module Mux3
  (
    output wire [31:0] Dataout,
    input wire [31:0] A, B, C,
    input wire [1:0] sel	 
   );
	 wire do1,do2;
    mux #(32) ab( A,B,sel[1], do1);
    mux #(32) bc( C,B,sel[1], do2);
    mux #(32) abc( do1, do2, sel[0], Dataout); 	 

 endmodule
