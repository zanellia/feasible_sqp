/**
 *	\file feasibleSQP.cpp
 *	\author Andrea Zanelli
 *	\version 0.1
 *	\date 2020-2021
 *
 */


// this is necessary to avoid linking problems with libqpOASES.so
#define __USE_LONG_INTEGERS__
#define __USE_LONG_FINTS__
#include "qpOASES.hpp"
#include <casadi/casadi.hpp>
#include <casadi/casadi_c.h>
#include "ca_dfdy.h"
#include "ca_dgdy.h"
#include "ca_g.h"
#include "ca_dLdyy.h"
#include "{{ solver_opts.solver_name }}.hpp"
#include "Sparse"

using namespace casadi;
using namespace std;

USING_NAMESPACE_QPOASES

int evaluate_dgdy(const double** arg, double** res, casadi_int* iw, double* w, int nnz, real_t* y_val, real_t* p_val, double* A_val) {

    // Allocate memory (thread-safe)
    ca_dgdy_incref();

    /* Evaluate the function */
    arg[0] = y_val;
    arg[1] = p_val;
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

int evaluate_dLdyy(const double** arg, double** res, casadi_int* iw, double* w, int nnz, real_t* y_val, real_t* lam_val, real_t* p_val, double* H_val) {

    // Allocate memory (thread-safe)
    ca_dLdyy_incref();

    /* Evaluate the function */
    arg[0] = y_val;
    arg[1] = lam_val;
    arg[2] = p_val;
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

extern "C" {
int init ( )
{
    d_stats[0] = d_stats_0;
    d_stats[1] = d_stats_1;
    d_stats[2] = d_stats_2;

    i_stats[0] = i_stats_0;
    i_stats[1] = i_stats_1;
}

int {{ solver_opts.solver_name }} ( )
{

    // zero out stats
    for (int i = 0; i < MAX_STATS; i++) {
        d_stats_0[i] = 0.0;
        d_stats_1[i] = 0.0;
        d_stats_2[i] = 0.0;
    }

    for (int i = 0; i < MAX_STATS; i++) {
        d_stats_0[i] = 0;
        d_stats_1[i] = 0;
    }            

    vector<double> y(NV, 0);
    vector<double> lam(NI, 0);
    vector<double> p(NP, 0);
    
    // init y
    for(int i = 0; i < NV; i++) {
        y_val[i] = y_init[i];
        y[i] = y_init[i];
    }
    // init lam
    for(int i = 0; i < NI; i++) {
        lam_val[i] = lam_init[i];
        lam[i] = lam_init[i];
    }

    for(int i = 0; i < NP; i++) {
        p[i] = p_val[i];
    }

    Function ca_dfdy = external("ca_dfdy");

    vector<DM> ca_y_p = {reshape(DM(y), NV, 1), reshape(DM(p), NP, 1)};
    vector<DM> dfdy_eval = ca_dfdy(ca_y_p);
    // cout << "result (0): " << dfdy_eval.at(0) << endl;

    Function ca_g = external("ca_g");
    vector<DM> g_eval = ca_g(ca_y_p);
    // cout << "result (0): " << g_eval.at(0) << endl;

    Function ca_dgdy = external("ca_dgdy");
    vector<DM> dgdy_eval = ca_dgdy(ca_y_p);
    // cout << "result (0): " << dgdy_eval.at(0) << endl;

    Function ca_dLdyy = external("ca_dLdyy");
    vector<DM> ca_z_p = {reshape(DM(y), NV, 1), reshape(DM(lam), NI, 1), reshape(DM(p), NP, 1)};
    vector<DM> dLdyy_eval = ca_dLdyy(ca_z_p);
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
        // printf("[%lld,%lld]",rr,cc);                 /* Print the nonzero */
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

    evaluate_dgdy(arg_A, res_A, iw_A, w_A, nnz_A, y_val, p_val, A_val);

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

    // data for P
    int P_ir[nnz_H];
    int P_jc[ncol+1];
    double P_val[nnz_H];

    // define sparse matrix for matrix-vector product involved in
    // the gradient update
    Eigen::Map<Eigen::SparseMatrix<double> > P(NV, NV, nnz_H, P_jc, 
        P_ir, P_val);

    /* Print the pattern */
    // printf("  Dimension: %lld-by-%lld (%lld nonzeros)\n", nrow, ncol, nnz_H);
    // printf("  Nonzeros: {");
    zcounter = 0;
    for(cc=0; cc<ncol; ++cc){                    /* loop over columns */
      H_jc[cc] = colind[cc];
      P_jc[cc] = colind[cc];
      for(el=colind[cc]; el<colind[cc+1]; ++el){ /* loop over the nonzeros entries of the column */
        // if(el!=0) printf(", ");                  /* Separate the entries */
        rr = row[el];                            /* Get the row */
        H_ir[zcounter] = rr;
        P_ir[zcounter] = rr;
        zcounter+=1;
        // printf("[%lld,%lld]",rr,cc);                 /* Print the nonzero */
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

    evaluate_dLdyy(arg_A, res_H, iw_H, w_H, nnz_H, y_val, lam_val, p_val, H_val);

	long i;
	int_t nWSR;
	real_t tic, toc;
	real_t *y_QP = new real_t[NV];
	real_t *lam_QP = new real_t[NV + NI];

	// create sparse matrices
	SymSparseMat *H = new SymSparseMat(NV, NV, H_ir, H_jc, H_val);
	SparseMatrix *A = new SparseMatrix(NI, NV, A_ir, A_jc, A_val);

	H->createDiagInfo();

    real_t g_bar[NV]; 
    Eigen::SparseVector<double> g_temp(NV);
    real_t g[NV]; 
    real_t lbA[NI]; 
    real_t ubA[NI]; 
    real_t lb[NV]; 
    real_t ub[NV]; 

    std::vector<double> myvector = std::vector<double>(dfdy_eval.at(0));
    for(int i = 0; i < NV; i++) {

        g[i] = myvector[i];
        lb[i] = lby[i];
        ub[i] = uby[i];
    }

    for(int i = 0; i < NI; i++) {
        lbA[i] = lbg[i];
        ubA[i] = ubg[i];
    }

	Options options;
	// options.setToDefault();
	// options.printLevel = PL_TABULAR;
	// options.printLevel = PL_HIGH;
	options.printLevel = PL_NONE;
    options.enableEqualities = BT_TRUE;
    // options.enableFarBounds = BT_FALSE;

    Constraints guessedConstraints( NI );
    guessedConstraints.setupAllInactive( );

    Bounds guessedBounds( NV );
    guessedBounds.setupAllFree( );

    SQProblemSchur qpSchur(NV, NI);
    // SQProblem qpSchur(NV, NI);
    // QProblem qpSchur(NV, NI);
    qpSchur.setOptions(options);
    tic = getCPUtime();
    nWSR = MAX_NWSR;

    // printf("A matrix\n");
    // A->print();
    // printf("H matrix\n");
    // H->print();

    myvector = std::vector<double>(g_eval.at(0));
    for(int i = 0; i < NI; i++) {
        lbA[i] = lbg[i] - myvector[i];
        ubA[i] = ubg[i] - myvector[i];
    }

    for(int i = 0; i < NV; i++) {
        lb[i] = lby[i] - y[i];
        ub[i] = uby[i] - y[i];
    }

    int tot_iter = 0;
#if BOUNDS
        qpSchur.init(H, g, A, lb, ub, lbA, ubA, nWSR, 0, NULL, NULL, &guessedBounds, &guessedConstraints);
#else
        qpSchur.init(H, g, A, NULL, NULL, lbA, ubA, nWSR, 0, NULL, NULL, &guessedBounds, &guessedConstraints);
#endif

    tot_iter += 1;

    toc = getCPUtime();
    qpSchur.getPrimalSolution(y_QP);

    // for (i = 0; i < NV; i++)
    //     printf("y_QP[%i] = %f\n", i, y_QP[i]);
    qpSchur.getDualSolution(lam_QP);
    real_t step_inf_norm = 0.0;
    for (i = 0; i < NV; i++)
        if (getAbs(y_QP[i]) > step_inf_norm)
            step_inf_norm = getAbs(y_QP[i]);

    for (i = 0; i < NI; i++)
        if (getAbs(lam[i] - lam_QP[i]) > step_inf_norm)
            step_inf_norm = getAbs(lam[i] - lam_QP[i]);

    printf("------------------------------------------------------------\n");
    printf("dz\t\tnWSR\tCPU time [s]\talpha\t\tlin.\n");
    printf("------------------------------------------------------------\n");

    double time = toc-tic;

    printf("%1.2e\t%i\t%1.2e\t%1.2e\t%i\n", step_inf_norm, (int)nWSR, toc-tic, 1.0, 1);

    d_stats_0[tot_iter] = step_inf_norm;
    d_stats_1[tot_iter] = time;
    d_stats_2[tot_iter] = 1.0;
    i_stats_0[tot_iter] = nWSR;
    i_stats_1[tot_iter] = 1;

    for(int i = 0; i < NV; i++) {
        y[i] = y[i] + y_QP[i];
        y_val[i] = y[i];
    }

    for(int i = 0; i < NI; i++) {
        lam[i] = lam_QP[i];
        lam_val[i] = lam[i];
    }

    // fprintf(stdFile, "Solved sparse problem (Schur complement approach) in %d iterations, %.3f seconds.\n", (int)nWSR, toc-tic);
    // exit(1);
#if 1
    
    //////////////////////////////////////////////////// 
    // OUTER ITERATIONS
    ////////////////////////////////////////////////////
    
    for(int j = 0; j <  MAX_OUTER_IT; j ++) { 
        // outer loop
        // printf("in outer loop\n");

        if (j > 0) { // skip first outer iteration
            // update matrices and vectors
            evaluate_dgdy(arg_A, res_A, iw_A, w_A, nnz_A, y_val, p_val, A_val);
            A->setVal(A_val);

              
            evaluate_dLdyy(arg_H, res_H, iw_H, w_H, nnz_H, y_val, lam_val, p_val, H_val);
            H->setVal(H_val);
            
            // update P for gradient update (necessary or 
            // could I just map to H_val?)
            for (int i=0; i<nnz_H; i++)
                P_val[i] = H_val[i];

            // TODO(andrea) only setting y here! 
            ca_y_p = {reshape(DM(y), NV, 1), reshape(DM(p), NP, 1)};

            dfdy_eval = ca_dfdy(ca_y_p);
            // cout << "new gradient: " << dfdy_eval.at(0) << endl;
            myvector = std::vector<double>(dfdy_eval.at(0));

            // ca_lam[0] = reshape(DM(lam), NI, 1);

            for(int i = 0; i < NV; i++) {
                g_bar[i] = myvector[i];
            }

            g_eval = ca_g(ca_y_p);
            // cout << "new gradient: " << g_eval.at(0) << endl;
            myvector = std::vector<double>(g_eval.at(0));

            for(int i = 0; i < NI; i++) {
                lbA[i] = lbg[i] - myvector[i];
                ubA[i] = ubg[i] - myvector[i];
            }

            for(int i = 0; i < NV; i++) {
                lb[i] = lby[i] - y[i];
                ub[i] = uby[i] - y[i];

                // printf("lb[%i] = %f\n", lb[i]);
                // printf("ub[%i] = %f\n", ub[i]);
            }

            // solve with sparse matrices (Schur complement) 
            nWSR = MAX_NWSR;
            // SQProblemSchur qrecipeSchur(1, 1);
            tic = getCPUtime();

#if BOUNDS
            qpSchur.hotstart(H, g, A, lb, ub, lbA, ubA, nWSR);
#else
            qpSchur.hotstart(H, g, A, NULL, NULL, lbA, ubA, nWSR);
#endif
            toc = getCPUtime();
            tot_iter += 1;
            qpSchur.getPrimalSolution(y_QP);

            // for (i = 0; i < NV; i++)
            //     printf("y_QP[%i] = %f\n", i, y_QP[i]);

            real_t step_inf_norm = 0.0;
            for (i = 0; i < NV; i++)
                if (getAbs(y_QP[i]) > step_inf_norm)
                    step_inf_norm = getAbs(y_QP[i]);

            for (i = 0; i < NI; i++)
                if (getAbs(lam[i] - lam_QP[i]) > step_inf_norm)
                    step_inf_norm = getAbs(lam[i] - lam_QP[i]);

            if (tot_iter%10 == 0) { 
                printf("------------------------------------------------------------\n");
                printf("dz\t\tnWSR\tCPU time [s]\talpha\t\tlin.\n");
                printf("------------------------------------------------------------\n");
            }

            time = tic - toc;
            printf("%1.2e\t%i\t%1.2e\t%1.2e\t%i\n", step_inf_norm, (int)nWSR, time, 1.0, 1);

            d_stats_0[tot_iter] = step_inf_norm;
            d_stats_1[tot_iter] = time;
            d_stats_2[tot_iter] = 1.0;
            i_stats_0[tot_iter] = nWSR;
            i_stats_1[tot_iter] = 1;

            if (step_inf_norm < OUTER_TOL) {
                printf("->solution found!\n");
                for (i = 0; i < NV; i++)
                    printf("y[%i] = %f\n", i, y[i]);
                break;
            }

            qpSchur.getDualSolution(lam_QP);

            for(int i = 0; i < NV; i++) {
                // store outer primal iterate before update
                y_outer[i] = y_val[i];
                y[i] = y[i] + y_QP[i];
                y_val[i] = y[i];
            }

            for(int i = 0; i < NI; i++) {
                lam[i] = lam_QP[i];
                lam_val[i] = lam[i];
            }

            // fprintf(stdFile, "Solved sparse problem (Schur complement approach) in %d iterations, %.3f seconds.\n", (int)nWSR, toc-tic);
        }
            
        //////////////////////////////////////////////////// 
        // INNER ITERATIONS
        ////////////////////////////////////////////////////
        
        double prev_step_inf_norm = step_inf_norm;
        double alpha_inner = 1.0;

        
        for(int k = 0; k < MAX_INNER_IT; k ++) { 
            // inner loop
            // printf("in inner loop\n");
            // update vectors and solve hotstarted QP

            // TODO(andrea): only setting y here!
            ca_y_p = {reshape(DM(y), NV, 1), reshape(DM(p), NP, 1)};

#if 1
            // do not evaluate exact gradient, but rather
            // use linear update for g
            for(int i = 0; i < NV; i++)
                g_temp.coeffRef(i) = y[i] - y_outer[i];

            g_temp = alpha_inner*P*g_temp;

            for(int i = 0; i < NV; i++)
                g[i] = g_bar[i] + g_temp.coeffRef(i);
#else
            // cout << "new gradient: " << dfdy_eval.at(0) << endl;
            myvector = std::vector<double>(dfdy_eval.at(0));
            // ca_lam[0] = reshape(DM(lam), NI, 1);

            dfdy_eval = ca_dfdy(ca_y_p);
            for(int i = 0; i < NV; i++) {
                g[i] = myvector[i];
            }
#endif

            g_eval = ca_g(ca_y_p);
            // cout << "new evaluation of g: " << g_eval.at(0) << endl;
            myvector = std::vector<double>(g_eval.at(0));

            for(int i = 0; i < NI; i++) {
                lbA[i] = lbg[i] - myvector[i];
                ubA[i] = ubg[i] - myvector[i];
            }

            for(int i = 0; i < NV; i++) {
                lb[i] = lby[i] - y[i];
                ub[i] = uby[i] - y[i];
            }
            
            nWSR = MAX_NWSR;
            tic = getCPUtime();

#if BOUNDS
            qpSchur.hotstart(g, lb, ub, lbA, ubA, nWSR);
#else
            qpSchur.hotstart(g, NULL, NULL, lbA, ubA, nWSR);
#endif
            toc = getCPUtime();
            tot_iter += 1;
            qpSchur.getPrimalSolution(y_QP);
            qpSchur.getDualSolution(lam_QP);

            // for (i = 0; i < NV; i++)
            //     printf("y_QP[%i] = %f\n", i, y_QP[i]);

            double step_inf_norm = 0.0;
            for (i = 0; i < NV; i++)
                if (getAbs(y_QP[i]) > step_inf_norm)
                    step_inf_norm = getAbs(y_QP[i]);

            for (i = 0; i < NI; i++)
                if (getAbs(lam[i] - lam_QP[i]) > step_inf_norm)
                    step_inf_norm = getAbs(lam[i] - lam_QP[i]);

            double kappa = step_inf_norm/prev_step_inf_norm;
            // printf("step = %f, prev step = %f, kappa = %f\n", 
            //     step_inf_norm, prev_step_inf_norm, kappa);

            if (kappa > KAPPA_BAR)
            {
                // if (kappa > opts->kappa_max)
                // {
                //     printf("\n kappa > kappa_max!\n");
                //     break;
                // } 
                alpha_inner = alpha_inner * THETA_BAR;

                if (alpha_inner < MIN_ALPHA_INNER) {
                    printf("alpha = %f < MIN_ALPHA_INNER = %f. abort inner iterations\n", alpha_inner, MIN_ALPHA_INNER);
                    break;
                }
                // printf("alpha_inner = %f, kappa = %f\n", alpha_inner, kappa);
            }


            prev_step_inf_norm = step_inf_norm;

            if (tot_iter%10 == 0) { 
                printf("------------------------------------------------------------\n");
                printf("dz\t\tnWSR\tCPU time [s]\talpha\t\tlin.\n");
                printf("------------------------------------------------------------\n");
            }

            time = tic - toc;
            printf("%1.2e\t%i\t%1.2e\t%1.2e\t%i\n", step_inf_norm, (int)nWSR, toc-tic, alpha_inner, 0);

            d_stats_0[tot_iter] = step_inf_norm;
            d_stats_1[tot_iter] = time;
            d_stats_2[tot_iter] = alpha_inner;
            i_stats_0[tot_iter] = nWSR;
            i_stats_1[tot_iter] = 0;

            if (kappa > KAPPA_TILDE) {
                printf("kappa = %f > KAPPA_TILDE = %f. abort inner iterations\n", kappa, KAPPA_TILDE);
                break;
            }

            if (kappa > KAPPA_MAX) {
                printf("kappa = %f > KAPPA_MAX = %f. skipping update\n", kappa, KAPPA_MAX);
            } else { 
                // printf("inner loop primal step: %f\n", step_inf_norm);
                if (step_inf_norm < INNER_TOL) {
                    printf("-> solved inner problem!\n\n");
                    k = MAX_INNER_IT;
                }

                for(int i = 0; i < NV; i++) {
                    y[i] = y[i] + y_QP[i];
                    y_val[i] = y[i];
                }

                for(int i = 0; i < NI; i++) {
                    lam[i] = lam_QP[i];
                    lam_val[i] = lam[i];
                }
            }

            // fprintf(stdFile, "Solved hotstarted sparse problem (Schur complement approach) in %d iterations, %.3f seconds.\n", (int)nWSR, toc-tic);

        }
    }
#endif

	delete H;
	delete A;

	delete[] y_QP;
    delete[] lam_QP;

	// return 0;
}


int set_max_inner_it(int max_inner_it) {
    MAX_INNER_IT = max_inner_it;
    return 0;
}

int set_max_outer_it(int max_outer_it) {
    MAX_OUTER_IT = max_outer_it;
    return 0;
}

double set_kappa_max(double kappa_max) {
    KAPPA_MAX = kappa_max;
    return 0;
}

double set_kappa_tilde(double kappa_tilde) {
    KAPPA_TILDE = kappa_tilde;
    return 0;
}

double set_kappa_bar(double kappa_bar) {
    KAPPA_BAR = kappa_bar;
    return 0;
} 

double set_theta_bar(double theta_bar) {
    THETA_BAR = theta_bar;
    return 0;
}

double set_min_alpha_inner(double min_alpha_inner) {
    MIN_ALPHA_INNER = min_alpha_inner;
    return 0;
}

int set_max_nwsr(int max_nwsr) {
    MAX_NWSR = max_nwsr;
    return 0;
}

int set_inner_tol(int inner_tol) {
    INNER_TOL = inner_tol;
    return 0;
}

int set_outer_tol(int outer_tol) {
    OUTER_TOL = outer_tol;
    return 0;
}

int get_primal_sol(double *primal_sol) {
    for(int i = 0; i < NV; i++) {
        primal_sol[i] = y_val[i];
    }
}

int get_dual_sol(double *dual_sol) {
    for(int i = 0; i < NI; i++) {
        dual_sol[i] = lam_val[i];
    }
}

int set_primal_guess(double *primal_guess) {
    for(int i = 0; i < NV; i++) {
        y_init[i] = primal_guess[i];
    }
}

int set_dual_guess(double *dual_guess) {
    for(int i = 0; i < NI; i++) {
        lam_init[i] = dual_guess[i];
    }
}

int set_param(double *par) {
    for(int i = 0; i < NP; i++) {
        p_val[i] = par[i];
    }
}

int get_d_stats(double *d_stats_ret, int i) {
    if (i > 2 || i <0) {
        printf("Invalid stat index %i - value in range [0,2] required\n");
    } else {
        double * temp = d_stats[i];
        for (int j = 0; j < MAX_STATS; j++)
            d_stats_ret[j] = temp[j];
    }
}

int get_i_stats(int *i_stats_ret, int i) {
    if (i > 1 || i <0) {
        printf("Invalid stat index %i - value in range [0,1] required\n");
    } else {
        int * temp = i_stats[i];
        for (int j = 0; j < MAX_STATS; j++)
            i_stats_ret[j] = temp[j];
    }
}

}


