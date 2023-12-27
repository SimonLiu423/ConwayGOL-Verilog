# set clock 
set_location_assignment PIN_M9 -to clk;
# set reset
set_location_assignment PIN_P22 -to rst;

# set VGA
set_location_assignment PIN_A9 -to r_out[0];
set_location_assignment PIN_B10 -to r_out[1];
set_location_assignment PIN_C9 -to r_out[2];
set_location_assignment PIN_A5 -to r_out[3];
set_location_assignment PIN_L7 -to g_out[0];
set_location_assignment PIN_K7 -to g_out[1];
set_location_assignment PIN_J7 -to g_out[2];
set_location_assignment PIN_J8 -to g_out[3];
set_location_assignment PIN_B6 -to b_out[0];
set_location_assignment PIN_B7 -to b_out[1];
set_location_assignment PIN_A8 -to b_out[2];
set_location_assignment PIN_A7 -to b_out[3];
set_location_assignment PIN_H8 -to hsync;
set_location_assignment PIN_G8 -to vsync;

# set movement for cursor
set_location_assignment PIN_U7 -to move[0];
set_location_assignment PIN_W9 -to move[1];
set_location_assignment PIN_M7 -to move[2];
set_location_assignment PIN_M6 -to move[3];

# set freeze
set_location_assignment PIN_U13 -to freeze;

# set keypad row
set_location_assignment PIN_J17 -to keypadRow[0];
set_location_assignment PIN_G13 -to keypadRow[1];
set_location_assignment PIN_G16 -to keypadRow[2];
set_location_assignment PIN_F13 -to keypadRow[3];
# set keypad col
set_location_assignment PIN_F12 -to keypadCol[0];
set_location_assignment PIN_G15 -to keypadCol[1];
set_location_assignment PIN_G12 -to keypadCol[2];
set_location_assignment PIN_K16 -to keypadCol[3];


# set dot matrix
set_location_assignment PIN_E15 -to dot_row[0];
set_location_assignment PIN_B15 -to dot_row[1];
set_location_assignment PIN_A12 -to dot_row[2];
set_location_assignment PIN_E14 -to dot_row[3];
set_location_assignment PIN_C13 -to dot_row[4];
set_location_assignment PIN_B12 -to dot_row[5];
set_location_assignment PIN_A13 -to dot_row[6];
set_location_assignment PIN_D13 -to dot_row[7];

set_location_assignment PIN_J11 -to dot_col[0];
set_location_assignment PIN_J19 -to dot_col[1];
set_location_assignment PIN_H18 -to dot_col[2];
set_location_assignment PIN_A15 -to dot_col[3];
set_location_assignment PIN_G18 -to dot_col[4];
set_location_assignment PIN_H14 -to dot_col[5];
set_location_assignment PIN_H10 -to dot_col[6];
set_location_assignment PIN_G11 -to dot_col[7];
