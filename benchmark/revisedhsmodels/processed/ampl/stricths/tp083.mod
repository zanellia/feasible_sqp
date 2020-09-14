# Model tp083
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param a_1 := 85.334407;
param a_2 := 0.0056858;
param a_3 := 0.0006262;
param a_4 := 0.0022053;
param a_5 := 80.51249;
param a_6 := 0.0071317;
param a_7 := 0.0029955;
param a_8 := 0.0021813;
param a_9 := 9.300961;
param a_10 := 0.0047026;
param a_11 := 0.0012547;
param a_12 := 0.0019085;
var x_1 >= 78, <= 102;
let x_1 := 78;
var x_2 >= 33, <= 45;
let x_2 := 33;
var x_3 >= 27, <= 45;
let x_3 := 27;
var x_4 >= 27, <= 45;
let x_4 := 27;
var x_5 >= 27, <= 45;
let x_5 := 27;
var t_1 = a_1 + a_2*x_2*x_5 + a_3*x_1*x_4 - a_4*x_3*x_5;
var t_2 = a_5 + a_6*x_2*x_5 + a_7*x_1*x_2 + a_8*x_3^2 - 90;
var t_3 = a_9 + a_10*x_3*x_5 + a_11*x_1*x_3 + a_12*x_3*x_4 - 20;
minimize obj: 5.3578547*x_3^2 + 0.8356891*x_1*x_5 + 37.293239*x_1 - 40792.141;
subject to ci_1: t_1 >= 0;
subject to ci_2: 92 - t_1 >= 0;
subject to ci_3: t_2 >= 0;
subject to ci_4: 20 - t_2 >= 0;
subject to ci_5: t_3 >= 0;
subject to ci_6: 5 - t_3 >= 0;
solve;
display obj;
# End Model
