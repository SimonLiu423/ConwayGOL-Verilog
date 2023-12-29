module display_seven(number, seg1, seg2, seg3, seg4);
    input		[11:0]	number;
    output reg	[6:0]	seg1;
    output reg	[6:0] 	seg2; // Tens
    output reg	[6:0] 	seg3; // Hundreds
    output reg	[6:0] 	seg4; // Thousands

	reg 		[3:0] 	digit[0:3];
	integer i;

	always @(number) begin
		// Initialize BCD digits
		digit[0] = 0;
		digit[1] = 0;
		digit[2] = 0;
		digit[3] = 0;
		
		// Double dabble algorithm
		for (i = 11; i >= 0; i = i - 1) begin
		    if (digit[3] >= 5)
		        digit[3] = digit[3] + 3;
		    if (digit[2] >= 5)
		        digit[2] = digit[2] + 3;
		    if (digit[1] >= 5)
		        digit[1] = digit[1] + 3;
		    if (digit[0] >= 5)
		        digit[0] = digit[0] + 3;
		
		    digit[3] = digit[3] << 1;
		    digit[3][0] = digit[2][3];
		    digit[2] = digit[2] << 1;
		    digit[2][0] = digit[1][3];
		    digit[1] = digit[1] << 1;
		    digit[1][0] = digit[0][3];
		    digit[0] = digit[0] << 1;
		    digit[0][0] = number[i];
		end
	end

	// BCD to seven-segment decoder
	integer j;
	always @(*) begin
	    case (digit[0])
	        4'd0: seg1 = 7'b1000000;
	        4'd1: seg1 = 7'b1111001;
	        4'd2: seg1 = 7'b0100100;
	        4'd3: seg1 = 7'b0110000;
	        4'd4: seg1 = 7'b0011001;
	        4'd5: seg1 = 7'b0010010;
	        4'd6: seg1 = 7'b0000010;
	        4'd7: seg1 = 7'b1111000;
	        4'd8: seg1 = 7'b0000000;
	        4'd9: seg1 = 7'b0010000;
	        default: seg1 = 7'b1111111; // Off for invalid digits
	    endcase
	    case (digit[1])
	        4'd0: seg2 = 7'b1000000;
	        4'd1: seg2 = 7'b1111001;
	        4'd2: seg2 = 7'b0100100;
	        4'd3: seg2 = 7'b0110000;
	        4'd4: seg2 = 7'b0011001;
	        4'd5: seg2 = 7'b0010010;
	        4'd6: seg2 = 7'b0000010;
	        4'd7: seg2 = 7'b1111000;
	        4'd8: seg2 = 7'b0000000;
	        4'd9: seg2 = 7'b0010000;
	        default: seg2 = 7'b1111111; // Off for invalid digits
	    endcase
	    case (digit[2])
	        4'd0: seg3 = 7'b1000000;
	        4'd1: seg3 = 7'b1111001;
	        4'd2: seg3 = 7'b0100100;
	        4'd3: seg3 = 7'b0110000;
	        4'd4: seg3 = 7'b0011001;
	        4'd5: seg3 = 7'b0010010;
	        4'd6: seg3 = 7'b0000010;
	        4'd7: seg3 = 7'b1111000;
	        4'd8: seg3 = 7'b0000000;
	        4'd9: seg3 = 7'b0010000;
	        default: seg3 = 7'b1111111; // Off for invalid digits
	    endcase
	    case (digit[3])
	        4'd0: seg4 = 7'b1000000;
	        4'd1: seg4 = 7'b1111001;
	        4'd2: seg4 = 7'b0100100;
	        4'd3: seg4 = 7'b0110000;
	        4'd4: seg4 = 7'b0011001;
	        4'd5: seg4 = 7'b0010010;
	        4'd6: seg4 = 7'b0000010;
	        4'd7: seg4 = 7'b1111000;
	        4'd8: seg4 = 7'b0000000;
	        4'd9: seg4 = 7'b0010000;
	        default: seg4 = 7'b1111111; // Off for invalid digits
	    endcase
	end
	
endmodule

