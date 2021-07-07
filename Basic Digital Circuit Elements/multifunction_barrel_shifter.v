`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:24:27 05/24/2021 
// Design Name: 
// Module Name:    multifunction_barrel_shifter 
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
module multifunction_barrel_shifter(
   input wire [7:0] a,
   input wire [2:0] amt,
	input wire dir,
   output reg [7:0] y  
    );
	
	always @*
	 begin
	 if(dir)  //right
	  begin
     case(amt)
      3'o0: y = a;
      3'o1: y = {a[0], a[7:1]};
      3'o2: y = {a[1:0], a[7:2]};
      3'o3: y = {a[2:0], a[7:3]};
      3'o4: y = {a[3:0], a[7:4]};
      3'o5: y = {a[4:0], a[7:5]};
      3'o6: y = {a[5:0], a[7:6]};
      default: y = {a[0], a[7:1]};
     endcase
	  end
	 
	 else  //left
	  begin
     case(amt)
      3'o0: y = a;
      3'o1: y = {a[6:0], a[7]};
      3'o2: y = {a[5:0], a[7:6]};
      3'o3: y = {a[4:0], a[7:5]};
      3'o4: y = {a[3:0], a[7:4]};
      3'o5: y = {a[2:0], a[7:3]};
      3'o6: y = {a[1:0], a[7:2]};
      default: y = {a[0], a[7:1]};
     endcase
	  end
    end	     
endmodule
