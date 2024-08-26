module toppipeline (clk, rst_n);

input clk,rst_n;

//declaring wires
wire pcsrcE,regwriteW,regwriteE,resultsrcE,memwriteE,branchE,alusrcE,regwriteM,
resultsrcM,memwriteM,resultsrcW;
wire [31:0] pctargetE,instrD,pcD,pcincr4D,resultW,RD1E,RD2E,pcE,immextE,pcincr4E,
aluresultM,writedataM,pcincr4M,pcincr4W,readdataW,aluresultW;
wire [2:0] alucontrolE;
wire [4:0] RDW,RDE,RDM,RS1E,RS2E;
wire [1:0] forwardA_selE,forwardB_selE;
//declaring the modules
fetch_cycle fetchtop(.pcsrcE(pcsrcE), .clk(clk), .rst_n(rst_n), .pctargetE(pctargetE), .instrD(instrD),
 .pcD(pcD),.pcincr4D(pcincr4D));
//
Decode decodetop(.clk(clk),.rst_n(rst_n),.instrD(instrD),
.pcD(pcD),.pcincr4D(pcincr4D),.regwriteW(regwriteW)
,.regwriteE(regwriteE),.resultsrcE(resultsrcE),.memwriteE(memwriteE)
,.branchE(branchE),.alucontrolE(alucontrolE),.alusrcE(alusrcE),.RDW(RDW)
,.resultW(resultW),.RD1E(RD1E),.RD2E(RD2E),.pcE(pcE),.RDE(RDE),.immextE(immextE),.pcincr4E(pcincr4E)
,.RS1E(RS1E),.RS2E(RS2E));
//
Execute executetop(.clk(clk),.rst_n(rst_n),.pcsrcE(pcsrcE),.pctargetE(pctargetE),.pcincr4E(pcincr4E),
.immextE(immextE),.RDE(RDE),.pcE(pcE),.RD1E(RD1E),.RD2E(RD2E),
.alusrcE(alusrcE),.alucontrolE(alucontrolE),.branchE(branchE),.memwriteE(memwriteE),.resultsrcE(resultsrcE),
.regwriteE(regwriteE),.regwriteM(regwriteM),.resultsrcM(resultsrcM),.memwriteM(memwriteM),
.aluresultM(aluresultM),.writedataM(writedataM),.RDM(RDM),.pcincr4M(pcincr4M),.forwardA_selE(forwardA_selE),
.forwardB_selE(forwardB_selE));
//
Memory memorytop(.clk(clk),.rst_n(rst_n),.regwriteM(regwriteM),.resultsrcM(resultsrcM),.memwriteM(memwriteM),
.aluresultM(aluresultM),.writedataM(writedataM),.RDM(RDM),.pcincr4M(pcincr4M)
,.pcincr4W(pcincr4W),.RDW(RDW),.readdataW(readdataW),
.aluresultW(aluresultW),.resultsrcW(resultsrcW),.regwriteW(regwriteW));
//
writeback writebacktop(.resultsrcW(resultsrcW),.resultW(resultW),.readdataW(readdataW),
.aluresultW(aluresultW),.pcincr4W(pcincr4W));
//
Hazardunit hazardtop(.rst_n(rst_n),.regwriteM(regwriteM),.regwriteW(regwriteW),
.RDM(RDM),.RDW(RDW),.RS1E(RS1E),.RS2E(RS2E),.forwardA_selE(forwardA_selE),.forwardB_selE(forwardB_selE));
endmodule //toppipeline