include("DataFile.jl")
include("SolveBalances.jl")
include("CalcError.jl")

# Create Ensemble directory if it doesn't already exist
if ~isdir("Ensemble")
    mkdir("Ensemble")
end

# Create Best directory if it doesn't already exist
if ~isdir("Ensemble/Best")
    mkdir("Ensemble/Best")
end

# Setup the timescale
TSTART = 0.0
TSTOP = 3.0
Ts = 0.01

# Create or read the relevant information
if ~(isfile("Ensemble/Best/time_vector")&&isfile("Ensemble/Best/flux_array"))
	time_vector = collect(TSTART:Ts:TSTOP)
	FV = readdlm("FV")
	interval = Int64((size(FV,2)-1)/(length(time_vector)-1))
	flux_array = FV[:,1:interval:end]


# Read required stuff
time_vector = vec(abs(float(open(readdlm,"flux/time_vector"))))
flux_array_best = readdlm("flux/flux_array_best")
initial_condition_vector = vec(abs(float(open(readdlm,"initial_condition.dat"))))

if collect(TSTART:Ts:TSTOP)!=time_vector
	throw("Time vectors do not match")
end

# Load the data_dictionary
data_dictionary = DataFile(TSTART,TSTOP,Ts)
experiment_data_dictionary = data_dictionary["EXPERIMENT_DATA_DICTIONARY"]

# Call the ODE solver - 
tic()
fbalances(t,y,ydot) = MassBalances(t,x,dxdt_vector,time_vector,flux_array_best)
X = Sundials.cvode(fbalances,initial_condition_vector,time_vector;integrator=:BDF)
toc()
Error,Keys = CalcError(experiment_data_dictionary,time_vector,X)
cost = sum(Error)
cost_best = copy(cost)

if ~isfile("Ensemble/num_dir")
    writedlm("Ensemble/num_dir",0)
end

num_dir = convert(Int64,readdlm("Ensemble/num_dir")[1]) # Number of pre-existing directories

num_iter = 1000000
num_to_reset = 10 # Number of iterations before resetting to best-fit set

alpha = 10 # Increasing alpha decreases acceptance probability (for cost_new > cost)

variance_lower_bound = .01
variance_upper_bound = .2

for i = num_dir+1:num_dir+num_iter
	
	variance = exp(log(variance_lower_bound)+rand()*(log(variance_upper_bound)-log(variance_lower_bound)))
    
    if rem(i,num_to_reset) == 0 # Reset to best
        rate = copy(rate_best)
        cost = copy(cost_best)
    end
	
	# Perturb the flux array
	perturb = exp(variance*randn(size(flux_array)))
	flux_array_new = flux_array.*perturb
	
	writedlm("flux/flux_array",flux_array)
	
	
	# Call the ODE solver - 
	tic()
	fbalances(t,y,ydot) = MassBalances(t,x,dxdt_vector,time_vector,flux_array_new)
	X = Sundials.cvode(fbalances,initial_condition_vector,time_vector;integrator=:BDF)
	toc()
	Error,Keys = CalcError(experiment_data_dictionary,time_vector,X)
	cost = sum(Error)












