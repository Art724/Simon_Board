module roundCounter (output reg [7:0] roundCount, input roundSucsess, roundReset, clk);
// counts the rounds of play based off of the amount of sucseses that there are

always @(posedge clk) begin
    if (roundReset) begin
        roundCount <= 0;
    end
    if (roundSucsess) begin
        roundCount <= roundCount + 1;
    end
end

endmodule 
