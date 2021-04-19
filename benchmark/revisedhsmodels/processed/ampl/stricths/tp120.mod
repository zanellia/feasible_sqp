# Model tp120
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param mypi := 4*atan(1);
param c2 := 2;
param c3 := 3;
param c10 := 10;
param c20 := 20;
param c1000 := 1000;
param c100000 := 100000;
param rrough := ((50/c1000)/((2700 + 19300 + 7860)*(4/c3)*mypi))^(1/c3);
param rcage := 1/c10;
var x_1;
let x_1 := rrough;
var x_2;
let x_2 := rrough;
var x_3;
let x_3 := rrough;
var x_4;
let x_4 := (-1)/c20;
var x_5;
let x_5 := 1/c20;
var x_6;
let x_6 := (-1)/c20;
var x_7;
let x_7 := (-1)/c20;
var x_8;
let x_8 := (-1)*rrough/c10;
var x_9;
let x_9 := 1/c20;
var x_10;
let x_10 := 1/c10;
var x_11;
let x_11 := 1/c10;
var x_12;
let x_12 := 1/c10;
var massa = 2700*(4/c3)*mypi*x_1^3;
var massg = 19300*(4/c3)*mypi*x_2^3;
var massi = 7860*(4/c3)*mypi*x_3^3;
var dista0p2 = x_4^2 + x_7^2 + x_10^2;
var distg0p2 = x_5^2 + x_8^2 + x_11^2;
var disti0p2 = x_6^2 + x_9^2 + x_12^2;
var distag = sqrt((x_4 - x_5)^2 + (x_7 - x_8)^2 + (x_10 - x_11)^2);
var distgi = sqrt((x_5 - x_6)^2 + (x_8 - x_9)^2 + (x_11 - x_12)^2);
var distia = sqrt((x_6 - x_4)^2 + (x_9 - x_7)^2 + (x_12 - x_10)^2);
var rsumag = x_1 + x_2;
var rsumgi = x_2 + x_3;
var rsumia = x_3 + x_1;
var mf = (980665/c100000)*(massa*x_10 + massg*x_11 + massi*x_12);
var c_1 = x_8 + x_2/c10;
var c_2 = massa + massg + massi - 50/c1000;
var c_3 = (x_1^2 + 2*rcage*(x_10 - x_1) - dista0p2)/rrough;
var c_4 = (x_2^2 + 2*rcage*(x_11 - x_2) - distg0p2)/rrough;
var c_5 = (x_3^2 + 2*rcage*(x_12 - x_3) - disti0p2)/rrough;
var c_6 = distag - rsumag;
var c_7 = distgi - rsumgi;
var c_8 = distia - rsumia;
var c_9 = (-1)*(x_4 + x_1/c10);
var c_10 = x_5 - x_2/c10;
var c_11 = (-1)*(x_6 + x_3/c10);
var c_12 = (-1)*(x_7 + x_1/c10);
var c_13 = x_9 - x_3/c10;
var c_14 = x_1 - x_2/c2;
var c_15 = x_1 - x_3/c2;
var c_16 = x_2 - x_1/c2;
var c_17 = x_2 - x_3/c2;
var c_18 = x_3 - x_1/c2;
var c_19 = x_3 - x_2/c2;
minimize obj: mf;
subject to ce_1: c_1 = 0;
subject to ce_2: c_2 = 0;
subject to ci_1: c_3 >= 0;
subject to ci_2: c_4 >= 0;
subject to ci_3: c_5 >= 0;
subject to ci_4: c_6 >= 0;
subject to ci_5: c_7 >= 0;
subject to ci_6: c_8 >= 0;
subject to ci_7: c_9 >= 0;
subject to ci_8: c_10 >= 0;
subject to ci_9: c_11 >= 0;
subject to ci_10: c_12 >= 0;
subject to ci_11: c_13 >= 0;
subject to ci_12: c_14 >= 0;
subject to ci_13: c_15 >= 0;
subject to ci_14: c_16 >= 0;
subject to ci_15: c_17 >= 0;
subject to ci_16: c_18 >= 0;
subject to ci_17: c_19 >= 0;
solve;
display obj;
# End Model