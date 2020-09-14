# Model tp064
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 10^(-5);
let x_1 := 1;
var x_2 >= 10^(-5);
let x_2 := 1;
var x_3 >= 10^(-5);
let x_3 := 1;
minimize obj: 5*x_1 + 50000/x_1 + 20*x_2 + 72000/x_2 + 10*x_3 + 144000/x_3;
subject to ci_1: 1 - 4/x_1 - 32/x_2 - 120/x_3 >= 0;
solve;
display obj;
# End Model
