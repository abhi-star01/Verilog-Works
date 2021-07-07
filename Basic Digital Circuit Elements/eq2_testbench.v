
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:00:19 02/25/2021 
// Design Name: 
// Module Name:    eq2_testbench 
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

module eq2_testbench ;
// s i g n a l d e c l a r a t i o n
  reg [1:0]test_in0, test_in1 ;
wire test_out ;

// i n s t a n t i a t e t h e c i r c u i t under t e s t
  eq2 uut (.a(test_in0), .b(test_in1), .aeqb(test_out));


 // t e s t v e c t o r g e n e r a t o r
initial
begin

// t e s t v e c t o r 1
test_in0 = 2'b00;
test_in1 = 2'b00;
# 200;
// t e s t v e c t o r 2
test_in0 = 2'b01;
test_in1 = 2'b00;
# 200;
// t e s t v e c t o r 3
test_in0 = 2'b01;
test_in1 = 2'b11;
# 200;
// t e s t v e c t o r 4
test_in0 = 2'b10;
test_in1 = 2'b10;
# 200;
// t e s t v e c t o r 5
test_in0 = 2'b10;
test_in1 = 2'b00;
# 200;
// t e s t v e c t o r 6
test_in0 = 2'b11;
test_in1 = 2'b11;
# 200;
// t e s t v e c t o r 7
test_in0 = 2'b11;
test_in1 = 2'b01;
# 200;
// s t o p sitnztlation
$stop ;
end
endmodule
