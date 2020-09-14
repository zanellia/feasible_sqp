# Model tp074
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param a := 0.55;
param c3 := 3;
param l_1 := 0;
param l_2 := 0;
param l_3 := -a;
param l_4 := -a;
param u_1 := 1200;
param u_2 := 1200;
param u_3 := a;
param u_4 := a;
var x_1 >= l_1, <= u_1;
let x_1 := 0;
var x_2 >= l_2, <= u_2;
let x_2 := 0;
var x_3 >= l_3, <= u_3;
let x_3 := 0;
var x_4 >= l_4, <= u_4;
let x_4 := 0;
var myminfun = 3*x_1 + 1.0e-6*x_1^3 + 2*x_2 + 2.0e-6*x_2^3/c3;
var myabsdevnod0_0 = abs(myminfun - 5126.498109595273);
var myreldevnod0_0 = abs(myminfun/5126.498109595273 - 1);
var myabsdevnod0_1 = abs(x_1 - 679.9453198512117);
var myreldevnod0_1 = abs(x_1/679.9453198512117 - 1);
var myabsdevnod0_2 = abs(x_2 - 1026.067132610465);
var myreldevnod0_2 = abs(x_2/1026.067132610465 - 1);
var myabsdevnod0_3 = abs(x_3 - 0.1188763644931019);
var myreldevnod0_3 = abs(x_3/0.1188763644931019 - 1);
var myabsdevnod0_4 = abs(x_4 + 0.3962335532032103);
var myreldevnod0_4 = abs(x_4/0.3962335532032103 + 1);
var myabsdevnod1_0 = (1/2)*(abs(myabsdevnod0_0 - myabsdevnod0_1) + (myabsdevnod0_0 + myabsdevnod0_1));
var myreldevnod1_0 = (1/2)*(abs(myreldevnod0_0 - myreldevnod0_1) + (myreldevnod0_0 + myreldevnod0_1));
var myabsdevnod1_2 = (1/2)*(abs(myabsdevnod0_2 - myabsdevnod0_3) + (myabsdevnod0_2 + myabsdevnod0_3));
var myreldevnod1_2 = (1/2)*(abs(myreldevnod0_2 - myreldevnod0_3) + (myreldevnod0_2 + myreldevnod0_3));
var myabsdevnod1_4 = myabsdevnod0_4;
var myreldevnod1_4 = myreldevnod0_4;
var myabsdevnod2_0 = (1/2)*(abs(myabsdevnod1_0 - myabsdevnod1_2) + (myabsdevnod1_0 + myabsdevnod1_2));
var myreldevnod2_0 = (1/2)*(abs(myreldevnod1_0 - myreldevnod1_2) + (myreldevnod1_0 + myreldevnod1_2));
var myabsdevnod2_4 = myabsdevnod1_4;
var myreldevnod2_4 = myreldevnod1_4;
var myabsdevnod3_0 = (1/2)*(abs(myabsdevnod2_0 - myabsdevnod2_4) + (myabsdevnod2_0 + myabsdevnod2_4));
var myreldevnod3_0 = (1/2)*(abs(myreldevnod2_0 - myreldevnod2_4) + (myreldevnod2_0 + myreldevnod2_4));
var zmyabsdevmax = myabsdevnod3_0;
var zmyreldevmax = myreldevnod3_0;
minimize obj: myminfun;
subject to ce_1: 1000*sin((-1)*x_3 - 0.25) + 1000*sin((-1)*x_4 - 0.25) + 894.8 - x_1 = 0;
subject to ce_2: 1000*sin(x_3 - 0.25) + 1000*sin(x_3 - x_4 - 0.25) + 894.8 - x_2 = 0;
subject to ce_3: 1000*sin(x_4 - 0.25) + 1000*sin(x_4 - x_3 - 0.25) + 1294.8 = 0;
subject to ci_1: x_4 - x_3 + a >= 0;
subject to ci_2: x_3 - x_4 + a >= 0;
solve;
display x_1;
display x_2;
display x_3;
display x_4;
display myminfun;
display zmyabsdevmax;
display zmyreldevmax;
# End Model
