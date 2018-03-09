module start_game (start_lights_arranged, vector_at_begin, level, user_choice, buttons, state, clk);

output reg start_lights_arranged;
output reg [1:0] vector_at_begin [8:0];
output reg [1:0] level;
output user_choice;

input [8:0] buttons;
input [2:0] state;
input clk;

reg [1:0] tmp_level = 2'b00; 						// 0 means game has not started yet
parameter s_start_game = 3'b000;// s_refreshing = 3'b100;

//assign level = tmp_level;
assign user_choice = 1;

always @(posedge clk)
begin
	if(state != s_start_game)
	begin
		start_lights_arranged = 0;
		tmp_level = 0;
	end
	else
	if(state == s_start_game & tmp_level == 2'b00)
	begin
		if(buttons == 0 & tmp_level == 0)
		begin
			vector_at_begin[6] = 2'b11; vector_at_begin[3] = 2'b00; vector_at_begin[0] = 2'b00;
			vector_at_begin[7] = 2'b11; vector_at_begin[4] = 2'b11; vector_at_begin[1] = 2'b00;
			vector_at_begin[8] = 2'b11; vector_at_begin[5] = 2'b11; vector_at_begin[2] = 2'b11;
			
			level = 0;
		end
		//this should go then in the refresh module to light them up !!
		else
		begin
			
			if(buttons[6] | buttons[3] | buttons[0] == 1)
				begin
					tmp_level = 1;
				end
			else
				if(buttons[7] | buttons[4] | buttons[1] == 1)
				begin
					tmp_level = 2;
				end
			else
				if(buttons[8] | buttons[5] | buttons[2] == 1)
				begin
					tmp_level = 3;
				end
				
			vector_at_begin[0] = 2'b00; vector_at_begin[1] = 2'b00; vector_at_begin[2] = 2'b00;
			vector_at_begin[3] = 2'b00; vector_at_begin[4] = 2'b00; vector_at_begin[5] = 2'b00;
			vector_at_begin[6] = 2'b00; vector_at_begin[7] = 2'b00; vector_at_begin[8] = 2'b00;
			
			level = tmp_level;
			
			//this part may seem stupid but it is NOT !!
			/*if(vector_at_begin[0] == vector_at_begin[1] & vector_at_begin[1] == vector_at_begin[2] & vector_at_begin[2] == vector_at_begin[3] &
				vector_at_begin[3] == vector_at_begin[4] & vector_at_begin[4] == vector_at_begin[5] & vector_at_begin[5] == vector_at_begin[6] &
				vector_at_begin[6] == vector_at_begin[7] & vector_at_begin[7] == vector_at_begin[8] & vector_at_begin[8] == 2'b00)*/
				start_lights_arranged = 1;
			
		end
			
			
	end
		
end

endmodule
