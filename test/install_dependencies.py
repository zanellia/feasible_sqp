import sys
import os
from feasible_sqp import *

# matlab_root_path_file = sys.argv[1]
# with open(matlab_root_path_file) as f:
#     matlab_root_path = f.read()

cwd = os.getcwd()
# install_dependencies(matlab_root_path=matlab_root_path)
install_dependencies(
    hsl_lib_path= cwd + '/../coin_hsl_source/.libs/libcoinhsl.so')
