Tsim = readdlm("Tsim_flux")
flux_array = readdlm("flux_array")
X = readdlm("Ensemble100/Best/X")

species_names = ["g6p";"f6p";"fdp";"dhap";"g3p";"13dpg";"3pg";"2pg";"oaa";"coa";"accoa";"6pgl";"6pgc";"ru5p";"xu5p";"r5p";"s7p";"e4p";"2ddg6p";"cit";"icit";"akg";"succoa";"q8";"fum";"q8h2";"mql8";"mqn8";"glx";"actp";"ppi";"etoh";"for";"h_e";"chor";"gar";"10fthf";"air";"thf";"hco3";"aicar";"imp";"arg";"h2s";"mlthf";"5mthf";"urea";"h2o2";"mglx";"prop";"indole";"cadav";"gaba";"glc";"pep";"pyr";"ac";"lac";"mal";"atp";"adp";"amp";"gtp";"gdp";"gmp";"utp";"udp";"ump";"ctp";"cdp";"cmp";"succ";"asp";"gly";"ile";"asn";"cys";"lys";"his";"ala";"phe";"pro";"ser";"thr";"trp";"tyr";"val";"met";"leu";"glu";"gln";"CAT";"o2";"co2";"pi";"nh4";"so4";"h";"h2o";"nad";"nadh";"nadp";"nadph"]

accum = [species_names vec(max(0,X[end,1:103]-X[1,1:103]))]
accum_gly = accum[[1:8;55:56;11],:]
accum_tca = accum[[11;20:23;72;25;59;9],:]
accum_pp = accum[[14:18],:]
accum_ed = accum[[12:13;19],:]
accum_nadh = accum[[101;103],:]

early = vec(flux_array[133,:])
mid = vec(flux_array[221,:])
late = vec(flux_array[228,:])

#glc_upt = flux_array[:,1]+flux_array[:,2]+flux_array[:,3]+flux_array[:,4]+flux_array[:,5]
#g6p_f6p = flux_array[:,6]
#g6p_6pgl = flux_array[:,27]

glc_upt = sum(early[1:5])
g6p_f6p = early[6]
g6p_6pgl = early[27]
_6pgl_6pgc = early[29]
_6pgc_ru5p = early[30]
_6pgc_2ddg6p = early[41]


