# Model tp075
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param a := 0.48;
param c3 := 3;
param l_1 := 0;
param l_2 := 0;
param l_3 := -a;
param l_4 := -a;
param u_1 := 1200;
param u_2 := 1200;
param u_3 := a;
param u_4 := a;
var x_1 >= l_1, <= u_1;
let x_1 := 0;
var x_2 >= l_2, <= u_2;
let x_2 := 0;
var x_3 >= l_3, <= u_3;
let x_3 := 0;
var x_4 >= l_4, <= u_4;
let x_4 := 0;
minimize obj: 3*x_1 + 1.0e-6*x_1^3 + 2*x_2 + 2.0e-6*x_2^3/c3;
subject to ce_1: 1000*sin((-1)*x_3 - 0.25) + 1000*sin((-1)*x_4 - 0.25) + 894.8 - x_1 = 0;
subject to ce_2: 1000*sin(x_3 - 0.25) + 1000*sin(x_3 - x_4 - 0.25) + 894.8 - x_2 = 0;
subject to ce_3: 1000*sin(x_4 - 0.25) + 1000*sin(x_4 - x_3 - 0.25) + 1294.8 = 0;
subject to ci_1: x_4 - x_3 + a >= 0;
subject to ci_2: x_3 - x_4 + a >= 0;
solve;
display obj;
# End Model
