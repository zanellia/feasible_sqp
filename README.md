[![Build Status](https://travis-ci.com/zanellia/feasible_sqp.svg?branch=testing)](https://travis-ci.com/zanellia/feasible_sqp)
# A feasible sequential quadratic programming strategy with iterated second-order corrections
This package provides a solver for parametric nonconvex programs of the form

<img src="https://github.com/zanellia/feasible_sqp/blob/master/figures/nlp_description.png"
     width="296" height="160">
## dependencies 
`feasible_sqp` uses the sparse implementation of the QP solver `qpOASES` which depends on MA57. Unfortunately, this complicates installation a bit. You need to obtain a valid license for HSL and its source code (see [this page](https://www.hsl.rl.ac.uk/download/MA57/3.11.0/)). After obtaining the source code for HSL, you'll need to download the METIS package (version 4.3 is required) [here](http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/OLD/metis-4.0.3.tar.gz), extract the code and place it inside the root folder of coinhsl. Proceed then with the installation instructions of HSL, i.e., run `./configure`, `make` and `make install`.
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
feasible_sqp.install_dependencies(hsl_lib_path=<...>)
```

## usage
```python
from feasible_sqp import *

hsl_lib_path =     <...> # e.g., '/usr/local/lib/libcoinhsl.so'

install_dependencies(hsl_lib_path=hsl_lib_path)

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
solver.generate_solver(f, f, g, lby = lby, uby = uby)

# solve NLP
solver.solve()
```
notice: a call to
`solver.generate_solver()` generates a script called `set_LD_LIBRARY_PATH.sh` which can be sourced in order to update the `LD_LIBRARY_PATH` environment variable such that the shared libraries needed by the solver can be located.
