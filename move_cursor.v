module move_cursor(clk, rst, move, cursor_x, cursor_y, start_screen);
	input				clk, rst;
	input		[3:0]	move;
	output reg	[7:0]	cursor_x, cursor_y;
	output reg			start_screen;

	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			cursor_x <= 0;
			cursor_y <= 0;
			start_screen <= 1;
		end
		else begin
			if (!move[0]) begin
				if (cursor_x == 0) cursor_x <= `MAX_X - 1;
				else cursor_x <= cursor_x - 1;
				start_screen <= 0;
			end
			if (!move[3]) begin
				if (cursor_x == `MAX_X - 1) cursor_x <= 0;
				else cursor_x <= cursor_x + 1;
				start_screen <= 0;
			end
			if (!move[1]) begin
				if (cursor_y == `MAX_Y - 1) cursor_y <= 0;
				else cursor_y <= cursor_y + 1;
				start_screen <= 0;
			end
			if (!move[2]) begin
				if (cursor_y == 0) cursor_y <= `MAX_Y - 1;
				else cursor_y <= cursor_y - 1;
				start_screen <= 0;
			end
		end
		
	end
endmodule
