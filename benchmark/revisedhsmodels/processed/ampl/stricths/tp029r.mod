# Model tp029r
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1;
let x_1 := 1;
var x_2;
let x_2 := 1;
var x_3;
let x_3 := 1;
minimize obj: -x_1*x_2*x_3;
subject to ci_1: (-1)*x_1^2 - 2*x_2^2 - 4*x_3^2 + 48 >= 0;
solve;
display obj;
# End Model
