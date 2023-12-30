module count_alive(
    input                           clk,
    input                           rst,
    input       [`S_SIZE-1:0]	state,
    output reg  [11:0]				alives
);
    integer i;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            alives = 0;
        end
        else begin
            alives = 0;
            for (i = 0; i < `S_SIZE; i = i + 1) begin
                alives = alives + state[i];
            end
        end
    end

endmodule 