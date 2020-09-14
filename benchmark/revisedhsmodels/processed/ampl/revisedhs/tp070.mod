# Model tp070
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param e1 := -1;
param e2 := 1;
param d1 := 7.658;
param d2 := 7.685;
param e := e1;
param d := d1;
param yobs_1 := 0.00189;
param yobs_2 := 0.1038;
param yobs_3 := 0.268;
param yobs_4 := 0.506;
param yobs_5 := 0.577;
param yobs_6 := 0.604;
param yobs_7 := 0.725;
param yobs_8 := 0.898;
param yobs_9 := 0.947;
param yobs_10 := 0.845;
param yobs_11 := 0.702;
param yobs_12 := 0.528;
param yobs_13 := 0.385;
param yobs_14 := 0.257;
param yobs_15 := 0.159;
param yobs_16 := 0.0869;
param yobs_17 := 0.0453;
param yobs_18 := 0.01509;
param yobs_19 := 0.00189;
param c_1 := 0.1;
param c_2 := 1;
param c_3 := c_2 + 1;
param c_4 := c_3 + 1;
param c_5 := c_4 + 1;
param c_6 := c_5 + 1;
param c_7 := c_6 + 1;
param c_8 := c_7 + 1;
param c_9 := c_8 + 1;
param c_10 := c_9 + 1;
param c_11 := c_10 + 1;
param c_12 := c_11 + 1;
param c_13 := c_12 + 1;
param c_14 := c_13 + 1;
param c_15 := c_14 + 1;
param c_16 := c_15 + 1;
param c_17 := c_16 + 1;
param c_18 := c_17 + 1;
param c_19 := c_18 + 1;
param s_0 := 0;
var x_1 >= 0.00001, <= 100;
let x_1 := 2;
var x_2 >= 0.00001, <= 100;
let x_2 := 4;
var x_3 >= 0.00001, <= 1;
let x_3 := 0.04;
var x_4 >= 0.00001, <= 100;
let x_4 := 2;
var b = x_3 + (1 - x_3)*x_4;
var ycal_1 = (1 + 1/(12*x_2))^e * x_3*b^x_2 * (x_2/6.2832)^(1/2) * (c_1/d)^(x_2 - 1) * exp(x_2 -
b*c_1*x_2/7.658) + (1 + 1/(12*x_1))^e * (1 - x_3) * (b/x_4)^x_1 * (x_1/6.2832)^(1/2) * (c_1/7.658)^(x_1 - 1)
* exp(x_1 - b*c_1*x_1/(7.658*x_4));
var ycal_2 = (1 + 1/(12*x_2))^e * x_3*b^x_2 * (x_2/6.2832)^(1/2) * (c_2/d)^(x_2 - 1) * exp(x_2 -
b*c_2*x_2/7.658) + (1 + 1/(12*x_1))^e * (1 - x_3) * (b/x_4)^x_1 * (x_1/6.2832)^(1/2) * (c_2/7.658)^(x_1 - 1)
* exp(x_1 - b*c_2*x_1/(7.658*x_4));
var ycal_3 = (1 + 1/(12*x_2))^e * x_3*b^x_2 * (x_2/6.2832)^(1/2) * (c_3/d)^(x_2 - 1) * exp(x_2 -
b*c_3*x_2/7.658) + (1 + 1/(12*x_1))^e * (1 - x_3) * (b/x_4)^x_1 * (x_1/6.2832)^(1/2) * (c_3/7.658)^(x_1 - 1)
* exp(x_1 - b*c_3*x_1/(7.658*x_4));
var ycal_4 = (1 + 1/(12*x_2))^e * x_3*b^x_2 * (x_2/6.2832)^(1/2) * (c_4/d)^(x_2 - 1) * exp(x_2 -
b*c_4*x_2/7.658) + (1 + 1/(12*x_1))^e * (1 - x_3) * (b/x_4)^x_1 * (x_1/6.2832)^(1/2) * (c_4/7.658)^(x_1 - 1)
* exp(x_1 - b*c_4*x_1/(7.658*x_4));
var ycal_5 = (1 + 1/(12*x_2))^e * x_3*b^x_2 * (x_2/6.2832)^(1/2) * (c_5/d)^(x_2 - 1) * exp(x_2 -
b*c_5*x_2/7.658) + (1 + 1/(12*x_1))^e * (1 - x_3) * (b/x_4)^x_1 * (x_1/6.2832)^(1/2) * (c_5/7.658)^(x_1 - 1)
* exp(x_1 - b*c_5*x_1/(7.658*x_4));
var ycal_6 = (1 + 1/(12*x_2))^e * x_3*b^x_2 * (x_2/6.2832)^(1/2) * (c_6/d)^(x_2 - 1) * exp(x_2 -
b*c_6*x_2/7.658) + (1 + 1/(12*x_1))^e * (1 - x_3) * (b/x_4)^x_1 * (x_1/6.2832)^(1/2) * (c_6/7.658)^(x_1 - 1)
* exp(x_1 - b*c_6*x_1/(7.658*x_4));
var ycal_7 = (1 + 1/(12*x_2))^e * x_3*b^x_2 * (x_2/6.2832)^(1/2) * (c_7/d)^(x_2 - 1) * exp(x_2 -
b*c_7*x_2/7.658) + (1 + 1/(12*x_1))^e * (1 - x_3) * (b/x_4)^x_1 * (x_1/6.2832)^(1/2) * (c_7/7.658)^(x_1 - 1)
* exp(x_1 - b*c_7*x_1/(7.658*x_4));
var ycal_8 = (1 + 1/(12*x_2))^e * x_3*b^x_2 * (x_2/6.2832)^(1/2) * (c_8/d)^(x_2 - 1) * exp(x_2 -
b*c_8*x_2/7.658) + (1 + 1/(12*x_1))^e * (1 - x_3) * (b/x_4)^x_1 * (x_1/6.2832)^(1/2) * (c_8/7.658)^(x_1 - 1)
* exp(x_1 - b*c_8*x_1/(7.658*x_4));
var ycal_9 = (1 + 1/(12*x_2))^e * x_3*b^x_2 * (x_2/6.2832)^(1/2) * (c_9/d)^(x_2 - 1) * exp(x_2 -
b*c_9*x_2/7.658) + (1 + 1/(12*x_1))^e * (1 - x_3) * (b/x_4)^x_1 * (x_1/6.2832)^(1/2) * (c_9/7.658)^(x_1 - 1)
* exp(x_1 - b*c_9*x_1/(7.658*x_4));
var ycal_10 = (1 + 1/(12*x_2))^e * x_3*b^x_2 * (x_2/6.2832)^(1/2) * (c_10/d)^(x_2 - 1) * exp(x_2 -
b*c_10*x_2/7.658) + (1 + 1/(12*x_1))^e * (1 - x_3) * (b/x_4)^x_1 * (x_1/6.2832)^(1/2) * (c_10/7.658)^(x_1 -
1) * exp(x_1 - b*c_10*x_1/(7.658*x_4));
var ycal_11 = (1 + 1/(12*x_2))^e * x_3*b^x_2 * (x_2/6.2832)^(1/2) * (c_11/d)^(x_2 - 1) * exp(x_2 -
b*c_11*x_2/7.658) + (1 + 1/(12*x_1))^e * (1 - x_3) * (b/x_4)^x_1 * (x_1/6.2832)^(1/2) * (c_11/7.658)^(x_1 -
1) * exp(x_1 - b*c_11*x_1/(7.658*x_4));
var ycal_12 = (1 + 1/(12*x_2))^e * x_3*b^x_2 * (x_2/6.2832)^(1/2) * (c_12/d)^(x_2 - 1) * exp(x_2 -
b*c_12*x_2/7.658) + (1 + 1/(12*x_1))^e * (1 - x_3) * (b/x_4)^x_1 * (x_1/6.2832)^(1/2) * (c_12/7.658)^(x_1 -
1) * exp(x_1 - b*c_12*x_1/(7.658*x_4));
var ycal_13 = (1 + 1/(12*x_2))^e * x_3*b^x_2 * (x_2/6.2832)^(1/2) * (c_13/d)^(x_2 - 1) * exp(x_2 -
b*c_13*x_2/7.658) + (1 + 1/(12*x_1))^e * (1 - x_3) * (b/x_4)^x_1 * (x_1/6.2832)^(1/2) * (c_13/7.658)^(x_1 -
1) * exp(x_1 - b*c_13*x_1/(7.658*x_4));
var ycal_14 = (1 + 1/(12*x_2))^e * x_3*b^x_2 * (x_2/6.2832)^(1/2) * (c_14/d)^(x_2 - 1) * exp(x_2 -
b*c_14*x_2/7.658) + (1 + 1/(12*x_1))^e * (1 - x_3) * (b/x_4)^x_1 * (x_1/6.2832)^(1/2) * (c_14/7.658)^(x_1 -
1) * exp(x_1 - b*c_14*x_1/(7.658*x_4));
var ycal_15 = (1 + 1/(12*x_2))^e * x_3*b^x_2 * (x_2/6.2832)^(1/2) * (c_15/d)^(x_2 - 1) * exp(x_2 -
b*c_15*x_2/7.658) + (1 + 1/(12*x_1))^e * (1 - x_3) * (b/x_4)^x_1 * (x_1/6.2832)^(1/2) * (c_15/7.658)^(x_1 -
1) * exp(x_1 - b*c_15*x_1/(7.658*x_4));
var ycal_16 = (1 + 1/(12*x_2))^e * x_3*b^x_2 * (x_2/6.2832)^(1/2) * (c_16/d)^(x_2 - 1) * exp(x_2 -
b*c_16*x_2/7.658) + (1 + 1/(12*x_1))^e * (1 - x_3) * (b/x_4)^x_1 * (x_1/6.2832)^(1/2) * (c_16/7.658)^(x_1 -
1) * exp(x_1 - b*c_16*x_1/(7.658*x_4));
var ycal_17 = (1 + 1/(12*x_2))^e * x_3*b^x_2 * (x_2/6.2832)^(1/2) * (c_17/d)^(x_2 - 1) * exp(x_2 -
b*c_17*x_2/7.658) + (1 + 1/(12*x_1))^e * (1 - x_3) * (b/x_4)^x_1 * (x_1/6.2832)^(1/2) * (c_17/7.658)^(x_1 -
1) * exp(x_1 - b*c_17*x_1/(7.658*x_4));
var ycal_18 = (1 + 1/(12*x_2))^e * x_3*b^x_2 * (x_2/6.2832)^(1/2) * (c_18/d)^(x_2 - 1) * exp(x_2 -
b*c_18*x_2/7.658) + (1 + 1/(12*x_1))^e * (1 - x_3) * (b/x_4)^x_1 * (x_1/6.2832)^(1/2) * (c_18/7.658)^(x_1 -
1) * exp(x_1 - b*c_18*x_1/(7.658*x_4));
var ycal_19 = (1 + 1/(12*x_2))^e * x_3*b^x_2 * (x_2/6.2832)^(1/2) * (c_19/d)^(x_2 - 1) * exp(x_2 -
b*c_19*x_2/7.658) + (1 + 1/(12*x_1))^e * (1 - x_3) * (b/x_4)^x_1 * (x_1/6.2832)^(1/2) * (c_19/7.658)^(x_1 -
1) * exp(x_1 - b*c_19*x_1/(7.658*x_4));
var s_1 = s_0 + (yobs_1 - ycal_1)^2;
var s_2 = s_1 + (yobs_2 - ycal_2)^2;
var s_3 = s_2 + (yobs_3 - ycal_3)^2;
var s_4 = s_3 + (yobs_4 - ycal_4)^2;
var s_5 = s_4 + (yobs_5 - ycal_5)^2;
var s_6 = s_5 + (yobs_6 - ycal_6)^2;
var s_7 = s_6 + (yobs_7 - ycal_7)^2;
var s_8 = s_7 + (yobs_8 - ycal_8)^2;
var s_9 = s_8 + (yobs_9 - ycal_9)^2;
var s_10 = s_9 + (yobs_10 - ycal_10)^2;
var s_11 = s_10 + (yobs_11 - ycal_11)^2;
var s_12 = s_11 + (yobs_12 - ycal_12)^2;
var s_13 = s_12 + (yobs_13 - ycal_13)^2;
var s_14 = s_13 + (yobs_14 - ycal_14)^2;
var s_15 = s_14 + (yobs_15 - ycal_15)^2;
var s_16 = s_15 + (yobs_16 - ycal_16)^2;
var s_17 = s_16 + (yobs_17 - ycal_17)^2;
var s_18 = s_17 + (yobs_18 - ycal_18)^2;
var s_19 = s_18 + (yobs_19 - ycal_19)^2;
var mf = s_19;
var myminfun = mf;
var myabsdevnod0_0 = abs(myminfun - 0.007498463574427645);
var myreldevnod0_0 = abs(myminfun/0.007498463574427645 - 1);
var myabsdevnod0_1 = abs(x_1 - 12.27697912756719);
var myreldevnod0_1 = abs(x_1/12.27697912756719 - 1);
var myabsdevnod0_2 = abs(x_2 - 4.631748162745852);
var myreldevnod0_2 = abs(x_2/4.631748162745852 - 1);
var myabsdevnod0_3 = abs(x_3 - 0.3128646302166193);
var myreldevnod0_3 = abs(x_3/0.3128646302166193 - 1);
var myabsdevnod0_4 = abs(x_4 - 2.029282825337289);
var myreldevnod0_4 = abs(x_4/2.029282825337289 - 1);
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
subject to ci_1: b >= 0;
solve;
display x_1;
display x_2;
display x_3;
display x_4;
display myminfun;
display zmyabsdevmax;
display zmyreldevmax;
# End Model
