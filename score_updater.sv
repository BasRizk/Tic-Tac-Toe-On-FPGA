module score_updater(update_done, score_board, gameover, winning, state, player_symbol , clk);

output reg update_done;
output reg [7:0] score_board [5:0];
output gameover;

input [5:0] winning;
input [2:0] state;
input player_symbol;
input clk;

reg [3:0] displays [5:0];
reg [3:0] computer_score = 0;
reg [3:0] player_score = 0;
reg [3:0] round_number = 1;
reg [5:0] enable = 6'b111_111;


reg [2:0] clk_counter = 0;
reg [5:0] flash_counter = 0;

reg flash_clk;
reg endgame = 0;
reg flash = 0; //bool for enabling flash
reg start_update;

parameter s_updating_score = 3'b101, s_start_game = 3'b000 ,s_refreshing = 3'b100, s_checking = 3'b011;

parameter C_symbol = 4'd10 , P_symbol = 4'd11 , r_symbol = 4'd12;

/* //for debugging
seven_seg_dec player_segment  (score_board[5], winning[5] , enable[5]); 
seven_seg_dec displays[4]_segment  (score_board[4], winning[4] , enable[4]);
seven_seg_dec computer_segment  (score_board[3], winning[3] , enable[3]); 
seven_seg_dec computer_score_segment  (score_board[2], winning[2] , enable[2]);
seven_seg_dec round_segment  (score_board[1], winning[1] , enable[1]); 
seven_seg_dec round_number_segment  (score_board[0], winning[0] , enable[0]);
*/
seven_seg_dec player_segment  (score_board[0], displays[5] , enable[5]); 
seven_seg_dec displays_player_score  (score_board[1], displays[4] , enable[4]);
seven_seg_dec computer_segment  (score_board[2], displays[3] , enable[3]); 
seven_seg_dec computer_score_segment  (score_board[3], displays[2] , enable[2]);
seven_seg_dec round_segment  (score_board[4], displays[1] , enable[1]); 
seven_seg_dec round_number_segment  (score_board[5], displays[0] , enable[0]);

always @(posedge clk) 
begin

	start_update <= 1;
	
	if(state == s_start_game)
	begin 
		
		player_score <= 0;
		computer_score <= 0;
		round_number <= 1;
		
		displays[5] <= P_symbol;
		displays[4] <= player_score;
		displays[3] <= C_symbol;
		displays[2] <= computer_score;
		displays[1] <= r_symbol;
		displays[0] <= round_number;
		start_update <= 0;
		
		gameover <= 0;
		
	end
	else
	if(state == s_updating_score ) 
	begin
		displays[4] <= player_score;
		displays[2] <= computer_score;
		displays[0] <= round_number;
		start_update <= 0;
	
		if(displays[4] == 3 | displays[2] == 3)
		begin
			gameover <= 1;
		end
		
		if(flash == 1)
		begin
			if(flash_counter < 30)
			begin
				flash_counter <= flash_counter + 1;
				enable[0] <= flash_clk;
//				enable[1] <= flash_clk;
				enable[2] <= flash_clk;
//				enable[3] <= flash_clk;
				enable[4] <= flash_clk;
//				enable[5] <= flash_clk;
			end
			else
			begin
				flash_counter <= 0;
				flash <= 0;
				start_update <= 0;
				enable <= 6'b111_111;
			end
		end		
		
	end	
	else
	if(state == s_checking)
		begin
			if(winning[5] == 1 & displays[0] == round_number)
				begin
				round_number <= round_number + 1;
				flash <= 1;
				end
			
			if(winning[4] == 1)// & flash == 0 & endgame == 0)
			begin
			
				if(player_symbol == winning[3] & displays[4] == player_score & displays[2] == computer_score)
					player_score <= player_score + 1;
				else
					computer_score <= computer_score + 1;
				start_update <= 0;
						
			end
			update_done <= 0;
			gameover <= 0;
		end				

	/*
	if(flash == 0 & state == s_updating_score & (displays[4] != player_score | displays[2] != computer_score | displays[0] != round_number) ) //& displays[4] != 0 & displays[2] != 0 & displays[0] != 1)
	begin
		displays[4] <= player_score;
		displays[2] <= computer_score;
		displays[0] <= round_number;
		flash <= 1;
	end	
*/				
	
	

	

	if(start_update == 0 & flash == 0 & endgame == 0 & displays[4] == player_score & displays[2] == computer_score & displays[0] == round_number)
	begin
		update_done <= 1;
	end

			
	//-------------------------
	//clock
	
	if(clk_counter < 4)
		clk_counter <= clk_counter + 1;
	else
	begin
		flash_clk = ~ flash_clk;
		clk_counter <= 0;
	end
	
end
	
endmodule 