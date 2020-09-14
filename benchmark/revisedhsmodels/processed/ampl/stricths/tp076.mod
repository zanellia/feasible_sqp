# Model tp076
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 0;
let x_1 := 0.5;
var x_2 >= 0;
let x_2 := 0.5;
var x_3 >= 0;
let x_3 := 0.5;
var x_4 >= 0;
let x_4 := 0.5;
minimize obj: x_1^2 + 0.5*x_2^2 + x_3^2 + 0.5*x_4^2 - x_1*x_3 + x_3*x_4 - x_1 - 3*x_2 + x_3 - x_4;
subject to ci_1: 5 - x_1 - 2*x_2 - x_3 - x_4 >= 0;
subject to ci_2: 4 - 3*x_1 - x_2 - 2*x_3 + x_4 >= 0;
subject to ci_3: x_2 + 4*x_3 - 1.5 >= 0;
solve;
display obj;
# End Model
