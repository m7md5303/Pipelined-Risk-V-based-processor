module alu (alucontrolE,srcaE,srcbE,aluout,zeroE);
input[2:0] alucontrolE;
input [31:0] srcaE,srcbE;
output zeroE;
output reg [31:0] aluout;
always @(*) begin
    case (alucontrolE)
        3'b000:begin
           aluout=srcaE+srcbE; 
        end
        3'b001:begin
            aluout=srcaE-srcbE;
        end
        3'b010:begin
            aluout=srcaE&srcbE;
        end
        3'b011:begin
            aluout=srcaE|srcbE;
        end
        3'b100:begin
            aluout=srcaE^srcbE;
        end
        default:begin
            aluout=0;
        end
    endcase
end  
assign zeroE = (!aluout)? 1 : 0;
endmodule //alu