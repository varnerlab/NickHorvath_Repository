function MassBalances(t,x,dxdt_vector,time_vector,flux_array)
# Set RIBOSOME_START_CAT to RIBOSOME_START_CAT initial condition + RIBOSOME initial condition - RIBOSOME concentration
#initial_condition = readdlm("initial_condition.dat")
#x[76] = min(x[76],initial_condition[76]+initial_condition[77])
#x[77] = min(x[77],initial_condition[76]+initial_condition[77])

# Correct negative x's = throws errors in control even if small - 
const idx = find(x->(x<0),x);
x[idx] = 0.0

# Import flux array and corresponding time vector
time_vector = readdlm("flux/time_vector")
#flux_array = readdlm("flux/flux_array")

# Find timepoint closest to solver time value, and take corresponding rate vector out of flux array
t_diff = abs(t-time_vector)
t_idx = find(t_diff.==minimum(t_diff))
rate_vector = flux_array[:,t_idx]

# Encode the balance equations as a matrix vector product - 
const S = data_dictionary["STOICHIOMETRIC_MATRIX"]
const tmp_vector = S*rate_vector
const number_of_states = length(tmp_vector)
for state_index in collect(1:number_of_states)
    dxdt_vector[state_index] = tmp_vector[state_index]
    dxdt_vector[[138;143]] = 0 # Set M_h_c and M_o2_c to steady-state
end
end

