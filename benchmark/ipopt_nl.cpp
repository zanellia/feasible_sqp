/*
 *    This file is part of CasADi.
 *
 *    CasADi -- A symbolic framework for dynamic optimization.
 *    Copyright (C) 2010-2014 Joel Andersson, Joris Gillis, Moritz Diehl,
 *                            K.U. Leuven. All rights reserved.
 *    Copyright (C) 2011-2014 Greg Horn
 *
 *    CasADi is free software; you can redistribute it and/or
 *    modify it under the terms of the GNU Lesser General Public
 *    License as published by the Free Software Foundation; either
 *    version 3 of the License, or (at your option) any later version.
 *
 *    CasADi is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *    Lesser General Public License for more details.
 *
 *    You should have received a copy of the GNU Lesser General Public
 *    License along with CasADi; if not, write to the Free Software
 *    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */

#include <casadi/casadi.hpp>
#include <iomanip>
#include <stdio.h>
#include <dlfcn.h>

/**
 * This example demonstrates how NL-files, which can be generated
 * by AMPl or Pyomo, can be imported in CasADi and solved using
 * e.g. the interface to AMPL

 \author Joel Andersson
 \date 2012
*/

using namespace casadi;
using namespace std;

int main(int argc, char **argv){
  // Get the problem
  // std::string problem = (argc==2) ? argv[1] : "../../docs/examples/nl_files/hs107.nl";
  // std::string problem = (argc==2) ? argv[1] : "../../docs/examples/nl_files/hs112.nl";
  // std::string problem = (argc==2) ? argv[1] : "../../docs/examples/nl_files/gridneta.nl";
  // std::string problem = (argc==2) ? argv[1] : "../../docs/examples/nl_files/bdvalue.nl";
  // std::string problem = (argc==2) ? argv[1] : "../../docs/examples/nl_files/brainpc0.nl";
  // std::string problem = (argc==2) ? argv[1] : "../../docs/examples/nl_files/brainpc1.nl";
  // std::string problem = (argc==2) ? argv[1] : "../../docs/examples/nl_files/bratu3d.nl";
  // std::string problem = (argc==2) ? argv[1] : "../../docs/examples/nl_files/broydnbd.nl";
  // std::string problem = (argc==2) ? argv[1] : "../../docs/examples/nl_files/clnbeam.nl";
  // std::string problem = (argc==2) ? argv[1] : "../../docs/examples/nl_files/corkscrw.nl";
  std::string problem = (argc==2) ? argv[1] : "../../docs/examples/nl_files/dixchlnv.nl";

  // Parse an NL-file
  NlpBuilder nl;
  nl.import_nl(problem);

  // Set options
  Dict opts;
  opts["expand"] = true;
  //  opts["max_iter"] = 10;
  //  opts["verbose"] = true;
  //  opts["linear_solver"] = "ma57";
  //  opts["hessian_approximation"] = "limited-memory";
  //  opts["derivative_test"] = "second-order";

  // Allocate NLP solver and buffers
  Function solver = nlpsol("nlpsol", "ipopt", nl, opts);
  std::map<std::string, DM> arg, res;

  // Solve NLP
  arg["lbx"] = nl.x_lb;
  arg["ubx"] = nl.x_ub;
  arg["lbg"] = nl.g_lb;
  arg["ubg"] = nl.g_ub;
  arg["x0"] = nl.x_init;
  res = solver(arg);
  res = solver(arg);
  
#if 1
  // generate C code
  Function ca_f("ca_f", {nl.x}, {nl.f});

  ca_f.generate("ca_f", {{"with_header", true}});

  // Compile the C-code to a shared library
  string compile_command = "gcc -fPIC -shared -O3 ca_f.c -o ca_f.so";
  int flag = system(compile_command.c_str());
  casadi_assert(flag==0, "Compilation failed");

  Function ca_g("ca_g", {nl.x}, nl.g);

  ca_g.generate("ca_g", {{"with_header", true}});

  // Compile the C-code to a shared library
  compile_command = "gcc -fPIC -shared -O3 ca_g.c -o ca_g.so";
  flag = system(compile_command.c_str());
  casadi_assert(flag==0, "Compilation failed");

  // std::cout << typeid(nl.g).name() << std::endl; 
  // std::cout << typeid(nl.x).name() << std::endl; 
  MX g_exp = vertcat(nl.g);
  MX x_var = vertcat(nl.x);
  MX dgdy = MX::jacobian(g_exp, x_var);
  Function ca_dgdy("ca_dgdy", {x_var}, {dgdy});

  ca_dgdy.generate("ca_dgdy", {{"with_header", true}});

  // Compile the C-code to a shared library
  compile_command = "gcc -fPIC -shared -O3 ca_dgdy.c -o ca_dgdy.so";
  flag = system(compile_command.c_str());
  casadi_assert(flag==0, "Compilation failed");

  MX f_exp = nl.f;
  MX dfdy = MX::jacobian(f_exp, x_var);
  Function ca_dfdy("ca_dfdy", {x_var}, {dfdy});

  ca_dgdy.generate("ca_dfdy", {{"with_header", true}});

  // Compile the C-code to a shared library
  compile_command = "gcc -fPIC -shared -O3 ca_dfdy.c -o ca_dfdy.so";
  flag = system(compile_command.c_str());
  casadi_assert(flag==0, "Compilation failed");
  
  // std::cout << nl.f << std::endl; 
  // for (auto&& s : res) {
  //   std::cout << std::setw(10) << s.first << ": " << std::vector<double>(s.second) << std::endl;
  // }
#endif
  return 0;
}
