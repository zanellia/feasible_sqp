# Model tp008r
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param lbx1 := 2;
var x_1;
let x_1 := 2;
var x_2;
let x_2 := 1;
minimize obj: -1;
subject to ce_1: x_1^2 + x_2^2 - 25 = 0;
subject to ce_2: x_1*x_2 - 9 = 0;
solve;
display obj;
# End Model
