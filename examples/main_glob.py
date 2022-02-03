from feasible_sqp import *
import numpy as nmp

INSTALL_DEPS = 0
USE_MATLAB_HSL = 0

if INSTALL_DEPS:
    if USE_MATLAB_HSL: 
        install_dependencies(matlab_root_path='/usr/local/MATLAB/R2017b')
    else:
        install_dependencies(
            hsl_lib_path='/home/andrea/feasible_sqp/external/coin_hsl_source/.libs/libcoinhsl.so')

# number of primal variables
nv = 1
# create solver
solver = feasible_sqp(nv)
# get primal variables
y = solver.y
p = solver.p

# define cost
f = -1/2*y[0]**2 + y[0]**4
J = ca.jacobian(y,y)
gn_hess = ca.mtimes(J.T,J)

# define constraints
g = y 

# define bounds
lby = -1000*nmp.ones((nv,1))
uby = 1000*nmp.ones((nv,1))

# define nonlinear constraints
lbg = -1000.000*nmp.ones((nv,1))
ubg = 1000.000*nmp.ones((nv,1))

# define parameters
y0 = 0.55*nmp.ones((nv,1))

# generate solver
solver.generate_solver(f, f, g, lby = lby, uby = uby, lbg=lbg, ubg=ubg, \
    y0=y0, approximate_hessian=gn_hess)

# solve NLP
solver.set_inner_solves(100)
solver.set_max_outer_it(100)
solver.set_kappa_max(0.7)
solver.set_max_inner_it(50)
solver.set_r_conv_n(5)
solver.set_theta_bar(0.7)
solver.solve()
y_bar = solver.get_primal_sol()
print('optimal primal solution: ', y_bar)
lam_bar = solver.get_dual_sol()
print('optimal dual solution: ', lam_bar)
print('')
