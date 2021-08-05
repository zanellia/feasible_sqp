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
double MIN_ALPHA_INNER  = {{ solver_opts.min_alpha_inner }};
double INNER_TOL = {{ solver_opts.inner_tol }};
double OUTER_TOL = {{ solver_opts.outer_tol }};
#define NV {{ NV }}
#define NI {{ NI }}
#define NP {{ NP }}
#define BOUNDS 1

int {{ solver_opts.solver_name }}( );

int set_max_inner_it(int max_inner_it);

int set_max_outer_it(int max_outer_it);

double set_kappa_max(double kappa_max);

double set_kappa_tilde(double kappa_tilde);

double set_kappa_bar(double kappa_bar);

double set_theta_bar(double theta_bar);

double set_min_alpha_inner(double min_alpha_inner);

int set_max_nwsr(int max_nwsr);

int set_inner_tol(int inner_tol);

int set_outer_tol(int outer_tol);

int get_primal_sol(double *primal_sol);

int get_dual_sol(double *dual_sol);

int set_primal_guess(double *primal_guess);

int set_dual_guess(double *dual_guess);

int set_param(double *par);
}

// solution
double y_val[NV] = {0};
double y_outer[NV] = {0};
double lam_val[NI] = {0};

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

double lam_init[{{NI}}] = {
    {% for d in lam0 %}
    {{ d[0] }},
    {%- endfor %}
};

#endif
