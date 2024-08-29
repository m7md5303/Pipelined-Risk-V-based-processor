module fetch_cycle (pcsrcE, clk, rst_n, pctargetE, instrD, pcD,pcincr4D);
    input clk, rst_n;
    input pcsrcE;
    input [31:0] pctargetE;
    output [31:0] instrD, pcD, pcincr4D;
    reg [31:0] instrD_reg, pcD_reg, pcincr4D_reg;
    wire [31:0] pc,pcincr4,instrD_temp,pc_F;
    //declaring the modules
    pc_adder pc_adder_F(.pc_current(pc_F),.inc_value(32'h1),.pc_inc_out(pcincr4));
    pcmux pcmux_F ( .sel(pcsrcE),.pc_trgt(pctargetE),.pc_inc4(pcincr4),.pc_out(pc));
    instmem instmem_F(.address(pc),.instruction(instrD_temp));
    PC PC_F(.pc(pc), .clk(clk), .rst_n(rst_n), .pc_F(pc_F));
//adding the pipeline stage for the fetch cycle
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            instrD_reg<=0;
            pcD_reg<=0;
            pcincr4D_reg<=0;
        end
        else begin
            instrD_reg<=instrD_temp;
            pcD_reg<=pc_F;
            pcincr4D_reg<=pcincr4;
        end
    end
assign pcD=pcD_reg; 
assign pcincr4D=pcincr4D_reg;
assign instrD=instrD_reg;
endmodule