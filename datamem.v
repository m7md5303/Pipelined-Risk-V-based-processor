module datamem (RD,clk,rst_n,WE,A,WD);
input clk,WE,rst_n;
input [31:0] A,WD;
output [31:0] RD;
//declaring the memory
reg [31:0] datamemory [1023:0] ;

always @(posedge clk ) begin
    if(WE)begin
        datamemory[A]<=WD;
    end
end
assign RD= (!rst_n) ? 0 : datamemory[A];

endmodule //datamem