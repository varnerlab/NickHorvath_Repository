include("DataDictionary.jl")
include("SolveBalances.jl")
function SolveModel(params)
# Setup the timescale
TSTART = 0.0
TSTOP = 3.0
Ts = 0.01

# Create dictionary of parameters
data_dictionary = DataDictionary(TSTART,TSTOP,Ts)
data_dictionary["SATURATION_CONSTANT_ARRAY"][180,72] = 1e-4

data_dictionary["RATE_CONSTANT_ARRAY"][181] = 10^params[1]
data_dictionary["RATE_CONSTANT_ARRAY"][184] = 10^params[2]

# Solve the balances
Tsim,X = SolveBalances(TSTART,TSTOP,Ts,data_dictionary)
productivity = X[end,98]

return productivity
end
