# Model tp026r
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param lbx3 := -0.4;
var x_1;
let x_1 := -2.6;
var x_2;
let x_2 := 2;
var x_3;
let x_3 := 2;
minimize obj: (x_1 - x_2)^2 + (x_2 - x_3)^4;
subject to ce_1: (1 + x_2^2)*x_1 + x_3^4 - 3 = 0;
solve;
display obj;
# End Model
