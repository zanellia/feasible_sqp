# Model tp113
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1;
let x_1 := 2;
var x_2;
let x_2 := 3;
var x_3;
let x_3 := 5;
var x_4;
let x_4 := 5;
var x_5;
let x_5 := 1;
var x_6;
let x_6 := 2;
var x_7;
let x_7 := 7;
var x_8;
let x_8 := 3;
var x_9;
let x_9 := 6;
var x_10;
let x_10 := 10;
var c_1 = 105 - 4*x_1 - 5*x_2 + 3*x_7 - 9*x_8;
var c_2 = (-1)*10*x_1 + 8*x_2 + 17*x_7 - 2*x_8;
var c_3 = 8*x_1 - 2*x_2 - 5*x_9 + 2*x_10 + 12;
var c_4 = (-3)*(x_1 - 2)^2 - 4*(x_2 - 3)^2 - 2*x_3^2 + 7*x_4 + 120;
var c_5 = (-5)*x_1^2 - 8*x_2 - (x_3 - 6)^2 + 2*x_4 + 40;
var c_6 = (-1/2)*(x_1 - 8)^2 - 2*(x_2 - 4)^2 - 3*x_5^2 + x_6 + 30;
var c_7 = (-1)*x_1^2 - 2*(x_2 - 2)^2 + 2*x_1*x_2 - 14*x_5 + 6*x_6;
var c_8 = 3*x_1 - 6*x_2 - 12*(x_9 - 8)^2 + 7*x_10;
var mf = x_1^2 + x_2^2 + x_1*x_2 - 14*x_1 - 16*x_2 + (x_3 - 10)^2 + 4*(x_4 - 5)^2 + (x_5 - 3)^2 + 2*(x_6 -
1)^2 + 5*x_7^2 + 7*(x_8 - 11)^2 + 2*(x_9 - 10)^2 + (x_10 - 7)^2 + 45;
minimize obj: mf;
subject to ci_1: c_1 >= 0;
subject to ci_2: c_2 >= 0;
subject to ci_3: c_3 >= 0;
subject to ci_4: c_4 >= 0;
subject to ci_5: c_5 >= 0;
subject to ci_6: c_6 >= 0;
subject to ci_7: c_7 >= 0;
subject to ci_8: c_8 >= 0;
solve;
display obj;
# End Model
