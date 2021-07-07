`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:47:48 05/23/2021 
// Design Name: 
// Module Name:    hex_to_seven_segment_decoder 
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
module hex_to_seven_segment_decoder(
    input wire[3:0] hex,  // hex as 4 bit binary
    input wire dp,
    output reg[7:0] sseg  // (decimal_point) a b c d e f g	 
    );
	 
	 always @*
	 begin
	  case(hex)
	  4'h0: sseg[6:0] = 7'b0000001;
	  4'h1: sseg[6:0] = 7'b1001111;
	  4'h2: sseg[6:0] = 7'b0010010;
	  4'h3: sseg[6:0] = 7'b0000011;
	  4'h4: sseg[6:0] = 7'b1001100;
	  4'h5: sseg[6:0] = 7'b0100100;
	  4'h6: sseg[6:0] = 7'b0100000;
	  4'h7: sseg[6:0] = 7'b0001111;
	  4'h8: sseg[6:0] = 7'b0000100;
	  4'h9: sseg[6:0] = 7'b0000010;
	  4'ha: sseg[6:0] = 7'b0000010;
	  4'hb: sseg[6:0] = 7'b1100000;
	  4'hc: sseg[6:0] = 7'b0110001;
	  4'hd: sseg[6:0] = 7'b1000001;
	  4'he: sseg[6:0] = 7'b0000001;
	  4'hf: sseg[6:0] = 7'b0111000;
	  endcase
	  sseg[7] = dp;
	 end
	  
endmodule
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
