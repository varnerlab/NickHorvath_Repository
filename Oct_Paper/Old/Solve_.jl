include("Include.jl")

# load the data dictionary -
data_dictionary = DataDictionary(0,0,0)
#= notes: two possible implementations ---
  1. select subset of species to be constraint to synthetic data
    have everything else that are not constrained to data be open or a function of concentration
  2. select subset of species to be constraint to synthetic data
    have everything else that are not constrained to data constrained at steady state (sv=0)

=#


# import synthetic data from kinetic model
initial_conditions = readdlm("IC_data.dat")



# select subset of data to use as constraints
  # possible groups for analysis: glycolysis, TCA, PPP, AA synthesis, fatty acid synthesis, branching points

# set up initial conditions (use kinetic model data)


# loop for all constraint subsets
for constraint_index = [1:num_subset];
  # discretized dfba
  t0 = 0
  tf = 3
  tstep = 0.01
  for time_index in [t0:tf:tstep];


  # solve the lp problem -
  (objective_value, flux_array, dual_array, uptake_array, exit_flag) = FluxDriver(data_dictionary)


  end

end
