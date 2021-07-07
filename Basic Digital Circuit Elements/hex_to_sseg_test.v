`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:27:30 05/23/2021 
// Design Name: 
// Module Name:    hex_to_seven_segment_decoder_test 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 _ File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module hex_to_sseg_test ;
//input wire clk,
reg[7:0] sw;
//output wire [3:0] an,
//wire[7:0] seven_segment_decoder ;

// signal declaration
reg[7:0] inc;
wire[7: 0] led0 , led1 , led2, led3 ;
// i n c r e m e n t i n p u t


// i n s t a n t i a t e f o u r i n s t a n c e s o f hex d e c o d e r s
// i n s t a n c e f o r 4 LSBs o f i n p u t
hex_to_seven_segment_decoder sseg_unit_0
 (.hex(sw[3:0]), .dp(1'b0), .sseg(led0));
 // i n s t a n c e f o r 4 MSBs o f i n p u t
hex_to_seven_segment_decoder sseg_unit_I
 (.hex(sw[7:4]), .dp(1'b0), .sseg(led1));
// i n s t a n c e f o r 4 LSBs o f incrernented v a l u e
hex_to_seven_segment_decoder sseg_unit_2
 (.hex(inc[3:0]), .dp(1'b1), .sseg(led2));
// i n s t a n c e f o r 4 MSBs o f incrernented v a l u e
hex_to_seven_segment_decoder sseg_unit_3
 (.hex(inc[7:4]), .dp(1'b1), .sseg(led3));
 
 //t e s t v e c t o r g e n e r a t or
initial
begin

// t e s t v e c t o r 1
sw = 8'b00101100;
inc = sw + 1;
# 200;
// t e s t v e c t o r 2
sw = 8'b11001001;
inc = sw + 1;
# 200;
// t e s t v e c t o r 3
sw = 8'b10101001;
inc = sw + 1;
# 200;
// t e s t v e c t o r 4
sw = 8'b01010010;
inc = sw + 1;
# 200;
// t e s t v e c t o r 5
sw = 8'b10010010;
inc = sw + 1;
# 200;
// t e s t v e c t o r 6
sw = 8'b00110011;
inc = sw + 1;
# 200;
// t e s t v e c t o r 7
sw = 8'b11001111;
inc = sw + 1;
# 200;
// s t o p sitnztlation
$stop ;
// instantiate the seven-segment time multiplexing module
// disp_mux disp_unit
// (.clk(clk), .reset(1'b0), .in0(led0), .in1(led1), .in2(led2), .in3(led3), .an(an), .sseg(seven_segment_decoder));
end
endmodule 
