# Model tp100
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1;
let x_1 := 1;
var x_2;
let x_2 := 2;
var x_3;
let x_3 := 0;
var x_4;
let x_4 := 4;
var x_5;
let x_5 := 0;
var x_6;
let x_6 := 1;
var x_7;
let x_7 := 1;
var c_1 = 127 - 2*x_1^2 - 3*x_2^4 - x_3 - 4*x_4^2 - 5*x_5;
var c_2 = 282 - 7*x_1 - 3*x_2 - 10*x_3^2 - x_4 + x_5;
var c_3 = 196 - 23*x_1 - x_2^2 - 6*x_6^2 + 8*x_7;
var c_4 = (-4)*x_1^2 - x_2^2 + 3*x_1*x_2 - 2*x_3^2 - 5*x_6 +11*x_7;
var mf = (x_1 - 10)^2 + 5*(x_2 - 12)^2 + x_3^4 + 3*(x_4 - 11)^2 + 10*x_5^6 + 7*x_6^2 + x_7^4 - 4*x_6*x_7 -
10*x_6 - 8*x_7;
minimize obj: mf;
subject to ci_1: c_1 >= 0;
subject to ci_2: c_2 >= 0;
subject to ci_3: c_3 >= 0;
subject to ci_4: c_4 >= 0;
solve;
display obj;
# End Model
