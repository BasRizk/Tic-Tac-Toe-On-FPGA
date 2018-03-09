module Tic_tac_toe (state_indication, lights, score_board, buttons, in_clk, reset);

output [9:0] state_indication;

output [17:0] lights;
output [7:0] score_board [5:0]; //don't care about it for now

input [8:0] buttons;
input in_clk, reset; //we can add it as input to our modules

reg [1:0] main_vector [8:0];
reg [2:0] state = 3'b000;
reg turn_switch = 1; 	// 1 for user, 0 for computer

//wire[1:0] vector_after_begin [8:0];
wire [1:0] vector_at_begin [8:0];
wire [1:0] vector_after_user [8:0];
wire [1:0] vector_after_computer [8:0];
wire [1:0] level;
wire user_choice; // 1 for X, 0 for O
wire[5:0] winning;  //Determines status of the game somehow 
wire gameover;
wire clk;

wire start_lights_arranged, user_done, computer_done, check_done, refresh_done, update_done;

integer i;

parameter s_start_game = 3'b000, s_user_playing = 3'b001, s_computer_playing = 3'b010,
				s_checking = 3'b011, s_refreshing = 3'b100, s_updating_score = 3'b101;

//Intializing our modules - they all depend on the states

start_game St(start_lights_arranged, vector_at_begin, level, user_choice, buttons, state, clk);	//at s_start_game

user_player U(user_done, vector_after_user, main_vector, buttons, user_choice, state, clk);							//at s_user_playing
computer_player AI(computer_done, vector_after_computer, main_vector, level, user_choice, state, clk);			//at s_computer_playing

winning_checker C(check_done, winning, main_vector, state, clk);																//at s_checking
lights_refresher R(refresh_done, lights, main_vector, state, winning, clk);												//at s_refreshing
score_updater S(update_done, score_board, gameover, winning, state, user_choice, clk);									//at s_updating

clk_generator clkg(clk, in_clk); 


//changing our state depending on the transitions happening
//Updating our main_vector depending on any change of state

always @(posedge clk)
begin

if(~reset & state != s_start_game) state <= s_start_game; //in Case of reseting the game
else
begin
case(state)
	s_start_game			:	begin
									state_indication = 10'b0000_000_001;
									main_vector <= vector_at_begin;
									
									if(level !=0 & start_lights_arranged == 1)	//if level == 0, it means game has not began yet
									begin
										main_vector[0] <= 2'b00; main_vector[1] <= 2'b00; main_vector[2] <= 2'b00; 
										main_vector[3] <= 2'b00; main_vector[4] <= 2'b00; main_vector[5] <= 2'b00; 
										main_vector[6] <= 2'b00; main_vector[7] <= 2'b00; main_vector[8] <= 2'b00;
										
										turn_switch = (user_choice)? 1 : 0;
										state_indication = 10'b0000_010_000;
										state <= s_refreshing;	
										
									end

									
									end

	s_user_playing			:	begin
									if(user_done)
									begin
										main_vector <= vector_after_user;
										turn_switch <= ~turn_switch;
										state <= s_checking;
										state_indication = 10'b0000_001_000;
									end
									end
	
	s_computer_playing	:	begin
									if(computer_done)
									begin
										main_vector <= vector_after_computer;
										turn_switch <= ~turn_switch;
										state <= s_checking;
										state_indication = 10'b0000_001_000;

									end
									end
	
	s_checking				:	begin
									if(check_done)
									begin
										state_indication = 10'b0000_010_000;
										state <= s_refreshing;										
									end
									end
	
	s_refreshing			:	if(refresh_done)
									begin
										if(winning[5] == 1)
										begin
											main_vector[0] <= 2'b00; main_vector[1] <= 2'b00; main_vector[2] <= 2'b00; 
											main_vector[3] <= 2'b00; main_vector[4] <= 2'b00; main_vector[5] <= 2'b00; 
											main_vector[6] <= 2'b00; main_vector[7] <= 2'b00; main_vector[8] <= 2'b00;
											
										end
										state_indication = 10'b0000_100_000;
										state <= s_updating_score;		
									end
	
	
	s_updating_score		:	if(update_done)
									begin
										if(gameover == 1)
										begin
											state_indication = 10'b0000_000_001;
											state <= s_start_game;
										end
										else
											if(turn_switch == 1)
											begin
												state_indication = 10'b0000_000_010;
												state <= s_user_playing;
											end
											else
											begin
												state_indication = 10'b0000_000_100;
												state <= s_computer_playing;
											end
									end
									
	
	default 					:	begin
										state_indication = 10'b0000_111_111;
										state <= s_start_game;
									end
		
endcase
end

end

endmodule 