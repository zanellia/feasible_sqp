#
#**************************
# SET UP THE INITIAL DATA *
#**************************
#   Problem :
#   *********
#   A nonlinear minmax problem in eleven variables.
#   Note: the original statement of the problem contains an inconsistant
#         index i.  This has been replaced by 1, assuming a very common typo.
#         But the optimal solution of the resulting problem differs from that
#         quoted in the source. 
#   Source: 
#   E. Polak, D.H. Mayne and J.E. Higgins,
#   "Superlinearly convergent algorithm for min-max problems"
#   JOTA 69, pp. 407-439, 1991.
#   SIF input: Ph. Toint, Nov 1993.
#   classification  LOR2-AN-12-10
#   All variables are free
#   Solution
	param im1 := -1 + (10);
	param rim1 := 9.0;
	param jm1 := -1 + (11);
	param rjm1 := 11;
	param rj := 11;

	var x1 := 1.0;
	var x2 := 1.0;
	var x3 := 1.0;
	var x4 := 1.0;
	var x5 := 1.0;
	var x6 := 1.0;
	var x7 := 1.0;
	var x8 := 1.0;
	var x9 := 1.0;
	var x10 := 1.0;
	var x11 := 1.0;
	var u := 1.0;

minimize obj:
	u;

subject to f1:
	0 >= (exp((x1-sin(0.0+1.0+1.0))*(x1-sin(0.0+1.0+1.0)))) + 
	0.5*(exp((x2-sin(0.0+2.0+2.0))*(x2-sin(0.0+2.0+2.0)))) + 
	0.3333333333333333*(exp((x3-sin(0.0+3.0+3.0))*(x3-sin(0.0+3.0+3.0)))) + 
	0.25*(exp((x4-sin(0.0+4.0+4.0))*(x4-sin(0.0+4.0+4.0)))) + 
	0.2*(exp((x5-sin(0.0+5.0+5.0))*(x5-sin(0.0+5.0+5.0)))) + 
	0.16666666666666666*(exp((x6-sin(0.0+6.0+6.0))*(x6-sin(0.0+6.0+6.0)))) + 
	0.14285714285714285*(exp((x7-sin(0.0+7.0+7.0))*(x7-sin(0.0+7.0+7.0)))) + 
	0.125*(exp((x8-sin(0.0+8.0+8.0))*(x8-sin(0.0+8.0+8.0)))) + 
	0.1111111111111111*(exp((x9-sin(0.0+9.0+9.0))*(x9-sin(0.0+9.0+9.0)))) + 
	0.1*(exp((x10-sin(0.0+10.0+10.0))*(x10-sin(0.0+10.0+10.0)))) + 
	0.09090909090909091*(exp((x11-sin(0.0+11.0+11.0))*(x11-sin(0.0+11.0+11.0)))) - 
	u;
subject to f2:
	0 >= (exp((x1-sin(1.0+1.0+1.0))*(x1-sin(1.0+1.0+1.0)))) + 
	0.5*(exp((x2-sin(1.0+2.0+2.0))*(x2-sin(1.0+2.0+2.0)))) + 
	0.3333333333333333*(exp((x3-sin(1.0+3.0+3.0))*(x3-sin(1.0+3.0+3.0)))) + 
	0.25*(exp((x4-sin(1.0+4.0+4.0))*(x4-sin(1.0+4.0+4.0)))) + 
	0.2*(exp((x5-sin(1.0+5.0+5.0))*(x5-sin(1.0+5.0+5.0)))) + 
	0.16666666666666666*(exp((x6-sin(1.0+6.0+6.0))*(x6-sin(1.0+6.0+6.0)))) + 
	0.14285714285714285*(exp((x7-sin(1.0+7.0+7.0))*(x7-sin(1.0+7.0+7.0)))) + 
	0.125*(exp((x8-sin(1.0+8.0+8.0))*(x8-sin(1.0+8.0+8.0)))) + 
	0.1111111111111111*(exp((x9-sin(1.0+9.0+9.0))*(x9-sin(1.0+9.0+9.0)))) + 
	0.1*(exp((x10-sin(1.0+10.0+10.0))*(x10-sin(1.0+10.0+10.0)))) + 
	0.09090909090909091*(exp((x11-sin(1.0+11.0+11.0))*(x11-sin(1.0+11.0+11.0)))) - 
	u;
