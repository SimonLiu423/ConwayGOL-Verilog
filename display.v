`define DisplayWidth		10'd640
`define DisplayHeight		10'd480
`define TotalRow			(`DisplayHeight + 45)
`define TotalCol			(`DisplayWidth + 160)
`define H_Back	10'd96
`define H_VideoBegin		(`H_Back + 48)
`define H_VideoEnd			(`H_VideoBegin + `DisplayWidth)
`define V_Back	10'd2
`define V_VideoBegin		(`V_Back + 33)
`define V_VideoEnd			(`V_VideoBegin + `DisplayHeight)

module display(clk, rst, state, r_out, g_out, b_out, hsync, vsync);
	input					clk, rst;
	input		[3071:0]	state;
	output reg				hsync, vsync;
	output reg	[3:0]		r_out, g_out, b_out;

	reg			[9:0]		row_cnt, col_cnt;

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

			if (row_cnt >= `V_VideoBegin && row_cnt < `V_VideoEnd && col_cnt >= `H_VideoBegin && col_cnt < `H_VideoEnd) begin
				if ( state[(row_cnt / 10) * 48 + (col_cnt / 10)] == 1 ) begin
					r_out <= 4'b1111;
					g_out <= 4'b1111;
					b_out <= 4'b1111;
				end
				else begin
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
				end
				else row_cnt <= row_cnt + 1;
				hsync <= 0;
				col_cnt <= 0;
			end
			else col_cnt <= col_cnt + 1;
			
		end
	end
	
endmodule
