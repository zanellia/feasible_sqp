# Model tp066
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 0, <= 100;
let x_1 := 0;
var x_2 >= 0, <= 100;
let x_2 := 1.05;
var x_3 >= 0, <= 10;
let x_3 := 2.9;
minimize obj: 0.2*x_3 - 0.8*x_1;
subject to ci_1: x_2 - exp(x_1) >= 0;
subject to ci_2: x_3 - exp(x_2) >= 0;
solve;
display obj;
# End Model
