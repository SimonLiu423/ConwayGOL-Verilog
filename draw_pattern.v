module draw_pattern(draw, pattern_mat, state, cursor_x, cursor_y);
	input					draw;
	input		[7:0]		cursor_x, cursor_y;
	input		[63:0]		pattern_mat;
	output reg	[3071:0]	state;

	integer dx, dy, nx, ny;

	always @(posedge draw) begin
		for ( dy = 0; dy < 8; dy = dy + 1 ) begin
			for ( dx = 0; dx < 8; dx = dx + 1 ) begin
				ny = cursor_y + dy;
				nx = cursor_x + dx;
				if (nx >= 0 && nx < `MAX_X && ny >= 0 && ny < `MAX_Y) begin
					if (pattern_mat[dy*8 + dx]) state[ny*`MAX_X + nx] = 1;
				end
			end
		end
	end
	
endmodule
