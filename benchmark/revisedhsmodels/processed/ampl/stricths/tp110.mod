# Model tp110
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param s_0 := 0;
param p_0 := 1;
var x_1 >= 2.001, <= 9.999;
let x_1 := 9;
var x_2 >= 2.001, <= 9.999;
let x_2 := 9;
var x_3 >= 2.001, <= 9.999;
let x_3 := 9;
var x_4 >= 2.001, <= 9.999;
let x_4 := 9;
var x_5 >= 2.001, <= 9.999;
let x_5 := 9;
var x_6 >= 2.001, <= 9.999;
let x_6 := 9;
var x_7 >= 2.001, <= 9.999;
let x_7 := 9;
var x_8 >= 2.001, <= 9.999;
let x_8 := 9;
var x_9 >= 2.001, <= 9.999;
let x_9 := 9;
var x_10 >= 2.001, <= 9.999;
let x_10 := 9;
var s_1 = s_0 + log(x_1 - 2)^2 + log(10 - x_1)^2;
var s_2 = s_1 + log(x_2 - 2)^2 + log(10 - x_2)^2;
var s_3 = s_2 + log(x_3 - 2)^2 + log(10 - x_3)^2;
var s_4 = s_3 + log(x_4 - 2)^2 + log(10 - x_4)^2;
var s_5 = s_4 + log(x_5 - 2)^2 + log(10 - x_5)^2;
var s_6 = s_5 + log(x_6 - 2)^2 + log(10 - x_6)^2;
var s_7 = s_6 + log(x_7 - 2)^2 + log(10 - x_7)^2;
var s_8 = s_7 + log(x_8 - 2)^2 + log(10 - x_8)^2;
var s_9 = s_8 + log(x_9 - 2)^2 + log(10 - x_9)^2;
var s_10 = s_9 + log(x_10 - 2)^2 + log(10 - x_10)^2;
var p_1 = p_0*x_1;
var p_2 = p_1*x_2;
var p_3 = p_2*x_3;
var p_4 = p_3*x_4;
var p_5 = p_4*x_5;
var p_6 = p_5*x_6;
var p_7 = p_6*x_7;
var p_8 = p_7*x_8;
var p_9 = p_8*x_9;
var p_10 = p_9*x_10;
var mf = s_10 - p_10^(1/5);
minimize obj: mf;
solve;
display obj;
# End Model
