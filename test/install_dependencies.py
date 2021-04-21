import sys
from feasible_sqp import *

matlab_root_path_file = sys.argv[1]
with open(matlab_root_path_file) as f:
    matlab_root_path = f.read()

install_dependencies(matlab_root_path=matlab_root_path)
