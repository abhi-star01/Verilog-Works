`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:33:25 06/18/2021 
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
   ( input wire [31:0] operand1, operand2,
     input wire [2:0] mode, 
	 // input wire E,
	//  input wire [3:0] Rflags,
	  output wire [31:0] out,
	//  output wire [3:0] Wflags // Z C S O flags in order
	  output wire zero
    );
     reg carry ; 
	  reg [31:0] ALU_out ;
     wire Z,S,O ;
	  
	  always @*
	   begin
    //  if( E == 1) 
		 case(mode)
		  3'b010 : {carry, ALU_out} = operand1 + operand2 ;
        3'b110 : 
		   begin
			 ALU_out = operand1 - operand2 ;
			 carry = !ALU_out[31] ;
			end
		  3'b000 : ALU_out = operand1 & operand2;
		  3'b001 : ALU_out = operand1 | operand2;       	  
		  3'b111 : ALU_out = (operand1 < operand2) ? 1 : 0;
		 endcase 
		end 
	  
	  assign O = ALU_out[31] ^ ALU_out[30] ;
	  assign Z = (ALU_out == 0)? 1'b1 : 1'b0 ;
	  assign S = ALU_out[31];
	 // assign Wflags = {Z, carry, S, O}; 
	  assign zero = Z;
	  assign out = ALU_out;
	  
	endmodule 