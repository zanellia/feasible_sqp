from feasible_sqp import *

# number of primal variables
nv = 100
# create solver
solver = feasible_sqp(nv)
# get primal variables
y = solver.y

# define cost
f = 1.0/2.0*ca.dot(y-1,y-1)
# define constraints
g = ca.vertcat(0.1*y[10]**2 - ca.sin(y[1]))
# generate solver
solver.generate_solver(f,g)
