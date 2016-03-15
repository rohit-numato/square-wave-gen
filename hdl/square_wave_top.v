`timescale 1ns / 1ps

module square_wave_gen(
	input clk,
	input rst_n,
	output sq_wave
);

	// Input clock is 100MHz
	localparam CLOCK_FREQUENCY = 100000000;

	// Counter for toggling of clock
	integer counter = 0;
	
	reg sq_wave_reg = 0;
	assign sq_wave = sq_wave_reg;

 always @(posedge clk) begin
 
		if (!rst_n) begin
			counter <= 8'h00;
			sq_wave_reg	 <= 1'b0;
		end
	
		else begin 
			
			// If counter is zero, toggle sq_wave_reg 
			if (counter == 8'h00) begin
				sq_wave_reg <= ~sq_wave_reg;
				
				// Generate 1Hz Frequency
				counter <= CLOCK_FREQUENCY/2 - 1;  
			end 
			
			// Else count down
			else 
				counter <= counter - 1; 
			end
		end
		
endmodule