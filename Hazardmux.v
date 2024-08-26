module Hazardmux (A,B,C,sel,D);
input [31:0] A,B,C;
input [1:0] sel;
output [31:0] D;
assign D= (sel==2'b00)? A : (sel==2'b01)? B : (sel==2'b10)? C : 0;

endmodule //Hazardmux