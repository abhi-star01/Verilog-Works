`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:09:29 05/24/2021 
// Design Name: 
// Module Name:    dual_priority_encoder 
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
module dual_priority_encoder(
    input wire [11:0] req,
	 output reg [3:0] first,
	 output reg [3:0] second
    );
    
	 always @*
	  begin
	   if(req[11])
		 begin
		 first = 4'b1100;
		  casez(req)
		  12'b11??????????: second = 4'b1011;
		  12'b101?????????: second = 4'b1010;
		  12'b1001????????: second = 4'b1001;
		  12'b10001???????: second = 4'b1000;
		  12'b100001??????: second = 4'b0111;
		  12'b1000001?????: second = 4'b0110;
		  12'b10000001????: second = 4'b0101;
		  12'b100000001???: second = 4'b0100;
		  12'b1000000001??: second = 4'b0011;
		  12'b10000000001?: second = 4'b0010;
		  12'b100000000001: second = 4'b0001;
		  endcase
		 end
		else if(req[10])
		 begin
		  first = 4'b1011;
		  casez(req)
		  12'b011?????????: second = 4'b1010;
		  12'b0101????????: second = 4'b1001;
		  12'b01001???????: second = 4'b1000;
		  12'b010001??????: second = 4'b0111;
		  12'b0100001?????: second = 4'b0110;
		  12'b01000001????: second = 4'b0101;
		  12'b010000001???: second = 4'b0100;
		  12'b0100000001??: second = 4'b0011;
		  12'b01000000001?: second = 4'b0010;
		  12'b010000000001: second = 4'b0001;
		  endcase		   
		 end
		else if(req[9])
		 begin
		  first = 4'b1010;
		  casez(req)
		  12'b0011????????: second = 4'b1001;
		  12'b00101???????: second = 4'b1000;
		  12'b001001??????: second = 4'b0111;
		  12'b0010001?????: second = 4'b0110;
		  12'b00100001????: second = 4'b0101;
		  12'b001000001???: second = 4'b0100;
		  12'b0010000001??: second = 4'b0011;
		  12'b00100000001?: second = 4'b0010;
		  12'b001000000001: second = 4'b0001;
		  endcase		   
		 end	
		else if(req[8])
		 begin
		  first = 4'b1001;
		  casez(req)
		  12'b00011???????: second = 4'b1000;
		  12'b000101??????: second = 4'b0111;
		  12'b0001001?????: second = 4'b0110;
		  12'b00010001????: second = 4'b0101;
		  12'b000100001???: second = 4'b0100;
		  12'b0001000001??: second = 4'b0011;
		  12'b00010000001?: second = 4'b0010;
		  12'b000100000001: second = 4'b0001;
		  endcase		   
		 end			  
		else if(req[7])
		 begin
		  first = 4'b1000;
		  casez(req)
		  12'b000011??????: second = 4'b0111;
		  12'b0000101?????: second = 4'b0110;
		  12'b00001001????: second = 4'b0101;
		  12'b000010001???: second = 4'b0100;
		  12'b0000100001??: second = 4'b0011;
		  12'b00001000001?: second = 4'b0010;
		  12'b000010000001: second = 4'b0001;
		  endcase		   
		 end		  
		else if(req[6])
		 begin
		  first = 4'b0111;
		  casez(req)
		  12'b0000011?????: second = 4'b0110;
		  12'b00000101????: second = 4'b0101;
		  12'b000001001???: second = 4'b0100;
		  12'b0000010001??: second = 4'b0011;
		  12'b00000100001?: second = 4'b0010;
		  12'b000001000001: second = 4'b0001;
		  endcase		   
		 end			  
		else if(req[5])
		 begin
		  first = 4'b0110;
		  casez(req)
		  12'b00000011????: second = 4'b0101;
		  12'b000000101???: second = 4'b0100;
		  12'b0000001001??: second = 4'b0011;
		  12'b00000010001?: second = 4'b0010;
		  12'b000000100001: second = 4'b0001;
		  endcase		   
		 end		
		else if(req[4])
		 begin
		  first = 4'b0101;
		  casez(req)
		  12'b000000011???: second = 4'b0100;
		  12'b0000000101??: second = 4'b0011;
		  12'b00000001001?: second = 4'b0010;
		  12'b000000010001: second = 4'b0001;
		  endcase		   
		 end			  
		else if(req[3])
		 begin
		  first = 4'b0100;
		  casez(req)
		  12'b0000000011??: second = 4'b0011;
		  12'b00000000101?: second = 4'b0010;
		  12'b000000001001: second = 4'b0001;
		  endcase		   
		 end			  
		else if(req[2])
		 begin
		  first = 4'b0011;
		  casez(req)
		  12'b00000000011?: second = 4'b0010;
		  12'b000000000101: second = 4'b0001;
		  endcase		   
		 end		  
		else if(req[1])
		 begin
		  first = 4'b0010;
		  casez(req)
		  12'b000000000011: second = 4'b0001;
		  endcase		   
		 end		  
		else if(req[0])
		 begin
		  first = 4'b0001;
        second = 4'b0000;
		 end		  
		end  
endmodule
