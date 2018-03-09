module winning_checker(check_done, winning, main_vector, state, clk);

output reg [5:0] winning = 6'b000_000;
output reg check_done;

input [1:0] main_vector [8:0];
input [2:0] state;
input clk;

parameter s_winning_checker = 3'b011, s_refreshing = 3'b100, s_updating_score = 3'b101;

always @ (posedge clk)
begin

if(state != s_winning_checker)
begin
	check_done = 0;
	if(state != s_updating_score & state != s_refreshing)
		winning = 6'b000_000;
end

else
if(state == s_winning_checker & check_done == 0) 
begin
if(main_vector[0] == main_vector[1] & main_vector[1] == main_vector[2] & main_vector[2] == 2'b10)
   winning = 6'b110_000;
else
if(main_vector[3] == main_vector[4] & main_vector[4] == main_vector[5] & main_vector[5] == 2'b10)
	winning = 6'b110_001;
else
if(main_vector[6] == main_vector[7] & main_vector[7] == main_vector[8] & main_vector[8] == 2'b10)
	winning = 6'b110_010;
else
if(main_vector[0] == main_vector[3] & main_vector[3] == main_vector[6] & main_vector[6] == 2'b10)
	winning = 6'b110_011;	
else
if(main_vector[1] == main_vector[4] & main_vector[4] == main_vector[7] & main_vector[7] == 2'b10)
	winning = 6'b110_100;  
else
if(main_vector[2] == main_vector[5] & main_vector[5] == main_vector[8] & main_vector[8] == 2'b10)
	winning = 6'b110_101;	
else
if(main_vector[0] == main_vector[4] & main_vector[4] == main_vector[8] & main_vector[8] == 2'b10)
	winning = 6'b110_110;	  
else
if(main_vector[2] == main_vector[4] & main_vector[4] == main_vector[6] & main_vector[6] == 2'b10)
	winning = 6'b110_111;	
else	 
if(main_vector[0] == main_vector[1] & main_vector[1] == main_vector[2] & main_vector[2] == 2'b01)
	winning = 6'b111_000;
else
if(main_vector[3] == main_vector[4] & main_vector[4] == main_vector[5] & main_vector[5] == 2'b01)
	winning = 6'b111_001;
else
if(main_vector[6] == main_vector[7] & main_vector[7] == main_vector[8] & main_vector[8] == 2'b01)
	winning = 6'b111_010;
else
if(main_vector[0] == main_vector[3] & main_vector[3] == main_vector[6] & main_vector[6] == 2'b01)
	winning = 6'b111_011;	
else
if(main_vector[1] == main_vector[4] & main_vector[4] == main_vector[7] & main_vector[7] == 2'b01)
	winning = 6'b111_100;  
else
if(main_vector[2] == main_vector[5] & main_vector[5] == main_vector[8] & main_vector[8] == 2'b01)
	winning = 6'b111_101;	
	else
if(main_vector[0] == main_vector[4] & main_vector[4] == main_vector[8] & main_vector[8] == 2'b01)
	winning = 6'b111_110;	  
else
if(main_vector[2] == main_vector[4] & main_vector[4] == main_vector[6] & main_vector[6] == 2'b01)
	winning = 6'b111_111;
else
if(main_vector[0] != 2'b00 & main_vector[1] != 2'b00 & main_vector[2] != 2'b00 &
	main_vector[3] != 2'b00 & main_vector[4] != 2'b00 & main_vector[5] != 2'b00 &
	main_vector[6] != 2'b00 & main_vector[7] != 2'b00 & main_vector[8] != 2'b00 )
	winning = 6'b100_000;

check_done = 1;			
end
															  																				  
end		
							  
endmodule 