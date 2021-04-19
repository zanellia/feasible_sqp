# Model tp111
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param c_1 := -6.089;
param c_2 := -17.164;
param c_3 := -34.054;
param c_4 := -5.914;
param c_5 := -24.721;
param c_6 := -14.986;
param c_7 := -24.100;
param c_8 := -10.708;
param c_9 := -26.662;
param c_10 := -22.179;
param si_0 := 0;
param so_0 := 0;
var x_1 >= -100, <= 100;
let x_1 := -2.3;
var x_2 >= -100, <= 100;
let x_2 := -2.3;
var x_3 >= -100, <= 100;
let x_3 := -2.3;
var x_4 >= -100, <= 100;
let x_4 := -2.3;
var x_5 >= -100, <= 100;
let x_5 := -2.3;
var x_6 >= -100, <= 100;
let x_6 := -2.3;
var x_7 >= -100, <= 100;
let x_7 := -2.3;
var x_8 >= -100, <= 100;
let x_8 := -2.3;
var x_9 >= -100, <= 100;
let x_9 := -2.3;
var x_10 >= -100, <= 100;
let x_10 := -2.3;
var cf_1 = exp(x_1) + 2*exp(x_2) + 2*exp(x_3) + exp(x_6) + exp(x_10) - 2;
var cf_2 = exp(x_4) + 2*exp(x_5) + exp(x_6) + exp(x_7) - 1;
var cf_3 = exp(x_3) + exp(x_7) + exp(x_8) + 2*exp(x_9) + exp(x_10) - 1;
var si_1 = si_0 + exp(x_1);
var si_2 = si_1 + exp(x_2);
var si_3 = si_2 + exp(x_3);
var si_4 = si_3 + exp(x_4);
var si_5 = si_4 + exp(x_5);
var si_6 = si_5 + exp(x_6);
var si_7 = si_6 + exp(x_7);
var si_8 = si_7 + exp(x_8);
var si_9 = si_8 + exp(x_9);
var si_10 = si_9 + exp(x_10);
var aux = log(si_10);
var so_1 = so_0 + exp(x_1)*(c_1 + x_1 - aux);
var so_2 = so_1 + exp(x_2)*(c_2 + x_2 - aux);
var so_3 = so_2 + exp(x_3)*(c_3 + x_3 - aux);
var so_4 = so_3 + exp(x_4)*(c_4 + x_4 - aux);
var so_5 = so_4 + exp(x_5)*(c_5 + x_5 - aux);
var so_6 = so_5 + exp(x_6)*(c_6 + x_6 - aux);
var so_7 = so_6 + exp(x_7)*(c_7 + x_7 - aux);
var so_8 = so_7 + exp(x_8)*(c_8 + x_8 - aux);
var so_9 = so_8 + exp(x_9)*(c_9 + x_9 - aux);
var so_10 = so_9 + exp(x_10)*(c_10 + x_10 - aux);
var mf = so_10;
minimize obj: mf;
subject to ce_1: cf_1 = 0;
subject to ce_2: cf_2 = 0;
subject to ce_3: cf_3 = 0;
solve;
display obj;
# End Model