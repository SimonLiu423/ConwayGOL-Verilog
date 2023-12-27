module draw_pattern(draw, pattern_mat, state, cursor_x, cursor_y, alives);
	input					draw;
	input		[7:0]		cursor_x, cursor_y;
	input		[63:0]		pattern_mat;
	output reg	[3071:0]	state;
	output reg	[11:0]		alives;

	integer dx, dy, nx, ny;
	integer idx;

	always @(posedge draw) begin
		for ( dy = 0; dy < 8; dy = dy + 1 ) begin
			for ( dx = 0; dx < 8; dx = dx + 1 ) begin
				idx = ny * `MAX_Y + nx;
				ny = cursor_y + dy;
				nx = cursor_x + dx;
				if (nx >= 0 && nx < `MAX_X && ny >= 0 && ny < `MAX_Y) begin
					if (pattern_mat[dy*8 + dx]) begin
						if (state[idx] == 0) alives = alives + 1;
						state[idx] = 1;
					end
				end
			end
		end
	end
	
endmodule
