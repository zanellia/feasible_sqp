# Model tp106
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 100, <= 10000;
let x_1 := 5000;
var x_2 >= 1000, <= 10000;
let x_2 := 5000;
var x_3 >= 1000, <= 10000;
let x_3 := 5000;
var x_4 >= 10, <= 1000;
let x_4 := 200;
var x_5 >= 10, <= 1000;
let x_5 := 350;
var x_6 >= 10, <= 1000;
let x_6 := 150;
var x_7 >= 10, <= 1000;
let x_7 := 225;
var x_8 >= 10, <= 1000;
let x_8 := 425;
var c_1 = 1 - .0025*(x_4 + x_6);
var c_2 = 1 - .0025*(x_5 + x_7 - x_4);
var c_3 = 1 - .01*(x_8 - x_5);
var c_4 = x_1*x_6 - 833.33252*x_4 - 100*x_1 + 83333.333;
var c_5 = x_2*x_7 - 1250*x_5 - x_2*x_4 + 1250*x_4;
var c_6 = x_3*x_8 - 1250000 - x_3*x_5 + 2500*x_5;
var mf = x_1 + x_2 + x_3;
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
