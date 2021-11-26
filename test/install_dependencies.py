import sys
import os
from feasible_sqp import *

# matlab_root_path_file = sys.argv[1]
# with open(matlab_root_path_file) as f:
#     matlab_root_path = f.read()

cwd = os.getcwd()
# install_dependencies(matlab_root_path=matlab_root_path)
install_dependencies(
    blas_lib_path='/usr/lib/libblas.so', \
    lapack_lib_path='/usr/lib/lapack/liblapack.so', \
    # hsl_lib_path='/usr/local/MATLAB/R2017b/bin/glnxa64/libmwma57.so')
    hsl_lib_path= cwd + '/coin_hsl_source/.libs/libcoinhsl.so')
