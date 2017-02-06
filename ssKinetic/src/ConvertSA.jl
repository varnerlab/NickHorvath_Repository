

sa_old = saturation_constant_array[1:163,1:103] # The rest is all zeros
sa = [sa_old[:,1:53] sa_old[:,92] zeros(163,27) sa_old[:,54:91] sa_old[:,93:103]] # [g6p:gaba CAT new_species glc:gln o2:nadph]
sa = [sa;zeros(25,130)] # 25 new reactions

sa[164,55] = 1.0;	#	 Name: transcriptional_initiation_CAT: GENE_CAT+RNAP = OPEN_GENE_CAT Species: GENE_CAT
sa[164,56] = 1.0;	#	 Name: transcriptional_initiation_CAT: GENE_CAT+RNAP = OPEN_GENE_CAT Species: RNAP
sa[165,57] = 1.0;	#	 Name: transcription_CAT: OPEN_GENE_CAT+151*M_gtp_c+144*M_ctp_c+189*M_utp_c+176*M_atp_c = mRNA_CAT+GENE_CAT+RNAP+1320*M_pi_c Species: OPEN_GENE_CAT
sa[165,91] = 1.0;	#	 Name: transcription_CAT: OPEN_GENE_CAT+151*M_gtp_c+144*M_ctp_c+189*M_utp_c+176*M_atp_c = mRNA_CAT+GENE_CAT+RNAP+1320*M_pi_c Species: M_gtp_c
sa[165,97] = 1.0;	#	 Name: transcription_CAT: OPEN_GENE_CAT+151*M_gtp_c+144*M_ctp_c+189*M_utp_c+176*M_atp_c = mRNA_CAT+GENE_CAT+RNAP+1320*M_pi_c Species: M_ctp_c
sa[165,94] = 1.0;	#	 Name: transcription_CAT: OPEN_GENE_CAT+151*M_gtp_c+144*M_ctp_c+189*M_utp_c+176*M_atp_c = mRNA_CAT+GENE_CAT+RNAP+1320*M_pi_c Species: M_utp_c
sa[165,88] = 1.0;	#	 Name: transcription_CAT: OPEN_GENE_CAT+151*M_gtp_c+144*M_ctp_c+189*M_utp_c+176*M_atp_c = mRNA_CAT+GENE_CAT+RNAP+1320*M_pi_c Species: M_atp_c
sa[166,58] = 1.0;	#	 Name: mRNA_degradation_CAT: mRNA_CAT = 151*M_gmp_c+144*M_cmp_c+189*M_ump_c+176*M_amp_c Species: mRNA_CAT
sa[167,58] = 1.0;	#	 Name: translation_initiation_CAT: mRNA_CAT+RIBOSOME = RIBOSOME_START_CAT Species: mRNA_CAT
sa[167,59] = 1.0;	#	 Name: translation_initiation_CAT: mRNA_CAT+RIBOSOME = RIBOSOME_START_CAT Species: RIBOSOME
sa[168,60] = 1.0;	#	 Name: translation_CAT: RIBOSOME_START_CAT+438*M_gtp_c+15.0*M_ala_L_c_tRNA+5.0*M_arg_L_c_tRNA+10.0*M_asn_L_c_tRNA+12.0*M_asp_L_c_tRNA+5.0*M_cys_L_c_tRNA+12.0*M_glu_L_c_tRNA+13.0*M_gln_L_c_tRNA+10.0*M_gly_L_c_tRNA+12.0*M_his_L_c_tRNA+9.0*M_ile_L_c_tRNA+13.0*M_leu_L_c_tRNA+12.0*M_lys_L_c_tRNA+9.0*M_met_L_c_tRNA+20.0*M_phe_L_c_tRNA+7.0*M_pro_L_c_tRNA+10.0*M_ser_L_c_tRNA+13.0*M_thr_L_c_tRNA+5.0*M_trp_L_c_tRNA+11.0*M_tyr_L_c_tRNA+16.0*M_val_L_c_tRNA = RIBOSOME+mRNA_CAT+PROTEIN_CAT+438*M_gdp_c+438*M_pi_c+219*tRNA Species: RIBOSOME_START_CAT
sa[168,91] = 1.0;	#	 Name: translation_CAT: RIBOSOME_START_CAT+438*M_gtp_c+15.0*M_ala_L_c_tRNA+5.0*M_arg_L_c_tRNA+10.0*M_asn_L_c_tRNA+12.0*M_asp_L_c_tRNA+5.0*M_cys_L_c_tRNA+12.0*M_glu_L_c_tRNA+13.0*M_gln_L_c_tRNA+10.0*M_gly_L_c_tRNA+12.0*M_his_L_c_tRNA+9.0*M_ile_L_c_tRNA+13.0*M_leu_L_c_tRNA+12.0*M_lys_L_c_tRNA+9.0*M_met_L_c_tRNA+20.0*M_phe_L_c_tRNA+7.0*M_pro_L_c_tRNA+10.0*M_ser_L_c_tRNA+13.0*M_thr_L_c_tRNA+5.0*M_trp_L_c_tRNA+11.0*M_tyr_L_c_tRNA+16.0*M_val_L_c_tRNA = RIBOSOME+mRNA_CAT+PROTEIN_CAT+438*M_gdp_c+438*M_pi_c+219*tRNA Species: M_gtp_c
sa[168,61] = 1.0;	#	 Name: translation_CAT: RIBOSOME_START_CAT+438*M_gtp_c+15.0*M_ala_L_c_tRNA+5.0*M_arg_L_c_tRNA+10.0*M_asn_L_c_tRNA+12.0*M_asp_L_c_tRNA+5.0*M_cys_L_c_tRNA+12.0*M_glu_L_c_tRNA+13.0*M_gln_L_c_tRNA+10.0*M_gly_L_c_tRNA+12.0*M_his_L_c_tRNA+9.0*M_ile_L_c_tRNA+13.0*M_leu_L_c_tRNA+12.0*M_lys_L_c_tRNA+9.0*M_met_L_c_tRNA+20.0*M_phe_L_c_tRNA+7.0*M_pro_L_c_tRNA+10.0*M_ser_L_c_tRNA+13.0*M_thr_L_c_tRNA+5.0*M_trp_L_c_tRNA+11.0*M_tyr_L_c_tRNA+16.0*M_val_L_c_tRNA = RIBOSOME+mRNA_CAT+PROTEIN_CAT+438*M_gdp_c+438*M_pi_c+219*tRNA Species: M_ala_L_c_tRNA
sa[168,62] = 1.0;	#	 Name: translation_CAT: RIBOSOME_START_CAT+438*M_gtp_c+15.0*M_ala_L_c_tRNA+5.0*M_arg_L_c_tRNA+10.0*M_asn_L_c_tRNA+12.0*M_asp_L_c_tRNA+5.0*M_cys_L_c_tRNA+12.0*M_glu_L_c_tRNA+13.0*M_gln_L_c_tRNA+10.0*M_gly_L_c_tRNA+12.0*M_his_L_c_tRNA+9.0*M_ile_L_c_tRNA+13.0*M_leu_L_c_tRNA+12.0*M_lys_L_c_tRNA+9.0*M_met_L_c_tRNA+20.0*M_phe_L_c_tRNA+7.0*M_pro_L_c_tRNA+10.0*M_ser_L_c_tRNA+13.0*M_thr_L_c_tRNA+5.0*M_trp_L_c_tRNA+11.0*M_tyr_L_c_tRNA+16.0*M_val_L_c_tRNA = RIBOSOME+mRNA_CAT+PROTEIN_CAT+438*M_gdp_c+438*M_pi_c+219*tRNA Species: M_arg_L_c_tRNA
sa[168,63] = 1.0;	#	 Name: translation_CAT: RIBOSOME_START_CAT+438*M_gtp_c+15.0*M_ala_L_c_tRNA+5.0*M_arg_L_c_tRNA+10.0*M_asn_L_c_tRNA+12.0*M_asp_L_c_tRNA+5.0*M_cys_L_c_tRNA+12.0*M_glu_L_c_tRNA+13.0*M_gln_L_c_tRNA+10.0*M_gly_L_c_tRNA+12.0*M_his_L_c_tRNA+9.0*M_ile_L_c_tRNA+13.0*M_leu_L_c_tRNA+12.0*M_lys_L_c_tRNA+9.0*M_met_L_c_tRNA+20.0*M_phe_L_c_tRNA+7.0*M_pro_L_c_tRNA+10.0*M_ser_L_c_tRNA+13.0*M_thr_L_c_tRNA+5.0*M_trp_L_c_tRNA+11.0*M_tyr_L_c_tRNA+16.0*M_val_L_c_tRNA = RIBOSOME+mRNA_CAT+PROTEIN_CAT+438*M_gdp_c+438*M_pi_c+219*tRNA Species: M_asn_L_c_tRNA
sa[168,64] = 1.0;	#	 Name: translation_CAT: RIBOSOME_START_CAT+438*M_gtp_c+15.0*M_ala_L_c_tRNA+5.0*M_arg_L_c_tRNA+10.0*M_asn_L_c_tRNA+12.0*M_asp_L_c_tRNA+5.0*M_cys_L_c_tRNA+12.0*M_glu_L_c_tRNA+13.0*M_gln_L_c_tRNA+10.0*M_gly_L_c_tRNA+12.0*M_his_L_c_tRNA+9.0*M_ile_L_c_tRNA+13.0*M_leu_L_c_tRNA+12.0*M_lys_L_c_tRNA+9.0*M_met_L_c_tRNA+20.0*M_phe_L_c_tRNA+7.0*M_pro_L_c_tRNA+10.0*M_ser_L_c_tRNA+13.0*M_thr_L_c_tRNA+5.0*M_trp_L_c_tRNA+11.0*M_tyr_L_c_tRNA+16.0*M_val_L_c_tRNA = RIBOSOME+mRNA_CAT+PROTEIN_CAT+438*M_gdp_c+438*M_pi_c+219*tRNA Species: M_asp_L_c_tRNA
sa[168,65] = 1.0;	#	 Name: translation_CAT: RIBOSOME_START_CAT+438*M_gtp_c+15.0*M_ala_L_c_tRNA+5.0*M_arg_L_c_tRNA+10.0*M_asn_L_c_tRNA+12.0*M_asp_L_c_tRNA+5.0*M_cys_L_c_tRNA+12.0*M_glu_L_c_tRNA+13.0*M_gln_L_c_tRNA+10.0*M_gly_L_c_tRNA+12.0*M_his_L_c_tRNA+9.0*M_ile_L_c_tRNA+13.0*M_leu_L_c_tRNA+12.0*M_lys_L_c_tRNA+9.0*M_met_L_c_tRNA+20.0*M_phe_L_c_tRNA+7.0*M_pro_L_c_tRNA+10.0*M_ser_L_c_tRNA+13.0*M_thr_L_c_tRNA+5.0*M_trp_L_c_tRNA+11.0*M_tyr_L_c_tRNA+16.0*M_val_L_c_tRNA = RIBOSOME+mRNA_CAT+PROTEIN_CAT+438*M_gdp_c+438*M_pi_c+219*tRNA Species: M_cys_L_c_tRNA
sa[168,66] = 1.0;	#	 Name: translation_CAT: RIBOSOME_START_CAT+438*M_gtp_c+15.0*M_ala_L_c_tRNA+5.0*M_arg_L_c_tRNA+10.0*M_asn_L_c_tRNA+12.0*M_asp_L_c_tRNA+5.0*M_cys_L_c_tRNA+12.0*M_glu_L_c_tRNA+13.0*M_gln_L_c_tRNA+10.0*M_gly_L_c_tRNA+12.0*M_his_L_c_tRNA+9.0*M_ile_L_c_tRNA+13.0*M_leu_L_c_tRNA+12.0*M_lys_L_c_tRNA+9.0*M_met_L_c_tRNA+20.0*M_phe_L_c_tRNA+7.0*M_pro_L_c_tRNA+10.0*M_ser_L_c_tRNA+13.0*M_thr_L_c_tRNA+5.0*M_trp_L_c_tRNA+11.0*M_tyr_L_c_tRNA+16.0*M_val_L_c_tRNA = RIBOSOME+mRNA_CAT+PROTEIN_CAT+438*M_gdp_c+438*M_pi_c+219*tRNA Species: M_glu_L_c_tRNA
sa[168,67] = 1.0;	#	 Name: translation_CAT: RIBOSOME_START_CAT+438*M_gtp_c+15.0*M_ala_L_c_tRNA+5.0*M_arg_L_c_tRNA+10.0*M_asn_L_c_tRNA+12.0*M_asp_L_c_tRNA+5.0*M_cys_L_c_tRNA+12.0*M_glu_L_c_tRNA+13.0*M_gln_L_c_tRNA+10.0*M_gly_L_c_tRNA+12.0*M_his_L_c_tRNA+9.0*M_ile_L_c_tRNA+13.0*M_leu_L_c_tRNA+12.0*M_lys_L_c_tRNA+9.0*M_met_L_c_tRNA+20.0*M_phe_L_c_tRNA+7.0*M_pro_L_c_tRNA+10.0*M_ser_L_c_tRNA+13.0*M_thr_L_c_tRNA+5.0*M_trp_L_c_tRNA+11.0*M_tyr_L_c_tRNA+16.0*M_val_L_c_tRNA = RIBOSOME+mRNA_CAT+PROTEIN_CAT+438*M_gdp_c+438*M_pi_c+219*tRNA Species: M_gln_L_c_tRNA
sa[168,68] = 1.0;	#	 Name: translation_CAT: RIBOSOME_START_CAT+438*M_gtp_c+15.0*M_ala_L_c_tRNA+5.0*M_arg_L_c_tRNA+10.0*M_asn_L_c_tRNA+12.0*M_asp_L_c_tRNA+5.0*M_cys_L_c_tRNA+12.0*M_glu_L_c_tRNA+13.0*M_gln_L_c_tRNA+10.0*M_gly_L_c_tRNA+12.0*M_his_L_c_tRNA+9.0*M_ile_L_c_tRNA+13.0*M_leu_L_c_tRNA+12.0*M_lys_L_c_tRNA+9.0*M_met_L_c_tRNA+20.0*M_phe_L_c_tRNA+7.0*M_pro_L_c_tRNA+10.0*M_ser_L_c_tRNA+13.0*M_thr_L_c_tRNA+5.0*M_trp_L_c_tRNA+11.0*M_tyr_L_c_tRNA+16.0*M_val_L_c_tRNA = RIBOSOME+mRNA_CAT+PROTEIN_CAT+438*M_gdp_c+438*M_pi_c+219*tRNA Species: M_gly_L_c_tRNA
sa[168,69] = 1.0;	#	 Name: translation_CAT: RIBOSOME_START_CAT+438*M_gtp_c+15.0*M_ala_L_c_tRNA+5.0*M_arg_L_c_tRNA+10.0*M_asn_L_c_tRNA+12.0*M_asp_L_c_tRNA+5.0*M_cys_L_c_tRNA+12.0*M_glu_L_c_tRNA+13.0*M_gln_L_c_tRNA+10.0*M_gly_L_c_tRNA+12.0*M_his_L_c_tRNA+9.0*M_ile_L_c_tRNA+13.0*M_leu_L_c_tRNA+12.0*M_lys_L_c_tRNA+9.0*M_met_L_c_tRNA+20.0*M_phe_L_c_tRNA+7.0*M_pro_L_c_tRNA+10.0*M_ser_L_c_tRNA+13.0*M_thr_L_c_tRNA+5.0*M_trp_L_c_tRNA+11.0*M_tyr_L_c_tRNA+16.0*M_val_L_c_tRNA = RIBOSOME+mRNA_CAT+PROTEIN_CAT+438*M_gdp_c+438*M_pi_c+219*tRNA Species: M_his_L_c_tRNA
sa[168,70] = 1.0;	#	 Name: translation_CAT: RIBOSOME_START_CAT+438*M_gtp_c+15.0*M_ala_L_c_tRNA+5.0*M_arg_L_c_tRNA+10.0*M_asn_L_c_tRNA+12.0*M_asp_L_c_tRNA+5.0*M_cys_L_c_tRNA+12.0*M_glu_L_c_tRNA+13.0*M_gln_L_c_tRNA+10.0*M_gly_L_c_tRNA+12.0*M_his_L_c_tRNA+9.0*M_ile_L_c_tRNA+13.0*M_leu_L_c_tRNA+12.0*M_lys_L_c_tRNA+9.0*M_met_L_c_tRNA+20.0*M_phe_L_c_tRNA+7.0*M_pro_L_c_tRNA+10.0*M_ser_L_c_tRNA+13.0*M_thr_L_c_tRNA+5.0*M_trp_L_c_tRNA+11.0*M_tyr_L_c_tRNA+16.0*M_val_L_c_tRNA = RIBOSOME+mRNA_CAT+PROTEIN_CAT+438*M_gdp_c+438*M_pi_c+219*tRNA Species: M_ile_L_c_tRNA
sa[168,71] = 1.0;	#	 Name: translation_CAT: RIBOSOME_START_CAT+438*M_gtp_c+15.0*M_ala_L_c_tRNA+5.0*M_arg_L_c_tRNA+10.0*M_asn_L_c_tRNA+12.0*M_asp_L_c_tRNA+5.0*M_cys_L_c_tRNA+12.0*M_glu_L_c_tRNA+13.0*M_gln_L_c_tRNA+10.0*M_gly_L_c_tRNA+12.0*M_his_L_c_tRNA+9.0*M_ile_L_c_tRNA+13.0*M_leu_L_c_tRNA+12.0*M_lys_L_c_tRNA+9.0*M_met_L_c_tRNA+20.0*M_phe_L_c_tRNA+7.0*M_pro_L_c_tRNA+10.0*M_ser_L_c_tRNA+13.0*M_thr_L_c_tRNA+5.0*M_trp_L_c_tRNA+11.0*M_tyr_L_c_tRNA+16.0*M_val_L_c_tRNA = RIBOSOME+mRNA_CAT+PROTEIN_CAT+438*M_gdp_c+438*M_pi_c+219*tRNA Species: M_leu_L_c_tRNA
sa[168,72] = 1.0;	#	 Name: translation_CAT: RIBOSOME_START_CAT+438*M_gtp_c+15.0*M_ala_L_c_tRNA+5.0*M_arg_L_c_tRNA+10.0*M_asn_L_c_tRNA+12.0*M_asp_L_c_tRNA+5.0*M_cys_L_c_tRNA+12.0*M_glu_L_c_tRNA+13.0*M_gln_L_c_tRNA+10.0*M_gly_L_c_tRNA+12.0*M_his_L_c_tRNA+9.0*M_ile_L_c_tRNA+13.0*M_leu_L_c_tRNA+12.0*M_lys_L_c_tRNA+9.0*M_met_L_c_tRNA+20.0*M_phe_L_c_tRNA+7.0*M_pro_L_c_tRNA+10.0*M_ser_L_c_tRNA+13.0*M_thr_L_c_tRNA+5.0*M_trp_L_c_tRNA+11.0*M_tyr_L_c_tRNA+16.0*M_val_L_c_tRNA = RIBOSOME+mRNA_CAT+PROTEIN_CAT+438*M_gdp_c+438*M_pi_c+219*tRNA Species: M_lys_L_c_tRNA
sa[168,73] = 1.0;	#	 Name: translation_CAT: RIBOSOME_START_CAT+438*M_gtp_c+15.0*M_ala_L_c_tRNA+5.0*M_arg_L_c_tRNA+10.0*M_asn_L_c_tRNA+12.0*M_asp_L_c_tRNA+5.0*M_cys_L_c_tRNA+12.0*M_glu_L_c_tRNA+13.0*M_gln_L_c_tRNA+10.0*M_gly_L_c_tRNA+12.0*M_his_L_c_tRNA+9.0*M_ile_L_c_tRNA+13.0*M_leu_L_c_tRNA+12.0*M_lys_L_c_tRNA+9.0*M_met_L_c_tRNA+20.0*M_phe_L_c_tRNA+7.0*M_pro_L_c_tRNA+10.0*M_ser_L_c_tRNA+13.0*M_thr_L_c_tRNA+5.0*M_trp_L_c_tRNA+11.0*M_tyr_L_c_tRNA+16.0*M_val_L_c_tRNA = RIBOSOME+mRNA_CAT+PROTEIN_CAT+438*M_gdp_c+438*M_pi_c+219*tRNA Species: M_met_L_c_tRNA
sa[168,74] = 1.0;	#	 Name: translation_CAT: RIBOSOME_START_CAT+438*M_gtp_c+15.0*M_ala_L_c_tRNA+5.0*M_arg_L_c_tRNA+10.0*M_asn_L_c_tRNA+12.0*M_asp_L_c_tRNA+5.0*M_cys_L_c_tRNA+12.0*M_glu_L_c_tRNA+13.0*M_gln_L_c_tRNA+10.0*M_gly_L_c_tRNA+12.0*M_his_L_c_tRNA+9.0*M_ile_L_c_tRNA+13.0*M_leu_L_c_tRNA+12.0*M_lys_L_c_tRNA+9.0*M_met_L_c_tRNA+20.0*M_phe_L_c_tRNA+7.0*M_pro_L_c_tRNA+10.0*M_ser_L_c_tRNA+13.0*M_thr_L_c_tRNA+5.0*M_trp_L_c_tRNA+11.0*M_tyr_L_c_tRNA+16.0*M_val_L_c_tRNA = RIBOSOME+mRNA_CAT+PROTEIN_CAT+438*M_gdp_c+438*M_pi_c+219*tRNA Species: M_phe_L_c_tRNA
sa[168,75] = 1.0;	#	 Name: translation_CAT: RIBOSOME_START_CAT+438*M_gtp_c+15.0*M_ala_L_c_tRNA+5.0*M_arg_L_c_tRNA+10.0*M_asn_L_c_tRNA+12.0*M_asp_L_c_tRNA+5.0*M_cys_L_c_tRNA+12.0*M_glu_L_c_tRNA+13.0*M_gln_L_c_tRNA+10.0*M_gly_L_c_tRNA+12.0*M_his_L_c_tRNA+9.0*M_ile_L_c_tRNA+13.0*M_leu_L_c_tRNA+12.0*M_lys_L_c_tRNA+9.0*M_met_L_c_tRNA+20.0*M_phe_L_c_tRNA+7.0*M_pro_L_c_tRNA+10.0*M_ser_L_c_tRNA+13.0*M_thr_L_c_tRNA+5.0*M_trp_L_c_tRNA+11.0*M_tyr_L_c_tRNA+16.0*M_val_L_c_tRNA = RIBOSOME+mRNA_CAT+PROTEIN_CAT+438*M_gdp_c+438*M_pi_c+219*tRNA Species: M_pro_L_c_tRNA
sa[168,76] = 1.0;	#	 Name: translation_CAT: RIBOSOME_START_CAT+438*M_gtp_c+15.0*M_ala_L_c_tRNA+5.0*M_arg_L_c_tRNA+10.0*M_asn_L_c_tRNA+12.0*M_asp_L_c_tRNA+5.0*M_cys_L_c_tRNA+12.0*M_glu_L_c_tRNA+13.0*M_gln_L_c_tRNA+10.0*M_gly_L_c_tRNA+12.0*M_his_L_c_tRNA+9.0*M_ile_L_c_tRNA+13.0*M_leu_L_c_tRNA+12.0*M_lys_L_c_tRNA+9.0*M_met_L_c_tRNA+20.0*M_phe_L_c_tRNA+7.0*M_pro_L_c_tRNA+10.0*M_ser_L_c_tRNA+13.0*M_thr_L_c_tRNA+5.0*M_trp_L_c_tRNA+11.0*M_tyr_L_c_tRNA+16.0*M_val_L_c_tRNA = RIBOSOME+mRNA_CAT+PROTEIN_CAT+438*M_gdp_c+438*M_pi_c+219*tRNA Species: M_ser_L_c_tRNA
sa[168,77] = 1.0;	#	 Name: translation_CAT: RIBOSOME_START_CAT+438*M_gtp_c+15.0*M_ala_L_c_tRNA+5.0*M_arg_L_c_tRNA+10.0*M_asn_L_c_tRNA+12.0*M_asp_L_c_tRNA+5.0*M_cys_L_c_tRNA+12.0*M_glu_L_c_tRNA+13.0*M_gln_L_c_tRNA+10.0*M_gly_L_c_tRNA+12.0*M_his_L_c_tRNA+9.0*M_ile_L_c_tRNA+13.0*M_leu_L_c_tRNA+12.0*M_lys_L_c_tRNA+9.0*M_met_L_c_tRNA+20.0*M_phe_L_c_tRNA+7.0*M_pro_L_c_tRNA+10.0*M_ser_L_c_tRNA+13.0*M_thr_L_c_tRNA+5.0*M_trp_L_c_tRNA+11.0*M_tyr_L_c_tRNA+16.0*M_val_L_c_tRNA = RIBOSOME+mRNA_CAT+PROTEIN_CAT+438*M_gdp_c+438*M_pi_c+219*tRNA Species: M_thr_L_c_tRNA
sa[168,78] = 1.0;	#	 Name: translation_CAT: RIBOSOME_START_CAT+438*M_gtp_c+15.0*M_ala_L_c_tRNA+5.0*M_arg_L_c_tRNA+10.0*M_asn_L_c_tRNA+12.0*M_asp_L_c_tRNA+5.0*M_cys_L_c_tRNA+12.0*M_glu_L_c_tRNA+13.0*M_gln_L_c_tRNA+10.0*M_gly_L_c_tRNA+12.0*M_his_L_c_tRNA+9.0*M_ile_L_c_tRNA+13.0*M_leu_L_c_tRNA+12.0*M_lys_L_c_tRNA+9.0*M_met_L_c_tRNA+20.0*M_phe_L_c_tRNA+7.0*M_pro_L_c_tRNA+10.0*M_ser_L_c_tRNA+13.0*M_thr_L_c_tRNA+5.0*M_trp_L_c_tRNA+11.0*M_tyr_L_c_tRNA+16.0*M_val_L_c_tRNA = RIBOSOME+mRNA_CAT+PROTEIN_CAT+438*M_gdp_c+438*M_pi_c+219*tRNA Species: M_trp_L_c_tRNA
sa[168,79] = 1.0;	#	 Name: translation_CAT: RIBOSOME_START_CAT+438*M_gtp_c+15.0*M_ala_L_c_tRNA+5.0*M_arg_L_c_tRNA+10.0*M_asn_L_c_tRNA+12.0*M_asp_L_c_tRNA+5.0*M_cys_L_c_tRNA+12.0*M_glu_L_c_tRNA+13.0*M_gln_L_c_tRNA+10.0*M_gly_L_c_tRNA+12.0*M_his_L_c_tRNA+9.0*M_ile_L_c_tRNA+13.0*M_leu_L_c_tRNA+12.0*M_lys_L_c_tRNA+9.0*M_met_L_c_tRNA+20.0*M_phe_L_c_tRNA+7.0*M_pro_L_c_tRNA+10.0*M_ser_L_c_tRNA+13.0*M_thr_L_c_tRNA+5.0*M_trp_L_c_tRNA+11.0*M_tyr_L_c_tRNA+16.0*M_val_L_c_tRNA = RIBOSOME+mRNA_CAT+PROTEIN_CAT+438*M_gdp_c+438*M_pi_c+219*tRNA Species: M_tyr_L_c_tRNA
sa[168,80] = 1.0;	#	 Name: translation_CAT: RIBOSOME_START_CAT+438*M_gtp_c+15.0*M_ala_L_c_tRNA+5.0*M_arg_L_c_tRNA+10.0*M_asn_L_c_tRNA+12.0*M_asp_L_c_tRNA+5.0*M_cys_L_c_tRNA+12.0*M_glu_L_c_tRNA+13.0*M_gln_L_c_tRNA+10.0*M_gly_L_c_tRNA+12.0*M_his_L_c_tRNA+9.0*M_ile_L_c_tRNA+13.0*M_leu_L_c_tRNA+12.0*M_lys_L_c_tRNA+9.0*M_met_L_c_tRNA+20.0*M_phe_L_c_tRNA+7.0*M_pro_L_c_tRNA+10.0*M_ser_L_c_tRNA+13.0*M_thr_L_c_tRNA+5.0*M_trp_L_c_tRNA+11.0*M_tyr_L_c_tRNA+16.0*M_val_L_c_tRNA = RIBOSOME+mRNA_CAT+PROTEIN_CAT+438*M_gdp_c+438*M_pi_c+219*tRNA Species: M_val_L_c_tRNA
sa[169,108] = 1.0;	#	 Name: tRNA_charging_M_ala_L_c_CAT: 15.0*M_ala_L_c+15.0*M_atp_c+15.0*tRNA = 15.0*M_ala_L_c_tRNA+15.0*M_amp_c+30.0*M_pi_c Species: M_ala_L_c
sa[169,88] = 1.0;	#	 Name: tRNA_charging_M_ala_L_c_CAT: 15.0*M_ala_L_c+15.0*M_atp_c+15.0*tRNA = 15.0*M_ala_L_c_tRNA+15.0*M_amp_c+30.0*M_pi_c Species: M_atp_c
sa[169,81] = 1.0;	#	 Name: tRNA_charging_M_ala_L_c_CAT: 15.0*M_ala_L_c+15.0*M_atp_c+15.0*tRNA = 15.0*M_ala_L_c_tRNA+15.0*M_amp_c+30.0*M_pi_c Species: tRNA
sa[170,43] = 1.0;	#	 Name: tRNA_charging_M_arg_L_c_CAT: 5.0*M_arg_L_c+5.0*M_atp_c+5.0*tRNA = 5.0*M_arg_L_c_tRNA+5.0*M_amp_c+10.0*M_pi_c Species: M_arg_L_c
sa[170,88] = 1.0;	#	 Name: tRNA_charging_M_arg_L_c_CAT: 5.0*M_arg_L_c+5.0*M_atp_c+5.0*tRNA = 5.0*M_arg_L_c_tRNA+5.0*M_amp_c+10.0*M_pi_c Species: M_atp_c
sa[170,81] = 1.0;	#	 Name: tRNA_charging_M_arg_L_c_CAT: 5.0*M_arg_L_c+5.0*M_atp_c+5.0*tRNA = 5.0*M_arg_L_c_tRNA+5.0*M_amp_c+10.0*M_pi_c Species: tRNA
sa[171,104] = 1.0;	#	 Name: tRNA_charging_M_asn_L_c_CAT: 10.0*M_asn_L_c+10.0*M_atp_c+10.0*tRNA = 10.0*M_asn_L_c_tRNA+10.0*M_amp_c+20.0*M_pi_c Species: M_asn_L_c
sa[171,88] = 1.0;	#	 Name: tRNA_charging_M_asn_L_c_CAT: 10.0*M_asn_L_c+10.0*M_atp_c+10.0*tRNA = 10.0*M_asn_L_c_tRNA+10.0*M_amp_c+20.0*M_pi_c Species: M_atp_c
sa[171,81] = 1.0;	#	 Name: tRNA_charging_M_asn_L_c_CAT: 10.0*M_asn_L_c+10.0*M_atp_c+10.0*tRNA = 10.0*M_asn_L_c_tRNA+10.0*M_amp_c+20.0*M_pi_c Species: tRNA
sa[172,101] = 1.0;	#	 Name: tRNA_charging_M_asp_L_c_CAT: 12.0*M_asp_L_c+12.0*M_atp_c+12.0*tRNA = 12.0*M_asp_L_c_tRNA+12.0*M_amp_c+24.0*M_pi_c Species: M_asp_L_c
sa[172,88] = 1.0;	#	 Name: tRNA_charging_M_asp_L_c_CAT: 12.0*M_asp_L_c+12.0*M_atp_c+12.0*tRNA = 12.0*M_asp_L_c_tRNA+12.0*M_amp_c+24.0*M_pi_c Species: M_atp_c
sa[172,81] = 1.0;	#	 Name: tRNA_charging_M_asp_L_c_CAT: 12.0*M_asp_L_c+12.0*M_atp_c+12.0*tRNA = 12.0*M_asp_L_c_tRNA+12.0*M_amp_c+24.0*M_pi_c Species: tRNA
sa[173,105] = 1.0;	#	 Name: tRNA_charging_M_cys_L_c_CAT: 5.0*M_cys_L_c+5.0*M_atp_c+5.0*tRNA = 5.0*M_cys_L_c_tRNA+5.0*M_amp_c+10.0*M_pi_c Species: M_cys_L_c
sa[173,88] = 1.0;	#	 Name: tRNA_charging_M_cys_L_c_CAT: 5.0*M_cys_L_c+5.0*M_atp_c+5.0*tRNA = 5.0*M_cys_L_c_tRNA+5.0*M_amp_c+10.0*M_pi_c Species: M_atp_c
sa[173,81] = 1.0;	#	 Name: tRNA_charging_M_cys_L_c_CAT: 5.0*M_cys_L_c+5.0*M_atp_c+5.0*tRNA = 5.0*M_cys_L_c_tRNA+5.0*M_amp_c+10.0*M_pi_c Species: tRNA
sa[174,118] = 1.0;	#	 Name: tRNA_charging_M_glu_L_c_CAT: 12.0*M_glu_L_c+12.0*M_atp_c+12.0*tRNA = 12.0*M_glu_L_c_tRNA+12.0*M_amp_c+24.0*M_pi_c Species: M_glu_L_c
sa[174,88] = 1.0;	#	 Name: tRNA_charging_M_glu_L_c_CAT: 12.0*M_glu_L_c+12.0*M_atp_c+12.0*tRNA = 12.0*M_glu_L_c_tRNA+12.0*M_amp_c+24.0*M_pi_c Species: M_atp_c
sa[174,81] = 1.0;	#	 Name: tRNA_charging_M_glu_L_c_CAT: 12.0*M_glu_L_c+12.0*M_atp_c+12.0*tRNA = 12.0*M_glu_L_c_tRNA+12.0*M_amp_c+24.0*M_pi_c Species: tRNA
sa[175,119] = 1.0;	#	 Name: tRNA_charging_M_gln_L_c_CAT: 13.0*M_gln_L_c+13.0*M_atp_c+13.0*tRNA = 13.0*M_gln_L_c_tRNA+13.0*M_amp_c+26.0*M_pi_c Species: M_gln_L_c
sa[175,88] = 1.0;	#	 Name: tRNA_charging_M_gln_L_c_CAT: 13.0*M_gln_L_c+13.0*M_atp_c+13.0*tRNA = 13.0*M_gln_L_c_tRNA+13.0*M_amp_c+26.0*M_pi_c Species: M_atp_c
sa[175,81] = 1.0;	#	 Name: tRNA_charging_M_gln_L_c_CAT: 13.0*M_gln_L_c+13.0*M_atp_c+13.0*tRNA = 13.0*M_gln_L_c_tRNA+13.0*M_amp_c+26.0*M_pi_c Species: tRNA
sa[176,102] = 1.0;	#	 Name: tRNA_charging_M_gly_L_c_CAT: 10.0*M_gly_L_c+10.0*M_atp_c+10.0*tRNA = 10.0*M_gly_L_c_tRNA+10.0*M_amp_c+20.0*M_pi_c Species: M_gly_L_c
sa[176,88] = 1.0;	#	 Name: tRNA_charging_M_gly_L_c_CAT: 10.0*M_gly_L_c+10.0*M_atp_c+10.0*tRNA = 10.0*M_gly_L_c_tRNA+10.0*M_amp_c+20.0*M_pi_c Species: M_atp_c
sa[176,81] = 1.0;	#	 Name: tRNA_charging_M_gly_L_c_CAT: 10.0*M_gly_L_c+10.0*M_atp_c+10.0*tRNA = 10.0*M_gly_L_c_tRNA+10.0*M_amp_c+20.0*M_pi_c Species: tRNA
sa[177,107] = 1.0;	#	 Name: tRNA_charging_M_his_L_c_CAT: 12.0*M_his_L_c+12.0*M_atp_c+12.0*tRNA = 12.0*M_his_L_c_tRNA+12.0*M_amp_c+24.0*M_pi_c Species: M_his_L_c
sa[177,88] = 1.0;	#	 Name: tRNA_charging_M_his_L_c_CAT: 12.0*M_his_L_c+12.0*M_atp_c+12.0*tRNA = 12.0*M_his_L_c_tRNA+12.0*M_amp_c+24.0*M_pi_c Species: M_atp_c
sa[177,81] = 1.0;	#	 Name: tRNA_charging_M_his_L_c_CAT: 12.0*M_his_L_c+12.0*M_atp_c+12.0*tRNA = 12.0*M_his_L_c_tRNA+12.0*M_amp_c+24.0*M_pi_c Species: tRNA
sa[178,103] = 1.0;	#	 Name: tRNA_charging_M_ile_L_c_CAT: 9.0*M_ile_L_c+9.0*M_atp_c+9.0*tRNA = 9.0*M_ile_L_c_tRNA+9.0*M_amp_c+18.0*M_pi_c Species: M_ile_L_c
sa[178,88] = 1.0;	#	 Name: tRNA_charging_M_ile_L_c_CAT: 9.0*M_ile_L_c+9.0*M_atp_c+9.0*tRNA = 9.0*M_ile_L_c_tRNA+9.0*M_amp_c+18.0*M_pi_c Species: M_atp_c
sa[178,81] = 1.0;	#	 Name: tRNA_charging_M_ile_L_c_CAT: 9.0*M_ile_L_c+9.0*M_atp_c+9.0*tRNA = 9.0*M_ile_L_c_tRNA+9.0*M_amp_c+18.0*M_pi_c Species: tRNA
sa[179,117] = 1.0;	#	 Name: tRNA_charging_M_leu_L_c_CAT: 13.0*M_leu_L_c+13.0*M_atp_c+13.0*tRNA = 13.0*M_leu_L_c_tRNA+13.0*M_amp_c+26.0*M_pi_c Species: M_leu_L_c
sa[179,88] = 1.0;	#	 Name: tRNA_charging_M_leu_L_c_CAT: 13.0*M_leu_L_c+13.0*M_atp_c+13.0*tRNA = 13.0*M_leu_L_c_tRNA+13.0*M_amp_c+26.0*M_pi_c Species: M_atp_c
sa[179,81] = 1.0;	#	 Name: tRNA_charging_M_leu_L_c_CAT: 13.0*M_leu_L_c+13.0*M_atp_c+13.0*tRNA = 13.0*M_leu_L_c_tRNA+13.0*M_amp_c+26.0*M_pi_c Species: tRNA
sa[180,106] = 1.0;	#	 Name: tRNA_charging_M_lys_L_c_CAT: 12.0*M_lys_L_c+12.0*M_atp_c+12.0*tRNA = 12.0*M_lys_L_c_tRNA+12.0*M_amp_c+24.0*M_pi_c Species: M_lys_L_c
sa[180,88] = 1.0;	#	 Name: tRNA_charging_M_lys_L_c_CAT: 12.0*M_lys_L_c+12.0*M_atp_c+12.0*tRNA = 12.0*M_lys_L_c_tRNA+12.0*M_amp_c+24.0*M_pi_c Species: M_atp_c
sa[180,81] = 1.0;	#	 Name: tRNA_charging_M_lys_L_c_CAT: 12.0*M_lys_L_c+12.0*M_atp_c+12.0*tRNA = 12.0*M_lys_L_c_tRNA+12.0*M_amp_c+24.0*M_pi_c Species: tRNA
sa[181,116] = 1.0;	#	 Name: tRNA_charging_M_met_L_c_CAT: 9.0*M_met_L_c+9.0*M_atp_c+9.0*tRNA = 9.0*M_met_L_c_tRNA+9.0*M_amp_c+18.0*M_pi_c Species: M_met_L_c
sa[181,88] = 1.0;	#	 Name: tRNA_charging_M_met_L_c_CAT: 9.0*M_met_L_c+9.0*M_atp_c+9.0*tRNA = 9.0*M_met_L_c_tRNA+9.0*M_amp_c+18.0*M_pi_c Species: M_atp_c
sa[181,81] = 1.0;	#	 Name: tRNA_charging_M_met_L_c_CAT: 9.0*M_met_L_c+9.0*M_atp_c+9.0*tRNA = 9.0*M_met_L_c_tRNA+9.0*M_amp_c+18.0*M_pi_c Species: tRNA
sa[182,109] = 1.0;	#	 Name: tRNA_charging_M_phe_L_c_CAT: 20.0*M_phe_L_c+20.0*M_atp_c+20.0*tRNA = 20.0*M_phe_L_c_tRNA+20.0*M_amp_c+40.0*M_pi_c Species: M_phe_L_c
sa[182,88] = 1.0;	#	 Name: tRNA_charging_M_phe_L_c_CAT: 20.0*M_phe_L_c+20.0*M_atp_c+20.0*tRNA = 20.0*M_phe_L_c_tRNA+20.0*M_amp_c+40.0*M_pi_c Species: M_atp_c
sa[182,81] = 1.0;	#	 Name: tRNA_charging_M_phe_L_c_CAT: 20.0*M_phe_L_c+20.0*M_atp_c+20.0*tRNA = 20.0*M_phe_L_c_tRNA+20.0*M_amp_c+40.0*M_pi_c Species: tRNA
sa[183,110] = 1.0;	#	 Name: tRNA_charging_M_pro_L_c_CAT: 7.0*M_pro_L_c+7.0*M_atp_c+7.0*tRNA = 7.0*M_pro_L_c_tRNA+7.0*M_amp_c+14.0*M_pi_c Species: M_pro_L_c
sa[183,88] = 1.0;	#	 Name: tRNA_charging_M_pro_L_c_CAT: 7.0*M_pro_L_c+7.0*M_atp_c+7.0*tRNA = 7.0*M_pro_L_c_tRNA+7.0*M_amp_c+14.0*M_pi_c Species: M_atp_c
sa[183,81] = 1.0;	#	 Name: tRNA_charging_M_pro_L_c_CAT: 7.0*M_pro_L_c+7.0*M_atp_c+7.0*tRNA = 7.0*M_pro_L_c_tRNA+7.0*M_amp_c+14.0*M_pi_c Species: tRNA
sa[184,111] = 1.0;	#	 Name: tRNA_charging_M_ser_L_c_CAT: 10.0*M_ser_L_c+10.0*M_atp_c+10.0*tRNA = 10.0*M_ser_L_c_tRNA+10.0*M_amp_c+20.0*M_pi_c Species: M_ser_L_c
sa[184,88] = 1.0;	#	 Name: tRNA_charging_M_ser_L_c_CAT: 10.0*M_ser_L_c+10.0*M_atp_c+10.0*tRNA = 10.0*M_ser_L_c_tRNA+10.0*M_amp_c+20.0*M_pi_c Species: M_atp_c
sa[184,81] = 1.0;	#	 Name: tRNA_charging_M_ser_L_c_CAT: 10.0*M_ser_L_c+10.0*M_atp_c+10.0*tRNA = 10.0*M_ser_L_c_tRNA+10.0*M_amp_c+20.0*M_pi_c Species: tRNA
sa[185,112] = 1.0;	#	 Name: tRNA_charging_M_thr_L_c_CAT: 13.0*M_thr_L_c+13.0*M_atp_c+13.0*tRNA = 13.0*M_thr_L_c_tRNA+13.0*M_amp_c+26.0*M_pi_c Species: M_thr_L_c
sa[185,88] = 1.0;	#	 Name: tRNA_charging_M_thr_L_c_CAT: 13.0*M_thr_L_c+13.0*M_atp_c+13.0*tRNA = 13.0*M_thr_L_c_tRNA+13.0*M_amp_c+26.0*M_pi_c Species: M_atp_c
sa[185,81] = 1.0;	#	 Name: tRNA_charging_M_thr_L_c_CAT: 13.0*M_thr_L_c+13.0*M_atp_c+13.0*tRNA = 13.0*M_thr_L_c_tRNA+13.0*M_amp_c+26.0*M_pi_c Species: tRNA
sa[186,113] = 1.0;	#	 Name: tRNA_charging_M_trp_L_c_CAT: 5.0*M_trp_L_c+5.0*M_atp_c+5.0*tRNA = 5.0*M_trp_L_c_tRNA+5.0*M_amp_c+10.0*M_pi_c Species: M_trp_L_c
sa[186,88] = 1.0;	#	 Name: tRNA_charging_M_trp_L_c_CAT: 5.0*M_trp_L_c+5.0*M_atp_c+5.0*tRNA = 5.0*M_trp_L_c_tRNA+5.0*M_amp_c+10.0*M_pi_c Species: M_atp_c
sa[186,81] = 1.0;	#	 Name: tRNA_charging_M_trp_L_c_CAT: 5.0*M_trp_L_c+5.0*M_atp_c+5.0*tRNA = 5.0*M_trp_L_c_tRNA+5.0*M_amp_c+10.0*M_pi_c Species: tRNA
sa[187,114] = 1.0;	#	 Name: tRNA_charging_M_tyr_L_c_CAT: 11.0*M_tyr_L_c+11.0*M_atp_c+11.0*tRNA = 11.0*M_tyr_L_c_tRNA+11.0*M_amp_c+22.0*M_pi_c Species: M_tyr_L_c
sa[187,88] = 1.0;	#	 Name: tRNA_charging_M_tyr_L_c_CAT: 11.0*M_tyr_L_c+11.0*M_atp_c+11.0*tRNA = 11.0*M_tyr_L_c_tRNA+11.0*M_amp_c+22.0*M_pi_c Species: M_atp_c
sa[187,81] = 1.0;	#	 Name: tRNA_charging_M_tyr_L_c_CAT: 11.0*M_tyr_L_c+11.0*M_atp_c+11.0*tRNA = 11.0*M_tyr_L_c_tRNA+11.0*M_amp_c+22.0*M_pi_c Species: tRNA
sa[188,115] = 1.0;	#	 Name: tRNA_charging_M_val_L_c_CAT: 16.0*M_val_L_c+16.0*M_atp_c+16.0*tRNA = 16.0*M_val_L_c_tRNA+16.0*M_amp_c+32.0*M_pi_c Species: M_val_L_c
sa[188,88] = 1.0;	#	 Name: tRNA_charging_M_val_L_c_CAT: 16.0*M_val_L_c+16.0*M_atp_c+16.0*tRNA = 16.0*M_val_L_c_tRNA+16.0*M_amp_c+32.0*M_pi_c Species: M_atp_c
sa[188,81] = 1.0;	#	 Name: tRNA_charging_M_val_L_c_CAT: 16.0*M_val_L_c+16.0*M_atp_c+16.0*tRNA = 16.0*M_val_L_c_tRNA+16.0*M_amp_c+32.0*M_pi_c Species: tRNA

sa_vec = sa[find(sa.>0)]
writedlm("saturation_constant.dat",sa_vec)







