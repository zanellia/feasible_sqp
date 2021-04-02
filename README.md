# A feasible sequential quadratic programming strategy with iterated second-order corrections

## installation
- clone the repo: 
```bash
git clone https://github.com/zanellia/feasible_sqp.git
```
- install the Python package:
```bash
cd feasible_sqp
pip install .
```
- build and install the dependecnies:
```python
import feasible_sqp
feasible_sqp.install_dependencies()
```

## usage
```python
from feasible_sqp import *

matlab_lib_path = '/usr/local/MATLAB/R2017b/bin/glnxa64'
matlab_include_path = '/usr/local/MATLAB/R2017b/extern/include'

install_dependencies(matlab_lib_path=matlab_lib_path,\
    matlab_include_path=matlab_include_path)

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
lby = -0.4*np.ones((nv,1))
uby = 0.7*np.ones((nv,1))
# generate solver
solver.generate_solver(f,g, lby = lby, uby = uby)
# solve NLP
solver.solve()
```
notice: a call to
`solver.generate_solver()` generates a script called `set_LD_LIBRARY_PATH.sh` which must can be sourced in order to update the `LD_LIBRARY_PATH` environment variable in order to locate the shared libraries needed by the solver.
