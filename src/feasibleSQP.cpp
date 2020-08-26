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

#define MAXNWSR 100000
#define nv 1000
#define ni 50
#define YMAX 1

using namespace casadi;
using namespace std;

USING_NAMESPACE_QPOASES

int evaluate_dgdy(const double** arg, double** res, casadi_int* iw, double* w, int nnz, real_t* y_val, double* A_val) {

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
    // for (int j=0;j<nnz;j++)
    //     printf("A[%i] = %f\n", j, A_val[j]);

    return 0;

}

int evaluate_dLdyy(const double** arg, double** res, casadi_int* iw, double* w, int nnz, real_t* y_val, real_t* lam_val, double* H_val) {

    // Allocate memory (thread-safe)
    ca_dLdyy_incref();

    /* Evaluate the function */
    arg[0] = y_val;
    arg[1] = lam_val;
    res[0] = H_val;

    // Checkout thread-local memory (not thread-safe)
    int mem = ca_dLdyy_checkout();

    // Evaluation is thread-safe
    if (ca_dLdyy(arg, res, iw, w, mem)) return 1;

    // Release thread-local (not thread-safe)
    ca_dLdyy_release(mem);

    /* Print result of evaluation */
    // for (int j=0;j<nnz;j++)
    //     printf("H[%i] = %f\n", j, H_val[j]);

    return 0;

}

