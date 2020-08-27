import casadi as ca 
import numpy as np
from os import system 

nv = 100
ni = 1

y = ca.SX.sym('y', nv, 1)
lam = ca.SX.sym('lam', ni, 1)

optlevel = ''

opts = dict(with_header=True)

# objective function 
f = 1.0/2.0*ca.dot(y-1,y-1)
ca_dfdy = ca.Function('ca_dfdy', [y], [ca.jacobian(f,y)])
ca_dfdy.generate('ca_dfdy', opts)
print('compiling generated code for dfdy...')
system('gcc -fPIC -shared {} ca_dfdy.c -o ../bin/libca_dfdy.so'.format(optlevel))
system('gcc -fPIC -shared {} ca_dfdy.c -o ../bin/ca_dfdy.so'.format(optlevel))

# constraints
g = ca.vertcat(0.1*y[10]**2 - ca.sin(y[1]))
# g = ca.vertcat(y[0] - y[1] + 1)
# g = y[0:ni]

ca_g = ca.Function('ca_g', [y], [g])
ca_g.generate('ca_g', opts)
print('compiling generated code for g...')
system('gcc -fPIC -shared {} ca_g.c -o ../bin/libca_g.so'.format(optlevel))
system('gcc -fPIC -shared {} ca_g.c -o ../bin/ca_g.so'.format(optlevel))
ca_g.save("../bin/ca_g.casadi")
# temp = ca.Function.load("../bin/ca_g.casadi")
# import pdb; pdb.set_trace()

print('compiling generated code for dgdy...')
ca_dgdy = ca.Function('ca_dgdy', [y], [ca.jacobian(g,y)])
ca_dgdy.generate('ca_dgdy', opts)
system('gcc -fPIC -shared {} ca_dgdy.c -o ../bin/libca_dgdy.so'.format(optlevel))
system('gcc -fPIC -shared {} ca_dgdy.c -o ../bin/ca_dgdy.so'.format(optlevel))

# Lagrangian
L = f + ca.dot(lam, g)

print('compiling generated code for dLdyy...')
ca_dLdyy = ca.Function('ca_dLdyy', [y, lam], [ca.hessian(L,y)[0]])
ca_dLdyy.generate('ca_dLdyy', opts)
system('gcc -fPIC -shared -O3 ca_dLdyy.c -o ../bin/libca_dLdyy.so')
system('gcc -fPIC -shared -O3 ca_dLdyy.c -o ../bin/ca_dLdyy.so')
