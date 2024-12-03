module LCD_Storage (output reg [8*16-1:0] topline, bottomline, input [7:0] state, input clk);
localparam Idle = 4'b0000, Note1 = 4'b0001, Note2 = 4'b0010, Note3 = 4'b0011, Note4 = 4'b0100, Note5 = 4'b0101, Note6 = 4'b0110, Note7 = 4'b0111, Note8 = 4'b1000;

always @* begin
    case (state)
    1: begin
        bottomline = "";
        topline = "";
       end
    endcase   
end
endmodule
