module roundCounter (output reg [7:0] roundCount, input succses, roundReset, clk);
always @(posedge clk) begin
    if (roundReset) begin
        roundCount <= 0;
    end
    if (succses) begin
        roundCount <= roundCount + 1;
    end
end

endmodule 
