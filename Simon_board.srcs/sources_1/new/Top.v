module Top (output [2:0] simon_led0, simon_led1, simon_led2, simon_led3, output speaker, input [1:0] sw, input [3:0] simon_buttons_n, input clk);
// Setup Wire
wire [3:0] simon_buttons = ~simon_buttons_n; // for active Low to active High
wire [3:0] simon_buttons_d; // debounced Simmon Buttons
wire randomize; // Green Held for randimization
wire random; // PRNG
// reset Wires
wire roundReset;
wire stateReset = sw[0];
// enable Wires
wire PRNGEN;
wire colorSelectEn;
// Locical Wires
wire [7:0] roundCount;
wire roundSucsess;
// debouncing Simon Buttons
debouncer(.pulse(simon_buttons_d[0]),.held(randomize),.button(simon_buttons[0]),.reset(),.clk(clk));  // Green Button
debouncer(.pulse(simon_buttons_d[1]),.held(),.button(simon_buttons[1]),.reset(),.clk(clk)); // Red Button
debouncer(.pulse(simon_buttons_d[2]),.held(),.button(simon_buttons[2]),.reset(),.clk(clk)); // Blue Button
debouncer(.pulse(simon_buttons_d[3]),.held(),.button(simon_buttons[3]),.reset(),.clk(clk)); // Yellow Button

// for random number
PRNG(.random(random),.step(),.rerun(),.randomize(randomize),.clk(clk),.reset());
// counting Game Rounds
roundCounter(.roundCount(roundCount),.roundSucsess(roundSucsess),.roundReset(roundReset),.clk(clk));
// 


endmodule