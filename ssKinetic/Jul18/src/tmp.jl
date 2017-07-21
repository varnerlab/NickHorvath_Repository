include("DataDictionary.jl")
include("SolveBalances.jl")
include("CalcError.jl")
using PyPlot

# Setup the timescale
TSTART = 0.0
TSTOP = 3.0
Ts = 0.01

# Create dictionary of parameters
data_dictionary = DataDictionary(TSTART,TSTOP,Ts)
experiment_data_dictionary = data_dictionary["EXPERIMENT_DATA_DICTIONARY"]

rate = data_dictionary["RATE_CONSTANT_ARRAY"]

Tsim,X = SolveBalances(TSTART,TSTOP,Ts,data_dictionary)
Error,Keys = CalcError(experiment_data_dictionary,Tsim,X)
cost = sum(Error)

for i in 1:100;println(i)
	aa = X[end,78:97]
	min_index = find(aa.==minimum(aa))

	rate_new = copy(rate)
	rate_new[184+min_index].*=1.2
	data_dictionary["RATE_CONSTANT_ARRAY"] = rate_new

	Tsim,X = SolveBalances(TSTART,TSTOP,Ts,data_dictionary)
	Error,Keys = CalcError(experiment_data_dictionary,Tsim,X)
	cost_new = sum(Error);println(cost_new)

	if cost_new<cost
		rate = copy(rate_new)
	end
end

