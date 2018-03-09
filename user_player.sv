module user_player(user_done, vector_after_user, main_vector, buttons, user_indicator, state, clk);

output reg user_done;
output reg [1:0]  vector_after_user[8:0];

input[1:0] main_vector[8:0];
input[8:0] buttons;
input user_indicator;
input[1:0] state;
input clk;

integer i;
wire user_choice;

parameter s_user_playing = 3'b001;

assign user_choice = (user_indicator)? 2'b01 : 2'b10;

always @(posedge clk)
begin

if(state == s_user_playing & user_done == 0)
begin
	for(i=0;i<9;i=i+1)
		vector_after_user[i] = main_vector[i];
			
	case(buttons)
		 9'b000000001:if(vector_after_user[0] == 0) begin vector_after_user[0] = user_choice; user_done = 1; end
		 9'b000000010:if(vector_after_user[1] == 0) begin vector_after_user[1] = user_choice; user_done = 1; end
		 9'b000000100:if(vector_after_user[2] == 0) begin vector_after_user[2] = user_choice; user_done = 1; end
		 9'b000001000:if(vector_after_user[3] == 0) begin vector_after_user[3] = user_choice; user_done = 1; end 
		 9'b000010000:if(vector_after_user[4] == 0) begin vector_after_user[4] = user_choice; user_done = 1; end
		 9'b000100000:if(vector_after_user[5] == 0) begin vector_after_user[5] = user_choice; user_done = 1; end
		 9'b001000000:if(vector_after_user[6] == 0) begin vector_after_user[6] = user_choice; user_done = 1; end
		 9'b010000000:if(vector_after_user[7] == 0) begin vector_after_user[7] = user_choice; user_done = 1; end
		 9'b100000000:if(vector_after_user[8] == 0) begin vector_after_user[8] = user_choice; user_done = 1; end
	endcase
	
	

end

else
begin
	user_done = 0;
end

end

endmodule 