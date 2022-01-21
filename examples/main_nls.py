from feasible_sqp import *
import numpy as nmp

INSTALL_DEPS = 0
USE_MATLAB_HSL = 0

if INSTALL_DEPS:
    if USE_MATLAB_HSL: 
        install_dependencies(matlab_root_path='/usr/local/MATLAB/R2017b')
    else:
        install_dependencies(
            # hsl_lib_path='/usr/local/MATLAB/R2017b/bin/glnxa64/libmwma57.so')
            # hsl_lib_path='/home/andrea/coinhsl-2015.06.23-fsqp/.libs/libcoinhsl.so')
            hsl_lib_path='/home/andrea/feasible_sqp/external/coin_hsl_source/.libs/libcoinhsl.so')
            # hsl_lib_path='/usr/local/lib/libhsl.so')

# number of primal variables
nv = 2
# create solver
solver = feasible_sqp(nv, np=1)
# get primal variables
y = solver.y
p = solver.p

# define cost
r = ca.vertcat(ca.sin(y[0]-p), y[1])
f = 1.0/2.0*ca.mtimes(r.T,r)
J = ca.jacobian(r,y)
gn_hess = ca.mtimes(J.T,J)

# define constraints
g = ca.vertcat(ca.sin(y[1]) + 0.5)

# define bounds
lby = -0.8*nmp.ones((nv,1))
uby = 0.8*nmp.ones((nv,1))

# define nonlinear constraints
lbg = -0.000*nmp.ones((1,1))
ubg = 0.000*nmp.ones((1,1))

# define parameters
p0 = 5.0*nmp.ones((1,1))

# generate solver
solver.generate_solver(f, f, g, lby = lby, uby = uby, lbg=lbg, ubg=ubg, p0 = p0, approximate_hessian=gn_hess)
# solver.generate_solver(f,g, lby = lby, uby = uby, lbg=lbg, ubg=ubg, p0 = p0)
# solver.generate_solver(f,g, lby = lby, uby = uby)

# solve NLP
solver.set_inner_solves(10)
solver.solve()
y_bar = solver.get_primal_sol()
print('optimal primal solution: ', y_bar)
lam_bar = solver.get_dual_sol()
print('optimal dual solution: ', lam_bar)
print('')
