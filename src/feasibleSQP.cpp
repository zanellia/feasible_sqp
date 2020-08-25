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
// #include "qrecipe_data.hpp"
#include <casadi/casadi.hpp>
#include <casadi/casadi_c.h>
#include "ca_dfdy.h"
#include "ca_dgdy.h"
#include "ca_g.h"
#include "ca_dLdyy.h"

using namespace casadi;
using namespace std;

int main( )
{
    #define nv 10
    #define ni 1

    Function ca_dfdy = external("ca_dfdy");
    vector<double> y = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
    vector<double> lam = {1};
    vector<DM> ca_arg = {reshape(DM(y), nv, 1)};
    vector<DM> dfdy_eval = ca_dfdy(ca_arg);
    cout << "result (0): " << dfdy_eval.at(0) << endl;

    Function ca_g = external("ca_g");
    vector<DM> g_eval = ca_g(ca_arg);
    cout << "result (0): " << g_eval.at(0) << endl;

    Function ca_dgdy = external("ca_dgdy");
    vector<DM> dgdy_eval = ca_dgdy(ca_arg);
    cout << "result (0): " << dgdy_eval.at(0) << endl;

    Function ca_dLdyy = external("ca_dLdyy");
    ca_arg = {reshape(DM(y), nv, 1), reshape(DM(lam), ni, 1)};
    vector<DM> dLdyy_eval = ca_dLdyy(ca_arg);
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

    sparse_int_t A_ir[nrow];
    sparse_int_t A_jc[ncol];
    real_t A_val[nnz];

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

    // evaluate A

    /* Allocate input/output buffers and work vectors*/
    const double *arg[sz_arg];
    double *res[sz_res];
    casadi_int iw[sz_iw];
    double w[sz_w];

    /* Function input and output */
    const double y_val[nv] = {0};
    double res0[nv*nv];

    // Allocate memory (thread-safe)
    ca_dgdy_incref();

    /* Evaluate the function */
    arg[0] = y_val;
    res[0] = A_val;

    // Checkout thread-local memory (not thread-safe)
    int mem = ca_dgdy_checkout();

    // Evaluation is thread-safe
    if (ca_dgdy(arg, res, iw, w, mem)) return 1;

    // Release thread-local (not thread-safe)
    ca_dgdy_release(mem);

    /* Print result of evaluation */
    for (int j=0;j<nnz;j++)
        printf("A[%i] = %f\n", j, A_val[j]);

    // get sparsity patterns
    n_in = ca_dLdyy_n_in();
    n_out = ca_dLdyy_n_out();

    sz_arg=n_in;
    sz_res=n_out;
    sz_iw=0;
    sz_w=0;

    ca_dLdyy_work(&sz_arg, &sz_res, &sz_iw, &sz_w);
    printf("Work vector sizes:\n");
    printf("sz_arg = %lld, sz_res = %lld, sz_iw = %lld, sz_w = %lld\n\n",
           sz_arg, sz_res, sz_iw, sz_w);

    /* Print the sparsities of the inputs and outputs */
    // skip inputs
    ca_i = n_in;
    // Retrieve the sparsity pattern - CasADi uses column compressed storage (CCS)
    printf("Output %lld\n", ca_i-n_in);
    sp_i = ca_dLdyy_sparsity_out(ca_i-n_in);
    if (sp_i==0) return 1;
    nrow = *sp_i++; /* Number of rows */
    ncol = *sp_i++; /* Number of columns */
    colind = sp_i; /* Column offsets */
    row = sp_i + ncol+1; /* Row nonzero */
    nnz = sp_i[ncol]; /* Number of nonzeros */

    sparse_int_t H_ir[nrow];
    sparse_int_t H_jc[ncol];
    real_t H_val[nnz];

    /* Print the pattern */
    printf("  Dimension: %lld-by-%lld (%lld nonzeros)\n", nrow, ncol, nnz);
    printf("  Nonzeros: {");
    for(cc=0; cc<ncol; ++cc){                    /* loop over columns */
      for(el=colind[cc]; el<colind[cc+1]; ++el){ /* loop over the nonzeros entries of the column */
        if(el!=0) printf(", ");                  /* Separate the entries */
        rr = row[el];                            /* Get the row */
        printf("{%lld,%lld}",rr,cc);                 /* Print the nonzero */
      }
    }
    printf("}\n\n");

    // evaluate H

    /* Allocate input/output buffers and work vectors*/
    const double *arg_H[sz_arg];
    double *res_H[sz_res];
    casadi_int iw_H[sz_iw];
    double w_H[sz_w];

    /* Function input and output */

    // Allocate memory (thread-safe)
    ca_dLdyy_incref();

    /* Evaluate the function */
    arg_H[0] = y_val;
    res_H[0] = H_val;

    // Checkout thread-local memory (not thread-safe)
    int mem_H = ca_dLdyy_checkout();

    // Evaluation is thread-safe
    if (ca_dLdyy(arg_H, res_H, iw_H, w_H, mem_H)) return 1;

    // Release thread-local (not thread-safe)
    ca_dLdyy_release(mem);

    /* Print result of evaluation */
    for (int j=0;j<nnz;j++)
        printf("H[%i] = %f\n", j, H_val[j]);

	long i;
	int_t nWSR;
	real_t tic, toc;
	real_t *x3 = new real_t[nv];
	real_t *y3 = new real_t[nv + ni];

	// create sparse matrices
	SymSparseMat *H = new SymSparseMat(nv, nv, H_ir, H_jc, H_val);
	SparseMatrix *A = new SparseMatrix(ni, ni, A_ir, A_jc, A_val);

	H->createDiagInfo();

	// // solve with sparse matrices (Schur complement) 
	// nWSR = 1000;
	// SQProblemSchur qrecipeSchur(nv, ni);
	// tic = getCPUtime();
	// qrecipeSchur.init(H, g, A, lb, ub, lbA, ubA, nWSR, 0);
	// toc = getCPUtime();

	// fprintf(stdFile, "Solved sparse problem (Schur complement approach) in %d iterations, %.3f seconds.\n", (int)nWSR, toc-tic);
    
    // // update vectors and solve hotstarted QP
	// tic = getCPUtime();
	// qrecipeSchur.hotstart(g, lb, ub, lbA, ubA, nWSR, 0);
	// toc = getCPUtime();
	// qrecipeSchur.getPrimalSolution(x3);
	// qrecipeSchur.getDualSolution(y3);

	// fprintf(stdFile, "Solved hotstarted sparse problem (Schur complement approach) in %d iterations, %.3f seconds.\n", (int)nWSR, toc-tic);

	// delete H;
	// delete A;

	// delete[] y3;
	// delete[] x3;

	// return 0;
}


/*
 *	end of file
 */
