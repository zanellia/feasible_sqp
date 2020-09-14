# Model tp108r
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param mfcorrhs := 0;
var x_1;
let x_1 := 1;
var x_2;
let x_2 := 1;
var x_3;
let x_3 := 1;
var x_4;
let x_4 := 1;
var x_5;
let x_5 := 1;
var x_6;
let x_6 := 1;
var x_7;
let x_7 := 1;
var x_8;
let x_8 := 1;
var x_9 >= 0;
let x_9 := 1;
var c_1 = 1 - x_3^2 - x_4^2;
var c_2 = 1 - x_9^2;
var c_3 = 1 - x_5^2 - x_6^2;
var c_4 = 1 - x_1^2 - (x_2 - x_9)^2;
var c_5 = 1 - (x_1 - x_5)^2 - (x_2 - x_6)^2;
var c_6 = 1 - (x_1 - x_7)^2 - (x_2 - x_8)^2;
var c_7 = 1 - (x_3 - x_5)^2 - (x_4 - x_6)^2;
var c_8 = 1 - (x_3 - x_7)^2 - (x_4 - x_8)^2;
var c_9 = 1 - x_7^2 - (x_8 - x_9)^2;
var c_10 = x_1*x_4 - x_2*x_3;
var c_11 = x_3*x_9;
var c_12 = (-1)*x_5*x_9;
var c_13 = x_5*x_8 - x_6*x_7;
var mf = (-1/2)*(x_1*x_4 - x_2*x_3 + x_3*x_9 - x_5*x_9 + x_5*x_8 - x_6*x_7);
var mfcorrr = (3*x_1 - 2*x_2)^2 + (3*x_5 - 2*x_6)^2;
minimize obj: mf + mfcorrhs;
subject to ci_1: c_1 >= 0;
subject to ci_2: c_2 >= 0;
subject to ci_3: c_3 >= 0;
subject to ci_4: c_4 >= 0;
subject to ci_5: c_5 >= 0;
subject to ci_6: c_6 >= 0;
subject to ci_7: c_7 >= 0;
subject to ci_8: c_8 >= 0;
subject to ci_9: c_9 >= 0;
subject to ci_10: c_10 >= 0;
subject to ci_11: c_11 >= 0;
subject to ci_12: c_12 >= 0;
subject to ci_13: c_13 >= 0;
solve;
display obj;
# End Model
