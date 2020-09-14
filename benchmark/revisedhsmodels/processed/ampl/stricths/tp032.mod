# Model tp032
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 0;
let x_1 := 0.1;
var x_2 >= 0;
let x_2 := 0.7;
var x_3 >= 0;
let x_3 := 0.2;
minimize obj: (x_1 + 3*x_2 + x_3)^2 + 4*(x_1 - x_2)^2;
subject to ce_1: 1 - x_1 - x_2 - x_3 = 0;
subject to ci_1: 6*x_2 + 4*x_3 - x_1^3 - 3 >= 0;
solve;
display obj;
# End Model
