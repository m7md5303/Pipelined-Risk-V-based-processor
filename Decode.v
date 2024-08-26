module Decode (clk,rst_n,instrD,pcD,pcincr4D,regwriteW,regwriteE,resultsrcE,memwriteE,branchE,alucontrolE,alusrcE,RDW
,resultW,RD1E,RD2E,pcE,RDE,immextE,pcincr4E,RS1E,RS2E);
input clk,rst_n,regwriteW;
input [31:0] instrD,pcD,pcincr4D,resultW;
input [4:0] RDW;
output regwriteE,memwriteE,branchE,alusrcE,resultsrcE;
output [31:0] RD1E,RD2E,immextE,pcE,pcincr4E;
output [4:0] RDE,RS1E,RS2E; 
output [2:0] alucontrolE;

wire [31:0] immextD,RD1,RD2;
wire [1:0] immsrcD;
wire alusrcD,branchD,memwriteD,resultsrcD,regwriteD;
wire [2:0] alucontrolD;

reg regwriteEr,memwriteEr,branchEr,alusrcEr,resultsrcEr;
reg [31:0] RD1Er,RD2Er,immextEr,pcEr,pcincr4Er;
reg [4:0] RDEr,RS1Er,RS2Er; 
reg [2:0] alucontrolEr;
 

signextD signextD_D (.in_instr(instrD),.immsrcD(immsrcD),.immextD(immextD));
RegisterfileD RegisterfileD_D (.clk(clk),.rst_n(rst_n),.A1(instrD[19:15]),.A2(instrD[24:20]),.A3(RDW),
.WD3(resultW),.WE3(regwriteW),.RD1(RD1),.RD2(RD2));
Control_unitD Control_unitD_D (.opcode_cu(instrD[6:0]),.funct3(instrD[14:12]),.funct7(instrD[30]),.regwriteD(regwriteD),
.resultsrcD(resultsrcD),.memwriteD(memwriteD),
.branchD(branchD),.alucontrolD(alucontrolD),.alusrcD(alusrcD),.immsrcD(immsrcD));
//the decode cycle
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        regwriteEr<=0;
        memwriteEr<=0;
        branchEr<=0;
        alusrcEr<=0;
        resultsrcEr<=0;
        RD1Er<=0;
        RD2Er<=0;
        immextEr<=0;
        pcEr<=0;
        pcincr4Er<=0;
        RDEr<=0;
        alucontrolEr<=0;
        RS1Er<=0;
        RS2Er<=0;
    end
    else begin
        regwriteEr<=regwriteD;
        memwriteEr<=memwriteD;
        branchEr<=branchD;
        alusrcEr<=alusrcD;
        resultsrcEr<=resultsrcD;
        RD1Er<=RD2;
        RD2Er<=RD2;
        immextEr<=immextD;
        pcEr<=pcD;
        pcincr4Er<=pcincr4D;
        RDEr<=instrD[11:7];
        alucontrolEr<=alucontrolD;
        RS1Er<=instrD[19:15];
        RS2Er<=instrD[24:20];
    end
end
assign regwriteE=regwriteEr;
assign memwriteE=memwriteEr;
assign branchE=branchEr;
assign alusrcE=alusrcEr;
assign resultsrcE=resultsrcEr;
assign RD1E=RD1Er;
assign RD2E=RD2Er;
assign immextE=immextEr;
assign pcE=pcEr;
assign pcincr4E=pcincr4Er;
assign RDE=RDEr;
assign alucontrolE=alucontrolEr;
assign RS1E = RS1Er;
assign RS2E = RS2Er;
endmodule //Decode