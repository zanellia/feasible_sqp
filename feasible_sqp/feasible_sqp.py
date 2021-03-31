import casadi as ca 
import numpy as np
from os import system 

class feasible_sqp():
    def __init__(self, nv):
        self.y = ca.SX.sym('y', nv, 1)

        return

    def generate_solver(self, f, g):
        g_shape = g.shape

        if g_shape[1] != 1:
            raise Exception('g must have shape (<>,1), you have {}.'.format(g_shape))

        ni = g_shape(0)

        optlevel = ''

        opts = dict(with_header=True)

        ca_dfdy = ca.Function('ca_dfdy', [y], [ca.jacobian(f,y)])
        ca_dfdy.generate('ca_dfdy', opts)
        print('compiling generated code for dfdy...')
        system('gcc -fPIC -shared {} ca_dfdy.c -o ../bin/libca_dfdy.so'.format(optlevel))
        system('gcc -fPIC -shared {} ca_dfdy.c -o ../bin/ca_dfdy.so'.format(optlevel))

        ca_g = ca.Function('ca_g', [y], [g])
        ca_g.generate('ca_g', opts)
        print('compiling generated code for g...')
        system('gcc -fPIC -shared {} ca_g.c -o ../bin/libca_g.so'.format(optlevel))
        system('gcc -fPIC -shared {} ca_g.c -o ../bin/ca_g.so'.format(optlevel))
        ca_g.save("../bin/ca_g.casadi")

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
        print('successfully generated solver!')

        return