subject to f3:
	0 >= (exp((x1-sin(2.0+1.0+1.0))*(x1-sin(2.0+1.0+1.0)))) + 
	0.5*(exp((x2-sin(2.0+2.0+2.0))*(x2-sin(2.0+2.0+2.0)))) + 
	0.3333333333333333*(exp((x3-sin(2.0+3.0+3.0))*(x3-sin(2.0+3.0+3.0)))) + 
	0.25*(exp((x4-sin(2.0+4.0+4.0))*(x4-sin(2.0+4.0+4.0)))) + 
	0.2*(exp((x5-sin(2.0+5.0+5.0))*(x5-sin(2.0+5.0+5.0)))) + 
	0.16666666666666666*(exp((x6-sin(2.0+6.0+6.0))*(x6-sin(2.0+6.0+6.0)))) + 
	0.14285714285714285*(exp((x7-sin(2.0+7.0+7.0))*(x7-sin(2.0+7.0+7.0)))) + 
	0.125*(exp((x8-sin(2.0+8.0+8.0))*(x8-sin(2.0+8.0+8.0)))) + 
	0.1111111111111111*(exp((x9-sin(2.0+9.0+9.0))*(x9-sin(2.0+9.0+9.0)))) + 
	0.1*(exp((x10-sin(2.0+10.0+10.0))*(x10-sin(2.0+10.0+10.0)))) + 
	0.09090909090909091*(exp((x11-sin(2.0+11.0+11.0))*(x11-sin(2.0+11.0+11.0)))) - 
	u;
subject to f4:
	0 >= (exp((x1-sin(3.0+1.0+1.0))*(x1-sin(3.0+1.0+1.0)))) + 
	0.5*(exp((x2-sin(3.0+2.0+2.0))*(x2-sin(3.0+2.0+2.0)))) + 
	0.3333333333333333*(exp((x3-sin(3.0+3.0+3.0))*(x3-sin(3.0+3.0+3.0)))) + 
	0.25*(exp((x4-sin(3.0+4.0+4.0))*(x4-sin(3.0+4.0+4.0)))) + 
	0.2*(exp((x5-sin(3.0+5.0+5.0))*(x5-sin(3.0+5.0+5.0)))) + 
	0.16666666666666666*(exp((x6-sin(3.0+6.0+6.0))*(x6-sin(3.0+6.0+6.0)))) + 
	0.14285714285714285*(exp((x7-sin(3.0+7.0+7.0))*(x7-sin(3.0+7.0+7.0)))) + 
	0.125*(exp((x8-sin(3.0+8.0+8.0))*(x8-sin(3.0+8.0+8.0)))) + 
	0.1111111111111111*(exp((x9-sin(3.0+9.0+9.0))*(x9-sin(3.0+9.0+9.0)))) + 
	0.1*(exp((x10-sin(3.0+10.0+10.0))*(x10-sin(3.0+10.0+10.0)))) + 
	0.09090909090909091*(exp((x11-sin(3.0+11.0+11.0))*(x11-sin(3.0+11.0+11.0)))) - 
	u;
subject to f5:
	0 >= (exp((x1-sin(4.0+1.0+1.0))*(x1-sin(4.0+1.0+1.0)))) + 
	0.5*(exp((x2-sin(4.0+2.0+2.0))*(x2-sin(4.0+2.0+2.0)))) + 
	0.3333333333333333*(exp((x3-sin(4.0+3.0+3.0))*(x3-sin(4.0+3.0+3.0)))) + 
	0.25*(exp((x4-sin(4.0+4.0+4.0))*(x4-sin(4.0+4.0+4.0)))) + 
	0.2*(exp((x5-sin(4.0+5.0+5.0))*(x5-sin(4.0+5.0+5.0)))) + 
	0.16666666666666666*(exp((x6-sin(4.0+6.0+6.0))*(x6-sin(4.0+6.0+6.0)))) + 
	0.14285714285714285*(exp((x7-sin(4.0+7.0+7.0))*(x7-sin(4.0+7.0+7.0)))) + 
	0.125*(exp((x8-sin(4.0+8.0+8.0))*(x8-sin(4.0+8.0+8.0)))) + 
	0.1111111111111111*(exp((x9-sin(4.0+9.0+9.0))*(x9-sin(4.0+9.0+9.0)))) + 
	0.1*(exp((x10-sin(4.0+10.0+10.0))*(x10-sin(4.0+10.0+10.0)))) + 
	0.09090909090909091*(exp((x11-sin(4.0+11.0+11.0))*(x11-sin(4.0+11.0+11.0)))) - 
	u;
