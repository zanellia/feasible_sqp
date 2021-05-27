import casadi as ca 
import numpy as nmp
import os
from jinja2 import Environment
from jinja2.loaders import FileSystemLoader
from ctypes import *
import json
import sys

def install_dependencies(matlab_root_path=None, \
        blas_lib_path=None, lapack_lib_path=None, hsl_lib_path=None, \
        qpoases_root=None, casadi_root=None):

    if (matlab_root_path == None) and \
            (blas_lib_path == None or lapack_lib_path == None or hsl_lib_path == None):
        raise Exception('MA57 from the HSL library is required. Specify either matlab_root_path or'\
                ' blas_lib_path, lapack_lib_path, hsl_lib_path.')

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
        matlab_lib_dir = matlab_root_path + '/bin/glnxa64'
        matlab_include_dir = matlab_root_path + '/extern/include'

        cmd = 'make MATLAB_LIBDIR={} MATLAB_IDIR={} CASADI_ROOT_DIR={} QPOASES_ROOT_DIR={}'.format(\
            matlab_lib_dir, matlab_include_dir, casadi_root, qpoases_root)

        status = os.system(cmd)

        if status != 0:
            raise Exception('{} failed'.format(cmd))

        library_paths['matlab'] = matlab_lib_dir
    else:
        hsl_lib_dir = '/'.join(hsl_lib_path.split('/')[0:-1])

        cmd = 'make LIB_BLAS={} LIB_LAPACK={} LIB_SOLVER={} LIB_HSL_DIR={} CASADI_ROOT_DIR={} QPOASES_ROOT_DIR={}'.format(\
            blas_lib_path, lapack_lib_path, hsl_lib_path, hsl_lib_dir, casadi_root, qpoases_root)

        status = os.system(cmd)

        if status != 0:
            raise Exception('{} failed'.format(cmd))

        blas_lib_dir = '/'.join(blas_lib_path.split('/')[0:-1])
        lapack_lib_dir = '/'.join(lapack_lib_path.split('/')[0:-1])
        library_paths['hsl'] = hsl_lib_dir
        library_paths['blas'] = blas_lib_dir
        library_paths['lapack'] = lapack_lib_dir

    os.chdir('../feasible_sqp')

    # store library paths
    with open('paths.json', 'w') as f:
        json.dump(library_paths, f)

    os.chdir(cwd)

