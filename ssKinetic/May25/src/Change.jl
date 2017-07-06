include("DataDictionary.jl")
include("SolveBalances.jl")
include("CalcError.jl")
using PyPlot

# Setup the timescale
TSTART = 0.0
TSTOP = 3.0
Ts = 0.01

# Create dictionary of parameters
data_dictionary_best = DataDictionary(TSTART,TSTOP,Ts)
experiment_data_dictionary = data_dictionary_best["EXPERIMENT_DATA_DICTIONARY"]

for i in 1:100
	rate = readdlm("Rand100/$i/rate_constant.dat")
	rate[[180;183;386]] = 0
	rate[181] *= (5400/.6740711787216361)
	rate[184] *= (240/40.106026792106334)
	sat = readdlm("Rand100/$i/saturation_constant.dat")
	cont = readdlm("Rand100/$i/control_constant.dat")
	
	data_dictionary = deepcopy(data_dictionary_best)
	data_dictionary["RATE_CONSTANT_ARRAY"] = rate
    data_dictionary["SATURATION_CONSTANT_ARRAY"] = sat
    data_dictionary["CONTROL_PARAMETER_ARRAY"] = cont
	
	Tsim,X = SolveBalances(TSTART,TSTOP,Ts,data_dictionary)
	Error,Keys = CalcError(experiment_data_dictionary,Tsim,X)
	cost = sum(Error)
	cost_breakdown = [Keys Error]
    
	mkdir("Rand/$i")
    writedlm("Rand/$i/rate_constant.dat",rate)
    writedlm("Rand/$i/saturation_constant.dat",sat)
    writedlm("Rand/$i/control_constant.dat",cont)
    writedlm("Rand/$i/Tsim",Tsim)
    writedlm("Rand/$i/X",X)
    writedlm("Rand/$i/cost",cost)
    writedlm("Rand/$i/cost_breakdown",cost_breakdown)
    
    cost_old = readdlm("Rand100/$i/cost")[1]
    
    println("i = $i, cost_old = $cost_old, cost = $cost")
end

