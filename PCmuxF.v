module pcmux (sel,pc_trgt,pc_inc4,pc_out);
    input sel;
    input [31:0] pc_trgt,pc_inc4;
    output [31:0] pc_out;
    //selecting whether the convenient pc (pc+4) or a target pc
    assign pc_out= (sel)? pc_trgt : pc_inc4; 
endmodule