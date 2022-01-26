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
#include "ca_f.h"
#include "ca_f0.h"
#include "ca_dfdy.h"
#include "ca_dgdy.h"
#include "ca_g.h"
#include "ca_dLdyy.h"
{% if use_approximate_hessian %}
#include "ca_M.h"
{% endif %}
#include "{{ solver_opts.solver_name }}.hpp"
#include "Sparse"

using namespace casadi;
using namespace std;

USING_NAMESPACE_QPOASES

void print_qp(SymSparseMat* M, double* g, SparseMatrix* A, double* lb, double* ub, double* lbA, double* ubA) {

    printf("\n");
    printf("=============================================================\n");
    printf("M = \n");
    M->print();
    printf("\n");
    printf("g = \n");
    for (int i = 0; i < NV; i++) printf("g[%i] = %f\n", i, g[i]);
    printf("\n");
    printf("lb = \n");
    for (int i = 0; i < NV; i++) printf("lb[%i] = %f\n", i, lb[i]);
    printf("\n");
    printf("ub = \n");
    for (int i = 0; i < NV; i++) printf("lb[%i] = %f\n", i, ub[i]);
    printf("A = \n");
    A->print();
    printf("\n");
    printf("lbA = \n");
    for (int i = 0; i < NI; i++) printf("lbA[%i] = %f\n", i, lbA[i]);
    printf("\n");
    printf("ubA = \n");
    for (int i = 0; i < NI; i++) printf("ubA[%i] = %f\n", i, ubA[i]);
    printf("\n");
    printf("=============================================================\n");
    return;
}

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

int evaluate_dLdyy(const double** arg, double** res, casadi_int* iw, double* w, int nnz, real_t* y_val, real_t* lam_val, real_t* p_val, double* M_val) {

    // Allocate memory (thread-safe)
    ca_dLdyy_incref();

    /* Evaluate the function */
    arg[0] = y_val;
    arg[1] = lam_val;
    arg[2] = p_val;
    res[0] = M_val;

    // Checkout thread-local memory (not thread-safe)
    int mem = ca_dLdyy_checkout();

    // Evaluation is thread-safe
    if (ca_dLdyy(arg, res, iw, w, mem)) return 1;

    // Release thread-local (not thread-safe)
    ca_dLdyy_release(mem);

    /* Print result of evaluation */
    // for (int j=0;j<nnz;j++)
    //     printf("M[%i] = %f\n", j, M_val[j]);

    return 0;

}

{% if use_approximate_hessian %}
int evaluate_M(const double** arg, double** res, casadi_int* iw, double* w, int nnz, real_t* y_val, real_t* p_val, double* M_val) {

    // Allocate memory (thread-safe)
    ca_M_incref();

    /* Evaluate the function */
    arg[0] = y_val;
    arg[1] = p_val;
    res[0] = M_val;

    // Checkout thread-local memory (not thread-safe)
    int mem = ca_M_checkout();

    // Evaluation is thread-safe
    if (ca_M(arg, res, iw, w, mem)) return 1;

    // Release thread-local (not thread-safe)
    ca_M_release(mem);

    /* Print result of evaluation */
    // for (int j=0;j<nnz;j++)
    //     printf("M[%i] = %f\n", j, M_val[j]);

    return 0;

}
{% endif %}

