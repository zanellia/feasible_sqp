# Model tp045r
# Source version 8
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param eps := 10^(-4);
param lbxi := eps;
var x_1 <= 1;
let x_1 := 2;
var x_2 <= 2;
let x_2 := 2;
var x_3 <= 3;
let x_3 := 2;
var x_4 <= 4;
let x_4 := 2;
var x_5 <= 5;
let x_5 := 2;
minimize obj: 2 - (1/120)*x_1*x_2*x_3*x_4*x_5;
solve;
display obj;
# End Model
