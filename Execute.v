module Execute (clk,rst_n,pcsrcE,pctargetE,pcincr4E,immextE,RDE,pcE,RD1E,RD2E,alusrcE,
alucontrolE,branchE,memwriteE,resultsrcE,regwriteE,regwriteM,resultsrcM,memwriteM,
aluresultM,writedataM,RDM,pcincr4M,forwardA_selE,forwardB_selE);
input clk,rst_n,regwriteE,memwriteE,branchE,alusrcE,resultsrcE;
input [2:0] alucontrolE;
input [31:0] RD1E,RD2E,pcE,immextE,pcincr4E;
input [4:0] RDE;
input [1:0] forwardA_selE,forwardB_selE;
output pcsrcE,regwriteM,memwriteM,resultsrcM;
output [31:0] aluresultM,writedataM,pcincr4M,pctargetE;
output [4:0] RDM;
//declaring wires and regs
wire [31:0] aluresultE,srcbE,srca,srcb;
wire zeroE;
reg regwriteMr,memwriteMr,resultsrcMr;
reg [31:0] aluresultMr,writedataMr,pcincr4Mr;
reg [4:0] RDMr;
//declaring modules
Hazardmux HazardmuxE1(.A(RD2E),.B(resultW),.C(aluresultM),.sel(forwardB_selE),.D(srcb));
Hazardmux HazardmuxE2(.A(RD1E),.B(resultW),.C(aluresultM),.sel(forwardA_selE),.D(srca));
alumux alumuxE (.a(immextE),.b(srcb),.sel(alusrcE),.out(srcbE));
alu aluE (.alucontrolE(alucontrolE),.srcaE(srca),.srcbE(srcbE),.aluout(aluresultE),.zeroE(zeroE));
AdderE adderE (.pcE(pcE),.immext(immextE),.pctargetE(pctargetE));
//the execute cycle
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        regwriteMr<=0;
        memwriteMr<=0;
        resultsrcMr<=0; 
        aluresultMr<=0;
        writedataMr<=0;
        pcincr4Mr<=0;
        RDMr<=0;
    end
    else begin
        regwriteMr<=regwriteE;
        memwriteMr<=memwriteE;
        resultsrcMr<=resultsrcE;
        aluresultMr<=aluresultE;
        writedataMr<=srcb;
        pcincr4Mr<=pcincr4E;
        RDMr<=RDE;
    end
end
assign regwriteM=regwriteMr;
assign memwriteM=memwriteMr;
assign resultsrcM=resultsrcMr;
assign aluresultM=aluresultMr;
assign writedataM=writedataMr;
assign pcincr4M=pcincr4Mr;
assign RDM=RDMr;
assign pcsrcE=branchE & zeroE;

endmodule //Execute