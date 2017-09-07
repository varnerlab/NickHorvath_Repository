function IndexGrouping()

species_indices = SpeciesIndices()

glycolysis_indices = sort([
species_indices["M_glc_D_c"]
species_indices["M_g6p_c"]
species_indices["M_f6p_c"]
species_indices["M_fdp_c"]
species_indices["M_dhap_c"]
species_indices["M_g3p_c"]
species_indices["M_13dpg_c"]
species_indices["M_3pg_c"]
species_indices["M_2pg_c"]
species_indices["M_pep_c"]
species_indices["M_pyr_c"]
species_indices["M_lac_D_c"]
])

PPP_and_ED_indices = sort([
species_indices["M_6pgc_c"]
species_indices["M_6pgl_c"]
species_indices["M_ru5p_D_c"]
species_indices["M_r5p_c"]
species_indices["M_xu5p_D_c"]
species_indices["M_s7p_c"]
species_indices["M_e4p_c"]
species_indices["M_2ddg6p_c"]
])

TCA_and_acetate_indices = sort([
species_indices["M_accoa_c"]
species_indices["M_actp_c"]
species_indices["M_ac_c"]
species_indices["M_cit_c"]
species_indices["M_icit_c"]
species_indices["M_akg_c"]
species_indices["M_succoa_c"]
species_indices["M_succ_c"]
species_indices["M_fum_c"]
species_indices["M_mal_L_c"]
species_indices["M_oaa_c"]
species_indices["M_glx_c"]
])

energy_species_indices = sort([
species_indices["M_atp_c"]
species_indices["M_adp_c"]
species_indices["M_amp_c"]
species_indices["M_gtp_c"]
species_indices["M_gdp_c"]
species_indices["M_gmp_c"]
species_indices["M_ctp_c"]
species_indices["M_cdp_c"]
species_indices["M_cmp_c"]
species_indices["M_utp_c"]
species_indices["M_udp_c"]
species_indices["M_ump_c"]
])

amino_acids_indices = sort([
species_indices["M_ala_L_c"]
species_indices["M_arg_L_c"]
species_indices["M_asn_L_c"]
species_indices["M_asp_L_c"]
species_indices["M_cys_L_c"]
species_indices["M_glu_L_c"]
species_indices["M_gly_L_c"]
species_indices["M_gln_L_c"]
species_indices["M_his_L_c"]
species_indices["M_ile_L_c"]
species_indices["M_leu_L_c"]
species_indices["M_lys_L_c"]
species_indices["M_met_L_c"]
species_indices["M_phe_L_c"]
species_indices["M_pro_L_c"]
species_indices["M_ser_L_c"]
species_indices["M_trp_L_c"]
species_indices["M_tyr_L_c"]
species_indices["M_val_L_c"]
species_indices["M_thr_L_c"]
])

charged_amino_acids_indices = sort([
species_indices["M_ala_L_c_tRNA"]
species_indices["M_arg_L_c_tRNA"]
species_indices["M_asn_L_c_tRNA"]
species_indices["M_asp_L_c_tRNA"]
species_indices["M_cys_L_c_tRNA"]
species_indices["M_glu_L_c_tRNA"]
species_indices["M_gly_L_c_tRNA"]
species_indices["M_gln_L_c_tRNA"]
species_indices["M_his_L_c_tRNA"]
species_indices["M_ile_L_c_tRNA"]
species_indices["M_leu_L_c_tRNA"]
species_indices["M_lys_L_c_tRNA"]
species_indices["M_met_L_c_tRNA"]
species_indices["M_phe_L_c_tRNA"]
species_indices["M_pro_L_c_tRNA"]
species_indices["M_ser_L_c_tRNA"]
species_indices["M_trp_L_c_tRNA"]
species_indices["M_tyr_L_c_tRNA"]
species_indices["M_val_L_c_tRNA"]
species_indices["M_thr_L_c_tRNA"]
])

TXTL_indices = sort([
species_indices["GENE_CAT"]
species_indices["PROTEIN_CAT"]
species_indices["RIBOSOME"]
species_indices["RNAP"]
species_indices["mRNA_CAT"]
species_indices["tRNA"]
])

return glycolysis_indices, PPP_and_ED_indices, TCA_and_acetate_indices, energy_species_indices, amino_acids_indices, charged_amino_acids_indices, TXTL_indices
end