1	 R_PTS: M_pep_c+M_glc_D_c = M_g6p_c+M_pyr_c
2	 R_glk_atp: M_atp_c+M_glc_D_c = M_adp_c+M_g6p_c+M_h_c
3	 R_glk_utp: M_utp_c+M_glc_D_c = M_udp_c+M_g6p_c+M_h_c
4	 R_glk_ctp: M_ctp_c+M_glc_D_c = M_cdp_c+M_g6p_c+M_h_c
5	 R_glk_gtp: M_gtp_c+M_glc_D_c = M_gdp_c+M_g6p_c+M_h_c
6	 R_pgi: M_g6p_c = M_f6p_c
7	 R_pgi_R: M_f6p_c = M_g6p_c
8	 R_pfk: M_atp_c+M_f6p_c = M_adp_c+M_fdp_c+M_h_c
9	 R_fdp: M_fdp_c+M_h2o_c = M_f6p_c+M_pi_c
10	 R_fbaA: M_fdp_c = M_dhap_c+M_g3p_c
11	 R_fbaA_R: M_dhap_c+M_g3p_c = M_fdp_c
12	 R_tpiA: M_dhap_c = M_g3p_c
13	 R_tpiA_R: M_g3p_c = M_dhap_c
14	 R_gapA: M_g3p_c+M_nad_c+M_pi_c = M_13dpg_c+M_h_c+M_nadh_c
15	 R_gapA_R: M_13dpg_c+M_h_c+M_nadh_c = M_g3p_c+M_nad_c+M_pi_c
16	 R_pgk: M_13dpg_c+M_adp_c = M_3pg_c+M_atp_c
17	 R_pgk_R: M_3pg_c+M_atp_c = M_13dpg_c+M_adp_c
18	 R_gpm: M_3pg_c = M_2pg_c
19	 R_gpm_R: M_2pg_c = M_3pg_c
20	 R_eno: M_2pg_c = M_h2o_c+M_pep_c
21	 R_eno_R: M_h2o_c+M_pep_c = M_2pg_c
22	 R_pyk: M_adp_c+M_h_c+M_pep_c = M_atp_c+M_pyr_c
23	 R_pck: M_atp_c+M_oaa_c = M_adp_c+M_co2_c+M_pep_c
24	 R_ppc: M_co2_c+M_h2o_c+M_pep_c = M_h_c+M_oaa_c+M_pi_c
25	 R_pdh: M_coa_c+M_nad_c+M_pyr_c = M_accoa_c+M_co2_c+M_nadh_c
26	 R_pps: M_atp_c+M_h2o_c+M_pyr_c = M_amp_c+2*M_h_c+M_pep_c+M_pi_c
27	 R_zwf: M_g6p_c+M_nadp_c = M_6pgl_c+M_h_c+M_nadph_c
28	 R_zwf_R: M_6pgl_c+M_h_c+M_nadph_c = M_g6p_c+M_nadp_c
29	 R_pgl: M_6pgl_c+M_h2o_c = M_6pgc_c+M_h_c
30	 R_gnd: M_6pgc_c+M_nadp_c = M_co2_c+M_nadph_c+M_ru5p_D_c
31	 R_rpe: M_ru5p_D_c = M_xu5p_D_c
32	 R_rpe_R: M_xu5p_D_c = M_ru5p_D_c
33	 R_rpi: M_r5p_c = M_ru5p_D_c
34	 R_rpi_R: M_ru5p_D_c = M_r5p_c
35	 R_talAB: M_g3p_c+M_s7p_c = M_e4p_c+M_f6p_c
36	 R_talAB_R: M_e4p_c+M_f6p_c = M_g3p_c+M_s7p_c
37	 R_tkt1: M_r5p_c+M_xu5p_D_c = M_g3p_c+M_s7p_c
38	 R_tkt1_R: M_g3p_c+M_s7p_c = M_r5p_c+M_xu5p_D_c
39	 R_tkt2: M_e4p_c+M_xu5p_D_c = M_f6p_c+M_g3p_c
40	 R_tkt2_R: M_f6p_c+M_g3p_c = M_e4p_c+M_xu5p_D_c
41	 R_edd: M_6pgc_c = M_2ddg6p_c+M_h2o_c
42	 R_eda: M_2ddg6p_c = M_g3p_c+M_pyr_c
43	 R_gltA: M_accoa_c+M_h2o_c+M_oaa_c = M_cit_c+M_coa_c+M_h_c
44	 R_acn: M_cit_c = M_icit_c
45	 R_acn_R: M_icit_c = M_cit_c
46	 R_icd: M_icit_c+M_nadp_c = M_akg_c+M_co2_c+M_nadph_c
47	 R_icd_R: M_akg_c+M_co2_c+M_nadph_c = M_icit_c+M_nadp_c
48	 R_sucAB: M_akg_c+M_coa_c+M_nad_c = M_co2_c+M_nadh_c+M_succoa_c
49	 R_sucCD: M_atp_c+M_coa_c+M_succ_c = M_adp_c+M_pi_c+M_succoa_c
50	 R_sucCD_R: M_adp_c+M_pi_c+M_succoa_c = M_atp_c+M_coa_c+M_succ_c
51	 R_sdh: M_q8_c+M_succ_c = M_fum_c+M_q8h2_c
52	 R_frd: M_fum_c+M_mql8_c = M_mqn8_c+M_succ_c
53	 R_fum: M_fum_c+M_h2o_c = M_mal_L_c
54	 R_fum_R: M_mal_L_c = M_fum_c+M_h2o_c
55	 R_mdh: M_mal_L_c+M_nad_c = M_oaa_c+M_h_c+M_nadh_c
56	 R_mdh_R: M_oaa_c+M_h_c+M_nadh_c = M_mal_L_c+M_nad_c
57	 R_aceA: M_icit_c = M_glx_c+M_succ_c
58	 R_aceB: M_accoa_c+M_glx_c+M_h2o_c = M_coa_c+M_h_c+M_mal_L_c
59	 R_maeA: M_mal_L_c+M_nad_c = M_co2_c+M_nadh_c+M_pyr_c
60	 R_maeB: M_mal_L_c+M_nadp_c = M_co2_c+M_nadph_c+M_pyr_c

