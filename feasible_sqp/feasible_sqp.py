import casadi as ca 
import numpy as np
import os
from jinja2 import Environment
from jinja2.loaders import FileSystemLoader
from ctypes import *
import json

def install_dependencies(matlab_root_path=None, \
        blas_lib_path=None, lapack_lib_path=None, lib_solver_path=None, lib_hsl_path=None, \
        qpoases_root=None, casadi_root=None):

    if (matlab_root_path == None) and \
            (blas_lib_path == None or lapack_lib_path == None or lib_solver_path == None or lib_hsl_path == None):
        raise Exception('MA57 from the HSL library is required. Specify either matlab_root_path or'\
                ' blas_lib_path, lapack_lib_path, lib_solver_path and lib_hsl_path.')

    matlab_lib_path = matlab_root_path + '/bin/glnxa64'
    matlab_include_path = matlab_root_path + '/extern/include'

    root_path = os.path.dirname(os.path.abspath(__file__)) + '/..'

    cwd = os.getcwd()
    os.chdir(root_path)

    library_paths = dict()
    if qpoases_root is None:
        qpoases_root = root_path + '/external/qpOASES'
        print('Warning: using default qpOASES path: {}'.format(qpoases_root))
    if casadi_root is None:
        casadi_root = root_path + '/external/casadi'
        print('Warning: using default CasADi path: {}'.format(casadi_root))

    library_paths['qpoases'] = qpoases_root + '/bin'
    library_paths['casadi'] = casadi_root + '/installation/lib'

    os.chdir('external')
    if matlab_root_path:
        os.system('make MATLAB_LIBDIR={} MATLAB_IDIR={}'.format(matlab_lib_path, matlab_include_path))
        library_paths['matlab'] = matlab_lib_path
    else:
        os.system('make LIB_BLAS={} LIB_LAPACK={} LIB_SOLVER={} LINKHSL={}'.format(blas_lib_path, \
            lapack_lib_path, lib_solver_path, lib_hsl_path))

    os.chdir('../feasible_sqp')

    # store library paths
    with open('paths.json', 'w') as f:
        json.dump(library_paths, f)

    os.chdir(cwd)

class feasible_sqp():
    def __init__(self, nv, solver_name = 'fsqp_solver'):
        self.y = ca.SX.sym('y', nv, 1)
        self.ni = 0
        self.nv = nv
        opts = dict()
        opts['max_nwsr'] = 10000
        opts['max_inner_it'] = 10
        opts['max_outer_it'] = 10
        opts['inner_tol'] = 1E-3
        opts['outer_tol'] = 1E-6
        opts['solver_name'] = solver_name
        self.opts = opts

        return

    def generate_solver(self, f, g, lby = [], uby = [], lbg = [], ubg = [], qpoases_root=None, casadi_root=None):
        g_shape = g.shape

        if g_shape[1] != 1:
            raise Exception('g must have shape (<>,1), you have {}.'.format(g_shape))

        ni = g_shape[0]
        self.ni = ni
        nv = self.nv

        FSQP_INF = 1E12
        if lby == []:
            lby = -FSQP_INF*np.ones((nv,1))

        if uby == []:
            uby = FSQP_INF*np.ones((nv,1))

        if lbg == []:
            lbg = np.zeros((ni,1))

        if ubg == []:
            ubg = np.zeros((ni,1))

        if not isinstance(lby, np.ndarray):
            raise Exception('lby must be of type np.array, you have {}'.format(type(lby)))

        if not isinstance(uby, np.ndarray):
            raise Exception('lbu must be of type np.array, you have {}'.format(type(uby)))

        if not isinstance(lbg, np.ndarray):
            raise Exception('lbg must be of type np.array, you have {}'.format(type(lbg)))

        if not isinstance(ubg, np.ndarray):
            raise Exception('ubg must be of type np.array, you have {}'.format(type(ubg)))

        lby_shape = lby.shape

        if lby_shape[0] != nv or lby_shape[1] != 1:
            raise Exception('lby must have shape (nv,1) = ({},1), you have ({},{})'\
                .format(nv, lby_shape[0], lby_shape[1]))

        uby_shape = uby.shape

        if uby_shape[0] != nv or uby_shape[1] != 1:
            raise Exception('uby must have shape (nv,1) = ({},1), you have ({},{})'\
                .format(nv, uby_shape[0], uby_shape[1]))

        lbg_shape = lbg.shape

        if lbg_shape[0] != ni or lbg_shape[1] != 1:
            raise Exception('lbg must have shape (ni,1) = ({},1), you have ({},{})'\
                .format(nv, lbg_shape[0], lbg_shape[1]))

        ubg_shape = ubg.shape

        if ubg_shape[0] != ni or ubg_shape[1] != 1:
            raise Exception('ubg must have shape (ni,1) = ({},1), you have ({},{})'\
                .format(ni, ubg_shape[0], ubg_shape[1]))

        optlevel = ''

        opts = dict(with_header=True)

        y = self.y
        lam = ca.SX.sym('lam', ni, 1)

        os.system('mkdir -p {}'.format(self.opts['solver_name']))
        os.chdir(self.opts['solver_name'])
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
        with open('{}.cpp'.format(self.opts['solver_name']), "w+") as f:
            f.write(code)

        tmpl = env.get_template("templates/feasibleSQP.in.hpp")
        code = tmpl.render(solver_opts = self.opts, NV = nv, NI = ni, \
            lby = lby, uby = uby, lbg = lbg, ubg = ubg)

        with open('{}.hpp'.format(self.opts['solver_name']), "w+") as f:
            f.write(code)

        tmpl = env.get_template("templates/main.in.cpp")
        code = tmpl.render(solver_opts = self.opts)
        with open('main.cpp', "w+") as f:
            f.write(code)

        print('rendering templated Makefile...')
        tmpl = env.get_template("templates/Makefile.in")
        build_params = dict()
        fsqp_root = os.path.dirname(os.path.abspath(__file__)) + '/../'
        if casadi_root is None:
            casadi_root = fsqp_root + 'external/casadi'
        if qpoases_root is None:
            qpoases_root = fsqp_root + 'external/qpOASES'
        build_params['qpoases_root'] = qpoases_root
        build_params['casadi_root'] = casadi_root
        build_params['solver_name'] = self.opts['solver_name']
        code = tmpl.render(build_params = build_params)
        with open('Makefile', "w+") as f:
            f.write(code)

        os.system('make {}_shared'.format(self.opts['solver_name']))

        print('successfully generated solver!')
        os.chdir('..')

        # generate script to set LD_LIBRARY_PATH
        fsqp_root = os.path.dirname(os.path.abspath(__file__)) + '/../'
        with open(fsqp_root + '/feasible_sqp/paths.json', 'r') as f:
            library_paths = json.load(f)

        paths = ''
        cwd = os.getcwd()
        paths = paths + ':' + cwd + '/' + self.opts['solver_name']
        for key in library_paths:
            paths = paths + ':' + library_paths[key]

        with open('set_LD_LIBRARY_PATH.sh', 'w') as f:
            f.write('#!/bin/bash\nexport LD_LIBRARY_PATH=$LD_LIBRARY_PATH:{}'.format(paths))

        return

    def solve(self):

        # get solver shared_lib
        solver_name = self.opts['solver_name']
        self.shared_lib = CDLL(solver_name + '/' + solver_name + '.so')

        #TODO(andrea): why is this necessary??
        os.chdir(self.opts['solver_name'])

        self.shared_lib.fsqp_solver()

        os.chdir('..')


