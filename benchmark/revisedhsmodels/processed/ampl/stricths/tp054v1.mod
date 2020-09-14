# Model tp054v1
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 0, <= 20000;
let x_1 := 6000;
var x_2 >= -10, <= 10;
let x_2 := 1.5;
var x_3 >= 0, <= 10000000;
let x_3 := 4000000;
var x_4 >= 0, <= 20;
let x_4 := 2;
var x_5 >= -1, <= 1;
let x_5 := 0.003;
var x_6 >= 0, <= 200000000;
let x_6 := 50000000;
var y_1 = (x_1 - 10000)/8000;
var y_2 = (x_2 - 1)/1;
var y_3 = (x_3 - 2000000)/7000000;
var y_4 = (x_4 - 10)/50;
var y_5 = (x_5 - 1/1000)*20;
var y_6 = (x_6 - 100000000)/500000000;
var h1 = (y_1^2 + y_1*y_2*2/5 + y_2^2)*25/24;
var h2 = y_3^2 + y_4^2 + y_5^2 + y_6^2;
var mf = -exp(-(h1 + h2)/2);
minimize obj: mf;
subject to ce_1: x_1 + 4000*x_2 - 17600 = 0;
solve;
display obj;
# End Model