int main( )
{

    vector<double> y(nv, 1);
    vector<double> lam(ni, 0);

    Function ca_dfdy = external("ca_dfdy");

    vector<DM> ca_y = {reshape(DM(y), nv, 1)};
    vector<DM> dfdy_eval = ca_dfdy(ca_y);
    // cout << "result (0): " << dfdy_eval.at(0) << endl;

    Function ca_g = external("ca_g");
    vector<DM> g_eval = ca_g(ca_y);
    // cout << "result (0): " << g_eval.at(0) << endl;

    Function ca_dgdy = external("ca_dgdy");
    vector<DM> dgdy_eval = ca_dgdy(ca_y);
    // cout << "result (0): " << dgdy_eval.at(0) << endl;

    Function ca_dLdyy = external("ca_dLdyy");
    vector<DM> ca_z = {reshape(DM(y), nv, 1), reshape(DM(lam), ni, 1)};
    vector<DM> dLdyy_eval = ca_dLdyy(ca_z);
    // cout << "result (0): " << dLdyy_eval.at(0) << endl;


    // get sparsity patterns
    casadi_int n_in = ca_dgdy_n_in();
    casadi_int n_out = ca_dgdy_n_out();

    casadi_int sz_arg=n_in, sz_res=n_out, sz_iw=0, sz_w=0;

    ca_dgdy_work(&sz_arg, &sz_res, &sz_iw, &sz_w);
    // printf("Work vector sizes:\n");
    // printf("sz_arg = %lld, sz_res = %lld, sz_iw = %lld, sz_w = %lld\n\n",
    //        sz_arg, sz_res, sz_iw, sz_w);

    casadi_int nnz_A; 
    casadi_int ncol; 
    /* Print the sparsities of the inputs and outputs */
    casadi_int ca_i;
    // skip inputs
    ca_i = n_in;
    // Retrieve the sparsity pattern - CasADi uses column compressed storage (CCS)
    const casadi_int *sp_i;
    // printf("Output %lld\n", ca_i-n_in);
    sp_i = ca_dgdy_sparsity_out(ca_i-n_in);
    if (sp_i==0) return 1;
    casadi_int nrow = *sp_i++; /* Number of rows */
    ncol = *sp_i++; /* Number of columns */
    const casadi_int *colind = sp_i; /* Column offsets */
    const casadi_int *row = sp_i + ncol+1; /* Row nonzero */
    nnz_A = sp_i[ncol]; /* Number of nonzeros */

    sparse_int_t A_ir[nnz_A];
    sparse_int_t A_jc[ncol+1];
    double A_val[nnz_A];

    /* Print the pattern */
    // printf("  Dimension: %lld-by-%lld (%lld nonzeros)\n", nrow, ncol, nnz_A);
    // printf("  Nonzeros: {");
    casadi_int rr,cc,el;
    int zcounter = 0;
    for(cc=0; cc<ncol; ++cc){                    /* loop over columns */
      A_jc[cc] = colind[cc];
      for(el=colind[cc]; el<colind[cc+1]; ++el){ /* loop over the nonzeros entries of the column */
        
        // if(el!=0) printf(", ");                  /* Separate the entries */
        rr = row[el];                            /* Get the row */
        A_ir[zcounter] = rr;
        zcounter+=1;
        // printf("{%lld,%lld}",rr,cc);                 /* Print the nonzero */
      }
    }

    A_jc[ncol] = nnz_A;

    // printf("}\n\n");
    // for (int i = 0; i < nnz_A; i++) 
    //     printf("A_ir[%i] = %i\n", i, A_ir[i]);
    // for (int i = 0; i < ncol+1; i++) 
    //     printf("A_jc[%i] = %i\n", i, A_jc[i]);

    // evaluate A

    /* Allocate input/output buffers and work vectors*/
    const double *arg_A[sz_arg];
    double *res_A[sz_res];
    casadi_int iw_A[sz_iw];
    real_t w_A[sz_w];

    /* Function input and output */
    double y_val[nv] = {0};

    evaluate_dgdy(arg_A, res_A, iw_A, w_A, nnz_A, y_val, A_val);

    // get sparsity patterns
    n_in = ca_dLdyy_n_in();
    n_out = ca_dLdyy_n_out();

    sz_arg=n_in;
    sz_res=n_out;
    sz_iw=0;
    sz_w=0;

    int nnz_H;

    ca_dLdyy_work(&sz_arg, &sz_res, &sz_iw, &sz_w);
    // printf("Work vector sizes:\n");
    // printf("sz_arg = %lld, sz_res = %lld, sz_iw = %lld, sz_w = %lld\n\n",
    //        sz_arg, sz_res, sz_iw, sz_w);

    /* Print the sparsities of the inputs and outputs */
    // skip inputs
    ca_i = n_in;
    // Retrieve the sparsity pattern - CasADi uses column compressed storage (CCS)
    // printf("Output %lld\n", ca_i-n_in);
    sp_i = ca_dLdyy_sparsity_out(ca_i-n_in);
    if (sp_i==0) return 1;
    nrow = *sp_i++; /* Number of rows */
    ncol = *sp_i++; /* Number of columns */
    colind = sp_i; /* Column offsets */
    row = sp_i + ncol+1; /* Row nonzero */
    nnz_H = sp_i[ncol]; /* Number of nonzeros */

    sparse_int_t H_ir[nnz_H];
    sparse_int_t H_jc[ncol+1];
    real_t H_val[nnz_H];

    /* Print the pattern */
    // printf("  Dimension: %lld-by-%lld (%lld nonzeros)\n", nrow, ncol, nnz_H);
    // printf("  Nonzeros: {");
    zcounter = 0;
    for(cc=0; cc<ncol; ++cc){                    /* loop over columns */
      H_jc[cc] = colind[cc];
      for(el=colind[cc]; el<colind[cc+1]; ++el){ /* loop over the nonzeros entries of the column */
        // if(el!=0) printf(", ");                  /* Separate the entries */
        rr = row[el];                            /* Get the row */
        H_ir[zcounter] = rr;
        zcounter+=1;
        // printf("{%lld,%lld}",rr,cc);                 /* Print the nonzero */
      }
    }

    H_jc[ncol] = nnz_H;

    // printf("}\n\n");

    // for (int i = 0; i < nnz_H; i++) 
    //     printf("H_ir[%i] = %i\n", i, H_ir[i]);

    // for (int i = 0; i < ncol+1; i++) 
    //     printf("H_jc[%i] = %i\n", i, H_jc[i]);
    // evaluate H

    /* Allocate input/output buffers and work vectors*/
    const double *arg_H[sz_arg];
    double *res_H[sz_res];
    casadi_int iw_H[sz_iw];
    real_t w_H[sz_w];

    double lam_val[ni] = {0};
    evaluate_dLdyy(arg_A, res_H, iw_H, w_H, nnz_H, y_val, lam_val, H_val);

	long i;
	int_t nWSR;
	real_t tic, toc;
	real_t *y_QP = new real_t[nv];
	real_t *lam_QP = new real_t[nv + ni];

	// create sparse matrices
	SymSparseMat *H = new SymSparseMat(nv, nv, H_ir, H_jc, H_val);
	SparseMatrix *A = new SparseMatrix(ni, nv, A_ir, A_jc, A_val);

	H->createDiagInfo();

    real_t g[nv]; 
    real_t lbA[ni]; 
    real_t ubA[ni]; 
    real_t lb[nv]; 
    real_t ub[nv]; 

    DM myvector = dfdy_eval.at(0);
    for(int i = 0; i < nv; i++) {

        g[i] = (double) myvector(i);
        lb[i] = -YMAX;
        ub[i] = YMAX;
    }

    for(int i = 0; i < ni; i++) {
        lbA[i] = 0.0;
        ubA[i] = 0.0;
    }

	Options options;
	options.setToDefault();
	options.printLevel = PL_TABULAR;
    options.enableEqualities = BT_TRUE;

    Constraints guessedConstraints( ni );
    guessedConstraints.setupAllUpper( );

    Bounds guessedBounds( nv );
    guessedBounds.setupAllFree( );

    // SQProblemSchur qpSchur(nv, ni);
    SQProblemSchur qpSchur(nv, ni);
    qpSchur.setOptions(options);
    tic = getCPUtime();
    // qpSchur.init(H, g, A, lb, ub, lbA, ubA, nWSR, 0, NULL, NULL, &guessedBounds, &guessedConstraints);
    nWSR = MAXNWSR;
    qpSchur.init(H, g, A, lb, ub, lbA, ubA, nWSR);
    toc = getCPUtime();
    qpSchur.getPrimalSolution(y_QP);
    qpSchur.getDualSolution(lam_QP);
    fprintf(stdFile, "Solved sparse problem (Schur complement approach) in %d iterations, %.3f seconds.\n", (int)nWSR, toc-tic);
    // exit(1);

    for(int j = 0; j < 10; j ++) { 
        // outer loop
        printf("in outer loop\n");
        
        for(int i = 0; i < nv; i++) {
            y[i] = y[i] + y_QP[i];
            y_val[i] = y[i];
        }

        for(int i = 0; i < ni; i++) {
            lam[i] = lam_QP[i];
            y_val[i] = lam[i];
        }

        // update matrices and vectors
        evaluate_dgdy(arg_A, res_A, iw_A, w_A, nnz_A, y_val, A_val);
        A->setVal(A_val);
        evaluate_dLdyy(arg_H, res_H, iw_H, w_H, nnz_H, y_val, lam_val, H_val);
        H->setVal(H_val);
        ca_y[0] = reshape(DM(y), nv, 1);

        dfdy_eval = ca_dfdy(ca_y);
        // cout << "new gradient: " << dfdy_eval.at(0) << endl;
        myvector = dfdy_eval.at(0);

        // ca_lam[0] = reshape(DM(lam), ni, 1);

        for(int i = 0; i < nv; i++) {

            g[i] = (double) myvector(i);
        }

        g_eval = ca_g(ca_y);
        // cout << "new gradient: " << g_eval.at(0) << endl;
        myvector = g_eval.at(0);

        for(int i = 0; i < ni; i++) {

            lbA[i] = -(double) myvector(i);
            ubA[i] = -(double) myvector(i);
        }

        // solve with sparse matrices (Schur complement) 
        nWSR = MAXNWSR;
        // SQProblemSchur qrecipeSchur(1, 1);
        tic = getCPUtime();
        qpSchur.hotstart(H, g, A, lb, ub, lbA, ubA, nWSR);
        toc = getCPUtime();
        qpSchur.getPrimalSolution(y_QP);
        qpSchur.getDualSolution(lam_QP);

        fprintf(stdFile, "Solved sparse problem (Schur complement approach) in %d iterations, %.3f seconds.\n", (int)nWSR, toc-tic);
#if 1
    
        for(int k = 0; k < 10; k ++) { 
            // inner loop
            printf("in inner loop\n");
            // update vectors and solve hotstarted QP
            for(int i = 0; i < nv; i++) {
                y[i] = y[i] + y_QP[i];
                y_val[i] = y[i];
            }

            for(int i = 0; i < ni; i++) {
                lam[i] = lam_QP[i];
                y_val[i] = lam[i];
            }

            ca_y[0] = reshape(DM(y), nv, 1);

            dfdy_eval = ca_dfdy(ca_y);
            // cout << "new gradient: " << dfdy_eval.at(0) << endl;
            myvector = dfdy_eval.at(0);

            // ca_lam[0] = reshape(DM(lam), ni, 1);

            for(int i = 0; i < nv; i++) {

                g[i] = (double) myvector(i);
            }

            g_eval = ca_g(ca_y);
            // cout << "new gradient: " << g_eval.at(0) << endl;
            myvector = g_eval.at(0);

            for(int i = 0; i < ni; i++) {

                lbA[i] = -(double) myvector(i);
                ubA[i] = -(double) myvector(i);
            }

            
            nWSR = MAXNWSR;
            tic = getCPUtime();
            qpSchur.hotstart(g, lb, ub, lbA, ubA, nWSR);
            toc = getCPUtime();
            qpSchur.getPrimalSolution(y_QP);
            qpSchur.getDualSolution(lam_QP);

            fprintf(stdFile, "Solved hotstarted sparse problem (Schur complement approach) in %d iterations, %.3f seconds.\n", (int)nWSR, toc-tic);

        }
    }

	delete H;
	delete A;

	delete[] y_QP;
    delete[] lam_QP;

	// return 0;
#endif
}


