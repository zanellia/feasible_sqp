# Model tp071
# Source version 2
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 1, <= 5;
let x_1 := 1;
var x_2 >= 1, <= 5;
let x_2 := 5;
var x_3 >= 1, <= 5;
let x_3 := 5;
var x_4 >= 1, <= 5;
let x_4 := 1;
minimize obj: x_1*x_4*(x_1 + x_2 + x_3) + x_3;
subject to ce_1: x_1^2 + x_2^2 + x_3^2 + x_4^2 - 40 = 0;
subject to ci_1: x_1*x_2*x_3*x_4 - 25 >= 0;
solve;
display obj;
# End Model
