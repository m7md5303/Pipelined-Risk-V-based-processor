module signextD (in_instr,immsrcD,immextD);
input [31:0] in_instr;
input  [1:0] immsrcD;
output reg [31:0] immextD;
always @(*) begin
    case (immsrcD)
        2'b00: immextD = {{20{in_instr[31]}},in_instr[31:20]};
        2'b01: immextD = {{20{in_instr[31]}},{in_instr[31:25]},in_instr[11:7]};
        default: immextD=0;
    endcase
end 
endmodule //signextD