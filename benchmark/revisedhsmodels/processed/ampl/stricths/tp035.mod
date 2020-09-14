# Model tp035
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 0;
let x_1 := 0.5;
var x_2 >= 0;
let x_2 := 0.5;
var x_3 >= 0;
let x_3 := 0.5;
minimize obj: 9 - 8*x_1 - 6*x_2 - 4*x_3 + 2*x_1^2 + 2*x_2^2 + x_3^2 + 2*x_1*x_2 + 2*x_1*x_3;
subject to ci_1: 3 - x_1 - x_2 - 2*x_3 >= 0;
solve;
display obj;
# End Model
