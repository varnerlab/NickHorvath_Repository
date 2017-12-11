using Interpolations

function CalcAIC(experiment_data_dictionary,Tsim,X)

# Initialize arrays
AIC = Float64[]
Keys = AbstractString[]

Index = Dict()
Index["M_glc_D_c"] = 1
Index["CAT"] = 2
Index["M_pyr_c"] = 3
Index["M_lac_D_c"] = 4
Index["M_ac_c"] = 5
Index["M_succ_c"] = 6
Index["M_mal_L_c"] = 7
Index["M_atp_c"] = 8
Index["M_adp_c"] = 9
Index["M_amp_c"] = 10
Index["M_gtp_c"] = 11
Index["M_gdp_c"] = 12
Index["M_gmp_c"] = 13
Index["M_ctp_c"] = 14
Index["M_cdp_c"] = 15
Index["M_cmp_c"] = 16
Index["M_utp_c"] = 17
Index["M_udp_c"] = 18
Index["M_ump_c"] = 19
Index["M_ala_L_c"] = 20
Index["M_asn_L_c"] = 21
Index["M_asp_L_c"] = 22
Index["M_cys_L_c"] = 23
Index["M_gln_L_c"] = 24
Index["M_gly_L_c"] = 25
Index["M_his_L_c"] = 26
Index["M_ile_L_c"] = 27
Index["M_leu_L_c"] = 28
Index["M_lys_L_c"] = 29
Index["M_met_L_c"] = 30
Index["M_phe_L_c"] = 31
Index["M_pro_L_c"] = 32
Index["M_ser_L_c"] = 33
Index["M_thr_L_c"] = 34
Index["M_trp_L_c"] = 35
Index["M_tyr_L_c"] = 36
Index["M_val_L_c"] = 37

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
    # Calculate AIC
    k = 990/37
    n = length(data_vals)
    rss = sum((sim_itp-data_vals).^2)
    aic = 2*k+n*log(rss)
    # Push to arrays
    push!(AIC,aic)
    idx = Index[key]+10
    str = "$idx"*"_$key"
    push!(Keys,str)
end

return AIC,Keys
end
