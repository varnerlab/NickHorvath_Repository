include("../Model/DataDictionary.jl")

time_start = 0.0
time_stop = 3.0
time_step = .01
data_dictionary = DataDictionary(time_start,time_stop,time_step)
species_list = data_dictionary["list_of_metabolite_symbols"]
rxn_list = data_dictionary["list_of_reaction_strings"]

species_indices = Dict()
for i in 1:length(species_list)
	species_indices[species_list[i]] = i
end

rxn_indices = Dict()
for i in 1:length(rxn_list)
	key = String(split(rxn_list[i],':')[1])
	rxn_indices[key] = i
end

# Define function to calculate connected species
function Connectivity(metabolites::Array{String})

species_idx = Int64[]
for metabolite in metabolites
	push!(species_idx,species_indices[metabolite])
end

sub_array = S[species_idx,:]
if ndims(sub_array) == 1
	sub_array = sub_array'
end
rxn_idx = find(sum(sub_array,1))
connectivity_array = S[:,rxn_idx]
connected_species = find(sum(connectivity_array,2))

return species_list[connected_species]
end

# Define function to calculate connected species
function Connectivity(metabolite::String)

species_idx = species_indices[metabolite]
sub_array = S[species_idx,:]'
rxn_idx = find(sub_array)
connectivity_array = S[:,rxn_idx]
connected_species = find(sum(connectivity_array,2))

return species_list[connected_species]
end

# Read the stoichiometric network
S = readdlm("../Model/Network.dat")

## Make sure that TXTL stoichiometry is correct
#S[species_indices["GENE_CAT"],:] = 0
#S[species_indices["RNAP"],:] = 0
#S[species_indices["RIBOSOME"],:] = 0
#S[species_indices["mRNA_CAT"],rxn_indices["transcription_CAT"]] = 1
#S[species_indices["mRNA_CAT"],rxn_indices["mRNA_degradation_CAT"]] = -1
#S[species_indices["mRNA_CAT"],rxn_indices["translation_CAT"] = 0

# Replace all non-zeros with 1
S = Array{Int64}(round(abs(S).^.00000001,1))

# Choose species/rxns to ignore
species_to_ignore = ["M_co2_c"; "M_etoh_c"; "M_h2o2_c"; "M_h2o_c"; "M_h2s_c"; "M_h_c"; "M_h_e"; "M_hco3_c"; "M_nh3_c"; "M_o2_c"; "M_pi_c"; "M_ppi_c"]
species_to_ignore = vec(Array{String}(readdlm("../Model/ignore")))
for species in species_to_ignore
	S[species_indices[species],:] = 0
end

# Used for determining AA connectivity
#AA_species = ["M_ala_L_c"; "M_arg_L_c"; "M_asn_L_c"; "M_asp_L_c"; "M_cys_L_c"; "M_gln_L_c"; "M_glu_L_c"; "M_gly_L_c"; "M_his_L_c"; "M_ile_L_c"; "M_leu_L_c"; "M_lys_L_c"; "M_met_L_c"; "M_phe_L_c"; "M_pro_L_c"; "M_ser_L_c"; "M_thr_L_c"; "M_trp_L_c"; "M_tyr_L_c"; "M_val_L_c"]
#for species in species_list
#	if !(species in AA_species)
#		S[species_indices[species],:] = 0
#	end
#end

# Define number of species
num_species = size(S,1)

# Determine connected species
connected_species = String[]
connected_species_indices = Dict()
for species in species_list
	ignore = false
	for ignored_species in species_to_ignore
		if species == ignored_species
			ignore = true
		end
	end
	if !ignore && !isempty(find(S[species_indices[species],:]))
		push!(connected_species,species)
		connected_species_indices[species] = species_indices[species]
	end
end

# Calculate first-order connectivity
FirstOrderConn = Array{Int64}(zeros(num_species,1))
for i in connected_species_indices
	tmp = Connectivity(species_list[i])
	FirstOrderConn[i] = length(tmp)-1
