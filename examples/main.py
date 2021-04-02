from feasible_sqp import *

install_dependencies(matlab_lib_path='/usr/local/MATLAB/R2017b/bin/glnxa64',\
    matlab_include_path='/usr/local/MATLAB/R2017b/extern/include')

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
# generate solver
solver.generate_solver(f,g, lby = lby, uby = uby)
# solve NLP
solver.solve()
