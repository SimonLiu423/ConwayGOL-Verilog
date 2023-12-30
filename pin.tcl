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
set_location_assignment PIN_U7 -to move[3];
set_location_assignment PIN_W9 -to move[2];
set_location_assignment PIN_M7 -to move[1];
set_location_assignment PIN_M6 -to move[0];

# set show cursor
set_location_assignment PIN_AB13 -to preview;

# set freeze
set_location_assignment PIN_AB12 -to freeze;

# set speed
set_location_assignment PIN_U13 -to speed[0];
set_location_assignment PIN_V13 -to speed[1];
set_location_assignment PIN_T13 -to speed[2];
set_location_assignment PIN_T12 -to speed[3];


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

# set seven display
set_location_assignment PIN_U21 -to seg1[0];
set_location_assignment PIN_V21 -to seg1[1];
set_location_assignment PIN_W22 -to seg1[2];
set_location_assignment PIN_W21 -to seg1[3];
set_location_assignment PIN_Y22 -to seg1[4];
set_location_assignment PIN_Y21 -to seg1[5];
set_location_assignment PIN_AA22 -to seg1[6];

set_location_assignment PIN_AA20 -to seg2[0];
set_location_assignment PIN_AB20 -to seg2[1];
set_location_assignment PIN_AA19 -to seg2[2];
set_location_assignment PIN_AA18 -to seg2[3];
set_location_assignment PIN_AB18 -to seg2[4];
set_location_assignment PIN_AA17 -to seg2[5];
set_location_assignment PIN_U22 -to seg2[6];

set_location_assignment PIN_Y19 -to seg3[0];
set_location_assignment PIN_AB17 -to seg3[1];
set_location_assignment PIN_AA10 -to seg3[2];
set_location_assignment PIN_Y14 -to seg3[3];
set_location_assignment PIN_V14 -to seg3[4];
set_location_assignment PIN_AB22 -to seg3[5];
set_location_assignment PIN_AB21 -to seg3[6];

set_location_assignment PIN_Y16 -to seg4[0];
set_location_assignment PIN_W16 -to seg4[1];
set_location_assignment PIN_Y17 -to seg4[2];
set_location_assignment PIN_V16 -to seg4[3];
set_location_assignment PIN_U17 -to seg4[4];
set_location_assignment PIN_V18 -to seg4[5];
set_location_assignment PIN_V19 -to seg4[6];

