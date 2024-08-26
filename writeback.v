module writeback (resultsrcW,resultW,readdataW,aluresultW,pcincr4W);
input  resultsrcW;
input [31:0] readdataW,aluresultW,pcincr4W;
output [31:0] resultW;

assign resultW = (resultsrcW) ? readdataW : aluresultW;


endmodule //writeback