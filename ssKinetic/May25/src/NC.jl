include("DataDictionary.jl")
include("SolveBalances.jl")
include("CalcError.jl")

# Setup the timescale
TSTART = 0.0
TSTOP = 3.0
Ts = 0.01

# Create dictionary of parameters
data_dictionary = DataDictionary(TSTART,TSTOP,Ts)
experiment_data_dictionary = data_dictionary["EXPERIMENT_DATA_DICTIONARY"]

num_dir = convert(Int64,readdlm("Ensemble_nc/num_dir")[1])
num_dir += 1
writedlm("Ensemble_nc/num_dir",num_dir)
for i in num_dir+1:7449
    println(i)
    data_dictionary_new = copy(data_dictionary)
    rate = readdlm("Ensemble/$i/rate_constant.dat")
    sat = readdlm("Ensemble/$i/saturation_constant.dat")
    cont = readdlm("Ensemble/$i/control_constant.dat")
    # Add parameters to data_dictionary
    data_dictionary_new["RATE_CONSTANT_ARRAY"] = rate
    data_dictionary_new["SATURATION_CONSTANT_ARRAY"] = sat
    data_dictionary_new["CONTROL_PARAMETER_ARRAY"] = cont
    # Solve the balance equations and calculate cost
    Tsim,X = SolveBalances(TSTART,TSTOP,Ts,data_dictionary_new)
    Error,Keys = CalcError(experiment_data_dictionary,Tsim,X)
    cost = sum(Error)
    # Save the relevant information
    mkdir("Ensemble_nc/$i")
    writedlm("Ensemble_nc/$i/rate_constant.dat",rate)
    writedlm("Ensemble_nc/$i/saturation_constant.dat",sat)
    writedlm("Ensemble_nc/$i/control_constant.dat",cont)
    writedlm("Ensemble_nc/$i/Tsim",Tsim)
    writedlm("Ensemble_nc/$i/X",X)
    writedlm("Ensemble_nc/$i/cost",cost)
    num_dir += 1
    writedlm("Ensemble_nc/num_dir",num_dir)
end

