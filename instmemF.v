module instmem (address,instruction);
input [31:0] address;
output [31:0] instruction;
//declaring the memory
reg [31:0] instmemory [1023:0];
assign instruction = instmemory[address]; 
endmodule