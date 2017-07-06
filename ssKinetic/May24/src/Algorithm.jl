include("DataDictionary.jl")
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

# Create dictionary of parameters
data_dictionary_best = DataDictionary(TSTART,TSTOP,Ts)
experiment_data_dictionary = data_dictionary_best["EXPERIMENT_DATA_DICTIONARY"]

# Initialize number of parameters to be varied
num_rate = 408
num_rxn = convert(Int64,num_rate/2)
num_sat = 548
num_cont = 34
num_params = num_rate+num_sat+num_cont

# Create or read the relevant information
if ~(isfile("Ensemble/Best/rate_constant.dat")&&isfile("Ensemble/Best/saturation_constant.dat"))
    # Take parameters to be varied from data_dictionary_best
    rate_best = data_dictionary_best["RATE_CONSTANT_ARRAY"]
    rate = copy(rate_best)
    sat_best = data_dictionary_best["SATURATION_CONSTANT_ARRAY"]
    sat = copy(sat_best)
    cont_best = data_dictionary_best["CONTROL_PARAMETER_ARRAY"]
    cont = copy(cont_best)
    # Solve the balance equations and calculate cost
    Tsim_best,X_best = SolveBalances(TSTART,TSTOP,Ts,data_dictionary_best)
    Error_best,Keys = CalcError(experiment_data_dictionary,Tsim_best,X_best)
    cost_best = sum(Error_best)
    cost = copy(cost_best)
    # Save the relevant information
    writedlm("Ensemble/Best/rate_constant.dat",rate)
    writedlm("Ensemble/Best/saturation_constant.dat",sat)
    writedlm("Ensemble/Best/control_constant.dat",cont)
    writedlm("Ensemble/Best/Tsim",Tsim_best)
    writedlm("Ensemble/Best/X",X_best)
    writedlm("Ensemble/Best/cost",cost_best)
else
    # Read the parameters from disk
    rate_best = readdlm("Ensemble/Best/rate_constant.dat")
    rate = copy(rate_best)
    sat_best = readdlm("Ensemble/Best/saturation_constant.dat")
    sat = copy(sat_best)
    cont_best = readdlm("Ensemble/Best/control_constant.dat")
    cont = copy(cont_best)
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
    cost = copy(cost_best)
    # Save the relevant information
    writedlm("Ensemble/Best/Tsim",Tsim_best)
    writedlm("Ensemble/Best/X",X_best)
    writedlm("Ensemble/Best/cost",cost_best)
end

rate_bounds = readdlm("rate_bounds")
sat_upper_bound = 10
sat_lower_bound = .0001
gain_upper_bound = 10
gain_lower_bound = 0.01
order_upper_bound = 10
order_lower_bound = 0.01

if ~isfile("Ensemble/num_dir")
    writedlm("Ensemble/num_dir",0)
end

num_dir = convert(Int64,readdlm("Ensemble/num_dir")[1]) # Number of pre-existing directories

num_iter = 1000000
num_to_reset = 50 # Number of iterations before resetting to best-fit set

alpha = 2 # Increasing alpha decreases acceptance probability (for cost_new > cost)

#all_indices = [collect(1:75);collect(117:179)]
all_indices = collect(1:num_params)

variance_lower_bound = .05
variance_upper_bound = .5
num_indices_to_vary_lower_bound = 1
num_indices_to_vary_upper_bound = num_params

for i = num_dir+1:num_dir+num_iter

variance = exp(log(variance_lower_bound)+rand()*(log(variance_upper_bound)-log(variance_lower_bound)))

