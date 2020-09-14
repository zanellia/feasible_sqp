# Model tp065
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= -4.5, <= 4.5;
let x_1 := -5;
var x_2 >= -4.5, <= 4.5;
let x_2 := 5;
var x_3 >= -5, <= 5;
let x_3 := 0;
minimize obj: (x_1 - x_2)^2 + (x_1 + x_2 - 10)^2/9 + (x_3 - 5)^2;
subject to ci_1: 48 - x_1^2 - x_2^2 - x_3^2 >= 0;
solve;
display obj;
# End Model
