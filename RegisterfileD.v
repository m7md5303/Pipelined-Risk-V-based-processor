module RegisterfileD (clk,rst_n,A1,A2,A3,WD3,WE3,RD1,RD2);
input clk,rst_n,WE3;
input [4:0] A1,A2,A3;
input [31:0] WD3;
output [31:0] RD1,RD2;
//declaring the register file
reg [31:0] regfile [31:0];
//mechanism of the write process

always @(posedge clk ) begin
    if(WE3) begin
        regfile[A3] =WD3;
    end
end

//mechanism of the read process
assign RD1 = (!rst_n) ? 0 : regfile[A1];
assign RD2 = (!rst_n) ? 0 : regfile[A2];

endmodule //RegisterfileD