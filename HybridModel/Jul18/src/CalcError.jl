using Interpolations

function CalcError(experiment_data_dictionary,Tsim,X)

# Initialize arrays
Error = Float64[]
Keys = AbstractString[]

# Define dictionary of weights
Weight = Dict()
Weight["CAT"] = 16
Weight["M_glc_D_c"] = 2
Weight["M_pyr_c"] = 4
Weight["M_lac_D_c"] = 4
Weight["M_ac_c"] = 4
Weight["M_succ_c"] = 8
Weight["M_mal_L_c"] = 8
Weight["M_atp_c"] = 2
Weight["M_adp_c"] = 4
Weight["M_amp_c"] = 2
Weight["M_gtp_c"] = 1
Weight["M_gdp_c"] = 1
Weight["M_gmp_c"] = 1
Weight["M_ctp_c"] = 2
Weight["M_cdp_c"] = 1
Weight["M_cmp_c"] = 4
Weight["M_utp_c"] = 1
Weight["M_udp_c"] = 1
Weight["M_ump_c"] = 8
Weight["M_ala_L_c"] = 4
Weight["M_asn_L_c"] = 1
Weight["M_asp_L_c"] = 1
Weight["M_cys_L_c"] = 1
Weight["M_gln_L_c"] = 2
Weight["M_gly_L_c"] = 4
Weight["M_his_L_c"] = 1
Weight["M_ile_L_c"] = 1
Weight["M_leu_L_c"] = 1
Weight["M_lys_L_c"] = 1
Weight["M_met_L_c"] = 1
Weight["M_phe_L_c"] = 1
Weight["M_pro_L_c"] = 1
Weight["M_ser_L_c"] = 2
Weight["M_thr_L_c"] = 1
Weight["M_trp_L_c"] = 1
Weight["M_tyr_L_c"] = 1
Weight["M_val_L_c"] = 1

for (key,dataset) in experiment_data_dictionary
    # Get raw data and timepoints
    raw_array = dataset.raw_measurement_array
    data_tps = raw_array[:,1]
    data_vals = raw_array[:,2]
    # Interpolate simulation array to fit dataset
    index = dataset.model_index
    sim = X[:,index]
    itp = interpolate((Tsim,),sim,Gridded(Linear()))
    sim_itp = itp[data_tps]
    # Calculate error
    norm_diff = (sim_itp-data_vals)/maximum(data_vals)
    error = sum(norm_diff.^2)
    # Weight certain datasets as more important
    error *= Weight[key]
    # Push to arrays
    push!(Error,error)
    push!(Keys,key)
end

# Create another weight vector to punish high errors
weight = ones(length(Error))
weight[1:5] .*= [5;4;3;2;1]

Keys = sortrows([Error Keys],rev=true)[:,2]
Error = sortrows([Error Keys],rev=true)[:,1]
Error .*= weight

#glc_1 = X[101,100]
#glc_2 = X[201,100]
#glc_3 = X[end,100]
#fdp_1 = X[101,3]
#fdp_2 = X[201,3]
#fdp_3 = X[end,3]
#pyr_1 = X[101,102]
#pyr_2 = X[201,102]
#lac_1 = X[101,104]
#lac_2 = X[201,104]
#lac_3 = X[end,104]
#ac_3 = X[end,103]
#cat_half = X[51,98]
#cat_1 = X[101,98]
#cat_2 = X[201,98]
#cat_3 = X[end,98]
#succ_1 = X[101,118]
#succ_3 = X[end,118]
#mal_1 = X[101,105]
#mal_3 = X[end,105]

#ala_3 = X[end,126]
#arg_3 = X[end,36]
#asn_1 = X[101,122]
#asn_2 = X[201,122]
#asp_1 = X[101,119]
#asp_3 = X[end,119]
#cys_3 = X[end,123]
#gln_3 = X[end,137]
#gly_3 = X[end,120]
#his_3 = X[end,125]
#ile_3 = X[end,121]
#leu_3 = X[end,135]
#lys_3 = X[end,124]
#met_3 = X[end,134]
#phe_3 = X[end,127]
#pro_3 = X[end,128]
#ser_3 = X[end,129]
#thr_3 = X[end,130]
#trp_3 = X[end,131]
#tyr_3 = X[end,132]
#val_3 = X[end,133]

#penalty_factor = 1.5

#if cat_half < 4/1000 || cat_1 < 6.75/1000 || cat_2 < 9.8/1000 || cat_3 < 16.5/1000
#	Error *= penalty_factor*4
#end

#if glc_1 > 5 || glc_2 > .01 || glc_3 > .001
#	Error *= penalty_factor
#end

#if pyr_1 < 7.5 || pyr_2 > .01
#	Error *= penalty_factor
#end

#if lac_1 < 12 || lac_2 < 6 || lac_3 > 6
#    Error *= penalty_factor
#end

#if ac_3 < 35 || ac_3 > 55
#	Error *= penalty_factor
#end

#if succ_1 < 1.3 || succ_1 > 3.6 || succ_3 < 1 || succ_3 > 2.5
#	Error *= penalty_factor
#end

#if mal_1 < 3 || mal_1 > 7 || mal_3 < 1.5 || mal_3 > 5
#	Error *= penalty_factor
#end

#if ala_3 > 8 || ala_3 < 4
#	Error *= penalty_factor
#end

#if asn_2 > 2 || asn_1 > 1
#	Error *= penalty_factor
#end

#if asp_3 > 1
#	Error *= penalty_factor
#end

#if cys_3 > 1.5 || cys_3 < .1
#	Error *= penalty_factor
#end

#if gln_3 > 4.5 || gln_3 < 2.5
#	Error *= penalty_factor
#end

#if gly_3 > 3 || gly_3 < 1.5
#	Error *= penalty_factor
#end

#if his_3 > 2.5 || his_3 < 1
#	Error *= penalty_factor
#end

#if ile_3 > 2 || ile_3 < 1
#	Error *= penalty_factor
#end

#if leu_3 > 2.5 || leu_3 < 1.5
#	Error *= penalty_factor
#end

#if lys_3 > 1.5 || lys_3 < .1
#	Error *= penalty_factor
#end

#if met_3 > 2.3 || met_3 < .8
#	Error *= penalty_factor
#end

#if phe_3 > 2 || phe_3 < .7
#	Error *= penalty_factor
#end

#if pro_3 > 2 || pro_3 < 1
#	Error *= penalty_factor
#end

#if ser_3 > 2 || ser_3 < 1
#	Error *= penalty_factor
#end

#if thr_3 > 2 || thr_3 < 1
#	Error *= penalty_factor
#end

#if trp_3 > 2 || trp_3 < 1
#	Error *= penalty_factor
#end

#if tyr_3 > 1.3 || tyr_3 < .7
#	Error *= penalty_factor
#end

#if val_3 > 2.2 || val_3 < 1
#	Error *= penalty_factor
#end

return Error,Keys
end






