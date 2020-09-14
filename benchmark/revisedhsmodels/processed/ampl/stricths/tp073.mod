# Model tp073
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 0;
let x_1 := 1;
var x_2 >= 0;
let x_2 := 1;
var x_3 >= 0;
let x_3 := 1;
var x_4 >= 0;
let x_4 := 1;
minimize obj: 24.55*x_1 + 26.75*x_2 + 39*x_3 + 40.50*x_4;
subject to ce_1: x_1 + x_2 + x_3 + x_4 - 1 = 0;
subject to ci_1: 2.3*x_1 + 5.6*x_2 + 11.1*x_3 + 1.3*x_4 - 5 >= 0;
subject to ci_2: 12*x_1 + 11.9*x_2 + 41.8*x_3 + 52.1*x_4 - 21 - 1.645 * sqrt(0.28*x_1^2 + 0.19*x_2^2 +
20.5*x_3^2 + 0.62*x_4^2) >= 0;
solve;
display obj;
# End Model
