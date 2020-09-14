# Model tp033r
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param lbx2hs := 0;
param lbx2r := 10^(-5);
param lbx2 := lbx2hs;
var x_1 >= 0;
let x_1 := 0;
var x_2 >= lbx2;
let x_2 := lbx2;
var x_3 >= 0, <= 5;
let x_3 := 3;
minimize obj: (x_1 - 1)*(x_1 - 2)*(x_1 - 3) + x_3;
subject to ci_1: x_3^2 - x_2^2 - x_1^2 >= 0;
subject to ci_2: x_1^2 + x_2^2 + x_3^2 - 4 >= 0;
solve;
display obj;
# End Model
