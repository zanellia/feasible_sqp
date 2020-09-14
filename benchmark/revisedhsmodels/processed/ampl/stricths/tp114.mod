# Model tp114
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param a := .99;
param b := .9;
var x_1 >= .00001, <= 2000;
let x_1 := 1745;
var x_2 >= .00001, <= 16000;
let x_2 := 12000;
var x_3 >= .00001, <= 120;
let x_3 := 110;
var x_4 >= .00001, <= 5000;
let x_4 := 3048;
var x_5 >= .00001, <= 2000;
let x_5 := 1974;
var x_6 >= 85, <= 93;
let x_6 := 89.2;
var x_7 >= 90, <= 95;
let x_7 := 92.8;
var x_8 >= 3, <= 12;
let x_8 := 8;
var x_9 >= 1.2, <= 4;
let x_9 := 3.6;
var x_10 >= 145, <= 162;
let x_10 := 145;
var g_1 = 35.82 - .222*x_10 - b*x_9;
var g_2 = (-133) + 3*x_7 - a*x_10;
var g_3 = (-1)*g_1 + x_9*(1/b - b);
var g_4 = (-1)*g_2 + (1/a - a)*x_10;
var g_5 = 1.12*x_1 + .13167*x_1*x_8 - .00667*x_1*x_8^2 - a*x_4;
var g_6 = 57.425 + 1.098*x_8 - .038*x_8^2 + .325*x_6 - a*x_7;
var g_7 = (-1)*g_5 + (1/a - a)*x_4;
var g_8 = (-1)*g_6 + (1/a - a)*x_7;
var g_9 = 1.22*x_4 - x_1 - x_5;
var g_10 = 98000*x_3/(x_4*x_9 + 1000*x_3) - x_6;
var g_11 = (x_2 + x_5)/x_1 - x_8;
var mf = 5.04*x_1 + .035*x_2 + 10*x_3 + 3.36*x_5 - .063*x_4*x_7;
minimize obj: mf;
subject to ce_1: g_9 = 0;
subject to ce_2: g_10 = 0;
subject to ce_3: g_11 = 0;
subject to ci_1: g_1 >= 0;
subject to ci_2: g_2 >= 0;
subject to ci_3: g_3 >= 0;
subject to ci_4: g_4 >= 0;
subject to ci_5: g_5 >= 0;
subject to ci_6: g_6 >= 0;
subject to ci_7: g_7 >= 0;
subject to ci_8: g_8 >= 0;
solve;
display obj;
# End Model
