# Model tp117r2
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param a24a := 4/10;
param a24b := 4;
param a24 := a24a;
param ivxhs_1 := 0.001;
param ivxhs_2 := 0.001;
param ivxhs_3 := 0.001;
param ivxhs_4 := 0.001;
param ivxhs_5 := 0.001;
param ivxhs_6 := 0.001;
param ivxhs_7 := 60;
param ivxhs_8 := 0.001;
param ivxhs_9 := 0.001;
param ivxhs_10 := 0.001;
param ivxhs_11 := 0.001;
param ivxhs_12 := 0.001;
param ivxhs_13 := 0.001;
param ivxhs_14 := 0.001;
param ivxhs_15 := 0.001;
param lbx_1 := 0;
param lbx_2 := 0;
param lbx_3 := 0;
param lbx_4 := 0;
param lbx_5 := 0;
param lbx_6 := 0;
param lbx_7 := 0;
param lbx_8 := 0;
param lbx_9 := 0;
param lbx_10 := 0;
param lbx_11 := 0;
param lbx_12 := 0;
param lbx_13 := 0;
param lbx_14 := 0;
param lbx_15 := 0;
param ivx_1 := (1/2)*(abs(ivxhs_1 - lbx_1) + (ivxhs_1 + lbx_1));
param ivx_2 := (1/2)*(abs(ivxhs_2 - lbx_2) + (ivxhs_2 + lbx_2));
param ivx_3 := (1/2)*(abs(ivxhs_3 - lbx_3) + (ivxhs_3 + lbx_3));
param ivx_4 := (1/2)*(abs(ivxhs_4 - lbx_4) + (ivxhs_4 + lbx_4));
param ivx_5 := (1/2)*(abs(ivxhs_5 - lbx_5) + (ivxhs_5 + lbx_5));
param ivx_6 := (1/2)*(abs(ivxhs_6 - lbx_6) + (ivxhs_6 + lbx_6));
param ivx_7 := (1/2)*(abs(ivxhs_7 - lbx_7) + (ivxhs_7 + lbx_7));
param ivx_8 := (1/2)*(abs(ivxhs_8 - lbx_8) + (ivxhs_8 + lbx_8));
param ivx_9 := (1/2)*(abs(ivxhs_9 - lbx_9) + (ivxhs_9 + lbx_9));
param ivx_10 := (1/2)*(abs(ivxhs_10 - lbx_10) + (ivxhs_10 + lbx_10));
param ivx_11 := (1/2)*(abs(ivxhs_11 - lbx_11) + (ivxhs_11 + lbx_11));
param ivx_12 := (1/2)*(abs(ivxhs_12 - lbx_12) + (ivxhs_12 + lbx_12));
param ivx_13 := (1/2)*(abs(ivxhs_13 - lbx_13) + (ivxhs_13 + lbx_13));
param ivx_14 := (1/2)*(abs(ivxhs_14 - lbx_14) + (ivxhs_14 + lbx_14));
param ivx_15 := (1/2)*(abs(ivxhs_15 - lbx_15) + (ivxhs_15 + lbx_15));
var x_1 >= lbx_1;
let x_1 := ivx_1;
var x_2 >= lbx_2;
let x_2 := ivx_2;
var x_3 >= lbx_3;
let x_3 := ivx_3;
var x_4 >= lbx_4;
let x_4 := ivx_4;
var x_5 >= lbx_5;
let x_5 := ivx_5;
var x_6 >= lbx_6;
let x_6 := ivx_6;
var x_7 >= lbx_7;
let x_7 := ivx_7;
var x_8 >= lbx_8;
let x_8 := ivx_8;
var x_9 >= lbx_9;
let x_9 := ivx_9;
var x_10 >= lbx_10;
let x_10 := ivx_10;
var x_11 >= lbx_11;
let x_11 := ivx_11;
var x_12 >= lbx_12;
let x_12 := ivx_12;
var x_13 >= lbx_13;
let x_13 := ivx_13;
var x_14 >= lbx_14;
let x_14 := ivx_14;
var x_15 >= lbx_15;
let x_15 := ivx_15;
var c_1 = (-15) + 16*x_1 + (7/2)*x_3 - 2*x_6 + x_7 + x_8 - x_9 - x_10 + 60*x_11 - 40*x_12 - 20*x_13 +
64*x_14 - 20*x_15 + 12*x_11^2;
var c_2 = (-27) - 2*x_1 + 2*x_2 + 2*x_4 + 9*x_5 + x_7 + 2*x_8 - 2*x_9 - x_10 - 40*x_11 + 78*x_12 - 12*x_13 -
62*x_14 + 64*x_15 + 24*x_12^2;
var c_3 = (-36) - 2*x_3 + 2*x_5 + 4*x_6 + x_7 + 3*x_8 - 3*x_9 - x_10 - 20*x_11 - 12*x_12 + 20*x_13 - 12*x_14
- 20*x_15 + 30*x_13^2;
var c_4 = (-18) - x_1 - a24*x_2 + 4*x_4 - x_5 + x_7 + 2*x_8 - 4*x_9 - x_10 + 64*x_11 - 62*x_12 - 12*x_13 +
78*x_14 - 40*x_15 + 18*x_14^2;
var c_5 = (-12) - 2*x_2 + x_4 + (14/5)*x_5 + x_7 + x_8 - 5*x_9 - x_10 - 20*x_11 + 64*x_12 - 20*x_13 -
40*x_14 + 60*x_15 + 6*x_15^2;
var mf = 40*x_1 + 2*x_2 + (1/4)*x_3 + 4*x_4 + 4*x_5 + x_6 + 40*x_7 + 60*x_8 - 5*x_9 - x_10 + 30*x_11^2 -
40*x_11*x_12 - 20*x_11*x_13 + 64*x_11*x_14 - 20*x_11*x_15 + 39*x_12^2 - 12*x_12*x_13 - 62*x_12*x_14 +
64*x_12*x_15 + 10*x_13^2 - 12*x_13*x_14 - 20*x_13*x_15 + 39*x_14^2 - 40*x_14*x_15 + 30*x_15^2 + 8*x_11^3 +
16*x_12^3 + 20*x_13^3 + 12*x_14^3 + 4*x_15^3;
minimize obj: mf;
subject to ci_1: c_1 >= 0;
subject to ci_2: c_2 >= 0;
subject to ci_3: c_3 >= 0;
subject to ci_4: c_4 >= 0;
subject to ci_5: c_5 >= 0;
solve;
display obj;
# End Model
