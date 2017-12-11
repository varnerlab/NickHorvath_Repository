names_list = ["M_g6p_c"
"M_f6p_c"
"M_fdp_c"
"M_dhap_c"
"M_g3p_c"
"M_13dpg_c"
"M_3pg_c"
"M_2pg_c"
"M_oaa_c"
"M_coa_c"
"M_accoa_c"
"M_6pgl_c"
"M_6pgc_c"
"M_ru5p_D_c"
"M_xu5p_D_c"
"M_r5p_c"
"M_s7p_c"
"M_e4p_c"
"M_2ddg6p_c"
"M_cit_c"
"M_icit_c"
"M_akg_c"
"M_succoa_c"
"M_q8_c"
"M_fum_c"
"M_q8h2_c"
"M_mql8_c"
"M_mqn8_c"
"M_h_e"
"M_ppi_c"
"M_glx_c"
"M_actp_c"
"M_etoh_c"
"M_for_c"
"M_nh3_c"
"M_arg_L_c"
"M_h2s_c"
"M_thf_c"
"M_mlthf_c"
"M_aicar_c"
"M_5mthf_c"
"M_chor_c"
"M_h2o2_c"
"M_mglx_c"
"M_prop_c"
"M_indole_c"
"M_cadav_c"
"M_gaba_c"
"M_glycoA_c"
"M_78mdp_c"
"M_4adochor_c"
"M_4abz_c"
"M_78dhf_c"
"M_dhf_c"
"M_methf_c"
"M_10fthf_c"
"M_prpp_c"
"M_hco3_c"
"M_clasp_c"
"M_or_c"
"M_omp_c"
"M_5pbdra"
"M_gar_c"
"M_fgar_c"
"M_fgam_c"
"M_air_c"
"M_cair_c"
"M_saicar_c"
"M_faicar_c"
"M_imp_c"
"M_xmp_c"
"GENE_CAT"
"RNAP"
"OPEN_GENE_CAT"
"mRNA_CAT"
"RIBOSOME"
"RIBOSOME_START_CAT"
"M_ala_L_c_tRNA"
"M_arg_L_c_tRNA"
"M_asn_L_c_tRNA"
"M_asp_L_c_tRNA"
"M_cys_L_c_tRNA"
"M_glu_L_c_tRNA"
"M_gln_L_c_tRNA"
"M_gly_L_c_tRNA"
"M_his_L_c_tRNA"
"M_ile_L_c_tRNA"
"M_leu_L_c_tRNA"
"M_lys_L_c_tRNA"
"M_met_L_c_tRNA"
"M_phe_L_c_tRNA"
"M_pro_L_c_tRNA"
"M_ser_L_c_tRNA"
"M_thr_L_c_tRNA"
"M_trp_L_c_tRNA"
"M_tyr_L_c_tRNA"
"M_val_L_c_tRNA"
"PROTEIN_CAT"
"tRNA"
"M_glc_D_c"
"M_pep_c"
"M_pyr_c"
"M_ac_c"
"M_lac_D_c"
"M_mal_L_c"
"M_atp_c"
"M_adp_c"
"M_amp_c"
"M_gtp_c"
"M_gdp_c"
"M_gmp_c"
"M_utp_c"
"M_udp_c"
"M_ump_c"
"M_ctp_c"
"M_cdp_c"
"M_cmp_c"
"M_succ_c"
"M_asp_L_c"
"M_gly_L_c"
"M_ile_L_c"
"M_asn_L_c"
"M_cys_L_c"
"M_lys_L_c"
"M_his_L_c"
"M_ala_L_c"
"M_phe_L_c"
"M_pro_L_c"
"M_ser_L_c"
"M_thr_L_c"
"M_trp_L_c"
"M_tyr_L_c"
"M_val_L_c"
"M_met_L_c"
"M_leu_L_c"
"M_glu_L_c"
"M_gln_L_c"
"M_o2_c"
"M_co2_c"
"M_pi_c"
"M_nh4_c"
"M_so4_c"
"M_h_c"
"M_h2o_c"
"M_nad_c"
"M_nadh_c"
"M_nadp_c"
"M_nadph_c"]

Species = Dict()
X = readdlm("Ensemble/1/X")
for j in 1:148
	Species[names_list[j]] = X[:,j]
end

for i in 2:100
	X = readdlm("Ensemble/$i/X")
	for j in 1:148
		Species[names_list[j]] = [Species[names_list[j]] X[:,j]]
	end
end

z_val_for_95 = 1.95996

Mean = Dict()
Std = Dict()
Lower = Dict()
Upper = Dict()
for key in keys(Species)
	data = Species[key]
	M = Float64[]
	S = Float64[]
	for j in 1:301
		tmp = data[j,:]
		m = mean(tmp)
		s = std(tmp)
		push!(M,m)
		push!(S,s)
	end
	Mean[key] = M
	Std[key] = S
	Lower[key] = max(0,M-z_val_for_95*S)
	Upper[key] = M+z_val_for_95*S
end

