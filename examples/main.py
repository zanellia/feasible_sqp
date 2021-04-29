from feasible_sqp import *

INSTALL_DEPS = 1
USE_MATLAB_HSL = 0

if INSTALL_DEPS:
    if USE_MATLAB_HSL: 
        install_dependencies(matlab_root_path='/usr/local/MATLAB/R2017b')
    else:
        install_dependencies(
            blas_lib_path='/usr/lib/libblas.so', \
            lapack_lib_path='/usr/lib/lapack/liblapack.so', \
            lib_solver_path='/usr/local/lib/libhsl.so')

# number of primal variables
nv = 2
# create solver
solver = feasible_sqp(nv)
# get primal variables
y = solver.y

# define cost
f = 1.0/2.0*ca.dot(y-10,y-10)
# define constraints
g = ca.vertcat(ca.sin(y[1]) - y[0])
# define bounds
lby = -0.4*np.ones((nv,1))
uby = 0.7*np.ones((nv,1))
# define nonlinear constraints
lbg = -0.0001*np.ones((1,1))
ubg = 0.0001*np.ones((1,1))
# generate solver
solver.generate_solver(f,g, lby = lby, uby = uby, lbg=lbg, ubg=ubg)
# solver.generate_solver(f,g, lby = lby, uby = uby)
# solve NLP
solver.solve()
