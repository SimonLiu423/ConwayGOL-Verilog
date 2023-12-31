module clk_div(clk, rst, time_expire, div_clk);
	input				clk, rst;
	input		[24:0]	time_expire;
	output reg			div_clk;

	reg			[24:0]	count;
	
	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			count <= 25'd0;
			div_clk <= 1'b0;
		end
		else begin
			if (count >= time_expire) begin
				count <= 25'd0;
				div_clk <= ~div_clk;
			end
			else begin
				count <= count + 25'd1;
			end
		end
	end
endmodule
