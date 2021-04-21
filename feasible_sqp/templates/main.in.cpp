extern "C" {

extern int {{ solver_opts.solver_name }}( );

int main() {
    int status = {{ solver_opts.solver_name }}( );
    return status;
}

}
