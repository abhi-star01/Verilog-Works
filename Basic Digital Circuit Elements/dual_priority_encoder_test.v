
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:52:24 05/24/2021 
// Design Name: 
// Module Name:    dual_priority_encoder_test 
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
module dual_priority_encoder_test ;

reg [11:0] req;
wire [3:0] first, second;

dual_priority_encoder usa(.req(req),.first(first),.second(second));

initial
 begin
 req = 12'b100111010011;
 #200;
 req = 12'b101010101010;
 #200;
 req = 12'b001010111010;
 #200;
 req = 12'b000110101010;
 #200; 
 req = 12'b000000010010;
 #200;
 req = 12'b000000000011;
 #200;
 end
endmodule
