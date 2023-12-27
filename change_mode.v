module change_mode(rst, freeze_button, freeze);
	input		rst;
	input		freeze_button;
	output reg	freeze;

	always @(negedge rst or negedge freeze_button) begin
		if (!rst) freeze <= 0;
		else freeze <= ~freeze;
	end

endmodule;