end

# Calculate second-order connectivity
SecondOrderConn = Array{Int64}(zeros(num_species,1))
for i in connected_species_indices
	tmp = Connectivity(Connectivity(species_list[i]))
	SecondOrderConn[i] = length(tmp)-1
end

# Calculate third-order connectivity
ThirdOrderConn = Array{Int64}(zeros(num_species,1))
for i in connected_species_indices
	tmp = Connectivity(Connectivity(Connectivity(species_list[i])))
	ThirdOrderConn[i] = length(tmp)-1
end

# Check if third-order connectivity covers all connections
minimum(ThirdOrderConn[find(ThirdOrderConn)]) == length(FirstOrderConn[find(FirstOrderConn)])-1

# Calculate fourth-order connectivity
FourthOrderConn = Array{Int64}(zeros(num_species,1))
for i in connected_species_indices
	tmp = Connectivity(Connectivity(Connectivity(Connectivity(species_list[i]))))
	FourthOrderConn[i] = length(tmp)-1
end

# Check if fourth-order connectivity covers all connections
minimum(FourthOrderConn[find(FourthOrderConn)]) == length(FirstOrderConn[find(FirstOrderConn)])-1

# Calculate degree-of-connectivity matrix; set infinity as the default value
Degree = Array{Any}(Inf*ones(num_species,num_species))

# All species have zero-degree connectivity with themselves
for i in 1:num_species
	Degree[i,i] = 0
end

# Calculate all other connectivity indices
for i in 1:num_species
	for j in i+1:num_species
		if in(species_list[j],Connectivity(species_list[i]))
			Degree[i,j] = 1
			Degree[j,i] = 1
		elseif in(species_list[j],Connectivity(Connectivity(species_list[i])))
			Degree[i,j] = 2
			Degree[j,i] = 2
		elseif in(species_list[j],Connectivity(Connectivity(Connectivity(species_list[i]))))
			Degree[i,j] = 3
			Degree[j,i] = 3
		elseif in(species_list[j],Connectivity(Connectivity(Connectivity(Connectivity(species_list[i])))))
			Degree[i,j] = 4
			Degree[j,i] = 4
		end
	end
end

Degree_connected_species = Degree[connected_species_indices,connected_species_indices]
writedlm("Degree_connected_species",Degree_connected_species)

type Species
	model_index::Int64
	first_order_connnectivity::Int64
	second_order_connnectivity::Int64
	third_order_connnectivity::Int64
	fourth_order_connnectivity::Int64
	connectivity_array::Array
	function Species()
		this = new()
	end
end

SpeciesConnectivity = Dict()
for key in keys(species_indices)
	SpeciesConnectivity[key] = Species()
	SpeciesConnectivity[key].model_index = species_indices[key]
	SpeciesConnectivity[key].first_order_connnectivity = FirstOrderConn[SpeciesConnectivity[key].model_index]
	SpeciesConnectivity[key].second_order_connnectivity = SecondOrderConn[SpeciesConnectivity[key].model_index]
	SpeciesConnectivity[key].third_order_connnectivity = ThirdOrderConn[SpeciesConnectivity[key].model_index]
	SpeciesConnectivity[key].fourth_order_connnectivity = FourthOrderConn[SpeciesConnectivity[key].model_index]
	SpeciesConnectivity[key].connectivity_array = Degree[SpeciesConnectivity[key].model_index,:]
end



function ConnectivityDistribution(metabolites::Array{String})

species_sublist = String[]
C_dist = Int64[]
for species in species_list
	if !(species in metabolites) && (species in collect(keys(connected_species_indices)))
		push!(species_sublist,species)
		Conn = Int64[]
		for metabolite in metabolites
			conn = Degree[species_indices[metabolite],species_indices[species]]
			if isinteger(conn)
				push!(Conn,conn)
			end
		end
		C = minimum(Conn)
		push!(C_dist,C)
	end
end

return [species_sublist C_dist]
end