subject to f6:
	0 >= (exp((x1-sin(5.0+1.0+1.0))*(x1-sin(5.0+1.0+1.0)))) + 
	0.5*(exp((x2-sin(5.0+2.0+2.0))*(x2-sin(5.0+2.0+2.0)))) + 
	0.3333333333333333*(exp((x3-sin(5.0+3.0+3.0))*(x3-sin(5.0+3.0+3.0)))) + 
	0.25*(exp((x4-sin(5.0+4.0+4.0))*(x4-sin(5.0+4.0+4.0)))) + 
	0.2*(exp((x5-sin(5.0+5.0+5.0))*(x5-sin(5.0+5.0+5.0)))) + 
	0.16666666666666666*(exp((x6-sin(5.0+6.0+6.0))*(x6-sin(5.0+6.0+6.0)))) + 
	0.14285714285714285*(exp((x7-sin(5.0+7.0+7.0))*(x7-sin(5.0+7.0+7.0)))) + 
	0.125*(exp((x8-sin(5.0+8.0+8.0))*(x8-sin(5.0+8.0+8.0)))) + 
	0.1111111111111111*(exp((x9-sin(5.0+9.0+9.0))*(x9-sin(5.0+9.0+9.0)))) + 
	0.1*(exp((x10-sin(5.0+10.0+10.0))*(x10-sin(5.0+10.0+10.0)))) + 
	0.09090909090909091*(exp((x11-sin(5.0+11.0+11.0))*(x11-sin(5.0+11.0+11.0)))) - 
	u;
subject to f7:
	0 >= (exp((x1-sin(6.0+1.0+1.0))*(x1-sin(6.0+1.0+1.0)))) + 
	0.5*(exp((x2-sin(6.0+2.0+2.0))*(x2-sin(6.0+2.0+2.0)))) + 
	0.3333333333333333*(exp((x3-sin(6.0+3.0+3.0))*(x3-sin(6.0+3.0+3.0)))) + 
	0.25*(exp((x4-sin(6.0+4.0+4.0))*(x4-sin(6.0+4.0+4.0)))) + 
	0.2*(exp((x5-sin(6.0+5.0+5.0))*(x5-sin(6.0+5.0+5.0)))) + 
	0.16666666666666666*(exp((x6-sin(6.0+6.0+6.0))*(x6-sin(6.0+6.0+6.0)))) + 
	0.14285714285714285*(exp((x7-sin(6.0+7.0+7.0))*(x7-sin(6.0+7.0+7.0)))) + 
	0.125*(exp((x8-sin(6.0+8.0+8.0))*(x8-sin(6.0+8.0+8.0)))) + 
	0.1111111111111111*(exp((x9-sin(6.0+9.0+9.0))*(x9-sin(6.0+9.0+9.0)))) + 
	0.1*(exp((x10-sin(6.0+10.0+10.0))*(x10-sin(6.0+10.0+10.0)))) + 
	0.09090909090909091*(exp((x11-sin(6.0+11.0+11.0))*(x11-sin(6.0+11.0+11.0)))) - 
	u;
