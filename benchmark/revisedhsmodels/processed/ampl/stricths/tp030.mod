# Model tp030
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 1, <= 10;
let x_1 := 1;
var x_2 >= -10, <= 10;
let x_2 := 1;
var x_3 >= -10, <= 10;
let x_3 := 1;
minimize obj: x_1^2 + x_2^2 + x_3^2;
subject to ci_1: x_1^2 + x_2^2 - 1 >= 0;
solve;
display obj;
# End Model