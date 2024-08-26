module pc_adder (pc_current,inc_value,pc_inc_out);
    input [31:0] pc_current,inc_value;
    output [31:0] pc_inc_out;
    //adding the desired increment value which is usually 4 to the current pc
    assign pc_inc_out=pc_current+inc_value; 
endmodule