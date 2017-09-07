function calculate_constraints(state_array, parameters, constraint_index, syn_data,time_index,tstep)
  alpha = 1.1 # looseness/tightness of constraints
  beta = 10
  n_species = length(state_array[:,1])
  syn_upper = syn_data["upper"]
  syn_lower = syn_data["lower"]
  syn_mean = syn_data["mean"]

  # state array can only vary by a factor of 2 per iteration
  lower_bound = 0
  upper_bound = 100000000
  species_lower_bound = (lower_bound - state_array) / tstep;
  species_upper_bound = (upper_bound - state_array) / tstep;
  #@show syn_data,state_array
  #@show size(syn_data), size(state_array),constraint_index
  #@show syn_data[1,time_index]
  #@show state_array[1],constraint_index
  # constrain the species to synthetic data
  for c_index in constraint_index
    #if syn_data[c_index,time_index]-state_array[c_index] >= 0
      species_lower_bound[c_index] = (syn_lower[c_index,time_index]-state_array[c_index])
      species_upper_bound[c_index] = (syn_upper[c_index,time_index]-state_array[c_index])
    #else
      #species_lower_bound[c_index] = (syn_lower[c_index,time_index]-state_array[c_index])
    #  species_upper_bound[c_index] = (syn_upper[c_index,time_index]-state_array[c_index])
    #end

  end
  # oxygen
  species_lower_bound[103] = -100
  species_upper_bound[103] = 100

  # flux constraints

  # just start with Vmax and 0 for bounds
  flux_lower_bound = -.001*ones(202) #-100*ones(202) #parameters[:,1].*state_array./(parameter[:,2]+state_array) / beta
  flux_upper_bound = 100*ones(202) #parameters[:,1].*state_array./(parameter[:,2]+state_array) * beta

  species_constraints = [species_lower_bound species_upper_bound]
  flux_constraints = [flux_lower_bound flux_upper_bound]

  return species_constraints, flux_constraints
end
