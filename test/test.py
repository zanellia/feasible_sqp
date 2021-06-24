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

y_bar = solver.get_primal_sol()
print('optimal primal solution: ', y_bar)
lam_bar = solver.get_dual_sol()
print('optimal dual solution: ', lam_bar)

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

# set params
solver.set_param(10.0*nmp.ones((1,1)))
# set initial guess
solver.set_primal_guess(y_bar)
solver.set_dual_guess(lam_bar)
solver.solve()
lam_bar = solver.get_dual_sol()
print('optimal dual solution: ', lam_bar)
