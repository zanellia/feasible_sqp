# Model tp004
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 1;
let x_1 := 1.125;
var x_2 >= 0;
let x_2 := 0.125;
minimize obj: (x_1 + 1)^3/3 + x_2;
solve;
display obj;
# End Model
