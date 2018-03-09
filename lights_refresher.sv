module lights_refresher (refresh_done, lights, main_vector, state, win_case, clk);

output reg [17:0] lights;
output reg refresh_done;

input [1:0] main_vector [8:0];
input [2:0] state;
input [5:0]win_case;		//	1b_tie? 1b_winning? 1b_XO? 3b_win_case? 
input clk;

reg [7:0] counter = 8'b0000_0000;
//reg is_winner;
reg is_repeating = 0;
//assign is_winner = win_case[4];	//fixed by doing that

parameter s_refreshing = 3'b100, s_start_game = 3'b000;

always @ (posedge clk)
begin


	if((state == s_refreshing | state == s_start_game) & refresh_done == 0)
	begin
		if(is_repeating == 0 )		//	if user finishes his turn or computer finishes his turn
		begin
			lights[0] = (main_vector[0] == 2'b01 | main_vector[0] == 2'b11)? 1 : 0;
			lights[1] = (main_vector[1] == 2'b01 | main_vector[1] == 2'b11)? 1 : 0;
			lights[2] = (main_vector[2] == 2'b01 | main_vector[2] == 2'b11)? 1 : 0;
			lights[3] = (main_vector[3] == 2'b01 | main_vector[3] == 2'b11)? 1 : 0;
			lights[4] = (main_vector[4] == 2'b01 | main_vector[4] == 2'b11)? 1 : 0;
			lights[5] = (main_vector[5] == 2'b01 | main_vector[5] == 2'b11)? 1 : 0;
			lights[6] = (main_vector[6] == 2'b01 | main_vector[6] == 2'b11)? 1 : 0;
			lights[7] = (main_vector[7] == 2'b01 | main_vector[7] == 2'b11)? 1 : 0;
			lights[8] = (main_vector[8] == 2'b01 | main_vector[8] == 2'b11)? 1 : 0;
			lights[9] = (main_vector[0] == 2'b10 | main_vector[0] == 2'b11)? 1 : 0;
			lights[10] = (main_vector[1] == 2'b10 | main_vector[1] == 2'b11)? 1 : 0;
			lights[11] = (main_vector[2] == 2'b10 | main_vector[2] == 2'b11)? 1 : 0;
			lights[12] = (main_vector[3] == 2'b10 | main_vector[3] == 2'b11)? 1 : 0;
			lights[13] = (main_vector[4] == 2'b10 | main_vector[4] == 2'b11)? 1 : 0;
			lights[14] = (main_vector[5] == 2'b10 | main_vector[5] == 2'b11)? 1 : 0;
			lights[15] = (main_vector[6] == 2'b10 | main_vector[6] == 2'b11)? 1 : 0; 
			lights[16] = (main_vector[7] == 2'b10 | main_vector[7] == 2'b11)? 1 : 0;
			lights[17] = (main_vector[8] == 2'b10 | main_vector[8] == 2'b11)? 1 : 0;
			
		
			refresh_done = 1; 						//refresh has been finished	
		end

		if(win_case[5] == 1)							//if game ended
		begin
			
			is_repeating = 1;
			if(counter == 0)
				counter = 20;
			
			if(win_case[4] == 1)
			begin
				if(win_case[3] == 1)						// if winner is x	
				begin		
				
					if(win_case[2:0] == 3'b000)			//	first horizontal line
						begin
						lights[0] = ~lights[0];
						lights[1] = ~lights[1];
						lights[2] = ~lights[2];
						end
						
					if(win_case[2:0] == 3'b001)			//	second horizontal line
						begin
						lights[3] = ~lights[3];
						lights[4] = ~lights[4];
						lights[5] = ~lights[5];
						end
					
					if(win_case[2:0] == 3'b010)			//	third horizontal line
						begin
						lights[6] = ~lights[6];
						lights[7] = ~lights[7];
						lights[8] = ~lights[8];
						end
					
					if(win_case[2:0] == 3'b011)			//	first vertical line
						begin
						lights[0] = ~lights[0];
						lights[3] = ~lights[3];
						lights[6] = ~lights[6];
						end
					
					if(win_case[2:0] == 3'b100)			//	second vertical line
						begin
						lights[1] = ~lights[1];
						lights[4] = ~lights[4];
						lights[7] = ~lights[7];
						end
					
					if(win_case[2:0] == 3'b101)			//	third vertical line
						begin
						lights[2] = ~lights[2];
						lights[5] = ~lights[5];
						lights[8] = ~lights[8];
						end
					
					if(win_case[2:0] == 3'b110)			//	backward slash line
						begin
						lights[0] = ~lights[0];
						lights[4] = ~lights[4];
						lights[8] = ~lights[8];
						end
					
					if(win_case[2:0] == 3'b111)			//	forward slash line
						begin
						lights[2] = ~lights[2];
						lights[4] = ~lights[4];
						lights[6] = ~lights[6];
						end
					
				end			
				else // meaning it is 0 not 1
				if(win_case[3] == 0)						// if winner is O
				begin		
					
					if(win_case[2:0] == 3'b000)			//	first horizontal line
						begin
						lights[9] = ~lights[9];
						lights[10] = ~lights[10];
						lights[11] = ~lights[11];
						end
						
					if(win_case[2:0] == 3'b001)			//	second horizontal line
						begin
						lights[12] = ~lights[12];
						lights[13] = ~lights[13];
						lights[14] = ~lights[14];
						end
					
					if(win_case[2:0] == 3'b010)			//	third horizontal line
						begin
						lights[15] = ~lights[15];
						lights[16] = ~lights[16];
						lights[17] = ~lights[17];
						end
					
					if(win_case[2:0] == 3'b011)			//	first vertical line
						begin
						lights[9] = ~lights[9];
						lights[12] = ~lights[12];
						lights[15] = ~lights[15];
						end
					
					if(win_case[2:0] == 3'b100)			//	second vertical line
						begin
						lights[10] = ~lights[12];
						lights[13] = ~lights[13];
						lights[16] = ~lights[16];
						end
					
					if(win_case[2:0] == 3'b101)			//	third vertical line
						begin
						lights[11] = ~lights[11];
						lights[14] = ~lights[14];
						lights[17] = ~lights[17];
						end
					
					if(win_case[2:0] == 3'b110)			//	backward slash line
						begin
						lights[9] = ~lights[9];
						lights[13] = ~lights[13];
						lights[17] = ~lights[17];
						end
					
					if(win_case[2:0] == 3'b111)			//	forward slash line
						begin
						lights[11] = ~lights[11];
						lights[13] = ~lights[13];
						lights[15] = ~lights[15];
						end
						
				end
			end
			else //meaning no one won 
				lights = ~lights;
			
			
			counter = (counter != 0) ? counter - 1 : 8'b0000_0000;
			
			if(counter == 0)
				is_repeating = 0;
			if(is_repeating == 0)
			begin
				lights = 0;
				refresh_done = 1;							//refresh has been finished
			end
			else
				refresh_done = 0;
		end
		else if(win_case[5] == 0)
		begin
			is_repeating = 0;
		end
	end	
	else
	begin
		refresh_done = 0;
		is_repeating = 0;
	end
	//end
	
end
endmodule
