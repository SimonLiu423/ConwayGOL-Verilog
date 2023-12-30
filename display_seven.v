module display_seven(
	input				clk,
	input				rst,
    input		[11:0]	number,
    output reg	[6:0]	seg1, // Units
    output reg	[6:0] 	seg2, // Tens
    output reg	[6:0] 	seg3, // Hundreds
    output reg	[6:0] 	seg4  // Thousands
);

	reg 		[3:0] 	digit[0:3];
	reg 		[6:0] 	segment_patterns [0:9];

	initial begin
		segment_patterns[0] = 7'b1000000; // 0
		segment_patterns[1] = 7'b1111001; // 1
		segment_patterns[2] = 7'b0100100; // 2
		segment_patterns[3] = 7'b0110000; // 3
		segment_patterns[4] = 7'b0011001; // 4
		segment_patterns[5] = 7'b0010010; // 5
		segment_patterns[6] = 7'b0000010; // 6
		segment_patterns[7] = 7'b1111000; // 7
		segment_patterns[8] = 7'b0000000; // 8
		segment_patterns[9] = 7'b0011000; // 9
	end

	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			seg1 <= 0;
			seg2 <= 0;
			seg3 <= 0;
			seg4 <= 0;
		end
		else begin
			seg1 <= segment_patterns[number % 10];
			seg2 <= segment_patterns[number / 10 % 10];
			seg3 <= segment_patterns[number / 100 % 10];
			seg4 <= segment_patterns[number / 1000 % 10];
		end
	end
	
endmodule

