
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
#include <casadi/casadi_c.h>
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
    std::string problem = (argc==2) ? argv[1] : "../benchmark/cuter/nl_files/hs107.nl";

    // Parse an NL-file
    cout << "Loading NL file " << problem << std::endl;
    NlpBuilder nl;
    nl.import_nl(problem);

    // generate C code
    cout << "Generating CasADi code for f..." << std::endl;
    Function ca_f("ca_f", {nl.x}, {nl.f});

    ca_f.generate("ca_f", {{"with_header", true}});

    // Compile the C-code to a shared library
    string compile_command = "gcc -fPIC -shared -O3 ca_f.c -o ca_f.so";
    int flag = system(compile_command.c_str());
    casadi_assert(flag==0, "Compilation failed");

    cout << "Generating CasADi code for g..." << std::endl;
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

    cout << "Generating CasADi code for dgdy..." << std::endl;
    Function ca_dgdy("ca_dgdy", {x_var}, {dgdy});

    ca_dgdy.generate("ca_dgdy", {{"with_header", true}});

    // Compile the C-code to a shared library
    compile_command = "gcc -fPIC -shared -O3 ca_dgdy.c -o ca_dgdy.so";
    flag = system(compile_command.c_str());
    casadi_assert(flag==0, "Compilation failed");

    MX f_exp = nl.f;
    MX dfdy = MX::jacobian(f_exp, x_var);
    cout << "Generating CasADi code for dfdy..." << std::endl;
    Function ca_dfdy("ca_dfdy", {x_var}, {dfdy});

    ca_dgdy.generate("ca_dfdy", {{"with_header", true}});

    // Compile the C-code to a shared library
    compile_command = "gcc -fPIC -shared -O3 ca_dfdy.c -o ca_dfdy.so";
    flag = system(compile_command.c_str());
    casadi_assert(flag==0, "Compilation failed");
    // std::cout << g_exp.size1() << std::endl;
    MX lambda = MX::sym("lambda", g_exp.size1(), 1);
    MX L = f_exp + dot(lambda, g_exp);
    
    MX hess_L = hessian(L,x_var);
    cout << "Generating CasADi code for ca_dLdyy..." << std::endl;
    Function ca_dLdyy = Function("ca_dLdyy", {x_var, lambda}, {hess_L(0)});
    ca_dgdy.generate("ca_dLdyy", {{"with_header", true}});

    compile_command = "gcc -fPIC -shared -O3 ca_dLdyy.c -o ca_dLdyy.so";
    flag = system(compile_command.c_str());
    casadi_assert(flag==0, "Compilation failed");
    // ca_dLdyy.generate('ca_dLdyy', opts)
    // system('gcc -fPIC -shared -O3 ca_dLdyy.c -o ../bin/libca_dLdyy.so')
    // system('gcc -fPIC -shared -O3 ca_dLdyy.c -o ../bin/ca_dLdyy.so')
    // std::cout << nl.f << std::endl; 
    // for (auto&& s : res) {
    //   std::cout << std::setw(10) << s.first << ": " << std::vector<double>(s.second) << std::endl;
    // }
    cout << "Done!" << std::endl;
    return 0;
}
