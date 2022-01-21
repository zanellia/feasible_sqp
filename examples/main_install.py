from feasible_sqp import *
import numpy as nmp

INSTALL_DEPS = 1
USE_MATLAB_HSL = 0

if INSTALL_DEPS:
    if USE_MATLAB_HSL: 
        install_dependencies(matlab_root_path='/usr/local/MATLAB/R2017b')
    else:
        install_dependencies(
            blas_lib_path='/usr/lib/x86_64-linux-gnu/blas/libblas.so', \
            lapack_lib_path='/usr/lib/x86_64-linux-gnu/lapack/liblapack.so', \
            hsl_lib_path='/usr/local/lib/libhsl.so')

# number of primal variables
nv = 2
# create solver
solver = feasible_sqp(nv, np=1)
# get primal variables
y = solver.y
p = solver.p

# define cost
f = 1.0/2.0*ca.mtimes(y.T-10,y-p)
# define constraints
g = ca.vertcat(1.0 + ca.sin(y[1]) - y[0])
# define bounds
lby = -0.4*nmp.ones((nv,1))
uby = 0.7*nmp.ones((nv,1))
# define nonlinear constraints
lbg = -0.000*nmp.ones((1,1))
ubg = 0.000*nmp.ones((1,1))
# define parameters
p0 = 10.0*nmp.ones((1,1))
# generate solver
solver.generate_solver(f,f,g, lby = lby, uby = uby, lbg=lbg, ubg=ubg, p0 = p0)
# solver.generate_solver(f,f,g, lby = lby, uby = uby)
