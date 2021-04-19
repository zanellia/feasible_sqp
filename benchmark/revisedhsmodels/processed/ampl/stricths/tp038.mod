# Model tp038
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= -10, <= 10;
let x_1 := -3;
var x_2 >= -10, <= 10;
let x_2 := -1;
var x_3 >= -10, <= 10;
let x_3 := -3;
var x_4 >= -10, <= 10;
let x_4 := -1;
minimize obj: 100*(x_2 - x_1^2)^2 + (1 - x_1)^2 + 90*(x_4 - x_3^2)^2 + (1 - x_3)^2 + 10.1*((x_2 - 1)^2 +
(x_4 - 1)^2) + 19.8*(x_2 - 1)*(x_4 - 1);
solve;
display obj;
# End Model