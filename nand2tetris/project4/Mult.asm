// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.


  @0
  D=M
  @n
  M=D  //n=RAM[0]
 
  @1
  D=M
  @m
  M=D  //m=RAM[1]

  @i
  M=0  //i=0

  @0
  D=A
  @2
  M=D
  
 (LOOP)
  @i
  D=M
  @n
  D=D-M

  @END
  D;JGE //if i>n goto END
 
  @m
  D=M
  @2
  M=M+D

  @i
  M=M+1 
  
  @LOOP
  0;JMP 
  
 (END)
  @END
  0;JMP
