module load_pattern(clk, rst, pattern_id, pattern_mat);
	input				clk, rst;
	input		[3:0]	pattern_id;
	output reg	[0:63]	pattern_mat;

	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			pattern_mat <= 0;
		end
		else begin
			case (pattern_id)
				4'h1: pattern_mat <= {
						8'b10000000,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000
					};
				4'h2: pattern_mat <= {
						8'b11000000,
						8'b11000000,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000
					};
				4'h3: pattern_mat <= {
						8'b11000000,
						8'b10100000,
						8'b01000000,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000
					};
				4'h4: pattern_mat <= {
						8'b01000000,
						8'b10100000,
						8'b01000000,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000
					};
				4'h5: pattern_mat <= {
						8'b01100000,
						8'b10010000,
						8'b01100000,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000
					};
				4'h6: pattern_mat <= {
						8'b01100000,
						8'b10010000,
						8'b01010000,
						8'b00100000,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000
					};
				4'h7: pattern_mat <= {
						8'b11100000,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000
					};
				4'h8: pattern_mat <= {
						8'b11000000,
						8'b11000000,
						8'b00110000,
						8'b00110000,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000
					};
				4'h9: pattern_mat <= {
						8'b01000000,
						8'b00100000,
						8'b11100000,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000
					};
				4'ha: pattern_mat <= {
						8'b10010000,
						8'b00001000,
						8'b10001000,
						8'b01111000,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000
					};
				4'hb: pattern_mat <= {
						8'b00100000,
						8'b10001000,
						8'b00000100,
						8'b10000100,
						8'b01111100,
						8'b00000000,
						8'b00000000,
						8'b00000000
					};
				4'hf: pattern_mat <= {
						8'b01000000,
						8'b00010000,
						8'b11001110,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000
					};
				4'he: pattern_mat <= {
						8'b11001000,
						8'b10001000,
						8'b10011000,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000
					};
				4'hd: pattern_mat <= {
						8'b11100000,
						8'b00000000,
						8'b01000000,
						8'b01000000,
						8'b01000000,
						8'b00000000,
						8'b00000000,
						8'b00000000
					};
				4'hc: pattern_mat <= {
						8'b01010000,
						8'b10000000,
						8'b01001000,
						8'b00011100,
						8'b00000000,
						8'b00000000,
						8'b00000000,
						8'b00000000
					};
				default: pattern_mat <= 0;
			endcase
		end
	end
endmodule
