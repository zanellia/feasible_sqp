# Model tp062
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 0, <= 1;
let x_1 := 0.7;
var x_2 >= 0, <= 1;
let x_2 := 0.2;
var x_3 >= 0, <= 1;
let x_3 := 0.1;
minimize obj: (-32.174) * (255*log((x_1 + x_2 + x_3 + 0.03)/(0.09*x_1 + x_2 + x_3 + 0.03)) + 280*log((x_2 +
x_3 + 0.03)/(0.07*x_2 + x_3 + 0.03)) + 290*log((x_3 + 0.03)/(0.13*x_3 + 0.03)));
subject to ce_1: x_1 + x_2 + x_3 - 1 = 0;
solve;
display obj;
# End Model
