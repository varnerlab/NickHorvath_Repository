include("Include.jl")

Mean = Unpack("./data/Mean")
Std = Unpack("./data/Std")
Upper = Unpack("./data/Upper")
Lower = Unpack("./data/Lower")
data_dictionary = DataDictionary(0,0,0)#148x301
metabolite_list = data_dictionary["list_of_metabolite_symbols"]

# 182 translation_CAT
# 60 M_glc_D_c
# 142 PROTEIN_CAT
# load the data dictionary -

(n_species,n_rxn) = size(data_dictionary["stoichiometric_matrix"])
t0 = 0
tf = 3
tstep = 0.01
experimental_time = [t0:tstep:tf;]
length_time = length(experimental_time)

# notes: two possible implementations ---
#  1. select subset of species to be constrained to synthetic data
#    have everything else that are not constrained to data be open or a function of concentration
#  2. select subset of species to be constrained to synthetic data
#    have everything else that are not constrained to data constrained at steady state (sv=0)

initial_conditions = ones(n_species,1)*0.1
for species_index in 1:n_species
  initial_conditions[species_index] = Mean[metabolite_list[species_index]][1]
  @show species_index,metabolite_list[species_index],Mean[metabolite_list[species_index]][1]
end
#initial_conditions = ones(n_species,1)*0.1

glycolysis_indices, PPP_and_ED_indices, TCA_and_acetate_indices, energy_species_indices, amino_acids_indices, charged_amino_acids_indices, TXTL_indices = IndexGrouping()

# this determines which parameters are fitted to data
#species_constraint_index = [60,142,31,70,41,137]
species_constraint_index = [energy_species_indices; amino_acids_indices; TXTL_indices]#; glycolysis_indices]
#species_constraint_index = collect(1:146)

syn_data_upper = zeros(n_species,length_time)
syn_data_lower = zeros(n_species,length_time)
syn_mean = zeros(n_species,length_time)
for syn_index in species_constraint_index
  syn_data_upper[syn_index,:] = Upper[metabolite_list[syn_index]]
  syn_data_lower[syn_index,:] = Lower[metabolite_list[syn_index]]
  syn_mean[syn_index,:] = Mean[metabolite_list[syn_index]]
end
syn_data = Dict{AbstractString,Any}()
syn_data["mean"] = syn_mean
syn_data["upper"] = syn_data_upper
syn_data["lower"] = syn_data_lower
#for syn_index in [1:length_time]
#  syn_data[60,syn_index] = 1*exp(-0.01*syn_index)
#end

# not currently used
parameter = ones(202,2)
parameter[:,1] = parameter[:,1]*110
parameter[:,2] = parameter[:,2]*0.03

# import synthetic data from kinetic model
#initial_conditions = readdlm("IC_data.dat")

#data_dictionary["species_bounds_array"] = ones(202,2)
#data_dictionary["species_bounds_array"][:,1] = -1;
#data_dictionary["species_bounds_array"][:,2] = 1
# select subset of data to use as constraints
# possible groups for analysis: glycolysis, TCA, PPP, AA synthesis, fatty acid synthesis, branching points

# set up initial conditions (use kinetic model data)
time_state_array = zeros(n_species,length_time)
FBA = data_dictionary["default_flux_bounds_array"]
SBA = data_dictionary["species_bounds_array"]
# loop for all constraint subsets
for constraint_index = [1];
  # discretized dfba
  state_array = deepcopy(initial_conditions)
  time_state_array[:,1] = state_array
  
  index = 2
  #dfba
  for time_index in experimental_time[2:end]
    # constraint
      (species_constraints, flux_constraints) = calculate_constraints(state_array,parameter,species_constraint_index,syn_data,index,tstep)
      data_dictionary["species_bounds_array"] = species_constraints
      data_dictionary["default_flux_bounds_array"] = flux_constraints

      # solve the lp problem -
      (objective_value, flux_array, dual_array, uptake_array, exit_flag) = FluxDriver(data_dictionary)

      # mass balance for concentration
      state_array = state_array + (uptake_array * tstep) # cell free mass balanace
      println("val: ",uptake_array[60])
      state_array[103] = initial_conditions[103]
      time_state_array[:,index] = state_array

      index = index + 1
    end

  # evalution of performance

end

error = CalcError(Upper,Lower,experimental_time,time_state_array)
println("cost: ",sum(error))

Plot(Upper,Lower,experimental_time,time_state_array)
