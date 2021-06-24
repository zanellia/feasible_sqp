from feasible_sqp import *
import numpy as nmp

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
lby = -0.4*nmp.ones((nv,1))
uby = 0.7*nmp.ones((nv,1))

# define nonlinear constraints
lbg = -0.0001*nmp.ones((1,1))
ubg = 0.0001*nmp.ones((1,1))

# generate solver
# solver.generate_solver(f,g, lby = lby, uby = uby, lbg=lbg, ubg=ubg)
solver.generate_solver(f,g, lby = lby, uby = uby)

# solve NLP
solver.solve()
