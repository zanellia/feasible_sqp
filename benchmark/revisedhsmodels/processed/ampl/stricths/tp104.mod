# Model tp104
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= .1, <= 10;
let x_1 := 6;
var x_2 >= .1, <= 10;
let x_2 := 3;
var x_3 >= .1, <= 10;
let x_3 := .4;
var x_4 >= .1, <= 10;
let x_4 := .2;
var x_5 >= .1, <= 10;
let x_5 := 6;
var x_6 >= .1, <= 10;
let x_6 := 6;
var x_7 >= .1, <= 10;
let x_7 := 1;
var x_8 >= .1, <= 10;
let x_8 := .5;
var c_1 = 1 - .0588*x_5*x_7 - .1*x_1;
var c_2 = 1 - .0588*x_6*x_8 - .1*x_1 - .1*x_2;
var c_3 = 1 - 4*x_3/x_5 - 2/(x_3^.71*x_5) - .0588*x_7/x_3^1.3;
var c_4 = 1 - 4*x_4/x_6 - 2/(x_4^.71*x_6) - .0588*x_8/x_4^1.3;
var mf = .4*(x_1/x_7)^.67 + .4*(x_2/x_8)^.67 + 10 - x_1 - x_2;
var c_5 = mf - 1;
var c_6 = 4.2 - mf;
minimize obj: mf;
subject to ci_1: c_1 >= 0;
subject to ci_2: c_2 >= 0;
subject to ci_3: c_3 >= 0;
subject to ci_4: c_4 >= 0;
subject to ci_5: c_5 >= 0;
subject to ci_6: c_6 >= 0;
solve;
display obj;
# End Model
