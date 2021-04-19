# Model tp100
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1;
let x_1 := 1;
var x_2;
let x_2 := 2;
var x_3;
let x_3 := 0;
var x_4;
let x_4 := 4;
var x_5;
let x_5 := 0;
var x_6;
let x_6 := 1;
var x_7;
let x_7 := 1;
var c_1 = 127 - 2*x_1^2 - 3*x_2^4 - x_3 - 4*x_4^2 - 5*x_5;
var c_2 = 282 - 7*x_1 - 3*x_2 - 10*x_3^2 - x_4 + x_5;
var c_3 = 196 - 23*x_1 - x_2^2 - 6*x_6^2 + 8*x_7;
var c_4 = (-4)*x_1^2 - x_2^2 + 3*x_1*x_2 - 2*x_3^2 - 5*x_6 +11*x_7;
var mf = (x_1 - 10)^2 + 5*(x_2 - 12)^2 + x_3^4 + 3*(x_4 - 11)^2 + 10*x_5^6 + 7*x_6^2 + x_7^4 - 4*x_6*x_7 -
10*x_6 - 8*x_7;
var myminfun = mf;
var myabsdevnod0_0 = abs(myminfun - 680.6300573744021);
var myreldevnod0_0 = abs(myminfun/680.6300573744021 - 1);
var myabsdevnod0_1 = abs(x_1 - 2.33049937287957);
var myreldevnod0_1 = abs(x_1/2.33049937287957 - 1);
var myabsdevnod0_2 = abs(x_2 - 1.951372372896889);
var myreldevnod0_2 = abs(x_2/1.951372372896889 - 1);
var myabsdevnod0_3 = abs(x_3 + 0.4775413923888715);
var myreldevnod0_3 = abs(x_3/0.4775413923888715 + 1);
var myabsdevnod0_4 = abs(x_4 - 4.36572623365581);
var myreldevnod0_4 = abs(x_4/4.36572623365581 - 1);
var myabsdevnod0_5 = abs(x_5 + 0.6244869705268174);
var myreldevnod0_5 = abs(x_5/0.6244869705268174 + 1);
var myabsdevnod0_6 = abs(x_6 - 1.038131018607958);
var myreldevnod0_6 = abs(x_6/1.038131018607958 - 1);
var myabsdevnod0_7 = abs(x_7 - 1.594226711611868);
var myreldevnod0_7 = abs(x_7/1.594226711611868 - 1);
var myabsdevnod1_0 = (1/2)*(abs(myabsdevnod0_0 - myabsdevnod0_1) + (myabsdevnod0_0 + myabsdevnod0_1));
var myreldevnod1_0 = (1/2)*(abs(myreldevnod0_0 - myreldevnod0_1) + (myreldevnod0_0 + myreldevnod0_1));
var myabsdevnod1_2 = (1/2)*(abs(myabsdevnod0_2 - myabsdevnod0_3) + (myabsdevnod0_2 + myabsdevnod0_3));
var myreldevnod1_2 = (1/2)*(abs(myreldevnod0_2 - myreldevnod0_3) + (myreldevnod0_2 + myreldevnod0_3));
var myabsdevnod1_4 = (1/2)*(abs(myabsdevnod0_4 - myabsdevnod0_5) + (myabsdevnod0_4 + myabsdevnod0_5));
var myreldevnod1_4 = (1/2)*(abs(myreldevnod0_4 - myreldevnod0_5) + (myreldevnod0_4 + myreldevnod0_5));
var myabsdevnod1_6 = (1/2)*(abs(myabsdevnod0_6 - myabsdevnod0_7) + (myabsdevnod0_6 + myabsdevnod0_7));
var myreldevnod1_6 = (1/2)*(abs(myreldevnod0_6 - myreldevnod0_7) + (myreldevnod0_6 + myreldevnod0_7));
var myabsdevnod2_0 = (1/2)*(abs(myabsdevnod1_0 - myabsdevnod1_2) + (myabsdevnod1_0 + myabsdevnod1_2));
var myreldevnod2_0 = (1/2)*(abs(myreldevnod1_0 - myreldevnod1_2) + (myreldevnod1_0 + myreldevnod1_2));
var myabsdevnod2_4 = (1/2)*(abs(myabsdevnod1_4 - myabsdevnod1_6) + (myabsdevnod1_4 + myabsdevnod1_6));
var myreldevnod2_4 = (1/2)*(abs(myreldevnod1_4 - myreldevnod1_6) + (myreldevnod1_4 + myreldevnod1_6));
var myabsdevnod3_0 = (1/2)*(abs(myabsdevnod2_0 - myabsdevnod2_4) + (myabsdevnod2_0 + myabsdevnod2_4));
var myreldevnod3_0 = (1/2)*(abs(myreldevnod2_0 - myreldevnod2_4) + (myreldevnod2_0 + myreldevnod2_4));
var zmyabsdevmax = myabsdevnod3_0;
var zmyreldevmax = myreldevnod3_0;
minimize obj: myminfun;
subject to ci_1: c_1 >= 0;
subject to ci_2: c_2 >= 0;
subject to ci_3: c_3 >= 0;
subject to ci_4: c_4 >= 0;
solve;
display x_1;
display x_2;
display x_3;
display x_4;
display x_5;
display x_6;
display x_7;
display myminfun;
display zmyabsdevmax;
display zmyreldevmax;
# End Model