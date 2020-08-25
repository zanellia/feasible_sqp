import casadi as ca 
import numpy as np
from os import system 

nv = 10
ni = 1

y = ca.SX.sym('y', nv, 1)
lam = ca.SX.sym('lam', ni, 1)

opts = dict(with_header=True)

# objective function 
f = 1.0/2.0*(y[0]**2 + y[1]**2)

ca_dfdy = ca.Function('ca_dfdy', [y], [ca.jacobian(f,y)])
ca_dfdy.generate('ca_dfdy', opts)
system('gcc -fPIC -shared -O3 ca_dfdy.c -o ../bin/libca_dfdy.so')
system('gcc -fPIC -shared -O3 ca_dfdy.c -o ../bin/ca_dfdy.so')

# constraints
g = y[0] - 2*y[1] + 0.5*y[8] 

ca_g = ca.Function('ca_g', [y], [g])
ca_g.generate('ca_g', opts)
system('gcc -fPIC -shared -O3 ca_g.c -o ../bin/libca_g.so')
system('gcc -fPIC -shared -O3 ca_g.c -o ../bin/ca_g.so')
ca_g.save("../bin/ca_g.casadi")
# temp = ca.Function.load("../bin/ca_g.casadi")
# import pdb; pdb.set_trace()

ca_dgdy = ca.Function('ca_dgdy', [y], [ca.jacobian(g,y)])
ca_dgdy.generate('ca_dgdy', opts)
system('gcc -fPIC -shared -O3 ca_dgdy.c -o ../bin/libca_dgdy.so')
system('gcc -fPIC -shared -O3 ca_dgdy.c -o ../bin/ca_dgdy.so')

# Lagrangian
L = f + ca.dot(lam, g)

ca_dLdyy = ca.Function('ca_dLdyy', [y, lam], [ca.hessian(L,y)[0]])
ca_dLdyy.generate('ca_dLdyy', opts)
system('gcc -fPIC -shared -O3 ca_dLdyy.c -o ../bin/ca_dLdyy.so')
