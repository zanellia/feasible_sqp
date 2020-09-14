# Model tp009r
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param mypi := 4*atan(1);
param eps := 10^(-6);
param lbx1 := (-1)*9 + eps;
param ubx1 := 3 - eps;
var x_1;
let x_1 := 0;
var x_2;
let x_2 := 0;
minimize obj: sin(mypi*x_1/12)*cos(mypi*x_2/16);
subject to ce_1: 4*x_1 - 3*x_2 = 0;
solve;
display obj;
# End Model
