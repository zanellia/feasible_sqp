import glob, os, string

os.chdir("./mod_files")
for file_name in glob.glob("*.mod"):
    name_ = file_name.split('.')[0]
    
    print('converting ', file_name, '.mod')
    os.system("../../../amplide.linux64/ampl -og{} {}".format(\
        name_, file_name))

    os.system("mv {} ../nl_files".format(name_ + '.nl'))
