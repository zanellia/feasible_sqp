# Model tp015
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 <= 1/2;
let x_1 := -2;
var x_2;
let x_2 := 1;
minimize obj: 100*(x_2 - x_1^2)^2 + (1 - x_1)^2;
subject to ci_1: x_1*x_2 - 1 >= 0;
subject to ci_2: x_1 + x_2^2 >= 0;
solve;
display obj;
# End Model
