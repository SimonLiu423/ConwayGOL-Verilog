`define TimeExpire_VGA 32'd0
`define TimeExpire_Game 32'd12500000
`define TimeExpire_Movement 32'd10000
`define TimeExpire_Keypad 32'd250000
`define TimeExpire_Matrix 32'd2500
`define MAX_X 8'd64
`define MAX_Y 8'd48

module main(clk, rst, freeze, move, keypadRow, keypadCol, dot_row, dot_col, r_out, g_out, b_out, hsync, vsync);
	input				clk, rst;
	input				freeze;
	input	[3:0]		move;
	input	[3:0]		keypadCol;

	output				hsync, vsync;
	output	[3:0]		r_out, g_out, b_out;
	output	[3:0]		keypadRow;
	output	[7:0]		dot_row, dot_col;

	wire				vga_clk, game_clk, move_clk, key_clk, mat_clk;
	wire	[3071:0]	state;
	wire	[3:0]		pattern_idx;
	wire	[63:0]		pattern_mat;
	wire	[7:0]		cursor_x, cursor_y;

	// clks
	clk_div			A0(clk, rst, `TimeExpire_VGA, vga_clk);
	clk_div			B0(clk, rst, `TimeExpire_Game, game_clk);
	clk_div			C0(clk, rst, `TimeExpire_Movement, move_clk);
	clk_div			D0(clk, rst, `TimeExpire_Keypad, key_clk);
	clk_div			E0(clk, rst, `TimeExpire_Matrix, mat_clk);

	// inputs
	move_cursor		M1(move_clk, rst, move, cursor_x, cursor_y);
	choose_pattern	N1(key_clk, rst, keypadRow, keypadCol, pattern_idx);

	// states
	conway_fsm		F1(game_clk, rst, freeze, state);
	load_pattern	G1(clk, rst, pattern_idx, pattern_mat);

	// outputs
	display			M2(vga_clk, rst, state, r_out, g_out, b_out, hsync, vsync);
	display_matrix	M4(mat_clk, rst, pattern_mat, dot_row, dot_col);

endmodule

