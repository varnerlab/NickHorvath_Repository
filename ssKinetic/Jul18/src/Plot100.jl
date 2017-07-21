include("DataDictionary.jl")
include("PlotSingle.jl")
using PyPlot

if isdir("flux")
    rm("flux",recursive=true)
end

# Setup the timescale
TSTART = 0.0
TSTOP = 3.0
Ts = 0.01

# Create dictionary of parameters
data_dictionary = DataDictionary(TSTART,TSTOP,Ts)
experiment_data_dictionary = data_dictionary["EXPERIMENT_DATA_DICTIONARY"]

for i in 1:100;println(i)
	Tsim = readdlm("EnsembleNew/$i/Tsim")
	X = readdlm("EnsembleNew/$i/X")
	PlotSingle(Tsim,X)
end

