# Model tp109
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param c22938a := -22.938;
param c22938b := 22.938;
param c22938 := c22938a;
param a := 50.176;
param arg := 0.25;
param b := sin(arg);
param c := cos(arg);
var x_1 >= 0;
let x_1 := 0;
var x_2 >= 0;
let x_2 := 0;
var x_3 >= -0.55, <= 0.55;
let x_3 := 0;
var x_4 >= -0.55, <= 0.55;
let x_4 := 0;
var x_5 >= 196, <= 252;
let x_5 := 0;
var x_6 >= 196, <= 252;
let x_6 := 0;
var x_7 >= 196, <= 252;
let x_7 := 0;
var x_8 >= -400, <= 800;
let x_8 := 0;
var x_9 >= -400, <= 800;
let x_9 := 0;
var cf_1 = x_4 - x_3 + .55;
var cf_2 = x_3 - x_4 + .55;
var cf_3 = 2250000 - x_1^2 - x_8^2;
var cf_4 = 2250000 - x_2^2 - x_9^2;
var cf_5 = x_5*x_6*sin((-1)*x_3 - 1/4) + x_5*x_7*sin((-1)*x_4 - 1/4) + 2*b*x_5^2 - a*x_1 + 400*a;
var cf_6 = x_5*x_6*sin(x_3 - 1/4) + x_6*x_7*sin(x_3 - x_4 - 1/4) + 2*b*x_6^2 - a*x_2 + 400*a;
var cf_7 = x_5*x_7*sin(x_4 - 1/4) + x_6*x_7*sin(x_4 - x_3 - 1/4) + 2*b*x_7^2 + 881.779*a;
var cf_8 = a*x_8 + x_5*x_6*cos((-1)*x_3 - 1/4) + x_5*x_7*cos((-1)*x_4 - 1/4) - 200*a - 2*c*x_5^2 +
0.7533e-3*a*x_5^2;
var cf_9 = a*x_9 + x_5*x_6*cos(x_3 - 1/4) + x_6*x_7*cos(x_3 - x_4 - 1/4) - 2*c*x_6^2 + 0.7533e-3*a*x_6^2 -
200*a;
var cf_10 = x_5*x_7*cos(x_4 - 1/4) + x_6*x_7*cos(x_4 - x_3 - 1/4) - 2*c*x_7^2 + c22938*a + 0.7533e-3*a*x_7^2;
var mf = 3*x_1 + 1.0e-6*x_1^3 + 2*x_2 + 0.522074e-6*x_2^3;
minimize obj: mf;
subject to ce_1: cf_5 = 0;
subject to ce_2: cf_6 = 0;
subject to ce_3: cf_7 = 0;
subject to ce_4: cf_8 = 0;
subject to ce_5: cf_9 = 0;
subject to ce_6: cf_10 = 0;
subject to ci_1: cf_1 >= 0;
subject to ci_2: cf_2 >= 0;
subject to ci_3: cf_3 >= 0;
subject to ci_4: cf_4 >= 0;
solve;
display obj;
# End Model
