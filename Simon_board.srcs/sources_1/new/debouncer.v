module debouncer (output logicalHighPulse, logicalLowPulse, held, input button, reset, clk);

localparam sampletime = 1999999;  // 20ms
reg [20:0]timer;
reg button_sample, button_debounced,button_debounced_d;
assign logicalHighPulse = (button_debounced & ~button_debounced_d);
assign logicalLowPulse = (~button_debounced & button_debounced_d);
assign  held = button_debounced;

always @(posedge clk) begin  // Timer
	if (reset) begin
    	timer <= (sampletime);
	end
	else begin
    	timer <= (timer -1);
    	if (timer == 0) begin
        	timer <= sampletime;
    	end
	end
end

always @(posedge clk) begin
	button_debounced_d <=(button_debounced);
	if (timer == 0) begin
   	button_sample <= (button);
   	if (button_sample == button) begin
       	button_debounced <= (button);
   	end
	end
end
endmodule
