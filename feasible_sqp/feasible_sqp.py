import casadi as ca 
import numpy as np
import os
from jinja2 import Environment
from jinja2.loaders import FileSystemLoader

class feasible_sqp():
    def __init__(self, nv, solver_name = 'fsqp_solver'):
        self.y = ca.SX.sym('y', nv, 1)
        self.solver_name = solver_name
        self.ni = 0
        self.nv = nv
        opts = dict()
        opts['max_nwsr'] = 10000
        opts['max_inner_it'] = 100
        opts['max_outer_it'] = 100
        opts['inner_tol'] = 1E-3
        opts['outer_tol'] = 1E-6
        self.opts = opts

        return

    def generate_solver(self, f, g):
        g_shape = g.shape

        if g_shape[1] != 1:
            raise Exception('g must have shape (<>,1), you have {}.'.format(g_shape))

        ni = g_shape[0]
        self.ni = ni

        optlevel = ''

        opts = dict(with_header=True)

        y = self.y
        lam = ca.SX.sym('lam', ni, 1)

        os.system('mkdir -p {}'.format(self.solver_name))
        os.chdir(self.solver_name)
        ca_dfdy = ca.Function('ca_dfdy', [y], [ca.jacobian(f,y)])
        ca_dfdy.generate('ca_dfdy', opts)
        print('compiling generated code for dfdy...')
        os.system('gcc -fPIC -shared {} ca_dfdy.c -o libca_dfdy.so'.format(optlevel))
        os.system('gcc -fPIC -shared {} ca_dfdy.c -o ca_dfdy.so'.format(optlevel))

        ca_g = ca.Function('ca_g', [y], [g])
        ca_g.generate('ca_g', opts)
        print('compiling generated code for g...')
        os.system('gcc -fPIC -shared {} ca_g.c -o libca_g.so'.format(optlevel))
        os.system('gcc -fPIC -shared {} ca_g.c -o ca_g.so'.format(optlevel))
        # ca_g.save("ca_g.casadi")

        print('compiling generated code for dgdy...')
        ca_dgdy = ca.Function('ca_dgdy', [y], [ca.jacobian(g,y)])
        ca_dgdy.generate('ca_dgdy', opts)
        os.system('gcc -fPIC -shared {} ca_dgdy.c -o libca_dgdy.so'.format(optlevel))
        os.system('gcc -fPIC -shared {} ca_dgdy.c -o ca_dgdy.so'.format(optlevel))

        # Lagrangian
        L = f + ca.dot(lam, g)

        print('compiling generated code for dLdyy...')
        ca_dLdyy = ca.Function('ca_dLdyy', [y, lam], [ca.hessian(L,y)[0]])
        ca_dLdyy.generate('ca_dLdyy', opts)
        os.system('gcc -fPIC -shared -O3 ca_dLdyy.c -o libca_dLdyy.so')
        os.system('gcc -fPIC -shared -O3 ca_dLdyy.c -o ca_dLdyy.so')

        print('rendering templated C++ code...')
        env = Environment(loader=FileSystemLoader(os.path.dirname(os.path.abspath(__file__))))
        tmpl = env.get_template("templates/feasibleSQP.in.cpp")
        code = tmpl.render(solver_opts = self.opts, NI = self.ni, NV = self.nv)
        with open('feasibleSQP.cpp', "w+") as f:
            f.write(code)

        print('rendering templated Makefile...')


        print('successfully generated solver!')

        return

