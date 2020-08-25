/*
 *	This file is part of qpOASES.
 *
 *	qpOASES -- An Implementation of the Online Active Set Strategy.
 *	Copyright (C) 2007-2017 by Hans Joachim Ferreau, Andreas Potschka,
 *	Christian Kirches et al. All rights reserved.
 *
 *	qpOASES is free software; you can redistribute it and/or
 *	modify it under the terms of the GNU Lesser General Public
 *	License as published by the Free Software Foundation; either
 *	version 2.1 of the License, or (at your option) any later version.
 *
 *	qpOASES is distributed in the hope that it will be useful,
 *	but WITHOUT ANY WARRANTY; without even the implied warranty of
 *	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *	See the GNU Lesser General Public License for more details.
 *
 *	You should have received a copy of the GNU Lesser General Public
 *	License along with qpOASES; if not, write to the Free Software
 *	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */


/**
 *	\file examples/feasibleSQP.cpp
 *	\author Andrea Zanelli
 *	\version 3.2
 *	\date 2007-2017
 *
 *	QRECIPE example from the CUTEr test set with sparse matrices.
 *	Comparison between nullspace factorization (dense and sparse) and
 *	Schur complement approach.
 */



#include <qpOASES.hpp>
#include "qrecipe_data.hpp"
// #include <casadi/casadi.hpp>
// using namespace casadi;
// using namespace std;



int main( )
{
	USING_NAMESPACE_QPOASES

	long i;
	int_t nWSR;
	real_t tic, toc;
	real_t *x3 = new real_t[180];
	real_t *y3 = new real_t[271];

	// create sparse matrices
	SymSparseMat *H = new SymSparseMat(180, 180, H_ir, H_jc, H_val);
	SparseMatrix *A = new SparseMatrix(91, 180, A_ir, A_jc, A_val);

	H->createDiagInfo();

	// solve with sparse matrices (Schur complement) 
	nWSR = 1000;
	SQProblemSchur qrecipeSchur(180, 91);
	tic = getCPUtime();
	qrecipeSchur.init(H, g, A, lb, ub, lbA, ubA, nWSR, 0);
	toc = getCPUtime();

	fprintf(stdFile, "Solved sparse problem (Schur complement approach) in %d iterations, %.3f seconds.\n", (int)nWSR, toc-tic);
    
    // update vectors and solve hotstarted QP
	tic = getCPUtime();
	qrecipeSchur.hotstart(g, lb, ub, lbA, ubA, nWSR, 0);
	toc = getCPUtime();
	qrecipeSchur.getPrimalSolution(x3);
	qrecipeSchur.getDualSolution(y3);

	fprintf(stdFile, "Solved hotstarted sparse problem (Schur complement approach) in %d iterations, %.3f seconds.\n", (int)nWSR, toc-tic);

	delete H;
	delete A;

	delete[] y3;
	delete[] x3;

	return 0;
}


/*
 *	end of file
 */
