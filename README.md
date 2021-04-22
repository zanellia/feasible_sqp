[![Build Status](https://travis-ci.com/zanellia/feasible_sqp.svg?branch=master)](https://travis-ci.com/zanellia/feasible_sqp)
# A feasible sequential quadratic programming strategy with iterated second-order corrections
This package provides a solver for nonconvex programs of the form

<p>min_y f(y)
</p>
<p>s.t.  lb_g <= g(y) <= ub_g,
</p>
<p>      lb_y <= y <= ub_y,

## installation
- clone the repo: 
```bash
git clone https://github.com/zanellia/feasible_sqp.git
```
- init submodules (qpOASES, CasADi):
```
git submodule update --init
```
- install the Python package:
```bash
cd feasible_sqp
pip install -e .
```
- build and install the dependencies:
```python
import feasible_sqp
feasible_sqp.install_dependencies(matlab_root_path=<...>)
```

## usage
```python
from feasible_sqp import *

matlab_root_path =     <...> # e.g., '/usr/local/MATLAB/R2017b'

install_dependencies(matlab_root_path=matlab_root_path)

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
lby = -np.ones((nv,1))
uby = np.ones((nv,1))

# generate solver
solver.generate_solver(f,g, lby = lby, uby = uby)

# solve NLP
solver.solve()
```
notice: a call to
`solver.generate_solver()` generates a script called `set_LD_LIBRARY_PATH.sh` which can be sourced in order to update the `LD_LIBRARY_PATH` environment variable such that the shared libraries needed by the solver can be located.
