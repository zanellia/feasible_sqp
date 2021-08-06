from feasible_sqp import *
import numpy as nmp

INSTALL_DEPS = 0
USE_MATLAB_HSL = 0

if INSTALL_DEPS:
    if USE_MATLAB_HSL: 
        install_dependencies(matlab_root_path='/usr/local/MATLAB/R2017b')
    else:
        install_dependencies(
            blas_lib_path='/usr/lib/libblas.so', \
            lapack_lib_path='/usr/lib/lapack/liblapack.so', \
            # hsl_lib_path='/usr/local/MATLAB/R2017b/bin/glnxa64/libmwma57.so')
            hsl_lib_path='/home/andrea/coinhsl-2015.06.23-fsqp/.libs/libcoinhsl.so')
            # hsl_lib_path='/usr/local/lib/libhsl.so')

# number of primal variables
nv = 2
# create solver
solver = feasible_sqp(nv, np=1)
# get primal variables
y = solver.y
p = solver.p

# define cost
f = 1.0/2.0*ca.dot(y-10,y-p)
# define constraints
g = ca.vertcat(1.0 + 1.0*ca.sin(y[0]) - y[1])
# define bounds
lby = -0.4*nmp.ones((nv,1))
uby = 0.7*nmp.ones((nv,1))
# define nonlinear constraints
lbg = -0.000*nmp.ones((1,1))
ubg = 0.000*nmp.ones((1,1))
# define parameters
p0 = 10.0*nmp.ones((1,1))
# generate solver
solver.generate_solver(f,g, lby = lby, uby = uby, lbg=lbg, ubg=ubg, p0 = p0)
# solver.generate_solver(f,g, lby = lby, uby = uby)

# init NLP solver
solver.init()

# solve NLP
solver.solve()
y_bar = solver.get_primal_sol()
print('optimal primal solution: ', y_bar)
lam_bar = solver.get_dual_sol()
print('optimal dual solution: ', lam_bar)
print('')

# set params
solver.set_param(-10.0*nmp.ones((1,1)))
# set initial guess
solver.set_primal_guess(y_bar)
solver.set_dual_guess(lam_bar)

# re-solve NLP
solver.solve()
y_bar = solver.get_primal_sol()
print('optimal primal solution: ', y_bar)
lam_bar = solver.get_dual_sol()
print('optimal dual solution: ', lam_bar)
print('')

# set params
solver.set_param(10.0*nmp.ones((1,1)))
# set initial guess
solver.set_primal_guess(y_bar)
solver.set_dual_guess(lam_bar)
solver.solve()
lam_bar = solver.get_dual_sol()
print('optimal dual solution: ', lam_bar)

stats = solver.get_stats()

import pdb; pdb.set_trace()
