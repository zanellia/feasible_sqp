from setuptools import setup, find_packages

import sys
print(sys.version_info)

if sys.version_info < (3,5):
    sys.exit('Python version 3.5 or later required. Exiting.')

setup(name='acados_template',
   version='0.1',
   python_requires='>=3.5', # < 3.9
   description='A feasible SQP solver based on second-order corrections',
   url='http://github.com/zanellia/feasible_sqp',
   author='Andrea Zanelli',
   license='BSD',
   packages = find_packages(),
   include_package_data = True,
   setup_requires=['setuptools_scm'],
   use_scm_version={
     "fallback_version": "0.1-local",
     "root": "../..",
     "relative_to": __file__
   },
   install_requires=[
      'numpy',
      'casadi>=3.5.1',
   ],
   package_data={'': [
       'src/feasibleSQP.cpp',
       'src/Makefile',
       ]},
   zip_safe=False
)
