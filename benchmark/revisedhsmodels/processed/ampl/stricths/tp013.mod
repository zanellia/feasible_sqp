# Model tp013
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 0;
let x_1 := -2;
var x_2 >= 0;
let x_2 := -2;
minimize obj: (x_1 - 2)^2 + x_2^2;
subject to ci_1: (1 - x_1)^3 - x_2 >= 0;
solve;
display obj;
# End Model
