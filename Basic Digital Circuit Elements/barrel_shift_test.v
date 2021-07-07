`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:49:32 05/23/2021 
// Design Name: 
// Module Name:    barrel_shift_test 
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
`timescale 1 ns/10 ps

module barrel_shift_test ;
// s i g n a l d e c l a r a t i o n
reg [7:0]a ;
reg [2:0]amt ;
reg dir ;
wire [7:0]test_out ;

// i n s t a n t i a t e t h e c i r c u i t under t e s t
  multifunction_barrel_shifter_stage_reversal axp(.a(a), .amt(amt), .y(test_out), .dir(dir));


 // t e s t v e c t o r g e n e r a t o r
initial
begin

// t e s t v e c t o r 1
a = 8'b10001100;
amt = 3'b100;
dir = 1;
# 200;
// t e s t v e c t o r 2
a = 8'b10101010;
amt = 3'b000;
dir = 0;
# 200;
// t e s t v e c t o r 3
a = 8'b01010101;
amt = 3'b110;
dir = 0;
# 200;
// t e s t v e c t o r 4
a = 8'b10010110;
amt = 3'b101;
dir = 1;
# 200;
// t e s t v e c t o r 5
a = 8'b10110011;
amt = 3'b010;
dir = 0;
# 200;
// t e s t v e c t o r 6
a = 8'b11001111;
amt = 3'b101;
dir = 0;
# 200;
// t e s t v e c t o r 7
a = 8'b11010101;
amt = 3'b011;
dir = 1;
# 200; 
// s t o p sitnztlation
$stop ;
end
endmodule
