module computer_player (computer_done, vector_after_computer, main_vector, level, user_indicator, state, clk);

output reg [1:0] vector_after_computer[8:0];
output reg computer_done;

input[1:0] main_vector[8:0];
input[1:0] level;
input user_indicator;
input clk;
input[2:0] state;

integer i;
integer random;

reg [9:0] count = 0;
wire [1:0] c_choice;
wire[1:0] user_choice; 

parameter s_computer_playing = 3'b010;

assign c_choice = (user_indicator)? 2'b10 : 2'b01;
assign user_choice = (user_indicator)? 2'b01 : 2'b10;

always @ (posedge clk)
begin

	if(count == 10'b1111_1111_11)
		count = 0;
	else
		count = count + 1;
	
	if(state == s_computer_playing & computer_done == 0)
	begin
		
		for(i=0;i<9;i=i+1)
			vector_after_computer[i] = main_vector[i];
			
		if(level == 2'b01)					//		block for the easy level
		begin
			random = count % 9;
			if(vector_after_computer[random] == 2'b00)
			begin
				vector_after_computer[random] = c_choice;
				computer_done = 1;
			end
		end
		
		else if(level == 2'b10)				//		block for the normal level
		begin
		
			
			//check if computer has a chance of winning
			if(vector_after_computer[0] == c_choice & vector_after_computer[1] == c_choice & vector_after_computer[2] == 2'b00) 
			begin
				vector_after_computer[2] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[1] == c_choice & vector_after_computer[2] == c_choice & vector_after_computer[0] == 2'b00)
			begin 
				vector_after_computer[0] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[0] == c_choice & vector_after_computer[2] == c_choice & vector_after_computer[1] == 2'b00)
			begin 
				vector_after_computer[1] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[3] == c_choice & vector_after_computer[4] == c_choice & vector_after_computer[5] == 2'b00)
			begin 
				vector_after_computer[5] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[3] == c_choice & vector_after_computer[5] == c_choice & vector_after_computer[4] == 2'b00)
			begin 
				vector_after_computer[4] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[4] == c_choice & vector_after_computer[5] == c_choice & vector_after_computer[3] == 2'b00)
			begin 
				vector_after_computer[3] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[6] == c_choice & vector_after_computer[7] == c_choice & vector_after_computer[8] == 2'b00)
			begin 
				vector_after_computer[8] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[6] == c_choice & vector_after_computer[8] == c_choice & vector_after_computer[7] == 2'b00)
			begin 
				vector_after_computer[7] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[7] == c_choice & vector_after_computer[8] == c_choice & vector_after_computer[6] == 2'b00)
			begin 
				vector_after_computer[6] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[0] == c_choice & vector_after_computer[3] == c_choice & vector_after_computer[6] == 2'b00)
			begin 
				vector_after_computer[6] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[0] == c_choice & vector_after_computer[6] == c_choice & vector_after_computer[3] == 2'b00)
			begin 
				vector_after_computer[3] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[3] == c_choice & vector_after_computer[6] == c_choice & vector_after_computer[0] == 2'b00)
			begin 
				vector_after_computer[0] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[1] == c_choice & vector_after_computer[4] == c_choice & vector_after_computer[7] == 2'b00)
			begin 
				vector_after_computer[7] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[1] == c_choice & vector_after_computer[7] == c_choice & vector_after_computer[4] == 2'b00)
			begin 
				vector_after_computer[4] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[4] == c_choice & vector_after_computer[7] == c_choice & vector_after_computer[1] == 2'b00)
			begin 
				vector_after_computer[1] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[2] == c_choice & vector_after_computer[5] == c_choice & vector_after_computer[8] == 2'b00)
			begin 
				vector_after_computer[8] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[2] == c_choice & vector_after_computer[8] == c_choice & vector_after_computer[5] == 2'b00)
			begin 
				vector_after_computer[5] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[5] == c_choice & vector_after_computer[8] == c_choice & vector_after_computer[2] == 2'b00)
			begin 
				vector_after_computer[2] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[0] == c_choice & vector_after_computer[8] == c_choice & vector_after_computer[4] == 2'b00)
			begin 
				vector_after_computer[4] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[4] == c_choice & vector_after_computer[8] == c_choice & vector_after_computer[0] == 2'b00)
			begin 
				vector_after_computer[0] = c_choice;
				computer_done = 1;
			end								
			else if(vector_after_computer[0] == c_choice & vector_after_computer[4] == c_choice & vector_after_computer[8] == 2'b00)
			begin 
				vector_after_computer[8] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[2] == c_choice & vector_after_computer[4] == c_choice & vector_after_computer[6] == 2'b00)
			begin 
				vector_after_computer[6] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[2] == c_choice & vector_after_computer[6] == c_choice & vector_after_computer[4] == 2'b00)
			begin 
				vector_after_computer[4] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[4] == c_choice & vector_after_computer[6] == c_choice & vector_after_computer[2] == 2'b00)
			begin 
			vector_after_computer[2] = c_choice;
			computer_done = 1;
			end

			
			//checking to block user from winning
			else if(vector_after_computer[0] == user_choice & vector_after_computer[1] == user_choice & vector_after_computer[2] == 2'b00)
			begin 
				vector_after_computer[2] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[1] == user_choice & vector_after_computer[2] == user_choice & vector_after_computer[0] == 2'b00)
			begin 
				vector_after_computer[0] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[0] == user_choice & vector_after_computer[2] == user_choice & vector_after_computer[1] == 2'b00)
			begin 
				vector_after_computer[1] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[3] == user_choice & vector_after_computer[4] == user_choice & vector_after_computer[5] == 2'b00)
			begin 
				vector_after_computer[5] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[3] == user_choice & vector_after_computer[5] == user_choice & vector_after_computer[4] == 2'b00)
			begin 
				vector_after_computer[4] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[4] == user_choice & vector_after_computer[5] == user_choice & vector_after_computer[3] == 2'b00)
			begin 
				vector_after_computer[3] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[6] == user_choice & vector_after_computer[7] == user_choice & vector_after_computer[8] == 2'b00)
			begin 
				vector_after_computer[8] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[6] == user_choice & vector_after_computer[8] == user_choice & vector_after_computer[7] == 2'b00)
			begin 
				vector_after_computer[7] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[7] == user_choice & vector_after_computer[8] == user_choice & vector_after_computer[6] == 2'b00)
			begin 
				vector_after_computer[6] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[0] == user_choice & vector_after_computer[3] == user_choice & vector_after_computer[6] == 2'b00)
			begin 
				vector_after_computer[6] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[0] == user_choice & vector_after_computer[6] == user_choice & vector_after_computer[3] == 2'b00)
			begin 
				vector_after_computer[3] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[3] == user_choice & vector_after_computer[6] == user_choice & vector_after_computer[0] == 2'b00)
			begin 
				vector_after_computer[0] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[1] == user_choice & vector_after_computer[4] == user_choice & vector_after_computer[7] == 2'b00)
			begin 
				vector_after_computer[7] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[1] == user_choice & vector_after_computer[7] == user_choice & vector_after_computer[4] == 2'b00)
			begin 
				vector_after_computer[4] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[4] == user_choice & vector_after_computer[7] == user_choice & vector_after_computer[1] == 2'b00)
			begin 
				vector_after_computer[1] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[2] == user_choice & vector_after_computer[5] == user_choice & vector_after_computer[8] == 2'b00)
			begin 
				vector_after_computer[8] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[2] == user_choice & vector_after_computer[8] == user_choice & vector_after_computer[5] == 2'b00)
			begin 
				vector_after_computer[5] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[5] == user_choice & vector_after_computer[8] == user_choice & vector_after_computer[2] == 2'b00)
			begin 
				vector_after_computer[2] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[0] == user_choice & vector_after_computer[8] == user_choice & vector_after_computer[4] == 2'b00)
			begin 
				vector_after_computer[4] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[4] == user_choice & vector_after_computer[8] == user_choice & vector_after_computer[0] == 2'b00)
			begin 
				vector_after_computer[0] = c_choice;
				computer_done = 1;
			end								
			else if(vector_after_computer[0] == user_choice & vector_after_computer[4] == user_choice & vector_after_computer[8] == 2'b00)
			begin 
				vector_after_computer[8] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[2] == user_choice & vector_after_computer[4] == user_choice & vector_after_computer[6] == 2'b00)
			begin 
				vector_after_computer[6] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[2] == user_choice & vector_after_computer[6] == user_choice & vector_after_computer[4] == 2'b00)
			begin 
				vector_after_computer[4] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[4] == user_choice & vector_after_computer[6] == user_choice & vector_after_computer[2] == 2'b00)
			begin 
				vector_after_computer[2] = c_choice;
				computer_done = 1;
			end
			
			
			//will put randomly as can't win and user doesn't have a chance to win 
			else
			begin
				random = count % 9;
				if(vector_after_computer[random] == 2'b00)
				begin
					vector_after_computer[random] = c_choice;
					computer_done = 1;
				end
			end
		
		end
		else if(level == 2'b11)//block for the hard level
		begin
			
			//check if computer has a chance of winning
			if(vector_after_computer[0] == c_choice & vector_after_computer[1] == c_choice & vector_after_computer[2] == 2'b00) 
			begin
				vector_after_computer[2] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[1] == c_choice & vector_after_computer[2] == c_choice & vector_after_computer[0] == 2'b00)
			begin 
				vector_after_computer[0] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[0] == c_choice & vector_after_computer[2] == c_choice & vector_after_computer[1] == 2'b00)
			begin 
				vector_after_computer[1] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[3] == c_choice & vector_after_computer[4] == c_choice & vector_after_computer[5] == 2'b00)
			begin 
				vector_after_computer[5] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[3] == c_choice & vector_after_computer[5] == c_choice & vector_after_computer[4] == 2'b00)
			begin 
				vector_after_computer[4] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[4] == c_choice & vector_after_computer[5] == c_choice & vector_after_computer[3] == 2'b00)
			begin 
				vector_after_computer[3] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[6] == c_choice & vector_after_computer[7] == c_choice & vector_after_computer[8] == 2'b00)
			begin 
				vector_after_computer[8] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[6] == c_choice & vector_after_computer[8] == c_choice & vector_after_computer[7] == 2'b00)
			begin 
				vector_after_computer[7] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[7] == c_choice & vector_after_computer[8] == c_choice & vector_after_computer[6] == 2'b00)
			begin 
				vector_after_computer[6] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[0] == c_choice & vector_after_computer[3] == c_choice & vector_after_computer[6] == 2'b00)
			begin 
				vector_after_computer[6] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[0] == c_choice & vector_after_computer[6] == c_choice & vector_after_computer[3] == 2'b00)
			begin 
				vector_after_computer[3] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[3] == c_choice & vector_after_computer[6] == c_choice & vector_after_computer[0] == 2'b00)
			begin 
				vector_after_computer[0] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[1] == c_choice & vector_after_computer[4] == c_choice & vector_after_computer[7] == 2'b00)
			begin 
				vector_after_computer[7] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[1] == c_choice & vector_after_computer[7] == c_choice & vector_after_computer[4] == 2'b00)
			begin 
				vector_after_computer[4] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[4] == c_choice & vector_after_computer[7] == c_choice & vector_after_computer[1] == 2'b00)
			begin 
				vector_after_computer[1] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[2] == c_choice & vector_after_computer[5] == c_choice & vector_after_computer[8] == 2'b00)
			begin 
				vector_after_computer[8] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[2] == c_choice & vector_after_computer[8] == c_choice & vector_after_computer[5] == 2'b00)
			begin 
				vector_after_computer[5] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[5] == c_choice & vector_after_computer[8] == c_choice & vector_after_computer[2] == 2'b00)
			begin 
				vector_after_computer[2] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[0] == c_choice & vector_after_computer[8] == c_choice & vector_after_computer[4] == 2'b00)
			begin 
				vector_after_computer[4] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[4] == c_choice & vector_after_computer[8] == c_choice & vector_after_computer[0] == 2'b00)
			begin 
				vector_after_computer[0] = c_choice;
				computer_done = 1;
			end								
			else if(vector_after_computer[0] == c_choice & vector_after_computer[4] == c_choice & vector_after_computer[8] == 2'b00)
			begin 
				vector_after_computer[8] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[2] == c_choice & vector_after_computer[4] == c_choice & vector_after_computer[6] == 2'b00)
			begin 
				vector_after_computer[6] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[2] == c_choice & vector_after_computer[6] == c_choice & vector_after_computer[4] == 2'b00)
			begin 
				vector_after_computer[4] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[4] == c_choice & vector_after_computer[6] == c_choice & vector_after_computer[2] == 2'b00)
			begin 
			vector_after_computer[2] = c_choice;
			computer_done = 1;
			end

			
			//checking to block user from winning
			else if(vector_after_computer[0] == user_choice & vector_after_computer[1] == user_choice & vector_after_computer[2] == 2'b00)
			begin 
				vector_after_computer[2] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[1] == user_choice & vector_after_computer[2] == user_choice & vector_after_computer[0] == 2'b00)
			begin 
				vector_after_computer[0] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[0] == user_choice & vector_after_computer[2] == user_choice & vector_after_computer[1] == 2'b00)
			begin 
				vector_after_computer[1] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[3] == user_choice & vector_after_computer[4] == user_choice & vector_after_computer[5] == 2'b00)
			begin 
				vector_after_computer[5] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[3] == user_choice & vector_after_computer[5] == user_choice & vector_after_computer[4] == 2'b00)
			begin 
				vector_after_computer[4] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[4] == user_choice & vector_after_computer[5] == user_choice & vector_after_computer[3] == 2'b00)
			begin 
				vector_after_computer[3] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[6] == user_choice & vector_after_computer[7] == user_choice & vector_after_computer[8] == 2'b00)
			begin 
				vector_after_computer[8] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[6] == user_choice & vector_after_computer[8] == user_choice & vector_after_computer[7] == 2'b00)
			begin 
				vector_after_computer[7] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[7] == user_choice & vector_after_computer[8] == user_choice & vector_after_computer[6] == 2'b00)
			begin 
				vector_after_computer[6] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[0] == user_choice & vector_after_computer[3] == user_choice & vector_after_computer[6] == 2'b00)
			begin 
				vector_after_computer[6] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[0] == user_choice & vector_after_computer[6] == user_choice & vector_after_computer[3] == 2'b00)
			begin 
				vector_after_computer[3] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[3] == user_choice & vector_after_computer[6] == user_choice & vector_after_computer[0] == 2'b00)
			begin 
				vector_after_computer[0] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[1] == user_choice & vector_after_computer[4] == user_choice & vector_after_computer[7] == 2'b00)
			begin 
				vector_after_computer[7] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[1] == user_choice & vector_after_computer[7] == user_choice & vector_after_computer[4] == 2'b00)
			begin 
				vector_after_computer[4] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[4] == user_choice & vector_after_computer[7] == user_choice & vector_after_computer[1] == 2'b00)
			begin 
				vector_after_computer[1] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[2] == user_choice & vector_after_computer[5] == user_choice & vector_after_computer[8] == 2'b00)
			begin 
				vector_after_computer[8] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[2] == user_choice & vector_after_computer[8] == user_choice & vector_after_computer[5] == 2'b00)
			begin 
				vector_after_computer[5] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[5] == user_choice & vector_after_computer[8] == user_choice & vector_after_computer[2] == 2'b00)
			begin 
				vector_after_computer[2] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[0] == user_choice & vector_after_computer[8] == user_choice & vector_after_computer[4] == 2'b00)
			begin 
				vector_after_computer[4] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[4] == user_choice & vector_after_computer[8] == user_choice & vector_after_computer[0] == 2'b00)
			begin 
				vector_after_computer[0] = c_choice;
				computer_done = 1;
			end								
			else if(vector_after_computer[0] == user_choice & vector_after_computer[4] == user_choice & vector_after_computer[8] == 2'b00)
			begin 
				vector_after_computer[8] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[2] == user_choice & vector_after_computer[4] == user_choice & vector_after_computer[6] == 2'b00)
			begin 
				vector_after_computer[6] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[2] == user_choice & vector_after_computer[6] == user_choice & vector_after_computer[4] == 2'b00)
			begin 
				vector_after_computer[4] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[4] == user_choice & vector_after_computer[6] == user_choice & vector_after_computer[2] == 2'b00)
			begin 
				vector_after_computer[2] = c_choice;
				computer_done = 1;
			end
			
			//play a move that is not bad
			else if(vector_after_computer[4] == 2'b00)
			begin
				vector_after_computer[4] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[0] == user_choice & vector_after_computer[5] == user_choice & vector_after_computer[2] == 2'b00)
			begin
				vector_after_computer[2] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[0] == user_choice & vector_after_computer[7] == user_choice & vector_after_computer[6] == 2'b00)
			begin
				vector_after_computer[6] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[0] == user_choice & vector_after_computer[8] == user_choice & vector_after_computer[5] == 2'b00)
			begin
				vector_after_computer[5] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[2] == user_choice & vector_after_computer[3] == user_choice & vector_after_computer[0] == 2'b00)
			begin
				vector_after_computer[0] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[2] == user_choice & vector_after_computer[7] == user_choice & vector_after_computer[8] == 2'b00)
			begin
				vector_after_computer[8] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[2] == user_choice & vector_after_computer[6] == user_choice & vector_after_computer[3] == 2'b00)
			begin
				vector_after_computer[3] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[8] == user_choice & vector_after_computer[3] == user_choice & vector_after_computer[6] == 2'b00)
			begin
				vector_after_computer[6] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[8] == user_choice & vector_after_computer[1] == user_choice & vector_after_computer[6] == 2'b00)
			begin
				vector_after_computer[6] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[6] == user_choice & vector_after_computer[5] == user_choice & vector_after_computer[2] == 2'b00)
			begin
				vector_after_computer[2] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[6] == user_choice & vector_after_computer[1] == user_choice & vector_after_computer[0] == 2'b00)
			begin
				vector_after_computer[0] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[1] == user_choice & vector_after_computer[3] == user_choice & vector_after_computer[0] == 2'b00)
			begin
				vector_after_computer[0] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[1] == user_choice & vector_after_computer[5] == user_choice & vector_after_computer[2] == 2'b00)
			begin
				vector_after_computer[2] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[3] == user_choice & vector_after_computer[7] == user_choice & vector_after_computer[6] == 2'b00)
			begin
				vector_after_computer[6] = c_choice;
				computer_done = 1;
			end
			else if(vector_after_computer[7] == user_choice & vector_after_computer[5] == user_choice & vector_after_computer[8] == 2'b00)
			begin
				vector_after_computer[8] = c_choice;
				computer_done = 1;
			end
			
			
			//will put randomly as can't win and user doesn't have a chance to win and all the good moves in the knowledge have failed  
			else
			begin
				random = count % 9;
				if(vector_after_computer[random] == 2'b00)
				begin
					vector_after_computer[random] = c_choice;
					computer_done = 1;
				end
			
			end

		end
	
	end
	else
		computer_done = 0;
	
end

endmodule 