/* This file was automatically generated by CasADi.
   The CasADi copyright holders make no ownership claim of its contents. */
#ifdef __cplusplus
extern "C" {
#endif

#ifndef casadi_real
#define casadi_real double
#endif

#ifndef casadi_int
#define casadi_int long long int
#endif

int ca_dfdy(const casadi_real** arg, casadi_real** res, casadi_int* iw, casadi_real* w, int mem);
int ca_dfdy_alloc_mem(void);
int ca_dfdy_init_mem(int mem);
void ca_dfdy_free_mem(int mem);
int ca_dfdy_checkout(void);
void ca_dfdy_release(int mem);
void ca_dfdy_incref(void);
void ca_dfdy_decref(void);
casadi_int ca_dfdy_n_out(void);
casadi_int ca_dfdy_n_in(void);
casadi_real ca_dfdy_default_in(casadi_int i);
const char* ca_dfdy_name_in(casadi_int i);
const char* ca_dfdy_name_out(casadi_int i);
const casadi_int* ca_dfdy_sparsity_in(casadi_int i);
const casadi_int* ca_dfdy_sparsity_out(casadi_int i);
int ca_dfdy_work(casadi_int *sz_arg, casadi_int* sz_res, casadi_int *sz_iw, casadi_int *sz_w);
#ifdef __cplusplus
} /* extern "C" */
#endif
