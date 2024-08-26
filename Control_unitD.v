module Control_unitD (opcode_cu,funct3,funct7,regwriteD,resultsrcD,memwriteD,branchD,alucontrolD,alusrcD,immsrcD);
input [6:0] opcode_cu;
input [2:0] funct3;
input funct7;
output reg resultsrcD,memwriteD,alusrcD,regwriteD,branchD;
output reg [2:0] alucontrolD;
output reg [1:0] immsrcD;
//alu decoder
reg [1:0] aluopCD;
always @(*) begin
case (aluopCD)
2'b00:begin
    alucontrolD=0;
end
2'b01:begin
    alucontrolD=3'b001;
end
2'b10:begin
    case (funct3)
    3'b000:begin
        if({opcode_cu[5],funct7}==2'b11)begin
            alucontrolD=3'b010;
        end
        else begin
            alucontrolD=0;
        end
    end
    default: alucontrolD=funct3; 
    endcase
end  
default: alucontrolD=0;
endcase
end
//main decoder
always @(*) begin
case (opcode_cu)
    7'b000_0011:begin
        regwriteD=1;
        immsrcD=0;
        alusrcD=1;
        memwriteD=0;
        resultsrcD=1;
        branchD=0;
        aluopCD=0;
    end
    7'b010_0011:begin
        regwriteD=0;
        immsrcD=2'b01;
        alusrcD=1;
        memwriteD=1;
        resultsrcD=0;
        branchD=0;
        aluopCD=0;
    end
    7'b011_0011:begin
        regwriteD=1;
        immsrcD=0;
        alusrcD=0;
        memwriteD=0;
        resultsrcD=0;
        branchD=0;
        aluopCD=2'b10;
    end
    7'b001_0011:begin
        regwriteD=1;
        immsrcD=0;
        alusrcD=1;
        memwriteD=0;
        resultsrcD=1;
        branchD=0;
        aluopCD=2'b10;
    end
    7'b110_0011:begin
        regwriteD=0;
        immsrcD=2'b10;
        alusrcD=0;
        memwriteD=0;
        resultsrcD=0;
        branchD=1;
        aluopCD=2'b01;
    end
    default:begin
        regwriteD=0;
        immsrcD=0;
        alusrcD=0;
        memwriteD=0;
        resultsrcD=0;
        branchD=0;
        aluopCD=0;
    end    
endcase
end
endmodule //Control_unitD