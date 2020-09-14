# Model tp093
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 0;
let x_1 := 5.54;
var x_2 >= 0;
let x_2 := 4.4;
var x_3 >= 0;
let x_3 := 12.02;
var x_4 >= 0;
let x_4 := 11.82;
var x_5 >= 0;
let x_5 := 0.702;
var x_6 >= 0;
let x_6 := 0.852;
var c_1 = (1/1000)*x_1*x_2*x_3*x_4*x_5*x_6 - 207/100;
var c_2 = 1 - (62/100000)*x_1*x_4*x_5^2*(x_1 + x_2 + x_3) - (58/100000)*x_2*x_3*x_6^2*(x_1 + x_2*157/100 +
x_4);
var mf = (204/10000)*x_1*x_4*(x_1 + x_2 + x_3) + (187/10000)*x_2*x_3*(x_1 + (157/100)*x_2 + x_4) +
(607/10000)*x_1*x_4*x_5^2*(x_1 + x_2 + x_3) + (437/10000)*x_2*x_3*x_6^2*(x_1 + (157/100)*x_2 + x_4);
minimize obj: mf;
subject to ci_1: c_1 >= 0;
subject to ci_2: c_2 >= 0;
solve;
display obj;
# End Model
