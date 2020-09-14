# Model tp107
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param c := (48.4/50.176)*sin(.25);
param d := (48.4/50.176)*cos(.25);
var x_1 >= 0;
let x_1 := .8;
var x_2 >= 0;
let x_2 := .8;
var x_3;
let x_3 := .2;
var x_4;
let x_4 := .2;
var x_5 >= .90909, <= 1.0909;
let x_5 := 1.0454;
var x_6 >= .90909, <= 1.0909;
let x_6 := 1.0454;
var x_7 >= .90909, <= 1.0909;
let x_7 := 1.0454;
var x_8;
let x_8 := 0;
var x_9;
let x_9 := 0;
var y1 = sin(x_8);
var y2 = cos(x_8);
var y3 = sin(x_9);
var y4 = cos(x_9);
var y5 = sin(x_8 - x_9);
var y6 = cos(x_8 - x_9);
var ec_1 = .4 - x_1 + 2*c*x_5^2 - x_5*x_6*(d*y1 + c*y2) - x_5*x_7*(d*y3 + c*y4);
var ec_2 = .4 - x_2 + 2*c*x_6^2 + x_5*x_6*(d*y1 - c*y2) + x_6*x_7*(d*y5 - c*y6);
var ec_3 = .8 + 2*c*x_7^2 + x_5*x_7*(d*y3 - c*y4) - x_6*x_7*(d*y5 + c*y6);
var ec_4 = .2 - x_3 + 2*d*x_5^2 + x_5*x_6*(c*y1 - d*y2) + x_5*x_7*(c*y3 - d*y4);
var ec_5 = .2 - x_4 + 2*d*x_6^2 - x_5*x_6*(c*y1 + d*y2) - x_6*x_7*(c*y5 + d*y6);
var ec_6 = (-.337) + 2*d*x_7^2 - x_5*x_7*(c*y3 + d*y4) + x_6*x_7*(c*y5 - d*y6);
var mf = 3000*x_1 + 1000*x_1^3 + 2000*x_2 + 666.667*x_2^3;
minimize obj: mf;
subject to ce_1: ec_1 = 0;
subject to ce_2: ec_2 = 0;
subject to ce_3: ec_3 = 0;
subject to ce_4: ec_4 = 0;
subject to ce_5: ec_5 = 0;
subject to ce_6: ec_6 = 0;
solve;
display obj;
# End Model
