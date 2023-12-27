`define TimeExpire_VGA 32'd0
`define TimeExpire_Game 32'd12500000
`define TimeExpire_Movement 32'd10000
`define MAX_X 8'd64
`define MAX_Y 8'd48

module main(clk, rst, freeze_button, move, r_out, g_out, b_out, hsync, vsync);
	input				clk, rst;
	input				freeze_button;
	input	[3:0]		move;
	output				hsync, vsync;
	output	[3:0]		r_out, g_out, b_out;

	wire				vga_clk, game_clk, move_clk;
	wire				freeze;
	wire	[3071:0]	state;
	wire	[7:0]		cursor_x, cursor_y;

	clk_div			M0(clk, rst, `TimeExpire_VGA, vga_clk);
	clk_div			M00(clk, rst, `TimeExpire_Game, game_clk);
	clk_div			M000(clk, rst, `TimeExpire_Movement, move_clk);
	change_mode		M11(rst, freeze_button, freeze);
	move_cursor		M12(move_clk, rst, move, cursor_x, cursor_y);
	conway_fsm		M1(game_clk, rst, freeze, state);
	display			M2(vga_clk, rst, state, r_out, g_out, b_out, hsync, vsync);
endmodule

