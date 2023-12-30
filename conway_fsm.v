`define neighbors(y, x) \
	(state[`idx(`PREV(y, 1, `MAX_Y), `PREV(x, 1, `MAX_X))] + 	/* [y-1][x-1] */ 	\
	state[`idx(`PREV(y, 1, `MAX_Y), x)] +					/* [y-1][x] */ 		\
	state[`idx(`PREV(y, 1, `MAX_Y), `NEXT(x, 1, `MAX_X))] + 	/* [y-1][x+1] */ 	\
	state[`idx(y, `PREV(x, 1, `MAX_X))] + 					/* [y][x-1] */ 		\
	state[`idx(y, `NEXT(x, 1, `MAX_X))] + 					/* [y][x+1] */ 		\
	state[`idx(`NEXT(y, 1, `MAX_Y), `PREV(x, 1, `MAX_X))] + 	/* [y+1][x-1] */ 	\
	state[`idx(`NEXT(y, 1, `MAX_Y), x)] + 					/* [y+1][x] */ 		\
	state[`idx(`NEXT(y, 1, `MAX_Y), `NEXT(x, 1, `MAX_X))]) 	/* [y+1][x+1] */

module conway_fsm(
	input							clk,
	input 							rst,
	input 							draw,
	input							freeze,
	input		[7:0]				cursor_x, 
	input		[7:0]				cursor_y,
	input		[0:63]				pattern_mat,
	input							start_screen,
	output reg	[0:`S_SIZE-1]		state
);
	integer x, y, dx, dy;
	reg  							in_game;
	// reg			[24:0]				count;
	reg								drawed;
	// reg								calc_state;

	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			in_game <= 0;
			drawed <= 0;
			state <= 
				{
					40'b0,
					40'b0,
					40'b0001110111101001010001001100101010011100,
					40'b0010000100101001010001010010101010100000,
					40'b0010000100101101010001010010111000111000,
					40'b0010000100101011010101011110010000000100,
					40'b0010000100101001010101010010010000000100,
					40'b0001110111101001011111010010010000111000,
					40'b0,
					40'b0000000000000000001111001100011100111100,
					40'b0000000000000000001000010010101010100000,
					40'b0000000000000000001000010010101010111000,
					40'b0000000000000000001011011110101010100000,
					40'b0000000000000000001001010010101010100000,
					40'b0000000000000000001111010010101010111100,
					40'b0,
					40'b0000000011110111100000000000000000000000,
					40'b0000000010010100000000000000000000000000,
					40'b0000000010010111000000000000000000000000,
					40'b0000000010010100000000000000000000000000,
					40'b0000000010010100000000000000000000000000,
					40'b0000000011110100000000000000000000000000,
					40'b0,
					40'b0000000000000000100001011110111100000000,
					40'b0000000000000000100001010000100000000000,
					40'b0000000000000000100001011100111000000000,
					40'b0000000000000000100001010000100000000000,
					40'b0000000000000000100001010000100000000000,
					40'b0000000000000000111101010000111100000000,
					40'b0,
				};

		end
		else begin
			if (start_screen == 0) begin
				// calc_state = (count >= 2 * `TimeExpire_Game) ? 1 : 0;
				if (in_game == 0) begin
					in_game <= 1;
					state <= 0;
				end
				else begin
					for ( y = 0; y < `MAX_Y; y = y + 1) begin
						for ( x = 0; x < `MAX_X; x = x + 1) begin
							dx = (x >= cursor_x) ? (x - cursor_x) : (x + `MAX_X - cursor_x);
							dy = (y >= cursor_y) ? (y - cursor_y) : (y + `MAX_Y - cursor_y);

							if (draw && (dx < 8) && (dy < 8) && (pattern_mat[(dy)*8 + (dx)] == 1)) begin
								if (drawed == 0) begin
									state[`idx(y,x)] <= 1;
									drawed <= 1;
								end
							end
							else if (freeze == 0 && state[`idx(y,x)] == 1 && (`neighbors(y,x) < 2 || `neighbors(y,x) > 3)) begin
   		    	        		state[`idx(y,x)] <= 0; // Cell dies
								drawed <= 0;
   		    	    		end
							else if (freeze == 0 && state[`idx(y,x)] == 0 && `neighbors(y,x) == 3) begin
								state[`idx(y,x)] <= 1;
								drawed <= 0;
   		    	    		end
							else begin
								state[`idx(y,x)] <= state[`idx(y,x)];
								drawed <= 0;
   		    	    		end
						end
					end
				end
			end
		end
	end
	

endmodule