subject to f8:
	0 >= (exp((x1-sin(7.0+1.0+1.0))*(x1-sin(7.0+1.0+1.0)))) + 
	0.5*(exp((x2-sin(7.0+2.0+2.0))*(x2-sin(7.0+2.0+2.0)))) + 
	0.3333333333333333*(exp((x3-sin(7.0+3.0+3.0))*(x3-sin(7.0+3.0+3.0)))) + 
	0.25*(exp((x4-sin(7.0+4.0+4.0))*(x4-sin(7.0+4.0+4.0)))) + 
	0.2*(exp((x5-sin(7.0+5.0+5.0))*(x5-sin(7.0+5.0+5.0)))) + 
	0.16666666666666666*(exp((x6-sin(7.0+6.0+6.0))*(x6-sin(7.0+6.0+6.0)))) + 
	0.14285714285714285*(exp((x7-sin(7.0+7.0+7.0))*(x7-sin(7.0+7.0+7.0)))) + 
	0.125*(exp((x8-sin(7.0+8.0+8.0))*(x8-sin(7.0+8.0+8.0)))) + 
	0.1111111111111111*(exp((x9-sin(7.0+9.0+9.0))*(x9-sin(7.0+9.0+9.0)))) + 
	0.1*(exp((x10-sin(7.0+10.0+10.0))*(x10-sin(7.0+10.0+10.0)))) + 
	0.09090909090909091*(exp((x11-sin(7.0+11.0+11.0))*(x11-sin(7.0+11.0+11.0)))) - 
	u;
subject to f9:
	0 >= (exp((x1-sin(8.0+1.0+1.0))*(x1-sin(8.0+1.0+1.0)))) + 
	0.5*(exp((x2-sin(8.0+2.0+2.0))*(x2-sin(8.0+2.0+2.0)))) + 
	0.3333333333333333*(exp((x3-sin(8.0+3.0+3.0))*(x3-sin(8.0+3.0+3.0)))) + 
	0.25*(exp((x4-sin(8.0+4.0+4.0))*(x4-sin(8.0+4.0+4.0)))) + 
	0.2*(exp((x5-sin(8.0+5.0+5.0))*(x5-sin(8.0+5.0+5.0)))) + 
	0.16666666666666666*(exp((x6-sin(8.0+6.0+6.0))*(x6-sin(8.0+6.0+6.0)))) + 
	0.14285714285714285*(exp((x7-sin(8.0+7.0+7.0))*(x7-sin(8.0+7.0+7.0)))) + 
	0.125*(exp((x8-sin(8.0+8.0+8.0))*(x8-sin(8.0+8.0+8.0)))) + 
	0.1111111111111111*(exp((x9-sin(8.0+9.0+9.0))*(x9-sin(8.0+9.0+9.0)))) + 
	0.1*(exp((x10-sin(8.0+10.0+10.0))*(x10-sin(8.0+10.0+10.0)))) + 
	0.09090909090909091*(exp((x11-sin(8.0+11.0+11.0))*(x11-sin(8.0+11.0+11.0)))) - 
	u;
subject to f10:
	0 >= (exp((x1-sin(9.0+1.0+1.0))*(x1-sin(9.0+1.0+1.0)))) + 
	0.5*(exp((x2-sin(9.0+2.0+2.0))*(x2-sin(9.0+2.0+2.0)))) + 
	0.3333333333333333*(exp((x3-sin(9.0+3.0+3.0))*(x3-sin(9.0+3.0+3.0)))) + 
	0.25*(exp((x4-sin(9.0+4.0+4.0))*(x4-sin(9.0+4.0+4.0)))) + 
	0.2*(exp((x5-sin(9.0+5.0+5.0))*(x5-sin(9.0+5.0+5.0)))) + 
	0.16666666666666666*(exp((x6-sin(9.0+6.0+6.0))*(x6-sin(9.0+6.0+6.0)))) + 
	0.14285714285714285*(exp((x7-sin(9.0+7.0+7.0))*(x7-sin(9.0+7.0+7.0)))) + 
	0.125*(exp((x8-sin(9.0+8.0+8.0))*(x8-sin(9.0+8.0+8.0)))) + 
	0.1111111111111111*(exp((x9-sin(9.0+9.0+9.0))*(x9-sin(9.0+9.0+9.0)))) + 
	0.1*(exp((x10-sin(9.0+10.0+10.0))*(x10-sin(9.0+10.0+10.0)))) + 
	0.09090909090909091*(exp((x11-sin(9.0+11.0+11.0))*(x11-sin(9.0+11.0+11.0)))) - 
	u;

solve;
	display x1;
	display x2;
	display x3;
	display x4;
	display x5;
	display x6;
	display x7;
	display x8;
	display x9;
	display x10;
	display x11;
	display u;
display obj;
