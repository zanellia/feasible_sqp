# Model tp037
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 0, <= 42;
let x_1 := 10;
var x_2 >= 0, <= 42;
let x_2 := 10;
var x_3 >= 0, <= 42;
let x_3 := 10;
minimize obj: -x_1*x_2*x_3;
subject to ci_1: 72 - x_1 - 2*x_2 - 2*x_3 >= 0;
subject to ci_2: x_1 + 2*x_2 + 2*x_3 >= 0;
solve;
display obj;
# End Model
