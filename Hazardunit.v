module Hazardunit (rst_n,regwriteM,regwriteW,RDM,RDW,RS1E,RS2E,forwardA_selE,forwardB_selE);
input regwriteM,regwriteW,rst_n;
input [4:0] RDW,RDM,RS2E,RS1E;
output reg [1:0] forwardA_selE,forwardB_selE;
always @(*) begin
    if(!rst_n)begin
        forwardA_selE=0;
        forwardB_selE=0;
    end
    else begin
        //RS1 hazards
        if(regwriteM) begin
            if(RDM==RS1E) begin
                forwardA_selE=2'b10;
            end
            else begin
                forwardA_selE=0;
            end
        end
        else if(regwriteW) begin
            if(RDW==RS1E) begin
                forwardA_selE=2'b01;
            end
            else begin
                forwardA_selE=0;
            end
        end
       //RS2 hazards
        if(regwriteM) begin
            if(RDM==RS2E) begin
                forwardB_selE=2'b10;
            end
            else begin
                forwardB_selE=0;
            end
        end
        else if(regwriteW) begin
            if(RDW==RS2E) begin
                forwardB_selE=2'b01;
            end
            else begin
                forwardB_selE=0;
            end
        end
    end 
end



endmodule //Hazardunit