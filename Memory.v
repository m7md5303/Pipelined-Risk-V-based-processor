module Memory (clk,rst_n,regwriteM,resultsrcM,memwriteM,aluresultM,writedataM,RDM,pcincr4M,pcincr4W,RDW,readdataW,
aluresultW,resultsrcW,regwriteW);
//declaring the ports
input clk,rst_n,regwriteM,resultsrcM,memwriteM;
input [31:0] aluresultM,writedataM,pcincr4M;
input [4:0] RDM;
output regwriteW,resultsrcW;
output [31:0] aluresultW,readdataW,pcincr4W;
output [4:0] RDW;
//declaring regs and wires
reg regwriteWr,resultsrcWr;
reg [31:0] aluresultWr,readdataWr,pcincr4Wr;
reg [4:0] RDWr;
wire [31:0] readdataM;


datamem datamemoryM (.RD(readdataM),.clk(clk),.rst_n(rst_n),.WE(memwriteM),.A(aluresultM),.WD(writedataM));
//the memory cycle
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        readdataWr<=0;
        resultsrcWr<=0;
        aluresultWr<=0;
        readdataWr<=0;
        pcincr4Wr<=0;
        RDWr<=0;
        regwriteWr<=0;
    end
    else begin
        readdataWr<=readdataM;
        resultsrcWr<=resultsrcM;
        aluresultWr<=aluresultM;
        readdataWr<=readdataM;
        pcincr4Wr<=pcincr4M;
        RDWr<=RDM;
        regwriteWr<=regwriteM;
    end
end 


assign readdataW=readdataWr;
assign resultsrcW=resultsrcWr;
assign aluresultW=aluresultWr;
assign readdataW=readdataWr;
assign pcincr4W=pcincr4Wr;
assign RDW=RDWr;
assign regwriteW=regwriteWr;

endmodule //Memory