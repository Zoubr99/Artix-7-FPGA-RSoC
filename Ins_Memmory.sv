module Ins_Memmory(
    input logic clk, 
    input logic [31:0] MEM_addr,
    output logic [31:0] MEM_dout,
    input logic rMEM_en
  //input logic [31:0] MEM_Wdata,
);
    
   reg [31:0] MEM [0:1000];
	//reg [31:0] MEM [0:1500];


/*
 
  Note: it is better to first create a  R-Type program
  Note: to test the basic Cpu we will first need to generate a raw assembly code using systemverilog

    add x0, x0, x0       // Clear x0 (NOP, since x0 is always 0)
    add x1, x0, x0       // Initialize x1 to 0
    addi x1, x1, 1       // Increment x1 by 1 (x1 = 1)
    addi x1, x1, 1       // Increment x1 by 1 (x1 = 2)
    addi x1, x1, 1       // Increment x1 by 1 (x1 = 3)
    addi x1, x1, 1       // Increment x1 by 1 (x1 = 4)
    ebreak               // Trigger a breakpoint


initial begin
  // ───────────── R-TYPE ─────────────
  MEM[0] = 32'b0000000_00011_00010_000_00001_0110011; // ADD x1, x2, x3
  MEM[1] = 32'b0100000_00110_00101_000_00100_0110011; // SUB x4, x5, x6

  // ───────────── I-TYPE ─────────────
  MEM[2] = 32'b000000010100_00010_000_00101_0010011; // ADDI x5, x2, 20
//MEM[2] = 32'b000000010100_00000_000_00101_0010011; // ADDI x5, x0, 20
  MEM[3] = 32'b000000001010_00011_111_00110_0010011; // ANDI x6, x3, 10
  MEM[4] = 32'b000000010000_00100_010_00111_0000011; // LW x7, 16(x4)
  MEM[5] = 32'b000000000100_00101_000_01000_1100111; // JALR x8, x5, 4

  // ───────────── S-TYPE ─────────────
  MEM[6] = 32'b0000000_01001_00110_010_00100_0100011; // SW x9, 4(x6)
  MEM[7] = 32'b0000000_01010_00111_001_00100_0100011; // SH x10, 4(x7)

  // ───────────── B-TYPE ─────────────
  MEM[8] = 32'b000000_00101_00001_000_00010_1100011; // BEQ x1, x5, +4
  MEM[9] = 32'b000000_01000_00011_001_00010_1100011; // BNE x3, x8, +4

  // ───────────── U-TYPE ─────────────
  MEM[10] = 32'b00000000000000000001_01001_0110111; // LUI x9, 0x1000
  MEM[11] = 32'b00000000000000000010_01010_0010111; // AUIPC x10, 0x2000

  // ───────────── J-TYPE ─────────────
  // JAL x11, +12 → offset = 0x00C
  // encoded as imm[20|10:1|11|19:12]
  MEM[12] = 32'b00000011110000000000_01011_1101111;  // JAL x11, 12
  //            00000111100000000000

  // Optional: HALT custom opcode or NOP (ADDI x0, x0, 0)
  MEM[13] = 32'b000000000000_00000_000_00000_0010011; // NOP
end


*/

  initial begin
  $readmemh("testing_code_dly512.hex",MEM);
  end

   wire [29:0] Word_addr = MEM_addr[31:2];

  always_latch begin 
    if (rMEM_en) begin
        MEM_dout = MEM[Word_addr];
    end
	 
  end


endmodule
