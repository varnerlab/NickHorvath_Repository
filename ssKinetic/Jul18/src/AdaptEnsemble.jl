include("DataDictionary.jl")
include("SolveBalances.jl")
include("CalcError.jl")
include("CalcErrorUnweighted.jl")

# Setup the timescale
TSTART = 0.0
TSTOP = 3.0
Ts = 0.01

# Create dictionary of parameters
data_dictionary_best = DataDictionary(TSTART,TSTOP,Ts)
experiment_data_dictionary = data_dictionary_best["EXPERIMENT_DATA_DICTIONARY"]

rate_orig = readdlm("EnsembleMay25/Best/rate_constant.dat")
sat_orig = readdlm("EnsembleMay25/Best/saturation_constant.dat")
cont_orig = readdlm("EnsembleMay25/Best/control_constant.dat")

rate_new = readdlm("Best/rate_constant.dat")
sat_new = readdlm("Best/saturation_constant.dat")
cont_new = readdlm("Best/control_constant.dat")

rate_factor = rate_new./rate_orig
sat_factor = sat_new./sat_orig
cont_factor = cont_new./cont_orig

rate_bounds = readdlm("rate_bounds")
sat_bounds = [.0001*ones(548,1)	10*ones(548,1)]
sat_bounds[152,:] = [3.5e-6/2	3.5e-6*2]
sat_bounds[156,:] = [45e-3/2	45e-3*2]
cont_bounds = [[.02*ones(17,1) 10*ones(17,1)];[.05*ones(17,1) 10*ones(17,1)]]

for i in 1:100
	println(i)
	
	rate = readdlm("EnsembleMay25/$i/rate_constant.dat")
	sat = readdlm("EnsembleMay25/$i/saturation_constant.dat")
	cont = readdlm("EnsembleMay25/$i/control_constant.dat")
	
	rate.*=rate_factor
	sat.*=sat_factor
	cont.*=cont_factor
	
	rate = max(rate,rate_bounds[:,1])
	rate = min(rate,rate_bounds[:,2])
	s = sat[find(sat.>0)]
	s = max(s,sat_bounds[:,1])
	s = min(s,sat_bounds[:,2])
	sat[find(sat.>0)] = s
	c = vec(cont)
	c = max(c,cont_bounds[:,1])
	c = min(c,cont_bounds[:,2])
	cont = [c[1:17] c[18:end]]
	
	mkdir("EnsembleNew/$i")
	writedlm("EnsembleNew/$i/rate_constant.dat",rate)
	writedlm("EnsembleNew/$i/saturation_constant.dat",sat)
	writedlm("EnsembleNew/$i/control_constant.dat",cont)
	
	data_dictionary = deepcopy(data_dictionary_best)
    data_dictionary["RATE_CONSTANT_ARRAY"] = rate
    data_dictionary["SATURATION_CONSTANT_ARRAY"] = sat
    data_dictionary["CONTROL_PARAMETER_ARRAY"] = cont
    
    Tsim,X = SolveBalances(TSTART,TSTOP,Ts,data_dictionary)
    
    Error,Keys = CalcError(experiment_data_dictionary,Tsim,X)
    cost = sum(Error)
	Error,Keys = CalcErrorUnweighted(experiment_data_dictionary,Tsim,X)
    cost_unweighted = sum(Error)
	
	writedlm("EnsembleNew/$i/Tsim",Tsim)
	writedlm("EnsembleNew/$i/X",X)
	writedlm("EnsembleNew/$i/cost",cost)
	writedlm("EnsembleNew/$i/cost_unweighted",cost_unweighted)
end

