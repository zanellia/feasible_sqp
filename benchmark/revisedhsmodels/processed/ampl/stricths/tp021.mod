# Model tp021
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 2, <= 50;
let x_1 := -1;
var x_2 >= -50, <= 50;
let x_2 := -1;
minimize obj: (1/100)*x_1^2 + x_2^2 - 100;
subject to ci_1: 10*x_1 - x_2 - 10 >= 0;
solve;
display obj;
# End Model
