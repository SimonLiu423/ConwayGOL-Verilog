`define DisplayWidth		640
`define DisplayHeight		480
`define TimeExpire_VGA 25'd0
`define TimeExpire_Game 25'd12500000
`define TimeExpire_Movement 25'd2000000
`define TimeExpire_Keypad 25'd250000
`define TimeExpire_Matrix 25'd2500
`define TimeExpire_Black  25'd25000000
`define PREV(pos, val, max) (((pos) < (val)) ? ((pos)+ (max) - (val)) : ((pos) - (val)))
`define NEXT(pos, val, max) (((pos) + (val) >= (max)) ? ((pos) + (val) - (max)) : ((pos) + (val)))
`define idx(y, x) ((y)*`MAX_X + (x))
// `define MAX_X 8'd64
// `define MAX_Y 8'd48
`define S_WIDTH 16
`define MAX_X (`DisplayWidth / `S_WIDTH)
`define MAX_Y (`DisplayHeight / `S_WIDTH)
`define S_SIZE `MAX_X*`MAX_Y

module main(
	input				clk,
	input				rst,
	input				freeze,
	input				preview,
	input	[3:0]		move,
	input	[3:0]		keypadCol,
	input	[3:0]		speed,
	output	[6:0]		seg1,
	output	[6:0]		seg2,
	output	[6:0]		seg3,
	output	[6:0]		seg4,
	output	[3:0]		keypadRow,
	output	[7:0]		dot_row,
	output	[7:0]		dot_col,
	output	[3:0]		r_out,
	output	[3:0]		g_out,
	output	[3:0]		b_out,
	output				hsync,
	output				vsync
);

	wire					vga_clk, game_clk, move_clk, key_clk, mat_clk, black_clk;
	wire					draw;
	wire					start_screen;
	wire	[24:0]			game_time;
	wire	[`S_SIZE-1:0]	state;
	wire	[3:0]			pattern_id;
	wire	[0:63]			pattern_mat;
	wire	[7:0]			cursor_x, cursor_y;
	wire	[11:0]			alives;

	// clks
	clk_div			A0(clk, rst, `TimeExpire_VGA, vga_clk);
	clk_div			B0(clk, rst, game_time, game_clk);
	clk_div			C0(clk, rst, `TimeExpire_Movement, move_clk);
	clk_div			D0(clk, rst, `TimeExpire_Keypad, key_clk);
	clk_div			E0(clk, rst, `TimeExpire_Matrix, mat_clk);
	clk_div			E1(clk, rst, `TimeExpire_Black, black_clk);

	// inputs
	move_cursor		M1(move_clk, rst, move, cursor_x, cursor_y, start_screen);
	choose_pattern	N1(key_clk, rst, keypadRow, keypadCol, pattern_id, draw);
	change_speed	P1(speed, game_time);

	// states
	load_pattern	G1(game_clk, rst, pattern_id, pattern_mat);
	conway_fsm		F1(game_clk, rst, draw, freeze, cursor_x, cursor_y, pattern_mat, start_screen, state);
	count_alive		X1(game_clk, rst, state, alives);

	// outputs
	display			M2(vga_clk, black_clk, rst, start_screen, state, pattern_mat, preview, cursor_x, cursor_y, r_out, g_out, b_out, hsync, vsync);
	display_matrix	M4(mat_clk, rst, pattern_id, dot_row, dot_col);
	display_seven	M3(game_clk, rst, alives, seg1, seg2, seg3, seg4);

endmodule

