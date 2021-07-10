`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:22:55 06/18/2021 
// Design Name: 
// Module Name:    left_shift2 
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
 module left_shift2(
  input wire [31:0] a,
  output wire [31:0] y
  );
// shift left by 2
  assign y = {a[29:0], 2'b00};

 endmodule 