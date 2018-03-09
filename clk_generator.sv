module clk_generator(out_clk, in_clk);

input in_clk;
output reg out_clk;

reg [30:0] counter;

always@(posedge in_clk)
	begin
		counter = counter + 1;
		if( counter == 1_250_000)
			begin
				out_clk = ~out_clk;
				counter <= 0;
			end
	end
	
endmodule 