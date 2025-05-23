//  Module: RegisterFile
//
module RegisterFile
(
    input logic clk,
    input logic resetn,

    input logic rMEM_en_reg,
    input logic  eRegWrite,
    input logic [4:0] A1,
    input logic [4:0] A2,
    input logic [4:0] A3,
    input reg [31:0] WD3,
    input logic [6:0] states,

    output reg [31:0] RD1,
    output reg [31:0] RD2
);


 // Registers File  
reg [31:0] RegisterFile [0:31] =   

    '{

    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[0] 
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[1]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[2]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[3]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[4]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[5]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[6]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[7]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[8]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[9]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[10]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[11]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[12]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[13]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[14]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[15]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[16]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[17]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[18]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[19]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[20]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[21]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[22]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[23]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[24]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[25]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[26]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[27]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[28]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[29]
    32'b0000_0000_0000_0000_0000_0000_0000_0000,   // REG[30]
    32'b0000_0000_0000_0000_0000_0000_0000_0000    // REG[31]

    };



  always @(posedge rMEM_en_reg) begin
    //if(!resetn) begin
      // reset logic
   // end
   // else
          begin
            RD1 <= RegisterFile[A1]; // first output of the register file
            RD2 <= RegisterFile[A2]; // second output of the register file       
          end
  end

  always @(posedge eRegWrite) begin
    if(A3 != 0) begin
      RegisterFile[A3] <= WD3;
    end 
  end



/*
always_ff @(posedge clk or negedge resetn) begin
    begin
      RegisterFile[A3] = WD3;
    end

    if (states == 2)
    begin
      RD1 = RegisterFile[A1]; // first output of the register file
      RD2 = RegisterFile[A2]; // second output of the register file
    end
  
*/
    
endmodule
