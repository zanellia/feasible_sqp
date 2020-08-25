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
#include <casadi/casadi.hpp>
#include <casadi/casadi_c.h>
#include "ca_dfdy.h"
#include "ca_dgdy.h"
#include "ca_g.h"
#include "ca_dLdyy.h"

using namespace casadi;
using namespace std;

void usage_cplusplus(){
  cout << "---" << endl;
  cout << "Usage from CasADi C++:" << endl;
  cout << endl;

  // Use CasADi's "external" to load the compiled function
  Function f = external("f");

  // Use like any other CasADi function
  vector<double> x = {1, 2, 3, 4};
  vector<DM> arg = {reshape(DM(x), 2, 2), 5};
  vector<DM> res = f(arg);

  cout << "result (0): " << res.at(0) << endl;
  cout << "result (1): " << res.at(1) << endl;
}

int main( )
{
    #define nv 2
    #define ni 1

    Function ca_dfdy = external("ca_dfdy");
    vector<double> y = {1, 2};
    vector<double> lam = {1};
    vector<DM> arg = {reshape(DM(y), 2, 1)};
    vector<DM> dfdy_eval = ca_dfdy(arg);
    cout << "result (0): " << dfdy_eval.at(0) << endl;

    Function ca_g = external("ca_g");
    vector<DM> g_eval = ca_g(arg);
    cout << "result (0): " << g_eval.at(0) << endl;

    Function ca_dgdy = external("ca_dgdy");
    vector<DM> dgdy_eval = ca_dgdy(arg);
    cout << "result (0): " << dgdy_eval.at(0) << endl;

    Function ca_dLdyy = external("ca_dLdyy");
    arg = {reshape(DM(y), nv, 1), reshape(DM(lam), ni, 1)};
    vector<DM> dLdyy_eval = ca_dLdyy(arg);
    cout << "result (0): " << dLdyy_eval.at(0) << endl;

	USING_NAMESPACE_QPOASES

    // get sparsity patterns
    casadi_int n_in = ca_dgdy_n_in();
    casadi_int n_out = ca_dgdy_n_out();

    casadi_int sz_arg=n_in, sz_res=n_out, sz_iw=0, sz_w=0;

    ca_dgdy_work(&sz_arg, &sz_res, &sz_iw, &sz_w);
    printf("Work vector sizes:\n");
    printf("sz_arg = %lld, sz_res = %lld, sz_iw = %lld, sz_w = %lld\n\n",
           sz_arg, sz_res, sz_iw, sz_w);

    casadi_int nnz; 
    casadi_int ncol; 
    /* Print the sparsities of the inputs and outputs */
    casadi_int ca_i;
    // skip inputs
    ca_i = n_in;
    // Retrieve the sparsity pattern - CasADi uses column compressed storage (CCS)
    const casadi_int *sp_i;
    printf("Output %lld\n", ca_i-n_in);
    sp_i = ca_dgdy_sparsity_out(ca_i-n_in);
    if (sp_i==0) return 1;
    casadi_int nrow = *sp_i++; /* Number of rows */
    ncol = *sp_i++; /* Number of columns */
    const casadi_int *colind = sp_i; /* Column offsets */
    const casadi_int *row = sp_i + ncol+1; /* Row nonzero */
    nnz = sp_i[ncol]; /* Number of nonzeros */

    sparse_int_t A_ir[nnz];
    sparse_int_t A_jc[ncol];
    sparse_int_t A_val[nrow];

    /* Print the pattern */
    printf("  Dimension: %lld-by-%lld (%lld nonzeros)\n", nrow, ncol, nnz);
    printf("  Nonzeros: {");
    casadi_int rr,cc,el;
    for(cc=0; cc<ncol; ++cc){                    /* loop over columns */
      for(el=colind[cc]; el<colind[cc+1]; ++el){ /* loop over the nonzeros entries of the column */
        if(el!=0) printf(", ");                  /* Separate the entries */
        rr = row[el];                            /* Get the row */
        printf("{%lld,%lld}",rr,cc);                 /* Print the nonzero */
      }
    }
    printf("}\n\n");

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