extern "C" {
int {{ solver_opts.solver_name }}_init ()
{
    d_stats[0] = d_stats_0;
    d_stats[1] = d_stats_1;
    d_stats[2] = d_stats_2;

    i_stats[0] = i_stats_0;
    i_stats[1] = i_stats_1;
    return 0;
}

int {{ solver_opts.solver_name }} ()
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
    
    int cum_nwsr = 0;
    
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
    
    Function ca_f = external("ca_f");
    vector<DM> f_eval = ca_f(ca_y_p);
    Function ca_f0 = external("ca_f0");
    vector<DM> f0_eval = ca_f0(ca_y_p);

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

{% if use_approximate_hessian %}
    Function ca_M = external("ca_M");
    vector<DM> M_eval = ca_M(ca_y_p);
{% endif %}
    // cout << "result (0): " << dM_eval.at(0) << endl;

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

    int nnz_M;

{% if use_approximate_hessian %}
    // setup P
    // get sparsity patterns
    n_in = ca_dLdyy_n_in();
    n_out = ca_dLdyy_n_out();

    sz_arg=n_in;
    sz_res=n_out;
    sz_iw=0;
    sz_w=0;

    int nnz_P;

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
    nnz_P = sp_i[ncol]; /* Number of nonzeros */

    sparse_int_t P_ir[nnz_P];
    sparse_int_t P_jc[ncol+1];
    real_t P_val[nnz_P];
    zcounter = 0;
    for(cc=0; cc<ncol; ++cc){                    /* loop over columns */
      P_jc[cc] = colind[cc];
      for(el=colind[cc]; el<colind[cc+1]; ++el){ /* loop over the nonzeros entries of the column */
        // if(el!=0) printf(", ");                  /* Separate the entries */
        rr = row[el];                            /* Get the row */
        P_ir[zcounter] = rr;
        zcounter+=1;
        // printf("[%lld,%lld]",rr,cc);                 /* Print the nonzero */
      }
    }

    P_jc[ncol] = nnz_P;

    // printf("}\n\n");

    // for (int i = 0; i < nnz_P; i++) 
    //     printf("P_ir[%i] = %i\n", i, P_ir[i]);

    // for (int i = 0; i < ncol+1; i++) 
    //     printf("P_jc[%i] = %i\n", i, P_jc[i]);
    // evaluate P

    /* Allocate input/output buffers and work vectors*/
    const double *arg_P[sz_arg];
    double *res_P[sz_res];
    casadi_int iw_P[sz_iw];
    real_t w_P[sz_w];

    // for (int i = 0; i < nnz_A; i++) 
    //     printf("A_val[%i] = %f\n", i, A_val[i]);

    evaluate_dLdyy(arg_P, res_P, iw_P, w_P, nnz_P, y_val, lam_val, p_val, P_val);

    // define sparse matrix for matrix-vector product involved in
    // the gradient update
    Eigen::Map<Eigen::SparseMatrix<double> > P_(NV, NV, nnz_P, P_jc, 
        P_ir, P_val);
    
    // setup M
    // get sparsity patterns
    n_in = ca_M_n_in();
    n_out = ca_M_n_out();

    sz_arg=n_in;
    sz_res=n_out;
    sz_iw=0;
    sz_w=0;

    ca_M_work(&sz_arg, &sz_res, &sz_iw, &sz_w);
    // printf("Work vector sizes:\n");
    // printf("sz_arg = %lld, sz_res = %lld, sz_iw = %lld, sz_w = %lld\n\n",
    //        sz_arg, sz_res, sz_iw, sz_w);

    /* Print the sparsities of the inputs and outputs */
    // skip inputs
    ca_i = n_in;
    // Retrieve the sparsity pattern - CasADi uses column compressed storage (CCS)
    // printf("Output %lld\n", ca_i-n_in);
    sp_i = ca_M_sparsity_out(ca_i-n_in);
    if (sp_i==0) return 1;
    nrow = *sp_i++; /* Number of rows */
    ncol = *sp_i++; /* Number of columns */
    colind = sp_i; /* Column offsets */
    row = sp_i + ncol+1; /* Row nonzero */
    nnz_M = sp_i[ncol]; /* Number of nonzeros */

    sparse_int_t M_ir[nnz_M];
    sparse_int_t M_jc[ncol+1];
    real_t M_val[nnz_M];


    zcounter = 0;
    for(cc=0; cc<ncol; ++cc){                    /* loop over columns */
      M_jc[cc] = colind[cc];
      for(el=colind[cc]; el<colind[cc+1]; ++el){ /* loop over the nonzeros entries of the column */
        // if(el!=0) printf(", ");                  /* Separate the entries */
        rr = row[el];                            /* Get the row */
        M_ir[zcounter] = rr;
        zcounter+=1;
        // printf("[%lld,%lld]",rr,cc);                 /* Print the nonzero */
      }
    }

    M_jc[ncol] = nnz_M;

    // printf("}\n\n");

    // for (int i = 0; i < nnz_M; i++) 
    //     printf("M_ir[%i] = %i\n", i, M_ir[i]);

    // for (int i = 0; i < ncol+1; i++) 
    //     printf("M_jc[%i] = %i\n", i, M_jc[i]);
    // evaluate M

    /* Allocate input/output buffers and work vectors*/
    const double *arg_M[sz_arg];
    double *res_M[sz_res];
    casadi_int iw_M[sz_iw];
    real_t w_M[sz_w];

    // for (int i = 0; i < nnz_A; i++) 
    //     printf("A_val[%i] = %f\n", i, A_val[i]);

    evaluate_M(arg_M, res_M, iw_M, w_M, nnz_M, y_val, p_val, M_val);
        // for (int i = 0; i < 2; i++)
        //     printf("M_val[%i] = %f", i, M_val[i]);

    // define sparse matrix for matrix-vector product involved in
    // the gradient update
    Eigen::Map<Eigen::SparseMatrix<double> > M_(NV, NV, nnz_M, M_jc, 
        M_ir, M_val);
{% else %}
    // setup P and M at the same time

    // get sparsity patterns
    n_in = ca_dLdyy_n_in();
    n_out = ca_dLdyy_n_out();

    sz_arg=n_in;
    sz_res=n_out;
    sz_iw=0;
    sz_w=0;

    int nnz_P;

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
    nnz_P = sp_i[ncol]; /* Number of nonzeros */
    nnz_M = sp_i[ncol]; /* Number of nonzeros */

    sparse_int_t P_ir[nnz_P];
    sparse_int_t P_jc[ncol+1];
    real_t P_val[nnz_P];
    sparse_int_t M_ir[nnz_M];
    sparse_int_t M_jc[ncol+1];
    real_t M_val[nnz_M];

    zcounter = 0;
    for(cc=0; cc<ncol; ++cc){                    /* loop over columns */
      P_jc[cc] = colind[cc];
      M_jc[cc] = colind[cc];
      for(el=colind[cc]; el<colind[cc+1]; ++el){ /* loop over the nonzeros entries of the column */
        // if(el!=0) printf(", ");                  /* Separate the entries */
        rr = row[el];                            /* Get the row */
        P_ir[zcounter] = rr;
        M_ir[zcounter] = rr;
        zcounter+=1;
        // printf("[%lld,%lld]",rr,cc);                 /* Print the nonzero */
      }
    }

    P_jc[ncol] = nnz_P;
    M_jc[ncol] = nnz_P;

    // printf("}\n\n");

    // for (int i = 0; i < nnz_P; i++) 
    //     printf("P_ir[%i] = %i\n", i, P_ir[i]);

    // for (int i = 0; i < ncol+1; i++) 
    //     printf("P_jc[%i] = %i\n", i, P_jc[i]);
    // evaluate P

    /* Allocate input/output buffers and work vectors*/
    const double *arg_P[sz_arg];
    double *res_P[sz_res];
    casadi_int iw_P[sz_iw];
    real_t w_P[sz_w];
    const double *arg_M[sz_arg];
    double *res_M[sz_res];
    casadi_int iw_M[sz_iw];
    real_t w_M[sz_w];

    // for (int i = 0; i < nnz_A; i++) 
    //     printf("A_val[%i] = %f\n", i, A_val[i]);

    evaluate_dLdyy(arg_P, res_P, iw_P, w_P, nnz_P, y_val, lam_val, p_val, P_val);

    // define sparse matrix for matrix-vector product involved in
    // the gradient update
    Eigen::Map<Eigen::SparseMatrix<double> > P_(NV, NV, nnz_P, P_jc, 
        P_ir, P_val);
    
    // setup M
    for (int i=0; i<nnz_M; i++)
        M_val[i] = P_val[i];
{% endif %}

    long i;
    int_t nWSR;
    real_t tic, toc;
    real_t *y_QP = new real_t[NV];
    real_t *lam_QP = new real_t[NV + NI];

    // create sparse matrices
    SymSparseMat *M = new SymSparseMat(NV, NV, M_ir, M_jc, M_val);
    // for (int i = 0; i < nnz_A; i++) 
    //     printf("A_val[%i] = %f\n", i, A_val[i]);

	SparseMatrix *A = new SparseMatrix(NI, NV, A_ir, A_jc, A_val);

	M->createDiagInfo();

    real_t g_bar[NV]; 
    Eigen::SparseVector<double> g_temp(NV);
    real_t g[NV]; 
    real_t lbA[NI]; 
    real_t ubA[NI]; 
    real_t lb[NV]; 
    real_t ub[NV]; 

    std::vector<double> myvector = std::vector<double>(dfdy_eval.at(0));

    // cout << "new gradient: " << g_eval.at(0) << endl;

    for(int i = 0; i < NV; i++) {
        g[i] = 0.3 * myvector[i];
        g_bar[i] = myvector[i];
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
	options.printLevel = PL_LOW;
	/* options.printLevel = PL_NONE; */
    options.enableEqualities = BT_TRUE;
    // options.enableFarBounds = BT_FALSE;
    
    Bounds guessedBounds( NV );
    guessedBounds.init(NV);
    for (int i = 0; i < NV; i++) {
        guessedBounds.setupBound(i, (SubjectToStatus)bounds_guess[i]);
    }

    Constraints guessedConstraints( NI );
    guessedConstraints.init(NI);
    for (int i = 0; i < NI; i++) {
	guessedConstraints.setupConstraint(i, (SubjectToStatus)constraints_guess[i]);
    }

    returnValue qpOASES_status;
    SQProblemSchur qpSchur(NV, NI);
    // SQProblem qpSchur(NV, NI);
    // QProblem qpSchur(NV, NI);
    qpSchur.setOptions(options);
    tic = getCPUtime();
    nWSR = min(MAX_ITER_NWSR, MAX_CUM_NWSR - cum_nwsr);

    // printf("A matrix\n");
    // A->print();
    // printf("M matrix\n");
    // M->print();

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

    // fprintf(stdFile, "Solved sparse problem (Schur complement approach) in %d iterations, %.3f seconds.\n", (int)nWSR, toc-tic);
    // exit(1);
#if 1
    
    // for (i = 0; i < NV; i++)
    //     printf("y_val[%i] = %f\n", i, y_val[i]);

    //////////////////////////////////////////////////// 
    // OUTER ITERATIONS
    ////////////////////////////////////////////////////
    
    Bounds bounds_QP;
    Constraints constraints_QP;
    
    // this value is set to one by the inner loop 
    // whenever iterates are aborted
    int abort_inner = 0;
    double alpha = 1.0;
    int updated_alpha = 0;
    real_t step_inf_norm = 0.0;
    double time;
    double kappa;
    
    int inner_solves_counter = 0;
    int solved_inner = 0;
    for(int j = 0; j <  MAX_OUTER_IT; j ++) { 
        kappa = -1.0;
        printf("----------------------------------------------------------------------------------\n");

        // outer loop
        // printf("in outer loop\n");

        if (abort_inner) {
            // restore outer primal iterate
            for(int i = 0; i < NV; i++) {
                y_val[i] = y_outer[i];
                y[i] = y_outer[i];
                // printf("y_outer[%i] = %f\n", i, y_outer[i]);
            }
            
            // restore outer dual iterate
            for(int i = 0; i < NI; i++)
                lam_val[i] = lam_outer[i];

            alpha = alpha * THETA_BAR;
        }


        if (j == 0) {

#if BOUNDS
            qpOASES_status = qpSchur.init(M, g, A, lb, ub, lbA, ubA, nWSR, 0, NULL, NULL, &guessedBounds, &guessedConstraints);
#else
            qpOASES_status = pSchur.init(M, g, A, NULL, NULL, lbA, ubA, nWSR, 0, NULL, NULL, &guessedBounds, &guessedConstraints);
#endif

	    cum_nwsr += nWSR;

            if (qpOASES_status != SUCCESSFUL_RETURN) {
                printf("QP solution failed!\n");
                return 1;
            }

            tot_iter += 1;

            qpSchur.getPrimalSolution(y_QP);

            qpSchur.getDualSolution(lam_QP);
            for (i = 0; i < NV; i++)
                if (getAbs(y_QP[i]) > step_inf_norm)
                    step_inf_norm = getAbs(y_QP[i]);

            for (i = 0; i < NI; i++)
                if (getAbs(lam[i] - lam_QP[i]) > step_inf_norm)
                    step_inf_norm = getAbs(lam[i] - lam_QP[i]);

            printf("----------------------------------------------------------------------------------\n");
            printf("dz\t\tnWSR\tCPU time [s]\talpha\t\tkappa\t\tlin\tk\n");
            printf("----------------------------------------------------------------------------------\n");

            toc = getCPUtime();
            time = toc-tic;

            printf("%1.2e\t%i\t%1.2e\t%1.2e\t%1.2e\t%i\t%i\n", step_inf_norm, (int)nWSR, time, 1.0, kappa, !abort_inner, 0);

            d_stats_0[tot_iter] = step_inf_norm;
            d_stats_1[tot_iter] = time;
            d_stats_2[tot_iter] = 1.0;
            i_stats_0[tot_iter] = nWSR;
            i_stats_1[tot_iter] = 1;

        } else {
            if (abort_inner==0) {
                // update matrices and vectors
                evaluate_dgdy(arg_A, res_A, iw_A, w_A, nnz_A, y_val, p_val, A_val);
                A->setVal(A_val);

                {% if use_approximate_hessian %}
                evaluate_M(arg_M, res_M, iw_M, w_M, nnz_M, y_val, p_val, M_val);
                // exit(1);
                // for (int i = 0; i < 2; i++)
                //     printf("M_val[%i] = %f", i, M_val[i]);
                M->setVal(M_val);
                // printf("M = \n");
                // M->print();
                evaluate_dLdyy(arg_P, res_P, iw_P, w_P, nnz_P, y_val, lam_val, p_val, P_val);
                {% else %}
                evaluate_dLdyy(arg_P, res_P, iw_P, w_P, nnz_P, y_val, lam_val, p_val, P_val);
                M->setVal(P_val);
                {% endif %}
            }

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
            nWSR = min(MAX_ITER_NWSR, MAX_CUM_NWSR - cum_nwsr);
            // SQProblemSchur qrecipeSchur(1, 1);
            tic = getCPUtime();

#if BOUNDS
            qpOASES_status = qpSchur.hotstart(M, g, A, lb, ub, lbA, ubA, nWSR);
#else
            qpOASES_status = qpSchur.hotstart(M, g, A, NULL, NULL, lbA, ubA, nWSR);
#endif

	    cum_nwsr += nWSR;
	    
            if (qpOASES_status != SUCCESSFUL_RETURN) {
                printf("QP solution failed!\n");
                return 1;
            }

            tot_iter += 1;
            qpSchur.getPrimalSolution(y_QP);

            real_t step_inf_norm = 0.0;
            for (i = 0; i < NV; i++)
                if (getAbs(y_QP[i]) > step_inf_norm)
                    step_inf_norm = getAbs(y_QP[i]);

            for (i = 0; i < NI; i++)
                if (getAbs(lam[i] - lam_QP[i]) > step_inf_norm)
                    step_inf_norm = getAbs(lam[i] - lam_QP[i]);

            if (tot_iter%10 == 0) { 
                printf("----------------------------------------------------------------------------------\n");
                printf("dz\t\tnWSR\tCPU time [s]\talpha\t\tkappa\t\tlin\tk\n");
                printf("----------------------------------------------------------------------------------\n");
            }

            toc = getCPUtime();
            time = tic - toc;
            printf("%1.2e\t%i\t%1.2e\t%1.2e\t%1.2e\t%i\t%i\n", step_inf_norm, (int)nWSR, time, alpha, kappa, !abort_inner, 0);

            if(abort_inner) abort_inner = 0;

            d_stats_0[tot_iter] = step_inf_norm;
            d_stats_1[tot_iter] = time;
            d_stats_2[tot_iter] = 1.0;
            i_stats_0[tot_iter] = nWSR;
            i_stats_1[tot_iter] = 1;

            if (step_inf_norm < OUTER_TOL) {
                printf("->solution found!\n");
                for (int i = 0; i < NV; i++)
                    printf("y[%i] = %f\n", i, y[i]);
                return 0;
            }

            qpSchur.getDualSolution(lam_QP);

            // fprintf(stdFile, "Solved sparse problem (Schur complement approach) in %d iterations, %.3f seconds.\n", (int)nWSR, toc-tic);
        }

        qpSchur.getBounds(bounds_QP);
        qpSchur.getConstraints(constraints_QP);

        // print_qp(M, g, A, lb, ub, lbA, ubA);
        // store outer primal iterate before update
        // for (i = 0; i < NV; i++)
        //     printf("y[%i] = %f\n", i, y[i]);
        // for (i = 0; i < NV; i++)
        //     printf("y_QP[%i] = %f\n", i, y_QP[i]);
        for(int i = 0; i < NV; i++) {
            y_outer[i] = y_val[i];
            y[i] = y[i] + y_QP[i];
            y_val[i] = y[i];
        }
        
        // store outer dual iterate before update
        for(int i = 0; i < NI; i++) {
            lam_outer[i] = lam_val[i];
            lam[i] = lam_QP[i];
            lam_val[i] = lam[i];
        }

        // for (i = 0; i < NV; i++)
        //     printf("y_QP[%i] = %f\n", i, y_QP[i]);

        // for (i = 0; i < NV; i++)
        //     printf("y_val[%i] = %f\n", i, y_val[i]);

        //////////////////////////////////////////////////// 
        // INNER ITERATIONS
        ////////////////////////////////////////////////////

        step_history[0] = step_inf_norm;

        for(int k = 1; k < MAX_INNER_IT; k ++) { 

            kappa = -1.0;
        
            // inner loop
            // update vectors and solve hotstarted QP

            // TODO(andrea): only setting y here!
            ca_y_p = {reshape(DM(y), NV, 1), reshape(DM(p), NP, 1)};

#if 1
            // do not evaluate exact gradient, but rather
            // use linear update for g
            for(int i = 0; i < NV; i++)
                g_temp.coeffRef(i) = y[i] - y_outer[i];

            g_temp = (alpha*P_ + (1 - alpha)*M_)*g_temp;

            for(int i = 0; i < NV; i++) {
                g[i] = alpha*(g_bar[i] + g_temp.coeffRef(i));
                // printf("g[%i] = %f\n", i, g[i]);
            }
#else
            // ca_lam[0] = reshape(DM(lam), NI, 1);

            dfdy_eval = ca_dfdy(ca_y_p);
            myvector = std::vector<double>(dfdy_eval.at(0));
            // cout << "new gradient: " << dfdy_eval.at(0) << endl;
            // cout << "ca_y_p: " << ca_y_p << endl;
            // for (i = 0; i < NV; i++)
            //     printf("y_val[%i] = %f\n", i, y_val[i]);
            // for (i = 0; i < NV; i++)
            //     printf("y[%i] = %f\n", i, y[i]);
            for(int i = 0; i < NV; i++) {
                0.3 * g[i] = alpha*myvector[i];
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

            nWSR = min(MAX_ITER_NWSR, MAX_CUM_NWSR - cum_nwsr);

            tic = getCPUtime();

            // print_qp(M, g, A, lb, ub, lbA, ubA);
#if BOUNDS
            qpOASES_status = qpSchur.hotstart(g, lb, ub, lbA, ubA, nWSR);
#else
            qpOASES_status = qpSchur.hotstart(g, NULL, NULL, lbA, ubA, nWSR);
#endif

	    cum_nwsr += nWSR;

            if (qpOASES_status != SUCCESSFUL_RETURN) {
                printf("QP solution failed!\n");
                return 1;
            }

            tot_iter += 1;
            qpSchur.getPrimalSolution(y_QP);
            qpSchur.getDualSolution(lam_QP);

            double step_inf_norm = 0.0;
            for (i = 0; i < NV; i++)
                if (getAbs(y_QP[i]) > step_inf_norm)
                    step_inf_norm = getAbs(y_QP[i]);

            for (i = 0; i < NI; i++)
                if (getAbs(lam[i] - lam_QP[i]) > step_inf_norm)
                    step_inf_norm = getAbs(lam[i] - lam_QP[i]);

            // monitor N-step R-linear convergence
            if (k>=R_CONV_N && k >= 1) {
                step_history[R_CONV_N] = step_inf_norm;
                // printf("\n\n\nSHIFT buffer - k = %i\n\n\n", k);

                // for (int i =0; i < R_CONV_N+1; i++) 
                //     printf("step_history[%i] = %f\n", i, step_history[i]);
                kappa = step_history[R_CONV_N]/step_history[0];
                 
                if (kappa > KAPPA_BAR)
                {
                    alpha = alpha * THETA_BAR;
                    updated_alpha = 1;

                    if (alpha < MIN_ALPHA_INNER) {
                        printf("alpha = %f < MIN_ALPHA_INNER = %f. abort inner iterations\n", 
                            alpha, MIN_ALPHA_INNER);
                        abort_inner = 1;
                        break;
                    }
                }

                if (kappa > KAPPA_TILDE) {
                    printf("kappa = %f > KAPPA_TILDE = %f. abort inner iterations\n", kappa, KAPPA_TILDE);
                    abort_inner = 1;
                    k = MAX_INNER_IT;
                }

                // shift step history
                for (int l=0; l < R_CONV_N; l++) {
                    step_history[l] = step_history[l+1];
                }
            } else { // fill buffer 
                // printf("\n\n\nfill buffer - k = %i\n\n\n", k);
                // for (int i =0; i < R_CONV_N+1; i++) 
                //     printf("step_history[%i] = %f\n", i, step_history[i]);
                step_history[k] = step_inf_norm;
            }

            if (tot_iter%10 == 0) { 
                printf("----------------------------------------------------------------------------------\n");
                printf("dz\t\tnWSR\tCPU time [s]\talpha\t\tkappa\t\tlin\tk\n");
                printf("----------------------------------------------------------------------------------\n");
            }

            toc = getCPUtime();
            time = tic - toc;
            printf("%1.2e\t%i\t%1.2e\t%1.2e\t%1.2e\t%i\t%i\n", step_inf_norm, (int)nWSR, toc-tic, alpha, kappa, 0, k+1);

            d_stats_0[tot_iter] = step_inf_norm;
            d_stats_1[tot_iter] = time;
            d_stats_2[tot_iter] = alpha;
            i_stats_0[tot_iter] = nWSR;
            i_stats_1[tot_iter] = 0;

            // printf("R_CONV = %i, KAPPA_MAX = %f, REMAINDER = %i\n, kappa = %f, k = %i", R_CONV_N, KAPPA_MAX, k%R_CONV_N, kappa, k);
            if (kappa > KAPPA_MAX && k>R_CONV_N && !abort_inner) {
                printf("kappa = %f > KAPPA_MAX = %f. skipping update\n", kappa, KAPPA_MAX);
            } else { 
                // printf("inner loop primal step: %f\n", step_inf_norm);
                if (step_inf_norm < INNER_TOL) {
                    printf("-> solved inner problem!\n\n");
                    alpha = min(alpha * 1 / THETA_BAR, 1.0);
                    k = MAX_INNER_IT;
                    inner_solves_counter+=1;
                    solved_inner = 1;
                    if (inner_solves_counter >= INNER_SOLVES) {
                        printf("-> solved %i inner problems, stopping iterations!\n\n", inner_solves_counter);
                        return 0;
                    } 
                }

                // for (i = 0; i < NV; i++)
                //     printf("y[%i] = %f\n", i, y[i]);
                // for (i = 0; i < NV; i++)
                //     printf("y_QP[%i] = %f\n", i, y_QP[i]);
                for(int i = 0; i < NV; i++) {
                    y[i] = y[i] + y_QP[i];
                    y_val[i] = y[i];
                }

                // for (i = 0; i < NV; i++)
                //     printf("y_val[%i] = %f\n", i, y_val[i]);

                for(int i = 0; i < NI; i++) {
                    lam[i] = lam_QP[i];
                    lam_val[i] = lam[i];
                }
                
                qpSchur.getBounds(bounds_QP);
                qpSchur.getConstraints(constraints_QP);
            }

            // fprintf(stdFile, "Solved hotstarted sparse problem (Schur complement approach) in %d iterations, %.3f seconds.\n", (int)nWSR, toc-tic);

            if (k >= MAX_INNER_IT-1 && !solved_inner && !abort_inner) { 
                printf("max number of inner iterations reached (%i). Abort inner iterations and restore to outer iterate.\n", k); 
                abort_inner = 1;
            }
        }
        
    }
    
    for(int i = 0; i < NV; i++) {
        bounds_last[i] = bounds_QP.getStatus(i);
    }

    for(int i = 0; i < NI; i++) {
        constraints_last[i] = constraints_QP.getStatus(i);
    }
    
    return 1;
#endif

	delete M;
	delete A;

	delete[] y_QP;
    delete[] lam_QP;

	return 0;
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

double set_min_alpha(double min_alpha) {
    MIN_ALPHA_INNER = min_alpha;
    return 0;
}

int set_max_cum_nwsr(int max_cum_nwsr) {
    MAX_CUM_NWSR = max_cum_nwsr;
    return 0;
}

int set_max_iter_nwsr(int max_iter_nwsr) {
    MAX_ITER_NWSR = max_iter_nwsr;
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

int set_r_conv_n(int r_conv_n) {
    if (r_conv_n > MAX_R_CONV_N) {
        printf("r_conv = %i > MAX_R_CONV = %i. Skipping setter.\n", r_conv_n, MAX_R_CONV_N);
    } else {
        R_CONV_N = r_conv_n;
    }
    return 0;
}

int set_inner_solves(int inner_solves) {
    INNER_SOLVES = inner_solves;
    return 0;
}

int get_primal_guess(double *primal_guess) {
  for(int i = 0; i < NV; i++) {
    primal_guess[i] = y_init[i];
  }
}

int get_primal_sol(double *primal_sol) {
    for(int i = 0; i < NV; i++) {
        primal_sol[i] = y_val[i];
    }
    return 0;
}

int get_dual_sol(double *dual_sol) {
    for(int i = 0; i < NI; i++) {
        dual_sol[i] = lam_val[i];
    }
    return 0;
}

int set_primal_guess(double *primal_guess) {
    for(int i = 0; i < NV; i++) {
        y_init[i] = primal_guess[i];
    }
    return 0;
}

int set_dual_guess(double *dual_guess) {
    for(int i = 0; i < NI; i++) {
        lam_init[i] = dual_guess[i];
    }
    return 0;
}

int set_param(double *par) {
    for(int i = 0; i < NP; i++) {
        p_val[i] = par[i];
    }
    return 0;
}

int get_active_bounds(int *bounds) {
    for(int i = 0; i < NV; i++) {
        bounds[i] = bounds_last[i];
    }
    return 0;
}

int get_active_constraints(int *constraints) {
    for(int i = 0; i < NI; i++) {
        constraints[i] = constraints_last[i];
    }
    return 0;
}

int set_active_bounds_guess(int *bounds) {
    for(int i = 0; i < NV; i++) {
        bounds_guess[i] = bounds[i];
    }
    return 0;
}

int set_active_constraints_guess(int *constraints) {
    for(int i = 0; i < NI; i++) {
        constraints_guess[i] = constraints[i];
    }
    return 0;
}

double get_f(double *primal_sol) {
    vector<double> y(NV, 0);
    vector<double> p(NP, 0);
    
    for(int i = 0; i < NP; i++) {
        p[i] = p_val[i];
    }
    
    for(int i = 0; i < NV; i++) {
        y[i] = primal_sol[i];
    }
    
    vector<DM> ca_y_p = {reshape(DM(y), NV, 1), reshape(DM(p), NP, 1)};

    Function ca_f = external("ca_f");
    vector<DM> f_eval = ca_f(ca_y_p);
    
    return std::vector<double>(f_eval.at(0))[0];
}

double get_f0(double *primal_sol) {
    vector<double> y(NV, 0);
    vector<double> p(NP, 0);
    
    for(int i = 0; i < NP; i++) {
        p[i] = p_val[i];
    }
    
    for(int i = 0; i < NV; i++) {
        y[i] = primal_sol[i];
    }
    
    vector<DM> ca_y_p = {reshape(DM(y), NV, 1), reshape(DM(p), NP, 1)};

    Function ca_f0 = external("ca_f0");
    vector<DM> f0_eval = ca_f0(ca_y_p);
    
    return std::vector<double>(f0_eval.at(0))[0];
}

double get_constraint_violation_L1(double *primal_sol) {
    vector<double> y(NV, 0);
    vector<double> p(NP, 0);
    
    for(int i = 0; i < NP; i++) {
        p[i] = p_val[i];
    }
    
    for(int i = 0; i < NV; i++) {
        y[i] = primal_sol[i];
    }
    
    vector<DM> ca_y_p = {reshape(DM(y), NV, 1), reshape(DM(p), NP, 1)};

    Function ca_g = external("ca_g");
    vector<DM> g_eval = ca_g(ca_y_p);
    vector<double> myvector = std::vector<double>(g_eval.at(0));
    
    double cvl1 = 0;
    for(int i = 0; i < NI; i++) {
        if (myvector[i] < lbg[i]) cvl1 += lbg[i] - myvector[i];
        else if (myvector[i] > ubg[i]) cvl1 += myvector[i] - ubg[i];
    }
    
    return cvl1;
}

int get_d_stats(double *d_stats_ret, int i) {
    if (i > 2 || i <0) {
        printf("Invalid stat index %i - value in range [0,2] required\n", i);
    } else {
        double * temp = d_stats[i];
        for (int j = 0; j < MAX_STATS; j++)
            d_stats_ret[j] = temp[j];
    }
    return 0;
}

int get_i_stats(int *i_stats_ret, int i) {
    if (i > 1 || i <0) {
        printf("Invalid stat index %i - value in range [0,1] required\n", i);
    } else {
        int * temp = i_stats[i];
        for (int j = 0; j < MAX_STATS; j++)
            i_stats_ret[j] = temp[j];
    }
    return 0;
}

}
