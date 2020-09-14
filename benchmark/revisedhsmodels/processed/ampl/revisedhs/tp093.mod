# Model tp093
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 0;
let x_1 := 5.54;
var x_2 >= 0;
let x_2 := 4.4;
var x_3 >= 0;
let x_3 := 12.02;
var x_4 >= 0;
let x_4 := 11.82;
var x_5 >= 0;
let x_5 := 0.702;
var x_6 >= 0;
let x_6 := 0.852;
var c_1 = (1/1000)*x_1*x_2*x_3*x_4*x_5*x_6 - 207/100;
var c_2 = 1 - (62/100000)*x_1*x_4*x_5^2*(x_1 + x_2 + x_3) - (58/100000)*x_2*x_3*x_6^2*(x_1 + x_2*157/100 +
x_4);
var mf = (204/10000)*x_1*x_4*(x_1 + x_2 + x_3) + (187/10000)*x_2*x_3*(x_1 + (157/100)*x_2 + x_4) +
(607/10000)*x_1*x_4*x_5^2*(x_1 + x_2 + x_3) + (437/10000)*x_2*x_3*x_6^2*(x_1 + (157/100)*x_2 + x_4);
var myminfun = mf;
var myabsdevnod0_0 = abs(myminfun - 135.0759628291518);
var myreldevnod0_0 = abs(myminfun/135.0759628291518 - 1);
var myabsdevnod0_1 = abs(x_1 - 5.332666335528812);
var myreldevnod0_1 = abs(x_1/5.332666335528812 - 1);
var myabsdevnod0_2 = abs(x_2 - 4.656744059172021);
var myreldevnod0_2 = abs(x_2/4.656744059172021 - 1);
var myabsdevnod0_3 = abs(x_3 - 10.43299194046828);
var myreldevnod0_3 = abs(x_3/10.43299194046828 - 1);
var myabsdevnod0_4 = abs(x_4 - 12.08230634006369);
var myreldevnod0_4 = abs(x_4/12.08230634006369 - 1);
var myabsdevnod0_5 = abs(x_5 - 0.7526074362238322);
var myreldevnod0_5 = abs(x_5/0.7526074362238322 - 1);
var myabsdevnod0_6 = abs(x_6 - 0.8786508746591393);
var myreldevnod0_6 = abs(x_6/0.8786508746591393 - 1);
var myabsdevnod1_0 = (1/2)*(abs(myabsdevnod0_0 - myabsdevnod0_1) + (myabsdevnod0_0 + myabsdevnod0_1));
var myreldevnod1_0 = (1/2)*(abs(myreldevnod0_0 - myreldevnod0_1) + (myreldevnod0_0 + myreldevnod0_1));
var myabsdevnod1_2 = (1/2)*(abs(myabsdevnod0_2 - myabsdevnod0_3) + (myabsdevnod0_2 + myabsdevnod0_3));
var myreldevnod1_2 = (1/2)*(abs(myreldevnod0_2 - myreldevnod0_3) + (myreldevnod0_2 + myreldevnod0_3));
var myabsdevnod1_4 = (1/2)*(abs(myabsdevnod0_4 - myabsdevnod0_5) + (myabsdevnod0_4 + myabsdevnod0_5));
var myreldevnod1_4 = (1/2)*(abs(myreldevnod0_4 - myreldevnod0_5) + (myreldevnod0_4 + myreldevnod0_5));
var myabsdevnod1_6 = myabsdevnod0_6;
var myreldevnod1_6 = myreldevnod0_6;
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
solve;
display x_1;
display x_2;
display x_3;
display x_4;
display x_5;
display x_6;
display myminfun;
display zmyabsdevmax;
display zmyreldevmax;
# End Model
