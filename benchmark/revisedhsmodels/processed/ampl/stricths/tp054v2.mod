# Model tp054v2
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= -5/4, <= 5/4;
let x_1 := -1/2;
var x_2 >= -11, <= 9;
let x_2 := 1/2;
var x_3 >= -2/7, <= 8/7;
let x_3 := 2/7;
var x_4 >= -1/5, <= 1/5;
let x_4 := -4/25;
var x_5 >= -1001/50, <= 999/50;
let x_5 := 1/25;
var x_6 >= -1/5, <= 1/5;
let x_6 := -1/10;
var h1 = (x_1^2 + x_1*x_2*2/5 + x_2^2)*25/24;
var h2 = x_3^2 + x_4^2 + x_5^2 + x_6^2;
var mf = h1 + h2;
minimize obj: mf;
subject to ce_1: 8*x_1 + 4*x_2 - 18/5 = 0;
solve;
display obj;
# End Model
