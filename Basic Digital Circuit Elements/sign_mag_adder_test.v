`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:52:06 05/23/2021 
// Design Name: 
// Module Name:    sign_mag_adder_test 
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
module sign_mag_adder_test ;
reg[4:0] a,b;
wire[4:0] sum;

sign_mag_add s_add_1(.a(a), .b(b), .sum(sum));

 // t e s t v e c t o r g e n e r a t o r
initial
begin

// te s t v e c t o r 1
a = 5'b01000;
b = 5'b11000;
# 200;
// t e s t v e c t o r 2
a = 5'b10101;
b = 5'b01100;
# 200;
// t es t v e c t o r 3
a = 5'b01001;
b = 5'b11111;
# 200;
// t e s t v e c t o r 4
a = 5'b10110;
b = 5'b00010;
# 200;
// t e s t v e c t o r 5
a = 5'b01110;
b = 5'b10000;
# 200;
// t e s t v e c t o r 6
a = 5'b11011;
b = 5'b00011;
# 200;
// t e s t v e c t o r 7
a = 5'b10111;
b = 5'b01001;
# 200;
// s t o p sitnztlation
$stop ;
end
endmodule

