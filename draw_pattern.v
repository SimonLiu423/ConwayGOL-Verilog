module draw_pattern(draw, pattern_mat, state, cursor_x, cursor_y, alives);
	input							draw;
	input		[7:0]				cursor_x, cursor_y;
	input		[63:0]				pattern_mat;
	input		[`MAX_X*`MAX_Y-1:0]	state;
	output reg	[`MAX_X*`MAX_Y-1:0]	state;
	output reg	[11:0]				alives;

	integer dx, dy, nx, ny;
	integer idx;

	always @(posedge draw) begin
		for ( dy = 0; dy < 8; dy = dy + 1 ) begin
			for ( dx = 0; dx < 8; dx = dx + 1 ) begin
				ny = cursor_y + dy;
				nx = cursor_x + dx;
				if(ny < 0) ny = ny + `MAX_Y;
				if(nx < 0) nx = nx + `MAX_X;
				if(ny == `MAX_Y) ny = 0;
				if(nx == `MAX_X) nx = 0;
				idx = ny * `MAX_X + nx;
				if (pattern_mat[dy*8 + dx]) begin
					if (state[idx] == 0) alives = alives + 1;
					state[idx] = 1;
				end
			end
		end
	end
	
endmodule
