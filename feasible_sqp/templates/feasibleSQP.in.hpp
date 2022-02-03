#ifndef {{ solver_opts.solver_name }}_H
#define {{ solver_opts.solver_name }}_H
extern "C" {

int MAX_NWSR = {{ solver_opts.max_nwsr }};
int MAX_INNER_IT = {{ solver_opts.max_inner_it }};
int MAX_OUTER_IT = {{ solver_opts.max_outer_it }};
double KAPPA_MAX    = {{ solver_opts.kappa_max }};
double KAPPA_TILDE    = {{ solver_opts.kappa_tilde }};
double KAPPA_BAR    = {{ solver_opts.kappa_bar }};
double THETA_BAR    = {{ solver_opts.theta_bar }};
double MIN_ALPHA_INNER  = {{ solver_opts.min_alpha }};
double INNER_TOL = {{ solver_opts.inner_tol }};
double OUTER_TOL = {{ solver_opts.outer_tol }};
int R_CONV_N = {{ solver_opts.r_conv_n }};
int INNER_SOLVES = {{ solver_opts.inner_solves }};

#define NV {{ NV }}
#define NI {{ NI }}
#define NP {{ NP }}
// #define BOUNDS 1
#define BOUNDS 1

USING_NAMESPACE_QPOASES
void print_qp(SymSparseMat* M, double* g, SparseMatrix* A, double* lb, double* ub, double* lbA, double* ubA);

int {{ solver_opts.solver_name }}_init();

int {{ solver_opts.solver_name }}( );

int set_max_inner_it(int max_inner_it);

int set_max_outer_it(int max_outer_it);

int set_r_conv_n(int r_conv_n);

int set_inner_solves(int inner_solves);

double set_kappa_max(double kappa_max);

double set_kappa_tilde(double kappa_tilde);

double set_kappa_bar(double kappa_bar);

double set_theta_bar(double theta_bar);

double set_min_alpha(double min_alpha);

int set_max_nwsr(int max_nwsr);

int set_inner_tol(int inner_tol);

int set_outer_tol(int outer_tol);

int get_primal_sol(double *primal_sol);

int get_dual_sol(double *dual_sol);

int set_primal_guess(double *primal_guess);

int set_dual_guess(double *dual_guess);

int set_param(double *par);

int get_active_bounds(int *bounds);

int get_active_constraints(int *constraints);

int set_active_bounds_guess(int *bounds);

int set_active_constraints_guess(int *constraints);

// getters for objective function and feasibility assessment
double get_f(double *primal_sol);

double get_f0(double *primal_sol);

double get_constraint_violation_L1(double *primal_sol);

// getters for stats
int get_d_stats(double *d_stats_ret, int i);

int get_i_stats(int *i_stats_ret, int i);


}

// solution
double y_val[NV] = {0};
double y_outer[NV] = {0};
double lam_val[NI+NV] = {0};
double lam_outer[NI+NV] = {0};

#define MAX_STATS 10000

// stats
double * d_stats[3];
int    * i_stats[3];
double d_stats_0[MAX_STATS] = {0.0};
double d_stats_1[MAX_STATS] = {0.0};
double d_stats_2[MAX_STATS] = {0.0};
int i_stats_0[MAX_STATS] = {0};
int i_stats_1[MAX_STATS] = {0};

#define MAX_R_CONV_N 50
double step_history[MAX_R_CONV_N] = {0.0};

// active set
int bounds_guess[NV] = {0};
int constraints_guess[NI] = {0};
int bounds_last[NV] = {0};
int constraints_last[NI] = {0};

double lby[{{NV}}] = {
    {% for d in lby %}
    {{ d[0] }},
    {%- endfor %}
};

double uby[{{NV}}] = {
    {% for d in uby %}
    {{ d[0] }},
    {%- endfor %}
};

double lbg[{{NI}}] = {
    {% for d in lbg %}
    {{ d[0] }},
    {%- endfor %}
};

double ubg[{{NI}}] = {
    {% for d in ubg %}
    {{ d[0] }},
    {%- endfor %}
};

double p_val[{{NP}}] = {
    {% for d in p0 %}
    {{ d[0] }},
    {%- endfor %}
};

double y_init[{{NV}}] = {
    {% for d in y0 %}
    {{ d[0] }},
    {%- endfor %}
};

double lam_init[{{2*(NI+NV)}}] = {
    {% for d in lam0 %}
    {{ d[0] }},
    {%- endfor %}
};

#endif
