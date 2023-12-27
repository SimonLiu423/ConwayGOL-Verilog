module conway_fsm(clk, rst, freeze, state);
	input					clk, rst;
	input					freeze;
	output reg	[3071:0]	state;
	reg			[3071:0]	state_cp;

	integer x, y, dx, dy, nx, ny;
	integer idx, live_neighbors;

	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			state = 0;
			state[49] = 1;
			state[50] = 1;
			state[51] = 1;
		end
		else begin
			if (freeze == 0) begin
				state_cp = state;
				for ( y = 0; y < `MAX_Y; y = y + 1) begin
					for ( x = 0; x < `MAX_X; x = x + 1) begin
						idx = y*`MAX_Y + x;
						live_neighbors = 0;
						for ( dy = -1; dy <= 1; dy = dy + 1) begin
							for ( dx = -1; dx <= 1; dx = dx + 1 ) begin
								if (~(dy == 0 && dx == 0)) begin
									ny = y + dy;
									nx = x + dx;
									if (ny >= 0 && ny < `MAX_Y && nx >= 0 && nx < `MAX_X) begin
										live_neighbors = live_neighbors + state_cp[ny*`MAX_Y + nx];
									end	
								end
							end
						end
						
						if (state[idx] == 1 && (live_neighbors < 2 || live_neighbors > 3)) begin
        	        		state[idx] = 0; // Cell dies
        	    		end
						else if (state[idx] == 0 && live_neighbors == 3) begin
							state[idx] = 1;
        	    		end
						else begin
							state[idx] = state[idx];
        	    		end
					end
				end
			end

		end
	end
	

endmodule
