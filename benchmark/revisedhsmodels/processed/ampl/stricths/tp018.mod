# Model tp018
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 2, <= 50;
let x_1 := 2;
var x_2 >= 0, <= 50;
let x_2 := 2;
minimize obj: (1/100)*x_1^2 + x_2^2;
subject to ci_1: x_1*x_2 - 25 >= 0;
subject to ci_2: x_1^2 + x_2^2 - 25 >= 0;
solve;
display obj;
# End Model