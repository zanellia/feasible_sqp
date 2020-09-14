# Model tp117r2
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param a24a := 4/10;
param a24b := 4;
param a24 := a24a;
param ivxhs_1 := 0.001;
param ivxhs_2 := 0.001;
param ivxhs_3 := 0.001;
param ivxhs_4 := 0.001;
param ivxhs_5 := 0.001;
param ivxhs_6 := 0.001;
param ivxhs_7 := 60;
param ivxhs_8 := 0.001;
param ivxhs_9 := 0.001;
param ivxhs_10 := 0.001;
param ivxhs_11 := 0.001;
param ivxhs_12 := 0.001;
param ivxhs_13 := 0.001;
param ivxhs_14 := 0.001;
param ivxhs_15 := 0.001;
param lbx_1 := 0;
param lbx_2 := 0;
param lbx_3 := 1;
param lbx_4 := 0;
param lbx_5 := 1;
param lbx_6 := 1;
param lbx_7 := 0;
param lbx_8 := 0;
param lbx_9 := 0.09;
param lbx_10 := 0;
param lbx_11 := 0.1;
param lbx_12 := 0.3;
param lbx_13 := 0.3;
param lbx_14 := 0.2;
param lbx_15 := 0.1;
param ivx_1 := (1/2)*(abs(ivxhs_1 - lbx_1) + (ivxhs_1 + lbx_1));
param ivx_2 := (1/2)*(abs(ivxhs_2 - lbx_2) + (ivxhs_2 + lbx_2));
param ivx_3 := (1/2)*(abs(ivxhs_3 - lbx_3) + (ivxhs_3 + lbx_3));
param ivx_4 := (1/2)*(abs(ivxhs_4 - lbx_4) + (ivxhs_4 + lbx_4));
param ivx_5 := (1/2)*(abs(ivxhs_5 - lbx_5) + (ivxhs_5 + lbx_5));
param ivx_6 := (1/2)*(abs(ivxhs_6 - lbx_6) + (ivxhs_6 + lbx_6));
param ivx_7 := (1/2)*(abs(ivxhs_7 - lbx_7) + (ivxhs_7 + lbx_7));
param ivx_8 := (1/2)*(abs(ivxhs_8 - lbx_8) + (ivxhs_8 + lbx_8));
param ivx_9 := (1/2)*(abs(ivxhs_9 - lbx_9) + (ivxhs_9 + lbx_9));
param ivx_10 := (1/2)*(abs(ivxhs_10 - lbx_10) + (ivxhs_10 + lbx_10));
param ivx_11 := (1/2)*(abs(ivxhs_11 - lbx_11) + (ivxhs_11 + lbx_11));
param ivx_12 := (1/2)*(abs(ivxhs_12 - lbx_12) + (ivxhs_12 + lbx_12));
param ivx_13 := (1/2)*(abs(ivxhs_13 - lbx_13) + (ivxhs_13 + lbx_13));
param ivx_14 := (1/2)*(abs(ivxhs_14 - lbx_14) + (ivxhs_14 + lbx_14));
param ivx_15 := (1/2)*(abs(ivxhs_15 - lbx_15) + (ivxhs_15 + lbx_15));
var x_1 >= lbx_1;
let x_1 := ivx_1;
var x_2 >= lbx_2;
let x_2 := ivx_2;
var x_3 >= lbx_3;
let x_3 := ivx_3;
var x_4 >= lbx_4;
let x_4 := ivx_4;
var x_5 >= lbx_5;
let x_5 := ivx_5;
var x_6 >= lbx_6;
let x_6 := ivx_6;
var x_7 >= lbx_7;
let x_7 := ivx_7;
var x_8 >= lbx_8;
let x_8 := ivx_8;
var x_9 >= lbx_9;
let x_9 := ivx_9;
var x_10 >= lbx_10;
let x_10 := ivx_10;
var x_11 >= lbx_11;
let x_11 := ivx_11;
var x_12 >= lbx_12;
let x_12 := ivx_12;
var x_13 >= lbx_13;
let x_13 := ivx_13;
var x_14 >= lbx_14;
let x_14 := ivx_14;
var x_15 >= lbx_15;
let x_15 := ivx_15;
var c_1 = (-15) + 16*x_1 + (7/2)*x_3 - 2*x_6 + x_7 + x_8 - x_9 - x_10 + 60*x_11 - 40*x_12 - 20*x_13 +
64*x_14 - 20*x_15 + 12*x_11^2;
var c_2 = (-27) - 2*x_1 + 2*x_2 + 2*x_4 + 9*x_5 + x_7 + 2*x_8 - 2*x_9 - x_10 - 40*x_11 + 78*x_12 - 12*x_13 -
62*x_14 + 64*x_15 + 24*x_12^2;
var c_3 = (-36) - 2*x_3 + 2*x_5 + 4*x_6 + x_7 + 3*x_8 - 3*x_9 - x_10 - 20*x_11 - 12*x_12 + 20*x_13 - 12*x_14
- 20*x_15 + 30*x_13^2;
var c_4 = (-18) - x_1 - a24*x_2 + 4*x_4 - x_5 + x_7 + 2*x_8 - 4*x_9 - x_10 + 64*x_11 - 62*x_12 - 12*x_13 +
78*x_14 - 40*x_15 + 18*x_14^2;
var c_5 = (-12) - 2*x_2 + x_4 + (14/5)*x_5 + x_7 + x_8 - 5*x_9 - x_10 - 20*x_11 + 64*x_12 - 20*x_13 -
40*x_14 + 60*x_15 + 6*x_15^2;
var mf = 40*x_1 + 2*x_2 + (1/4)*x_3 + 4*x_4 + 4*x_5 + x_6 + 40*x_7 + 60*x_8 - 5*x_9 - x_10 + 30*x_11^2 -
40*x_11*x_12 - 20*x_11*x_13 + 64*x_11*x_14 - 20*x_11*x_15 + 39*x_12^2 - 12*x_12*x_13 - 62*x_12*x_14 +
64*x_12*x_15 + 10*x_13^2 - 12*x_13*x_14 - 20*x_13*x_15 + 39*x_14^2 - 40*x_14*x_15 + 30*x_15^2 + 8*x_11^3 +
16*x_12^3 + 20*x_13^3 + 12*x_14^3 + 4*x_15^3;
var myminfun = mf;
var myabsdevnod0_0 = abs(myminfun - 32.34867896572271);
var myreldevnod0_0 = abs(myminfun/32.34867896572271 - 1);
var myabsdevnod0_1 = abs(x_1);
var myreldevnod0_1 = abs(x_1);
var myabsdevnod0_2 = abs(x_2);
var myreldevnod0_2 = abs(x_2);
var myabsdevnod0_3 = abs(x_3 - 5.174040727698173);
var myreldevnod0_3 = abs(x_3/5.174040727698173 - 1);
var myabsdevnod0_4 = abs(x_4);
var myreldevnod0_4 = abs(x_4);
var myabsdevnod0_5 = abs(x_5 - 3.06110868775845);
var myreldevnod0_5 = abs(x_5/3.06110868775845 - 1);
var myabsdevnod0_6 = abs(x_6 - 11.83954566480073);
var myreldevnod0_6 = abs(x_6/11.83954566480073 - 1);
var myabsdevnod0_7 = abs(x_7);
var myreldevnod0_7 = abs(x_7);
var myabsdevnod0_8 = abs(x_8);
var myreldevnod0_8 = abs(x_8);
var myabsdevnod0_9 = abs(x_9 - 0.1038961907706158);
var myreldevnod0_9 = abs(x_9/0.1038961907706158 - 1);
var myabsdevnod0_10 = abs(x_10);
var myreldevnod0_10 = abs(x_10);
var myabsdevnod0_11 = abs(x_11 - 0.3);
var myreldevnod0_11 = abs(x_11/0.3 - 1);
var myabsdevnod0_12 = abs(x_12 - 0.3334676065346071);
var myreldevnod0_12 = abs(x_12/0.3334676065346071 - 1);
var myabsdevnod0_13 = abs(x_13 - 0.4);
var myreldevnod0_13 = abs(x_13/0.4 - 1);
var myabsdevnod0_14 = abs(x_14 - 0.4283101047816988);
var myreldevnod0_14 = abs(x_14/0.4283101047816988 - 1);
var myabsdevnod0_15 = abs(x_15 - 0.2239648735607981);
var myreldevnod0_15 = abs(x_15/0.2239648735607981 - 1);
var myabsdevnod1_0 = (1/2)*(abs(myabsdevnod0_0 - myabsdevnod0_1) + (myabsdevnod0_0 + myabsdevnod0_1));
var myreldevnod1_0 = (1/2)*(abs(myreldevnod0_0 - myreldevnod0_1) + (myreldevnod0_0 + myreldevnod0_1));
var myabsdevnod1_2 = (1/2)*(abs(myabsdevnod0_2 - myabsdevnod0_3) + (myabsdevnod0_2 + myabsdevnod0_3));
var myreldevnod1_2 = (1/2)*(abs(myreldevnod0_2 - myreldevnod0_3) + (myreldevnod0_2 + myreldevnod0_3));
var myabsdevnod1_4 = (1/2)*(abs(myabsdevnod0_4 - myabsdevnod0_5) + (myabsdevnod0_4 + myabsdevnod0_5));
var myreldevnod1_4 = (1/2)*(abs(myreldevnod0_4 - myreldevnod0_5) + (myreldevnod0_4 + myreldevnod0_5));
var myabsdevnod1_6 = (1/2)*(abs(myabsdevnod0_6 - myabsdevnod0_7) + (myabsdevnod0_6 + myabsdevnod0_7));
var myreldevnod1_6 = (1/2)*(abs(myreldevnod0_6 - myreldevnod0_7) + (myreldevnod0_6 + myreldevnod0_7));
var myabsdevnod1_8 = (1/2)*(abs(myabsdevnod0_8 - myabsdevnod0_9) + (myabsdevnod0_8 + myabsdevnod0_9));
var myreldevnod1_8 = (1/2)*(abs(myreldevnod0_8 - myreldevnod0_9) + (myreldevnod0_8 + myreldevnod0_9));
var myabsdevnod1_10 = (1/2)*(abs(myabsdevnod0_10 - myabsdevnod0_11) + (myabsdevnod0_10 + myabsdevnod0_11));
var myreldevnod1_10 = (1/2)*(abs(myreldevnod0_10 - myreldevnod0_11) + (myreldevnod0_10 + myreldevnod0_11));
var myabsdevnod1_12 = (1/2)*(abs(myabsdevnod0_12 - myabsdevnod0_13) + (myabsdevnod0_12 + myabsdevnod0_13));
var myreldevnod1_12 = (1/2)*(abs(myreldevnod0_12 - myreldevnod0_13) + (myreldevnod0_12 + myreldevnod0_13));
var myabsdevnod1_14 = (1/2)*(abs(myabsdevnod0_14 - myabsdevnod0_15) + (myabsdevnod0_14 + myabsdevnod0_15));
var myreldevnod1_14 = (1/2)*(abs(myreldevnod0_14 - myreldevnod0_15) + (myreldevnod0_14 + myreldevnod0_15));
var myabsdevnod2_0 = (1/2)*(abs(myabsdevnod1_0 - myabsdevnod1_2) + (myabsdevnod1_0 + myabsdevnod1_2));
var myreldevnod2_0 = (1/2)*(abs(myreldevnod1_0 - myreldevnod1_2) + (myreldevnod1_0 + myreldevnod1_2));
var myabsdevnod2_4 = (1/2)*(abs(myabsdevnod1_4 - myabsdevnod1_6) + (myabsdevnod1_4 + myabsdevnod1_6));
var myreldevnod2_4 = (1/2)*(abs(myreldevnod1_4 - myreldevnod1_6) + (myreldevnod1_4 + myreldevnod1_6));
var myabsdevnod2_8 = (1/2)*(abs(myabsdevnod1_8 - myabsdevnod1_10) + (myabsdevnod1_8 + myabsdevnod1_10));
var myreldevnod2_8 = (1/2)*(abs(myreldevnod1_8 - myreldevnod1_10) + (myreldevnod1_8 + myreldevnod1_10));
var myabsdevnod2_12 = (1/2)*(abs(myabsdevnod1_12 - myabsdevnod1_14) + (myabsdevnod1_12 + myabsdevnod1_14));
var myreldevnod2_12 = (1/2)*(abs(myreldevnod1_12 - myreldevnod1_14) + (myreldevnod1_12 + myreldevnod1_14));
var myabsdevnod3_0 = (1/2)*(abs(myabsdevnod2_0 - myabsdevnod2_4) + (myabsdevnod2_0 + myabsdevnod2_4));
var myreldevnod3_0 = (1/2)*(abs(myreldevnod2_0 - myreldevnod2_4) + (myreldevnod2_0 + myreldevnod2_4));
var myabsdevnod3_8 = (1/2)*(abs(myabsdevnod2_8 - myabsdevnod2_12) + (myabsdevnod2_8 + myabsdevnod2_12));
var myreldevnod3_8 = (1/2)*(abs(myreldevnod2_8 - myreldevnod2_12) + (myreldevnod2_8 + myreldevnod2_12));
var myabsdevnod4_0 = (1/2)*(abs(myabsdevnod3_0 - myabsdevnod3_8) + (myabsdevnod3_0 + myabsdevnod3_8));
var myreldevnod4_0 = (1/2)*(abs(myreldevnod3_0 - myreldevnod3_8) + (myreldevnod3_0 + myreldevnod3_8));
var zmyabsdevmax = myabsdevnod4_0;
var zmyreldevmax = myreldevnod4_0;
minimize obj: myminfun;
subject to ci_1: c_1 >= 0;
subject to ci_2: c_2 >= 0;
subject to ci_3: c_3 >= 0;
subject to ci_4: c_4 >= 0;
subject to ci_5: c_5 >= 0;
solve;
display x_1;
display x_2;
display x_3;
display x_4;
display x_5;
display x_6;
display x_7;
display x_8;
display x_9;
display x_10;
display x_11;
display x_12;
display x_13;
display x_14;
display x_15;
display myminfun;
display zmyabsdevmax;
display zmyreldevmax;
# End Model
