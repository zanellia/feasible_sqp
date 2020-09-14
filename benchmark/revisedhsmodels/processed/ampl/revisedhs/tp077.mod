# Model tp077
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1;
let x_1 := 2;
var x_2;
let x_2 := 2;
var x_3;
let x_3 := 2;
var x_4;
let x_4 := 2;
var x_5;
let x_5 := 2;
var myminfun = (x_1 - 1)^2 + (x_1 - x_2)^2 + (x_3 - 1)^2 + (x_4 - 1)^4 + (x_5 - 1)^6;
var myabsdevnod0_0 = abs(myminfun - 0.2415051287901787);
var myreldevnod0_0 = abs(myminfun/0.2415051287901787 - 1);
var myabsdevnod0_1 = abs(x_1 - 1.166172189709298);
var myreldevnod0_1 = abs(x_1/1.166172189709298 - 1);
var myabsdevnod0_2 = abs(x_2 - 1.182111388802704);
var myreldevnod0_2 = abs(x_2/1.182111388802704 - 1);
var myabsdevnod0_3 = abs(x_3 - 1.38025704314546);
var myreldevnod0_3 = abs(x_3/1.38025704314546 - 1);
var myabsdevnod0_4 = abs(x_4 - 1.506036273623046);
var myreldevnod0_4 = abs(x_4/1.506036273623046 - 1);
var myabsdevnod0_5 = abs(x_5 - 0.6109201960430908);
var myreldevnod0_5 = abs(x_5/0.6109201960430908 - 1);
var myabsdevnod1_0 = (1/2)*(abs(myabsdevnod0_0 - myabsdevnod0_1) + (myabsdevnod0_0 + myabsdevnod0_1));
var myreldevnod1_0 = (1/2)*(abs(myreldevnod0_0 - myreldevnod0_1) + (myreldevnod0_0 + myreldevnod0_1));
var myabsdevnod1_2 = (1/2)*(abs(myabsdevnod0_2 - myabsdevnod0_3) + (myabsdevnod0_2 + myabsdevnod0_3));
var myreldevnod1_2 = (1/2)*(abs(myreldevnod0_2 - myreldevnod0_3) + (myreldevnod0_2 + myreldevnod0_3));
var myabsdevnod1_4 = (1/2)*(abs(myabsdevnod0_4 - myabsdevnod0_5) + (myabsdevnod0_4 + myabsdevnod0_5));
var myreldevnod1_4 = (1/2)*(abs(myreldevnod0_4 - myreldevnod0_5) + (myreldevnod0_4 + myreldevnod0_5));
var myabsdevnod2_0 = (1/2)*(abs(myabsdevnod1_0 - myabsdevnod1_2) + (myabsdevnod1_0 + myabsdevnod1_2));
var myreldevnod2_0 = (1/2)*(abs(myreldevnod1_0 - myreldevnod1_2) + (myreldevnod1_0 + myreldevnod1_2));
var myabsdevnod2_4 = myabsdevnod1_4;
var myreldevnod2_4 = myreldevnod1_4;
var myabsdevnod3_0 = (1/2)*(abs(myabsdevnod2_0 - myabsdevnod2_4) + (myabsdevnod2_0 + myabsdevnod2_4));
var myreldevnod3_0 = (1/2)*(abs(myreldevnod2_0 - myreldevnod2_4) + (myreldevnod2_0 + myreldevnod2_4));
var zmyabsdevmax = myabsdevnod3_0;
var zmyreldevmax = myreldevnod3_0;
minimize obj: myminfun;
subject to ce_1: x_1^2*x_4 + sin(x_4 - x_5) - 2*sqrt(2) = 0;
subject to ce_2: x_2 + x_3^4*x_4^2 - 8 - sqrt(2) = 0;
solve;
display x_1;
display x_2;
display x_3;
display x_4;
display x_5;
display myminfun;
display zmyabsdevmax;
display zmyreldevmax;
# End Model
