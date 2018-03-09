module seven_seg_dec(segments, num , enable);

input enable;
input[4:0] num;
output [6:0] segments;
reg [7:0] segments;

always@(num or enable)
begin
	
	if(enable == 1)
		case(num)
		0: segments <= ~8'b0011_1111; 	  	//  --0--
		1: segments <= ~8'b0011_0000;		   //  |    |
		2: segments <=  ~8'b0101_1011;      //  5    1  
		3: segments   <=  ~8'b0111_1001;  	//  |    |
		4: segments <=  ~8'b0111_0100;    	//  --6--
		5: segments   <=  ~8'b0110_1101;    //  |    |
		6: segments <=  ~8'b0110_1111;    	//  4    2 
		7: segments   <=  ~8'b0011_1000;  	//  |    |
		8: segments <=  ~8'b0111_1111;    	//  --3--
		9: segments   <=  ~8'b0111_1101;
		10: segments <= ~8'b0000_1111; // C
		11: segments <= ~8'b0101_1110; // P
		12: segments <= ~8'b0100_0010; // r
		default: segments  <=  7'bx;
		endcase
	else
		segments <= 8'b1111_1111;
		
	
end

endmodule 