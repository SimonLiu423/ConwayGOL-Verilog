module choose_pattern(clk, rst, keypadRow, keypadCol, pattern, draw);
	input				clk, rst;
	input		[3:0]	keypadCol;

	output reg			draw;
	output reg	[3:0]	keypadRow, pattern;

	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			keypadRow <= 4'b1110;
			pattern <= 4'h0;
			draw <= 0;
		end
		else begin
			case ({keypadRow, keypadCol})
				8'b0111_0111: pattern <= 4'hf;
				8'b0111_1011: pattern <= 4'he;
				8'b0111_1101: pattern <= 4'hd;
				8'b0111_1110: pattern <= 4'hc;
				8'b1011_0111: pattern <= 4'hb;
				8'b1011_1011: pattern <= 4'h3;
				8'b1011_1101: pattern <= 4'h6;
				8'b1011_1110: pattern <= 4'h9;
				8'b1101_0111: pattern <= 4'ha;
				8'b1101_1011: pattern <= 4'h2;
				8'b1101_1101: pattern <= 4'h5;
				8'b1101_1110: pattern <= 4'h8;
				8'b1110_0111: pattern <= 4'h0;
				8'b1110_1011: pattern <= 4'h1;
				8'b1110_1101: pattern <= 4'h4;
				8'b1110_1110: pattern <= 4'h7;
				default: pattern <= pattern;
			endcase

			case ({keypadRow, keypadCol})
				8'b1110_0111: draw <= 1;
				default: draw <= 0;
			endcase

			case (keypadRow)
				4'b0111: keypadRow <= 4'b1011;
				4'b1011: keypadRow <= 4'b1101;
				4'b1101: keypadRow <= 4'b1110;
				4'b1110: keypadRow <= 4'b0111;
				default: keypadRow <= 4'b1110;
			endcase
		end
	end
endmodule
