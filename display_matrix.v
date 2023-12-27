module display_matrix(clk, rst, pattern_mat, dot_row, dot_col);
	input				clk, rst;
	input		[63:0]	pattern_mat;
	output reg	[7:0]	dot_row, dot_col;
	reg			[2:0]	row_cnt;

	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			dot_row <= 0;
			dot_col <= 0;
			row_cnt <= 0;
		end
		else begin
			case (row_cnt)
				3'd0: dot_col <= pattern_mat[63:56];
				3'd1: dot_col <= pattern_mat[55:48];
				3'd2: dot_col <= pattern_mat[47:40];
				3'd3: dot_col <= pattern_mat[39:32];
				3'd4: dot_col <= pattern_mat[31:24];
				3'd5: dot_col <= pattern_mat[23:16];
				3'd6: dot_col <= pattern_mat[15:8];
				3'd7: dot_col <= pattern_mat[7:0];
			endcase
			case (row_cnt)
				3'd0: dot_row <= 8'b01111111;	
				3'd1: dot_row <= 8'b10111111;	
				3'd2: dot_row <= 8'b11011111;	
				3'd3: dot_row <= 8'b11101111;	
				3'd4: dot_row <= 8'b11110111;	
				3'd5: dot_row <= 8'b11111011;	
				3'd6: dot_row <= 8'b11111101;	
				3'd7: dot_row <= 8'b11111110;	
			endcase
			row_cnt <= row_cnt + 1;
		end
	end
endmodule
