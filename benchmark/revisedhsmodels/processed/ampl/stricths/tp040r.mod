# Model tp040r
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param lbx3 := 0;
var x_1;
let x_1 := 0.8;
var x_2;
let x_2 := 0.8;
var x_3;
let x_3 := 0.8;
var x_4;
let x_4 := 0.8;
minimize obj: -x_1*x_2*x_3*x_4;
subject to ce_1: x_1^3 + x_2^2 - 1 = 0;
subject to ce_2: x_1^2*x_4 - x_3 = 0;
subject to ce_3: x_4^2 - x_2 = 0;
solve;
display obj;
# End Model
