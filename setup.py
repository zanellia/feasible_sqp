from setuptools import setup, find_packages

import sys
print(sys.version_info)

if sys.version_info < (3,5):
    sys.exit('Python version 3.5 or later required. Exiting.')

setup(name='feasible_sqp', #zeeopt, zeopt, zeos, zeosq, seors, seaorsqp
   version='0.1',
   python_requires='>=3.5', # < 3.9
   description='A feasible SQP solver based on second-order corrections',
   url='http://github.com/zanellia/feasible_sqp',
   author='Andrea Zanelli',
   license='BSD',
   packages = find_packages(),
   include_package_data = True,
   install_requires=[
      'numpy',
      'casadi>=3.5.1',
      'jinja2',
   ],
   package_data={'': [
       'templates/feasibleSQP.in.cpp',
       'templates/feasibleSQP.in.hpp',
       'templates/Makefile.in',
       ]},
   zip_safe=False
)
