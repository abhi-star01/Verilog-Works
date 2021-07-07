`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:58:47 05/31/2021 
// Design Name: 
// Module Name:    ALU 
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
  module ALU
   ( input wire [7:0] operand1, operand2,
     input wire [3:0] mode, 
	  input wire E,
	  input wire [3:0] Rflags,
	  output wire [7:0] out,
	  output wire [3:0] Wflags // Z C S O flags in order
    );
     reg carry ; 
	  reg [7:0] ALU_out ;
     wire Z,S,O ;
	  
	  always @*
	   begin
      if( E == 1) 
		 case(mode)
		  4'b0000 : {carry, ALU_out} = operand1 + operand2 ;
        4'b0001 : 
		   begin
			 ALU_out = operand1 - operand2 ;
			 carry = !ALU_out[7] ;
			end
		  4'b0010 : ALU_out = operand1 ;
		  4'b0011 : ALU_out = operand2 ;
		  4'b0100 : ALU_out = operand1 & operand2;
		  4'b0101 : ALU_out = operand1 | operand2;
		  4'b0110 : ALU_out = operand1 ^ operand2;       	  
		  4'b0111 : 
		   begin 
			 ALU_out = operand2 - operand1;
          carry = !ALU_out[7] ;
         end
		  4'b1000 : {carry, ALU_out} = operand2 + 8'd1;	
		  4'b1001 : 
		   begin 
			 ALU_out = operand2 - 1;
          carry = !ALU_out[7];
         end			 
		  4'b1010 : ALU_out = (operand2 << operand1[2:0])|(operand2 >> (8 - operand1[2:0])) ;
		  4'b1011 : ALU_out = (operand2 >> operand1[2:0])|(operand2 << (8 - operand1[2:0])) ;
		  4'b1100 : ALU_out = operand2 << operand1[2:0];
		  4'b1101 : ALU_out = operand2 >> operand1[2:0];
		  4'b1110 : ALU_out = operand2 >>> operand1[2:0];		  
		  4'b1111 : 
		   begin 
			 ALU_out = 8'd0 - operand2;
			 carry = !ALU_out[7];
			end 
		  default : ALU_out = operand2; // same value as accumulator
		 endcase 
		end 
	  
	  assign O = ALU_out[7] ^ ALU_out[6] ;
	  assign Z = (ALU_out == 0)? 1'b1 : 1'b0 ;
	  assign S = ALU_out[7];
	  assign Wflags = {Z, carry, S, O}; 
	  assign out = ALU_out;
	  
	endmodule 