import glob, os, string

# os.chdir("./cuter/mod_files")
# for file_name in glob.glob("*.mod"):
#     name_ = file_name.split('.')[0]
    
#     print('converting ', file_name)
#     os.system("../../../amplide.linux64/ampl -og{} {}".format(\
#         name_, file_name))

#     os.system("mv {} ../nl_files".format(name_ + '.nl'))

# os.chdir("../..")

os.chdir("./revisedhsmodels/processed/ampl/revisedhs")
for file_name in glob.glob("*.mod"):
    name_ = file_name.split('.')[0]
    
    print('converting ', file_name)
    os.system("../../../../../../amplide.linux64/ampl -og{} {}".format(\
        name_, file_name))

    os.system("mv {} ../../nl/revisedhs".format(name_ + '.nl'))

os.chdir("../../../..")

os.chdir("./revisedhsmodels/processed/ampl/stricths")
for file_name in glob.glob("*.mod"):
    name_ = file_name.split('.')[0]
    
    print('converting ', file_name)
    os.system("../../../../../../amplide.linux64/ampl -og{} {}".format(\
        name_, file_name))

    os.system("mv {} ../../nl/stricths".format(name_ + '.nl'))
