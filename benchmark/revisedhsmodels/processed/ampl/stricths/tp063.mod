# Model tp063
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 0;
let x_1 := 2;
var x_2 >= 0;
let x_2 := 2;
var x_3 >= 0;
let x_3 := 2;
minimize obj: 1000 - x_1^2 - 2*x_2^2 - x_3^2 - x_1*x_2 - x_1*x_3;
subject to ce_1: 8*x_1 + 14*x_2 + 7*x_3 - 56 = 0;
subject to ce_2: x_1^2 + x_2^2 + x_3^2 - 25 = 0;
solve;
display obj;
# End Model
