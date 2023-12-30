`define TotalRow			(`DisplayHeight + 45)
`define TotalCol			(`DisplayWidth + 160)
`define H_Back	10'd96
`define H_VideoBegin		(`H_Back + 48)
`define H_VideoEnd			(`H_VideoBegin + `DisplayWidth)
`define V_Back	10'd2
`define V_VideoBegin		(`V_Back + 33)
`define V_VideoEnd			(`V_VideoBegin + `DisplayHeight)

module display(
	input							clk,
	input							black_clk,
	input							rst,
	input							start_screen,
	input		[0:`S_SIZE-1]		state,
	input       [0:63]              pattern_mat,
	input							preview,
	input		[7:0]				cursor_x,
	input		[7:0]				cursor_y,
	output reg	[3:0]				r_out,
	output reg	[3:0]				g_out,
	output reg	[3:0]				b_out,
	output reg						hsync,
	output reg						vsync
);

	reg						black;
	reg			[9:0]		row_cnt, col_cnt;
	integer					grid_x, grid_y, dx, dy;

	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			row_cnt <= 10'd0;
			col_cnt <= 10'd0;
			vsync <= 1'b0;
			hsync <= 1'b0;
			r_out <= 4'b0;
			g_out <= 4'b0;
			b_out <= 4'b0;
		end
		else begin
			if (row_cnt == `V_Back) begin
				vsync <= 1;
			end
			if (col_cnt == `H_Back) begin
				hsync <= 1;
			end

			if (row_cnt >= `V_VideoBegin && row_cnt < `V_VideoEnd - 1 && col_cnt >= `H_VideoBegin && col_cnt < `H_VideoEnd - 1) begin
				grid_y = (row_cnt - `V_VideoBegin) / `S_WIDTH;
				grid_x = (col_cnt - `H_VideoBegin) / `S_WIDTH;
				dx = (grid_x >= cursor_x) ? (grid_x - cursor_x) : (grid_x + `MAX_X - cursor_x);
				dy = (grid_y >= cursor_y) ? (grid_y - cursor_y) : (grid_y + `MAX_Y - cursor_y);
				if(row_cnt == `V_VideoBegin || row_cnt+1 == `V_VideoEnd-1 || col_cnt == `H_VideoBegin || col_cnt+1 == `H_VideoEnd-1)begin
					r_out <= 4'b1111;
					g_out <= 4'b1111;
					b_out <= 4'b1111;
				end
				else if (start_screen && black) begin
					r_out <= 4'b0;
					g_out <= 4'b0;
					b_out <= 4'b0;
				end
				else if (state[`idx(grid_y, grid_x)]) begin
					r_out <= 4'b1111;
					g_out <= 4'b1111;
					b_out <= 4'b1111;
				end 
				else if (preview && ~start_screen && (dx < 8) && (dy < 8) && (pattern_mat[(dy)*8 + (dx)] == 1)) begin
					r_out <= 4'b0100;
					g_out <= 4'b0100;
					b_out <= 4'b0100;
				end else begin
					r_out <= 4'b0;
					g_out <= 4'b0;
					b_out <= 4'b0;
				end
			end
			else begin
				r_out <= 4'b0;
				g_out <= 4'b0;
				b_out <= 4'b0;
			end

			if (col_cnt == (`TotalCol - 1)) begin
				if (row_cnt == (`TotalRow - 1)) begin
					vsync <= 0;
					row_cnt <= 0;
					if (start_screen) begin
						black <= black_clk;
					end
				end
				else row_cnt <= row_cnt + 1;
				hsync <= 0;
				col_cnt <= 0;
			end
			else col_cnt <= col_cnt + 1;
			
		end
	end
	
endmodule
