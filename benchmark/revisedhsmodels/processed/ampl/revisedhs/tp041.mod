# Model tp041
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 0, <= 1;
let x_1 := 2;
var x_2 >= 0, <= 1;
let x_2 := 2;
var x_3 >= 0, <= 1;
let x_3 := 2;
var x_4 >= 0, <= 2;
let x_4 := 2;
var myminfun = 2 - x_1*x_2*x_3;
var myabsdevnod0_0 = abs(myminfun - 1.925925925925926);
var myreldevnod0_0 = abs(myminfun/1.925925925925926 - 1);
var myabsdevnod0_1 = abs(x_1 - 0.6666666666666667);
var myreldevnod0_1 = abs(x_1/0.6666666666666667 - 1);
var myabsdevnod0_2 = abs(x_2 - 0.3333333333333333);
var myreldevnod0_2 = abs(x_2/0.3333333333333333 - 1);
var myabsdevnod0_3 = abs(x_3 - 0.3333333333333333);
var myreldevnod0_3 = abs(x_3/0.3333333333333333 - 1);
var myabsdevnod0_4 = abs(x_4 - 2);
var myreldevnod0_4 = abs(x_4/2 - 1);
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
subject to ce_1: x_1 + 2*x_2 + 2*x_3 - x_4 = 0;
solve;
display x_1;
display x_2;
display x_3;
display x_4;
display myminfun;
display zmyabsdevmax;
display zmyreldevmax;
# End Model
