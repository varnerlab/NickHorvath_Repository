include("DataDictionary.jl")
include("SolveBalances.jl")
include("CalcError.jl")

# Setup the timescale
TSTART = 0.0
TSTOP = 3.0
Ts = 0.01

# Create dictionary of parameters
data_dictionary_best = DataDictionary(TSTART,TSTOP,Ts)
experiment_data_dictionary = data_dictionary_best["EXPERIMENT_DATA_DICTIONARY"]

# Initialize number of parameters to be varied
num_rate = 408
num_rxn = convert(Int64,num_rate/2)
num_sat = 548
num_cont = 34
num_params = num_rate+num_sat+num_cont

rate = readdlm("Ensemble/Best/rate_constant.dat")
sat = readdlm("Ensemble/Best/saturation_constant.dat")
cont = readdlm("Ensemble/Best/control_constant.dat")

# Check that params is of correct length
if ~((num_rate==length(rate))&&(num_sat==length(find(sat.>0)))&&(num_cont==length(cont)))
throw("Wrong number of parameters")
end

# Add parameters to data_dictionary_best
data_dictionary_best["RATE_CONSTANT_ARRAY"] = rate
data_dictionary_best["SATURATION_CONSTANT_ARRAY"] = sat
data_dictionary_best["CONTROL_PARAMETER_ARRAY"] = cont

# Solve the balance equations and calculate cost
Tsim_best,X_best = SolveBalances(TSTART,TSTOP,Ts,data_dictionary_best)
Error_best,Keys = CalcError(experiment_data_dictionary,Tsim_best,X_best)
cost_best = sum(Error_best)
species_with_data = [98;100;102:135;137]
CAT_best = X_best[:,98]
state_best = X_best[:,species_with_data]

if isfile("Sens/num_dir")
	num_dir = convert(Int64,readdlm("Sens/num_dir")[1])
else
	num_dir = 0
end
num_dir += 1
writedlm("Sens/num_dir",num_dir)

perturbation = 1.01
for i in num_dir:num_rxn
	println(i)
for j in i+1:num_rxn
	data_dictionary = deepcopy(data_dictionary_best)
	data_dictionary["RATE_CONSTANT_ARRAY"][i] = data_dictionary["RATE_CONSTANT_ARRAY"][i]*perturbation
	data_dictionary["RATE_CONSTANT_ARRAY"][j] = data_dictionary["RATE_CONSTANT_ARRAY"][i]*perturbation
	Tsim,X = SolveBalances(TSTART,TSTOP,Ts,data_dictionary)
	Error,Keys = CalcError(experiment_data_dictionary,Tsim,X)
	cost = sum(Error)
	CAT = X[:,98]
	state = X[:,species_with_data]
	CAT_sens = norm(CAT-CAT_best)
	state_sens = norm(state-state_best)
	str = "$i"*"_$j"
	mkdir("Sens/$str")
	writedlm("Sens/$str/Tsim",Tsim)
	writedlm("Sens/$str/X",X)
	writedlm("Sens/$str/cost",cost)
	writedlm("Sens/$str/CAT_sens",CAT_sens)
	writedlm("Sens/$str/state_sens",state_sens)
end
	writedlm("Sens/num_dir",i)
end
