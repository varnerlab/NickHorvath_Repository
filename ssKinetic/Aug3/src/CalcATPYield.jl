include("ATP_coefficients.jl")

# Read total number of flux vectors (timepoints)
num_tp = convert(Int64,readcsv("flux/num_flux")[1])

# Choose a frequency of reading fluxes (choose freq = 1 to read all fluxes)
freq = 1
flux = readcsv("flux/$freq")

# Create array of all flux vectors
Flux_array = zeros(length(flux),num_tp)
for i in freq:freq:num_tp
    flux = readdlm("flux/$i")
    Flux_array[:,i] = flux
end

# Sort columns of flux_array, in case timepoints are out of order
Flux_array = sortrows(Flux_array')'

# Collect timepoints into Tsim vector
tp_vector = vec(Flux_array[1,:])
flux_array = Flux_array[2:end,:]

# Determine the index (for the flux vector) corresponding to the end of phase 1
phase_split = 1.00 # Define the time in hours at which phase 1 ends
t_diff = abs(tp_vector-phase_split)
phase_split_index_fluxes = find(t_diff.==minimum(t_diff))[1]

# Give reaction indices and ATP stoichiometric coefficients for all ATP-producing reactions
atp_production_array = [["pgk";"pyk";"sucCD";"atp";"ackA";"asn_deg";"thr_deg3"] [12;18;45;55;68;102;109] [1;1;1;1;1;2;1]]

# Create the array of cumulative fluxes
atp_production = [["pgk";"pyk";"sucCD";"atp";"ackA";"asn_deg";"thr_deg3"] zeros(7,3)]
for i in 1:size(atp_production,1)
	reaction_index = atp_production_array[i,2]
	coeff = atp_production_array[i,3]
	tmp = coeff*flux_array[reaction_index,:]'
	# Perform trapezoid rule integration
	tmp_cumulative = [0;cumsum(.5*(tp_vector[2:end]-tp_vector[1:end-1]).*(tmp[2:end]+tmp[1:end-1]))]
	atp_production[i,2] = tmp_cumulative[end] # Total (3 hour) flux
	atp_production[i,3] = tmp_cumulative[phase_split_index_fluxes] # Phase 1 only
	atp_production[i,4] = tmp_cumulative[end]-tmp_cumulative[phase_split_index_fluxes] # Phase 2 only
end
atp_production = [atp_production;["TOTAL" sum(atp_production[:,2]) sum(atp_production[:,3]) sum(atp_production[:,4])]]

# Format as percentages
atp_production_percentage_table = [atp_production[1:end-1,1] round(atp_production[1:end-1,3]/atp_production[end,3]*100,0) round(atp_production[1:end-1,4]/atp_production[end,4]*100,0)]

# Get total ATP production across all three hours and in each phase
ATP_overall = atp_production[end,2]
ATP_first = atp_production[end,3]
ATP_second = atp_production[end,4]

# Give reaction indices and ATP stoichiometric coefficients for all ATP-consuming reactions
atp_consumption_array = ["R_glk_atp" 1 1;
"R_pfk" 4 1;
"R_pgk_R" 13 1;
"R_pck" 19 1;
"R_pps" 22 1;
"R_ackA_R" 69 1;
"R_acs" 70 1;
"R_arg" 78 3;
"R_asnB" 80 1;
"R_asnA" 81 1;
"R_glnA" 86 1;
"R_his" 88 2;
"R_lys" 91 1;
"R_met" 92 1;
"R_pro" 94 1;
"R_thr" 96 2;
"R_trp" 97 1;
"R_chor" 117 1;
"R_fol_3" 122 1;
"R_prpp_syn" 132 1;
"R_or_syn_1" 133 2;
"R_ctp_1" 137 1;
"R_ctp_2" 138 1;
"R_A_syn_2" 140 1;
"R_A_syn_4" 142 1;
"R_A_syn_5" 143 1;
"R_A_syn_6" 144 1;
"R_A_syn_7" 145 1;
"R_gmp_syn" 151 1;
"R_atp_amp" 152 1;
"R_atp_adp" 156 1;
"R_udp_utp" 160 1;
"R_cdp_ctp" 161 1;
"R_gdp_gtp" 162 1;
"R_atp_ump" 163 1;
"R_atp_cmp" 164 1;
"R_atp_gmp" 165 1;
"R_adk_atp" 166 1;
"transcription_CAT" 181 176;
"tRNA_charging_M_ala_L_c_CAT" 185 15;
"tRNA_charging_M_arg_L_c_CAT" 186 5;
"tRNA_charging_M_asn_L_c_CAT" 187 10;
"tRNA_charging_M_asp_L_c_CAT" 188 12;
"tRNA_charging_M_cys_L_c_CAT" 189 5;
"tRNA_charging_M_glu_L_c_CAT" 190 12;
"tRNA_charging_M_gln_L_c_CAT" 191 13;
"tRNA_charging_M_gly_L_c_CAT" 192 10;
"tRNA_charging_M_his_L_c_CAT" 193 12;
"tRNA_charging_M_ile_L_c_CAT" 194 9;
"tRNA_charging_M_leu_L_c_CAT" 195 13;
"tRNA_charging_M_lys_L_c_CAT" 196 12;
"tRNA_charging_M_met_L_c_CAT" 197 9;
"tRNA_charging_M_phe_L_c_CAT" 198 20;
"tRNA_charging_M_pro_L_c_CAT" 199 7;
"tRNA_charging_M_ser_L_c_CAT" 200 10;
"tRNA_charging_M_thr_L_c_CAT" 201 13;
"tRNA_charging_M_trp_L_c_CAT" 202 5;
"tRNA_charging_M_tyr_L_c_CAT" 203 11;
"tRNA_charging_M_val_L_c_CAT" 204 16]

# Create the array of cumulative fluxes
atp_consumption = [atp_consumption_array[:,1] zeros(size(atp_consumption_array,1),3)]
for i in 1:size(atp_consumption,1)
	reaction_index = atp_consumption_array[i,2]
	coeff = atp_consumption_array[i,3]
	tmp = coeff*flux_array[reaction_index,:]'
	# Perform trapezoid rule integration
	tmp_cumulative = [0;cumsum(.5*(tp_vector[2:end]-tp_vector[1:end-1]).*(tmp[2:end]+tmp[1:end-1]))]
	atp_consumption[i,2] = tmp_cumulative[end] # Total (3 hour) flux
	atp_consumption[i,3] = tmp_cumulative[phase_split_index_fluxes] # Phase 1 only
	atp_consumption[i,4] = tmp_cumulative[end]-tmp_cumulative[phase_split_index_fluxes] # Phase 2 only
end
atp_consumption = [atp_consumption;["TOTAL" sum(atp_consumption[:,2]) sum(atp_consumption[:,3]) sum(atp_consumption[:,4])]]

# Take sum of tRNA charging fluxes
atp_consumption_grouped = atp_consumption[1:39,:]
atp_consumption_grouped = [atp_consumption_grouped;["tRNA_charging" sum(atp_consumption[40:59,2]) sum(atp_consumption[40:59,3]) sum(atp_consumption[40:59,4])]]
atp_consumption_grouped = [atp_consumption_grouped [atp_consumption_array[1:39,2];204]]

# Sort fluxes by overall flux
tmp = [atp_consumption_grouped[:,2:end] atp_consumption_grouped[:,1]]
atp_consumption_sorted = sortrows(tmp,rev=true)[:,[5;1:4]]

# Lump lesser fluxes into "other"
atp_consumption_other = atp_consumption_sorted[1:13,:]
atp_consumption_other = [atp_consumption_other;["other" sum(atp_consumption_sorted[14:end,2]) sum(atp_consumption_sorted[14:end,3]) sum(atp_consumption_sorted[14:end,4]) 777]]

# Sort fluxes by flux index
tmp = [atp_consumption_other[:,end] atp_consumption_other[:,1:end-1]]
atp_consumption_final = sortrows(tmp)[:,[2:5;1]]
atp_consumption_final = [atp_consumption_final;[atp_consumption[end,:]' " "]]

# Format as percentages
atp_consumption_percentage_table = [atp_consumption_final[1:end-1,1] atp_consumption_final[1:end-1,end] round(atp_consumption_final[1:end-1,3]/atp_consumption_final[end,3]*100,0) round(atp_consumption_final[1:end-1,4]/atp_consumption_final[end,4]*100,0)]

# Read the simulated timecourse and state
Tsim = readdlm("Best/Tsim")
X = readdlm("Best/X")

# Determine the index (for the state vector) corresponding to the end of phase 1
phase_split = 1.00 # Define the time in hours at which phase 1 ends
t_diff = abs(Tsim-phase_split)
phase_split_index = find(t_diff.==minimum(t_diff))[1]

# Define relevant species
species = [
"glc" 100
"pyr" 102
"lac" 104
"succ" 118
"mal" 105
"ac" 103
"CAT" 98
"mRNA" 98
#"atp" 106
#"adp" 107
#"amp" 108
#"gtp" 109
#"gdp" 110
#"gmp" 111
#"ctp" 115
#"cdp" 116
#"cmp" 117
#"utp" 112
#"udp" 113
#"ump" 114
"ala" 126
"arg" 36
"asn" 122
"asp" 119
"cys" 123
"gln" 137
"glu" 136
"gly" 120
"his" 125
"ile" 121
"leu" 135
"lys" 124
"met" 134
"phe" 127
"pro" 128
"ser" 129
"thr" 130
"trp" 131
"tyr" 132
"val" 133]

# Get coefficients (equivalent ATP molecules) for metabolites
Coefficients = ATP_coefficients()

# Calculate each species' consumption/accumulation across all three hours and in each phase
for i in 1:size(species,1)
	species_name = species[i,1]
	species_index = species[i,2]
	eval(parse("$species_name = X[:,$species_index]"))
	eval(parse("$species_name"*"_overall = abs($species_name[1]-$species_name[end])"))
	eval(parse("$species_name"*"_first = abs($species_name[1]-$species_name[phase_split_index])"))
	eval(parse("$species_name"*"_second = abs($species_name[phase_split_index]-$species_name[end])"))
	eval(parse("$species_name"*"_coeff = Coefficients[\"$species_name\"]"))
end

## Calculate ATP yield per molecule substrate
#ATP_yield_first = ATP_first/GLC_first
#ATP_yield_second = ATP_second/(PYR_second+LAC_second+SUCC_second+MAL_second)
#ATP_yield_overall = (ATP_first+ATP_second)/(GLC_first+PYR_second+LAC_second+SUCC_second+MAL_second)

# Calculate energy efficiency
efficiency_overall = (mRNA_coeff*mRNA_overall+CAT_coeff*CAT_overall)/(ATP_overall)
efficiency_first = (mRNA_coeff*mRNA_first+CAT_coeff*CAT_first)/ATP_first
efficiency_second = (mRNA_coeff*mRNA_second+CAT_coeff*CAT_second)/ATP_second