class feasible_sqp():
    def __init__(self, nv, np = 0, solver_name = 'fsqp_solver'):

        self.p = ca.SX.sym('p', np, 1)

        self.y = ca.SX.sym('y', nv, 1)
        self.ni = 0
        self.nv = nv
        self.np = np
        opts = dict()
        opts['max_nwsr'] = 10000
        opts['max_inner_it'] = 10
        opts['max_outer_it'] = 10
        opts['inner_tol'] = 1E-3
        opts['outer_tol'] = 1E-6
        opts['solver_name'] = solver_name
        self.opts = opts

        return

    def generate_solver(self, f, g, lby = [], uby = [], lbg = [], ubg = [], p0 = [], y0 = [], lam0 = [], qpoases_root=None, casadi_root=None):
        g_shape = g.shape

        if g_shape[1] != 1:
            raise Exception('g must have shape (<>,1), you have {}.'.format(g_shape))

        ni = g_shape[0]
        self.ni = ni
        nv = self.nv
        np = self.np

        FSQP_INF = 1E12
        if lby == []:
            lby = -FSQP_INF*nmp.ones((nv,1))

        if uby == []:
            uby = FSQP_INF*nmp.ones((nv,1))

        if lbg == []:
            lbg = nmp.zeros((ni,1))

        if ubg == []:
            ubg = nmp.zeros((ni,1))

        if p0 == []:
            p0 = nmp.zeros((np,1))

        if y0 == []:
            y0 = nmp.zeros((nv,1))

        if lam0 == []:
            lam0 = nmp.zeros((ni,1))

        if not isinstance(lby, nmp.ndarray):
            raise Exception('lby must be of type nmp.array, you have {}'.format(type(lby)))

        if not isinstance(uby, nmp.ndarray):
            raise Exception('lbu must be of type nmp.array, you have {}'.format(type(uby)))

        if not isinstance(lbg, nmp.ndarray):
            raise Exception('lbg must be of type nmp.array, you have {}'.format(type(lbg)))

        if not isinstance(ubg, nmp.ndarray):
            raise Exception('ubg must be of type nmp.array, you have {}'.format(type(ubg)))

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

        p0_shape = p0.shape

        if p0_shape[0] != np or p0_shape[1] != 1:
            raise Exception('p0 must have shape (np,1) = ({},1), you have ({},{})'\
                .format(np, p0_shape[0], p0_shape[1]))
        optlevel = ''

        y0_shape = y0.shape

        if y0_shape[0] != nv or y0_shape[1] != 1:
            raise Exception('y0 must have shape (nv,1) = ({},1), you have ({},{})'\
                .format(nv, y0_shape[0], y0_shape[1]))
        opts = dict(with_header=True)

        lam0_shape = lam0.shape

        if lam0_shape[0] != ni or lam0_shape[1] != 1:
            raise Exception('lam0 must have shape (ni,1) = ({},1), you have ({},{})'\
                .format(ni, lam0_shape[0], lam0_shape[1]))

        y = self.y
        p = self.p
        lam = ca.SX.sym('lam', ni, 1)

        cmd = 'mkdir -p {}'.format(self.opts['solver_name'])
        status = os.system(cmd)
        if status != 0:
            raise Exception('{} failed'.format(cmd))

        os.chdir(self.opts['solver_name'])
        ca_dfdy = ca.Function('ca_dfdy', [y,p], [ca.jacobian(f,y)])
        ca_dfdy.generate('ca_dfdy', opts)
        print('compiling generated code for dfdy...')
        os.system('gcc -fPIC -shared {} ca_dfdy.c -o libca_dfdy.so'.format(optlevel))
        os.system('gcc -fPIC -shared {} ca_dfdy.c -o ca_dfdy.so'.format(optlevel))

        ca_g = ca.Function('ca_g', [y,p], [g])
        ca_g.generate('ca_g', opts)
        print('compiling generated code for g...')
        os.system('gcc -fPIC -shared {} ca_g.c -o libca_g.so'.format(optlevel))
        os.system('gcc -fPIC -shared {} ca_g.c -o ca_g.so'.format(optlevel))
        # ca_g.save("ca_g.casadi")

        print('compiling generated code for dgdy...')
        ca_dgdy = ca.Function('ca_dgdy', [y,p], [ca.jacobian(g,y)])
        ca_dgdy.generate('ca_dgdy', opts)
        os.system('gcc -fPIC -shared {} ca_dgdy.c -o libca_dgdy.so'.format(optlevel))
        os.system('gcc -fPIC -shared {} ca_dgdy.c -o ca_dgdy.so'.format(optlevel))

        # Lagrangian
        L = f + ca.dot(lam, g)

        print('compiling generated code for dLdyy...')
        ca_dLdyy = ca.Function('ca_dLdyy', [y, lam, p], [ca.hessian(L,y)[0]])
        ca_dLdyy.generate('ca_dLdyy', opts)
        os.system('gcc -fPIC -shared -O3 ca_dLdyy.c -o libca_dLdyy.so')
        os.system('gcc -fPIC -shared -O3 ca_dLdyy.c -o ca_dLdyy.so')

        print('rendering templated C++ code...')
        env = Environment(loader=FileSystemLoader(os.path.dirname(os.path.abspath(__file__))))
        tmpl = env.get_template("templates/feasibleSQP.in.cpp")
        code = tmpl.render(solver_opts = self.opts, NI = self.ni, NV = self.nv, NP = self.np)
        with open('{}.cpp'.format(self.opts['solver_name']), "w+") as f:
            f.write(code)

        tmpl = env.get_template("templates/feasibleSQP.in.hpp")
        code = tmpl.render(solver_opts = self.opts, NV = nv, NI = ni, NP = np,\
            lby = lby, uby = uby, lbg = lbg, ubg = ubg, p0 = p0, y0 = y0, lam0 = lam0)

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
        cwd = os.getcwd()
        solver_name = self.opts['solver_name']
        #TODO(andrea): why is this necessary??
        os.chdir(self.opts['solver_name'])

        self.shared_lib = CDLL(cwd + '/' + solver_name + '/' + solver_name + '.so')

        self.shared_lib.fsqp_solver()

        os.chdir('..')

    def set_max_inner_iter(self,  max_inner_it):
        self.shared_lib.set_max_inner_iter(max_inner_it)
        return

    def set_max_outer_it(self,  max_outer_it):
        self.shared_lib.set_max_outer_iter(max_outer_it)
        return

    def set_max_nwsr(self,  max_nwsr):
        self.shared_lib.set_max_nwsr_iter(max_nwsr)
        return

    def set_inner_tol(self,  inner_tol):
        self.shared_lib.set_inner_tol(inner_tol)
        return

    def set_outer_tol(self,  outer_tol):
        self.shared_lib.set_outer_tol(outer_tol)
        return

    def set_primal_guess(self,  value_):
        value_data = cast(value_.ctypes.data, POINTER(c_double))
        self.shared_lib.set_primal_guess.argtypes = POINTER(c_double)
        self.shared_lib.set_primal_guess.restype = c_int
        self.shared_lib.set_primal_guess(value_data)

        return

    def set_dual_guess(self,  value_):
        value_data = cast(value_.ctypes.data, POINTER(c_double))
        self.shared_lib.set_dual_guess.argtypes = POINTER(c_double)
        self.shared_lib.set_dual_guess.restype = c_int
        self.shared_lib.set_dual_guess(value_data)
        return

    def set_param(self,  value_):
        value_data = cast(value_.ctypes.data, POINTER(c_double))
        self.shared_lib.set_param.argtypes = POINTER(c_double)
        self.shared_lib.set_param.restype = c_int
        self.shared_lib.set_param(value_data)
        return

    def get_primal_sol(self):
        out = np.ascontiguousarray(np.zeros((self.nv,)), dtype=np.float64)
        out_data = cast(out.ctypes.data, POINTER(c_double))
        self.shared_lib.get_primal_guess.argtypes = POINTER(c_double)
        self.shared_lib.get_primal_guess.restype = c_int
        self.shared_lib.get_primal_sol(out_data)
        return out

    def get_dual_sol(self):
        out = np.ascontiguousarray(np.zeros((self.ni,)), dtype=np.float64)
        out_data = cast(out.ctypes.data, POINTER(c_double))
        self.shared_lib.get_dual_guess.argtypes = POINTER(c_double)
        self.shared_lib.get_dual_guess.restype = c_int
        self.shared_lib.get_dual_sol(out_data)
        return out
