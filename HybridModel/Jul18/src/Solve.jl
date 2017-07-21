include("DataFile.jl")
include("MassBalances.jl")
include("CalcError.jl")
include("PlotSingle.jl")
using Sundials
using PyPlot

# Read required stuff
time_vector = vec(abs(float(open(readdlm,"flux/time_vector"))))
initial_condition_vector = vec(abs(float(open(readdlm,"initial_condition.dat"))))

# Setup the timescale
TSTART = 0.0
TSTOP = 3.0
Ts = 0.01

if collect(TSTART:Ts:TSTOP)!=time_vector
	throw("Time vectors do not match")
end

# Load the data_dictionary
data_dictionary = DataFile(TSTART,TSTOP,Ts)
experiment_data_dictionary = data_dictionary["EXPERIMENT_DATA_DICTIONARY"]

# Call the ODE solver - 
tic()
fbalances(t,y,ydot) = MassBalances(t,y,ydot,data_dictionary);
X = Sundials.cvode(fbalances,initial_condition_vector,time_vector;integrator=:BDF);
toc()

Error,Keys = CalcError(experiment_data_dictionary,time_vector,X)
cost = sum(Error)

plot_color = "y"

PlotSingle(time_vector,X,plot_color)

