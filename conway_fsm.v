module conway_fsm(
	input							clk,
	input 							rst,
	input 							draw,
	input							freeze,
	input		[7:0]				cursor_x, 
	input		[7:0]				cursor_y,
	input		[63:0]				pattern_mat,
	output reg	[`MAX_X*`MAX_Y-1:0]	state,
	output reg	[11:0]				alives
);
	reg			[`MAX_X*`MAX_Y-1:0]	state_cp;
	integer x, y, dx, dy, nx, ny;
	integer u_idx, live_neighbors;

	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			state = 0;
			state[2+3*`MAX_X] = 1;
			state[3+4*`MAX_X] = 1;
			state[3+5*`MAX_X] = 1;
			state[2+5*`MAX_X] = 1;
			state[1+5*`MAX_X] = 1;

			// state[2+10*`MAX_X] = 1;
			// state[3+10*`MAX_X] = 1;
			// state[2+11*`MAX_X] = 1;
			// state[3+11*`MAX_X] = 1;

			// state[4+12*`MAX_X] = 1;
			// state[5+12*`MAX_X] = 1;
			// state[4+13*`MAX_X] = 1;
			// state[5+13*`MAX_X] = 1;
			alives = 0;
		end
		else begin
			if (freeze == 0) begin
				state_cp = state;
				for ( y = 0; y < `MAX_Y; y = y + 1) begin
					for ( x = 0; x < `MAX_X; x = x + 1) begin
						live_neighbors = 
							state_cp[idx(PREV(y, `MAX_Y), PREV(x, `MAX_X))] + 	// [y-1][x-1]
							state_cp[idx(PREV(y, `MAX_Y), x)] +					// [y-1][x]
							state_cp[idx(PREV(y, `MAX_Y), NEXT(x, `MAX_X))] + 	// [y-1][x+1]
							state_cp[idx(y, PREV(x, `MAX_X))] + 				// [y][x-1]
							state_cp[idx(y, NEXT(x, `MAX_X))] + 				// [y][x+1]
							state_cp[idx(NEXT(y, `MAX_Y), PREV(x, `MAX_X))] + 	// [y+1][x-1]
							state_cp[idx(NEXT(y, `MAX_Y), x)] + 				// [y+1][x]
							state_cp[idx(NEXT(y, `MAX_Y), NEXT(x, `MAX_X))]; 	// [y+1][x+1]
						
						u_idx = idx(y, x);
						if (state[idx] == 1 && (live_neighbors < 2 || live_neighbors > 3)) begin
        	        		state[idx] = 0; // Cell dies
							alives = alives - 1;
        	    		end
						else if (state[idx] == 0 && live_neighbors == 3) begin
							state[idx] = 1;
							alives = alives + 1;
        	    		end
						else begin
							state[idx] = state[idx];
        	    		end
					end
				end
			end
			// if (draw == 0) begin
			// 	for ( dy = 0; dy < 8; dy = dy + 1 ) begin
			// 		for ( dx = 0; dx < 8; dx = dx + 1 ) begin
			// 			ny = cursor_y + dy;
			// 			nx = cursor_x + dx;
			// 			if(ny < 0) ny = ny + `MAX_Y;
			// 			if(nx < 0) nx = nx + `MAX_X;
			// 			if(ny == `MAX_Y) ny = 0;
			// 			if(nx == `MAX_X) nx = 0;
			// 			idx = ny * `MAX_X + nx;
			// 			if (pattern_mat[dy*8 + dx]) begin
			// 				if (state[idx] == 0) alives = alives + 1;
			// 				state[idx] = 1;
			// 			ls
			// end
			// 		end
			// 	end
			// end

		end
	end
	

endmodule
