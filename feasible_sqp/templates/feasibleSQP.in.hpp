extern "C" {
int {{ solver_opts.solver_name }}( );
}

double lby[{{NV}}] = {
    {% for d in lby %}
    {{ d[0] }},
    {%- endfor %}
};

double uby[{{NV}}] = {
    {% for d in uby %}
    {{ d[0] }},
    {%- endfor %}
};

double lbg[{{NI}}] = {
    {% for d in lbg %}
    {{ d[0] }},
    {%- endfor %}
};

double ubg[{{NI}}] = {
    {% for d in ubg %}
    {{ d[0] }},
    {%- endfor %}
};
