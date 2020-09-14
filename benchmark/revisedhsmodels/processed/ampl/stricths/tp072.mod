# Model tp072
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param a11 := 4;
param a12 := 2.25;
param a13 := 1;
param a14 := 0.25;
param a21 := 0.16;
param a22 := 0.36;
param a23 := 0.64;
param a24 := 0.64;
param b1 := 0.0401;
param b2 := 0.010085;
var x_1 >= 0.001, <= 400000;
let x_1 := 1;
var x_2 >= 0.001, <= 300000;
let x_2 := 1;
var x_3 >= 0.001, <= 200000;
let x_3 := 1;
var x_4 >= 0.001, <= 100000;
let x_4 := 1;
minimize obj: 1 + x_1 + x_2 + x_3 + x_4;
subject to ci_1: b1 - a11/x_1 - a12/x_2 - a13/x_3 - a14/x_4 >= 0;
subject to ci_2: b2 - a21/x_1 - a22/x_2 - a23/x_3 - a24/x_4 >= 0;
solve;
display obj;
# End Model
