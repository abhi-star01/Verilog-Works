`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:20:54 05/23/2021 
// Design Name: 
// Module Name:    sign_mag_add 
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
module sign_mag_add
   #( parameter N = 4) 
	(
    input wire[N:0] a,b,
	 output reg[N:0] sum
    );
	 
	 //signal declaration
	 reg[N-1:0] max, min, mag_a, mag_b, mag_sum;
	 reg sign_a, sign_b, sign_sum;
	 
	 //body
	 always @*
	  begin
	  mag_a = a[N-1:0];
	  mag_b = b[N-1:0];
	  sign_a = a[N];
	  sign_b = b[N];
	  
	  if(mag_a > mag_b)
	   begin
		max = mag_a;
		min = mag_b;
		sign_sum = sign_a;
		end
		
	  else
	   begin
		max = mag_b;
		min = mag_a;
		sign_sum = sign_b;
	   end
		
	  if(sign_a == sign_b)
	   mag_sum = max + min;
	  else
	   mag_sum = max - min;
		
		sum = {sign_sum , mag_sum};
	  end
endmodule
