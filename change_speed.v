module change_speed(
    input       [3:0]       speed,
    output reg  [24:0]      new_time
);
    initial begin
        new_time = `TimeExpire_Game;
    end
    always @(speed) begin
        if (speed == 0) new_time = `TimeExpire_Game;
        new_time = `TimeExpire_Game / speed;
    end

endmodule