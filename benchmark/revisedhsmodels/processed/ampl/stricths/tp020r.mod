# Model tp020r
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param lbx1hs := -1/2;
param lbx1r := 0;
param lbx1 := lbx1hs;
var x_1 >= lbx1, <= 1/2;
let x_1 := -2;
var x_2;
let x_2 := 1;
minimize obj: 100*(x_2 - x_1^2)^2 + (1 - x_1)^2;
subject to ci_1: x_1 + x_2^2 >= 0;
subject to ci_2: x_1^2 + x_2 >= 0;
subject to ci_3: x_1^2 + x_2^2 - 1 >= 0;
solve;
display obj;
# End Model