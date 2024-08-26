module AdderE (pcE,immext,pctargetE);
input [31:0] pcE, immext;
output [31:0] pctargetE;
assign pctargetE = pcE + immext;
endmodule //AdderE