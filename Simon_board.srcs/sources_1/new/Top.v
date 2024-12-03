module Top (output [2:0] simon_led0, simon_led1, simon_led2, simon_led3, output speaker, input [1:0] sw, input [3:0] simon_buttons_n, input clk);
// Setup Wire
wire [3:0] simon_buttons = ~simon_buttons_n; // for active Low to active High
wire randomize; // Green Held for randimization
wire [3:0] simon_buttons_dH; // debounced Simmon Buttons. Active on logical High
wire [3:0] simon_buttons_dL; // debounced Simmon Buttons. Actibe on logical Low
// reset Wires
wire roundReset; // wire for reseting the round counter
wire stateReset = sw[0]; // wire for reseting the state
wire LCDReset; // reset for LCD.
// Enable Wires
reg colorSelectEn; // enable for color Select 
reg lcd_enable; // enable for LCD
// Locical Wires
wire greenHeld;
wire [7:0] roundCount; // RoundCounter
wire roundSucsess; // State_Machine
wire topline; // LCD
wire bottomline; // LCD
wire printLCD; //LCD
wire available; // LCD
wire lcd_regsel; // LCD
wire [7:0] state; // state_Machine
wire random; // PRNG
// Debouncing Simon Buttons
debouncer(.logicalHighPulse(simon_buttons_dL[0]),.logicalLowPulse(simon_buttons_dH[0]),.held(greenHeld),.button(simon_buttons[0]),.reset(),.clk(clk));  // Green Button
debouncer(.logicalHighPulse(simon_buttons_dL[1]),.logicalLowPulse(simon_buttons_dH[1]),.held(),.button(simon_buttons[1]),.reset(),.clk(clk)); // Red Button
debouncer(.logicalHighPulse(simon_buttons_dL[2]),.logicalLowPulse(simon_buttons_dH[2]),.held(),.button(simon_buttons[2]),.reset(),.clk(clk)); // Blue Button
debouncer(.logicalHighPulse(simon_buttons_dL[3]),.logicalLowPulse(simon_buttons_dH[3]),.held(),.button(simon_buttons[3]),.reset(),.clk(clk)); // Yellow Button
//For Random Number
PRNG(.random(random),.step(),.rerun(),.randomize(randomize),.clk(clk),.reset());
//Counting Game Rounds
roundCounter(.roundCount(roundCount),.roundSucsess(roundSucsess),.roundReset(roundReset),.clk(clk));
//LCD
lcd_string (.lcd_regsel(lcd_regsel), .lcd_read(), .lcd_enable(lcd_enable), .lcd_data(lcd_data), .available(available), .print(print), .topline(topline), .bottomline(bottomline), .reset(LCDReset), .clk(clk));
//LCD memory Storage
LCD_Storage (.topline(topline),.bottomline(bottomline),.state(state),.clk(clk));
// State Machine

// state list
localparam idel = 0, welcome = 1, Start_Button_Held = 2, Start_Button_Released = 3, Round_1_Read = 4, Round_1_Play = 5;
// counter
always @ (posedge clk) begin
end
// State Machine Proper
always @* begin
    colorSelectEn = 0;
    lcd_enable = 0;
    
end



endmodule