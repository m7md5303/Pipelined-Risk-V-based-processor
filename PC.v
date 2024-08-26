module PC (pc, clk, rst_n, pc_F);
input [31:0] pc;
input clk, rst_n;
output [31:0] pc_F;
reg [31:0] pc_F_reg;
//delaying the pc with one clock cycle
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        pc_F_reg<=0;
    end
    else begin
        pc_F_reg<=pc;
    end
end
assign pc_F = pc_F_reg;
endmodule