num_indices_to_vary = convert(Int64,round(exp(log(num_indices_to_vary_lower_bound)+rand()*(log(num_indices_to_vary_upper_bound)-log(num_indices_to_vary_lower_bound)))))
    
    if rem(i,num_to_reset) == 0 # Reset to best
        rate = copy(rate_best)
        cost = copy(cost_best)
    end
    
    # Copy data_dictionary
    data_dictionary = deepcopy(data_dictionary_best)
    
    # Create perturbation vectors
    perturb = ones(num_params)
    
    indices_to_vary = all_indices[randperm(length(all_indices))][1:num_indices_to_vary]
    
    perturb[indices_to_vary] = exp(variance*randn(length(indices_to_vary)))
    
    rate_perturb = perturb[1:num_rate]
    sat_perturb = perturb[num_rate+1:num_rate+num_sat]
    cont_perturb = perturb[num_rate+num_sat+1:num_rate+num_sat+num_cont]
    cont_perturb = reshape(cont_perturb,2,convert(Int64,length(cont_perturb)/2))'
    
    # Perturb rate constants and add to data_dictionary
    rate_new = rate.*rate_perturb
    rate_new = max(rate_bounds[:,1],rate_new)
    rate_new = min(rate_bounds[:,2],rate_new)
    data_dictionary["RATE_CONSTANT_ARRAY"] = rate_new
    
    # Perturb saturation constants and add to data_dictionary
    tmp = vec(data_dictionary["SATURATION_CONSTANT_ARRAY"])
    sat_vector = tmp[find(tmp.>0)]
    if ~(num_sat==length(sat_vector))
        throw("sat_vector is of incorrect length")
    end
    sat_vector_new = sat_vector.*sat_perturb
    sat_vector_new = max(sat_lower_bound,sat_vector_new)
    sat_vector_new = min(sat_upper_bound,sat_vector_new)
    sat_new = copy(sat)
    sat_new[find(sat_new.>0)] = sat_vector_new
    data_dictionary["SATURATION_CONSTANT_ARRAY"] = sat_new
    
    # Perturb control constants and add to data_dictionary
    cont_new = cont.*cont_perturb
    gain = cont_new[:,1]
    gain = max(gain_lower_bound,gain)
    gain = min(gain_upper_bound,gain)
    order = cont_new[:,2]
    order = max(order_lower_bound,order)
    order = min(order_upper_bound,order)
    cont_new = [gain order]
    data_dictionary["CONTROL_PARAMETER_ARRAY"] = cont_new
    
    # Solve the balance equations
    tic()
    Tsim,X = SolveBalances(TSTART,TSTOP,Ts,data_dictionary);
    time_elapsed = toc()
    
    if time_elapsed < 40 # Should prevent sets with CVODE errors from joining ensemble
                         # May also exclude some sets without CVODE errors
        Error_new,Keys = CalcError(experiment_data_dictionary,Tsim,X)
        cost_new = sum(Error_new)
        
        acc_prob = exp(alpha*(cost-cost_new)/cost)
        
        cost_round = round(cost,2)
        cost_new_round = round(cost_new,2)
        cost_best_round = round(cost_best,2)
        acc_prob_round = round(acc_prob,2)
        var_round = round(variance,2)
        
        # If a new best is achieved, overwrite parameters and cost and save the relevant information to Best directory
        if cost_new < cost_best
            # Save to Best directory
            rate_best = copy(rate_new)
            sat_best = copy(sat_new)
            cont_best = copy(cont_new)
            cost_best = copy(cost_new)
            writedlm("Ensemble/Best/rate_constant.dat",rate_best)
            writedlm("Ensemble/Best/saturation_constant.dat",sat_best)
            writedlm("Ensemble/Best/control_constant.dat",cont_best)
            writedlm("Ensemble/Best/Tsim",Tsim)
            writedlm("Ensemble/Best/X",X)
            writedlm("Ensemble/Best/cost",cost_best)
            println("$i: cost_new = $cost_new_round, cost = $cost_round, best = $cost_best_round, acc_prob = $acc_prob_round, var = $var_round, varying $num_indices_to_vary, NEW BEST")
        else
            println("$i: cost_new = $cost_new_round, cost = $cost_round, best = $cost_best_round, acc_prob = $acc_prob_round, var = $var_round, varying $num_indices_to_vary")
        end
        # If new cost is lower than previous cost, choose new params as reference point for perturbation
        if rand() < acc_prob # Accept all better sets and some worse sets
            # Create directory for next sample and save the relevant information
            mkdir("Ensemble/$i")
            writedlm("Ensemble/$i/rate_constant.dat",rate_new)
            writedlm("Ensemble/$i/saturation_constant.dat",sat_new)
            writedlm("Ensemble/$i/control_constant.dat",cont_new)
            writedlm("Ensemble/$i/Tsim",Tsim)
            writedlm("Ensemble/$i/X",X)
            writedlm("Ensemble/$i/cost",cost_new)
            # Overwrite variables
            rate = copy(rate_new)
            sat = copy(sat_new)
            cont = copy(cont_new)
            cost = copy(cost_new)
        end
        writedlm("Ensemble/num_dir",i) # Record new number of directories
    end
end
end






