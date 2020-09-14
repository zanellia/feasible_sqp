# Model tp101
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param a := -1/4;
var x_1 >= 1/10, <= 10;
let x_1 := 6;
var x_2 >= 1/10, <= 10;
let x_2 := 6;
var x_3 >= 1/10, <= 10;
let x_3 := 6;
var x_4 >= 1/10, <= 10;
let x_4 := 6;
var x_5 >= 1/10, <= 10;
let x_5 := 6;
var x_6 >= 1/10, <= 10;
let x_6 := 6;
var x_7 >= 1/100, <= 10;
let x_7 := 6;
var c_1 = 1 - (1/2)*x_1^(1/2)*x_3^(-1)*x_6^(-2)*x_7 - (7/10)*x_1^3*x_2*x_3^(-2)*x_6*x_7^(1/2) -
(2/10)*x_2^(-1)*x_3*x_4^(-1/2)*x_6^(2/3)* x_7^(1/4);
var c_2 = 1 - (13/10)*x_1^(-1/2)*x_2*x_3^(-1)*x_5^(-1)* x_6 - (8/10)*x_3*x_4^(-1)*x_5^(-1)*x_6^2 -
(31/10)*x_1^(-1)*x_2^(1/2)*x_4^(-2)* x_5^(-1)*x_6^(1/3);
var c_3 = 1 - 2*x_1*x_3^(-3/2)*x_5*x_6^(-1)*x_7^(1/3) - (1/10)*x_2*x_3^(-1/2)*x_5*x_6^(-1)* x_7^(-1/2) -
x_1^(-1)*x_2*x_3^(1/2)*x_5 - (65/100)*x_2^(-2)*x_3*x_5*x_6^(-1)*x_7;
var c_4 = 1 - (2/10)*x_1^(-2)*x_2*x_4^(-1)*x_5^(1/2)* x_7^(1/3) - (3/10)*x_1^(1/2)*x_2^2*x_3*x_4^(1/3)*
x_7^(1/4)*x_5^(-2/3) - (4/10)*x_1^(-3)*x_2^(-2)*x_3*x_5* x_7^(3/4) - (1/2)*x_3^(-2)*x_4*x_7^(1/2);
var mf = 10*x_1*x_2^(-1)*x_4^2*x_6^(-3)*x_7^a + 15*x_1^(-1)*x_2^(-2)*x_3*x_4*x_5^(-1)* x_7^(-1/2) +
20*x_1^(-2)*x_2*x_4^(-1)*x_5^(-2)*x_6 + 25*x_1^2*x_2^2*x_3^(-1)*x_5^(1/2)* x_6^(-2)*x_7;
var c_5 = mf - 100;
var c_6 = 3000 - mf;
var myminfun = mf;
var myabsdevnod0_0 = abs(myminfun - 1809.764765571414);
var myreldevnod0_0 = abs(myminfun/1809.764765571414 - 1);
var myabsdevnod0_1 = abs(x_1 - 2.856158555755147);
var myreldevnod0_1 = abs(x_1/2.856158555755147 - 1);
var myabsdevnod0_2 = abs(x_2 - 0.6108230308034505);
var myreldevnod0_2 = abs(x_2/0.6108230308034505 - 1);
var myabsdevnod0_3 = abs(x_3 - 2.150812562164474);
var myreldevnod0_3 = abs(x_3/2.150812562164474 - 1);
var myabsdevnod0_4 = abs(x_4 - 4.71287370924123);
var myreldevnod0_4 = abs(x_4/4.71287370924123 - 1);
var myabsdevnod0_5 = abs(x_5 - 0.9994875408574642);
var myreldevnod0_5 = abs(x_5/0.9994875408574642 - 1);
var myabsdevnod0_6 = abs(x_6 - 1.347507504828331);
var myreldevnod0_6 = abs(x_6/1.347507504828331 - 1);
var myabsdevnod0_7 = abs(x_7 - 0.0316527665027743);
var myreldevnod0_7 = abs(x_7/0.0316527665027743 - 1);
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
subject to ci_5: c_5 >= 0;
subject to ci_6: c_6 >= 0;
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
