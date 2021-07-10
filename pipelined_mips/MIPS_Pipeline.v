`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:22:47 07/10/2021 
// Design Name: 
// Module Name:    MIPS_Pipeline 
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
 
 module MIPS_Pipeline
 (
  input wire clk, reset
 );
  
  wire [31:0] PC, PCin;
  wire [31:0] PC4,ID_PC4,EX_PC4;
  wire [31:0] PCbne,PC4bne,PCj,PC4bnej,PCjr; // PC signals in MUX
  wire [31:0] Instruction,ID_Instruction,EX_Instruction; // Output of Instruction Memory
  wire [5:0] Opcode,Function; // Opcode, Function

  // Extend
  wire [15:0] imm16; // immediate in I type instruction
  wire [31:0] Im16_Ext,EX_Im16_Ext;
  wire [31:0] sign_ext_out,zero_ext_out;
  // regfile
  wire [4:0] rs,rt,rd,EX_rs,EX_rt,EX_rd,EX_WriteRegister,MEM_WriteRegister,WB_WriteRegister;
  wire [31:0] WB_WriteData, ReadData1, ReadData2,ReadData1Out,ReadData2Out, EX_ReadData1, EX_ReadData2;

  // ALU
  wire [31:0] Bus_A_ALU,Bus_B_ALU,Bus_B_forwarded;
  wire [31:0] EX_ALUResult,MEM_ALUResult,WB_ALUResult;
  wire ZeroFlag, OverflowFlag, CarryFlag, NegativeFlag,notZeroFlag;

  wire [31:0] WriteDataOfMem,MEM_ReadDataOfMem,WB_ReadDataOfMem;

  //Control signals 
  wire RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,Jump,SignZero,JRControl;
  wire ID_RegDst,ID_ALUSrc,ID_MemtoReg,ID_RegWrite,ID_MemRead,ID_MemWrite,ID_Branch,ID_JRControl;
  wire EX_RegDst,EX_ALUSrc,EX_MemtoReg,EX_RegWrite,EX_MemRead,EX_MemWrite,EX_Branch,EX_JRControl;
  wire MEM_MemtoReg,MEM_RegWrite,MEM_MemRead,MEM_MemWrite;
  wire WB_MemtoReg,WB_RegWrite;
  wire [1:0] ALUOp,ID_ALUOp,EX_ALUOp;
  wire [1:0] ALUControl;
  wire bneControl,notbneControl;
  wire JumpControl,JumpFlush;
  wire [1:0] ForwardA,ForwardB;
  
  //flush
  wire IF_flush,IFID_flush,notIFID_flush,Stall_flush,flush;

  //shift left
  wire [31:0] shiftleft2_bne_out,shiftleft2_jump_out; // shift left output

  // PC Write Enable, IF/ID Write Enable
  wire PC_WriteEn,IFID_WriteEn;


  //====== PC register======
  register_reset_en #(32) NPC_Reg(clk, reset, PC_WriteEn, PCin, PC);
  adder Add1(PC, {29'b0,3'b100}, PC4); // PC4 = PC + 4

  instr_mem InstructionMem1(clk, PC, Instruction);

  // register IF/ID
  register_reset_en IFID_PC4(clk, reset, IFID_WriteEn, PC4, ID_PC4);
  register_reset_en IFID_Instruction(clk, reset, IFID_WriteEn, Instruction, ID_Instruction);
  d_ff_syn_en_reset IF_flush_bit(clk, reset, IFID_WriteEn, IF_flush,IFID_flush);

  //========= ID STAGE===========
  assign Opcode = ID_Instruction[31:26];
  assign Function = ID_Instruction[5:0];
  assign rs = ID_Instruction[25:21];
  assign rt = ID_Instruction[20:16];
  assign rd = ID_Instruction[15:11];
  assign imm16= ID_Instruction[15:0];

  // Main Control
  controller MainControl(
  .regdst(RegDst),
  .alusrc(ALUSrc),
  .memtoreg(MemtoReg),
  .regwrite(RegWrite),
 // MemRead,
  .memwrite(MemWrite),
  //Branch,
  .alucontrol(ALUOp),
  .jump(Jump),
  .zero(SignZero),
  .op(Opcode)
  );

 // Regfile
  regfile Register_File( 
  clk,
  WB_RegWrite,
  rs,
  rt,
  WB_WriteRegister,
  WB_WriteData,
  ReadData1,
  ReadData2
  );

  // forward Read Data if Write and Read at the same time
  WB_forward  WB_forward_block (ReadData1Out, ReadData2Out, ReadData1, ReadData2, WB_WriteData, rs, rt, WB_WriteRegister, WB_RegWrite);
  
  // Sign-extend
  signext sign_extend1(imm16, sign_ext_out);
  // Zero-extend
  zeroext zero_extend1(imm16, zero_ext_out);
  // immediate extend: sign or zero
  mux muxSignZero(signext_out, zero_ext_out, SignZero, Im16_Ext);
  JRControl_Block JRControl_Block1( JRControl, ALUOp, Function);

  Discard_Instr Discard_Instr_Block(ID_flush,IF_flush,JumpControl,bneControl,EX_JRControl);

  or #(50) OR_flush(flush,ID_flush,IFID_flush,Stall_flush);
  flush_control flush_block1(ID_RegDst,ID_ALUSrc,ID_MemtoReg,ID_RegWrite,ID_MemRead,ID_MemWrite,ID_Branch,ID_ALUOp,ID_JRControl,flush,RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,JRControl);

  //==========EX STAGE=========================
  // register ID/EX
  register_reset_en IDEX_PC4(clk, reset, 1'b1, ID_PC4, EX_PC4);
  register_reset_en IDEX_ReadData1(clk, reset, 1'b1, ReadData1Out, EX_ReadData1);
  register_reset_en IDEX_ReadData2(clk, reset, 1'b1, ReadData2Out, EX_ReadData2);
  register_reset_en IDEX_Im16_Ext(clk, reset, 1'b1, Im16_Ext, EX_Im16_Ext);
  register_reset_en IDEX_rs_rt_rd(clk, reset, 1'b1, ID_Instruction, EX_Instruction[31:0]);
  assign EX_rs = EX_Instruction[25:21];
  assign EX_rt = EX_Instruction[20:16];
  assign EX_rd = EX_Instruction[15:11];

  // 9 control signals via ID/EX
  d_ff_syn_en_reset  IDEX_RegDst(.q(EX_RegDst), .d(ID_RegDst), .en(1'b1),.reset(reset), .clk(clk));
  d_ff_syn_en_reset  IDEX_ALUSrc(.q(EX_ALUSrc), .d(ID_ALUSrc), .en(1'b1),.reset(reset), .clk(clk));
  d_ff_syn_en_reset  IDEX_MemtoReg(.q(EX_MemtoReg), .d(ID_MemtoReg), .en(1'b1),.reset(reset), .clk(clk));
  d_ff_syn_en_reset  IDEX_RegWrite(.q(EX_RegWrite), .d(ID_RegWrite), .en(1'b1),.reset(reset), .clk(clk));
  d_ff_syn_en_reset  IDEX_MemRead(.q(EX_MemRead), .d(ID_MemRead), .en(1'b1), .reset(reset), .clk(clk));
  d_ff_syn_en_reset  IDEX_MemWrite(.q(EX_MemWrite), .d(ID_MemWrite), .en(1'b1), .reset(reset), .clk(clk));
  d_ff_syn_en_reset  IDEX_Branch(.q(EX_Branch), .d(ID_Branch), .en(1'b1), .reset(reset), .clk(clk));
  d_ff_syn_en_reset  IDEX_JRControl(.q(EX_JRControl), .d(ID_JRControl), .en(1'b1), .reset(reset), .clk(clk));
  d_ff_syn_en_reset  IDEX_ALUOp1(.q(EX_ALUOp[1]), .d(ID_ALUOp[1]), .en(1'b1), .reset(reset), .clk(clk));
  d_ff_syn_en_reset  IDEX_ALUOp0(.q(EX_ALUOp[0]), .d(ID_ALUOp[0]), .en(1'b1), .reset(reset), .clk(clk));

  //  Forwarding unit
  Forwarding_unit Forwarding_Block(ForwardA, ForwardB, MEM_RegWrite, WB_RegWrite, MEM_WriteRegister, WB_WriteRegister, EX_rs, EX_rt);
  // mux 3 x32 to 32 to choose source of ALU (forwarding)
  Mux3 mux3A(Bus_A_ALU, EX_ReadData1, MEM_ALUResult, WB_WriteData, ForwardA);
  Mux3 mux3B(Bus_B_forwarded, EX_ReadData2, MEM_ALUResult, WB_WriteData,ForwardB);
  // mux 2x32 to 32 to select source Bus B of ALU
  mux muxALUSrc(Bus_B_forwarded, EX_Im16_Ext, EX_ALUSrc, Bus_B_ALU);
  // ALU Control
  aludec ALUControl_Block1(EX_Im16_Ext[5:0], EX_ALUOp, ALUControl);
  // EX_Im16_Ext[5:0] is function

  // ALU
  ALU alu_block(Bus_A_ALU, Bus_B_ALU, ALUControl, EX_ALUResult, ZeroFlag);//, CarryFlag, , OverflowFlag, NegativeFlag);

  // mux 2x5 to 5 choose shift register is Rd or Rt
  mux #(5) muxRegDst( EX_rt, EX_rd, EX_RegDst, EX_WriteRegister);

  //==============MEM STAGE=================
  // register EX/MEM
  register_reset_en EXMEM_ALUResult(MEM_ALUResult,EX_ALUResult,1'b1,reset,clk);
  register_reset_en EXMEM_WriteDataOfMem(WriteDataOfMem, Bus_B_forwarded,1'b1,reset,clk);
  d_ff_syn_en_reset  EXMEM_MemtoReg(MEM_MemtoReg, EX_MemtoReg, 1'b1,reset, clk);
  d_ff_syn_en_reset  EXMEM_RegWrite(MEM_RegWrite, EX_RegWrite, 1'b1,reset, clk);
  d_ff_syn_en_reset  EXMEM_MemRead(MEM_MemRead, EX_MemRead, 1'b1,reset, clk);
  d_ff_syn_en_reset  EXMEM_MemWrite(MEM_MemWrite, EX_MemWrite, 1'b1,reset, clk);
  d_ff_syn_en_reset  EXMEM_WriteRegister4(MEM_WriteRegister[4], EX_WriteRegister[4], 1'b1,reset, clk);
  d_ff_syn_en_reset  EXMEM_WriteRegister3(MEM_WriteRegister[3], EX_WriteRegister[3], 1'b1,reset, clk);
  d_ff_syn_en_reset  EXMEM_WriteRegister2(MEM_WriteRegister[2], EX_WriteRegister[2], 1'b1,reset, clk);  
  d_ff_syn_en_reset  EXMEM_WriteRegister1(MEM_WriteRegister[1], EX_WriteRegister[1], 1'b1,reset, clk);
  d_ff_syn_en_reset  EXMEM_WriteRegister0(MEM_WriteRegister[0], EX_WriteRegister[0], 1'b1,reset, clk);

  // Data Memory 
  data_mem dataMem1(
     clk,
     MEM_MemWrite,        //writeenable	  
     MEM_ALUResult,       //address	  
     WriteDataOfMem,       //writedata
	  MEM_ReadDataOfMem //data 
   //  MEM_MemRead,       
     );
	  
  //==========WB STAGE====================
  // register MEM/WB
  register_reset_en MEMWB_ReadDataOfMem(WB_ReadDataOfMem,MEM_ReadDataOfMem,1'b1,reset,clk);
  register_reset_en MEMWB_ALUResult(WB_ALUResult,MEM_ALUResult,1'b1,reset,clk);
  d_ff_syn_en_reset  MEMWB_WriteRegister4(WB_WriteRegister[4], MEM_WriteRegister[4], 1'b1,reset, clk);
  d_ff_syn_en_reset  MEMWB_WriteRegister3(WB_WriteRegister[3], MEM_WriteRegister[3], 1'b1,reset, clk);
  d_ff_syn_en_reset  MEMWB_WriteRegister2(WB_WriteRegister[2], MEM_WriteRegister[2], 1'b1,reset, clk);
  d_ff_syn_en_reset  MEMWB_WriteRegister1(WB_WriteRegister[1], MEM_WriteRegister[1], 1'b1,reset, clk);
  d_ff_syn_en_reset  MEMWB_WriteRegister0(WB_WriteRegister[0], MEM_WriteRegister[0], 1'b1,reset, clk);
  d_ff_syn_en_reset  MEMWB_MemtoReg(WB_MemtoReg, MEM_MemtoReg, 1'b1,reset, clk);
  d_ff_syn_en_reset  MEMWB_RegWrite(WB_RegWrite, MEM_RegWrite, 1'b1,reset, clk);

  // Select Data to WriteData for regfile
  mux muxMemtoReg(WB_ALUResult, WB_ReadDataOfMem, WB_MemtoReg,  WB_WriteData);

  //Stalling
  StallControl StallControl_block(PC_WriteEn, IFID_WriteEn, Stall_flush, EX_MemRead, EX_rt, rs, rt, Opcode);

  //Jump,bne, JRs
 // bne: Branch if not equal
  left_shift2 shiftleft2_bne(EX_Im16_Ext, shiftleft2_bne_out);
  adder Add_bne(EX_PC4, shiftleft2_bne_out, PCbne);
  not #(50) notZero(notZeroFlag,ZeroFlag);
  and #(50) andbneControl(bneControl,EX_Branch,notZeroFlag);
  mux muxbneControl(PC4, PCbne, bneControl, PC4bne);
  // jump
  left_shift2 shiftleft2_jump({6'b0,ID_Instruction[25:0]}, shiftleft2_jump_out);
  assign PCj = {ID_PC4[31:28],shiftleft2_jump_out[27:0]};

  not #(50) notIFIDFlush(notIFID_flush,IFID_flush);
  and #(50) andJumpFlush(JumpFlush,Jump,notIFID_flush);
  not #(50) notbne(notbneControl,bneControl);
  and #(50) andJumpBNE(JumpControl,JumpFlush,notbneControl);
  mux muxJump(PC4bne, PCj, JumpControl, PC4bnej);

  // JR: Jump Register
  assign PCjr = Bus_A_ALU;
  mux muxJR(PC4bnej, PCjr, EX_JRControl, PCin);
 
 endmodule 