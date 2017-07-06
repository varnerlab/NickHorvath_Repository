function Write_saturation_array(glc_sat,o2_sat,ac_sat,glc_anaerobic)

	# Setup the saturation_constant_array -
	saturation_constant_array = [
		glc_sat	;	# 1 M1 M_glc_D_e::M_glc_D_e + 0.5*M_nh3_e + 1.98*M_o2_e + 0.34*M_pi_e --> 0.09*M_bio_e + 2.09*M_co2_e + 2.76*M_h2o_e + 6.37*M_h_e
		o2_sat	;	# 1 M1 M_o2_e::M_glc_D_e + 0.5*M_nh3_e + 1.98*M_o2_e + 0.34*M_pi_e --> 0.09*M_bio_e + 2.09*M_co2_e + 2.76*M_h2o_e + 6.37*M_h_e
		glc_sat	;	# 2 M2 M_glc_D_e::M_glc_D_e + 0.44*M_nh3_e + 1.5*M_o2_e + 0.29*M_pi_e --> 0.5*M_ac_e + 0.08*M_bio_e + 1.59*M_co2_e + 2.18*M_h2o_e + 5.55*M_h_e
		o2_sat	;	# 2 M2 M_o2_e::M_glc_D_e + 0.44*M_nh3_e + 1.5*M_o2_e + 0.29*M_pi_e --> 0.5*M_ac_e + 0.08*M_bio_e + 1.59*M_co2_e + 2.18*M_h2o_e + 5.55*M_h_e
		glc_sat	;	# 3 M3 M_glc_D_e::M_glc_D_e + 0.37*M_nh3_e + M_o2_e + 0.25*M_pi_e --> 0.79*M_ac_e + 0.07*M_bio_e + 0.59*M_co2_e + 0.98*M_for_e + 1.07*M_h2o_e + 4.64*M_h_e
		o2_sat	;	# 3 M3 M_o2_e::M_glc_D_e + 0.37*M_nh3_e + M_o2_e + 0.25*M_pi_e --> 0.79*M_ac_e + 0.07*M_bio_e + 0.59*M_co2_e + 0.98*M_for_e + 1.07*M_h2o_e + 4.64*M_h_e
		glc_sat	;	# 4 M4 M_glc_D_e::0.09*M_co2_e + M_glc_D_e + 0.28*M_nh3_e + 0.5*M_o2_e + 0.19*M_pi_e --> 1.13*M_ac_e + 0.05*M_bio_e + 0.08*M_etoh_e + 1.46*M_for_e + 0.21*M_h2o_e + 3.59*M_h_e
		o2_sat	;	# 4 M4 M_o2_e::0.09*M_co2_e + M_glc_D_e + 0.28*M_nh3_e + 0.5*M_o2_e + 0.19*M_pi_e --> 1.13*M_ac_e + 0.05*M_bio_e + 0.08*M_etoh_e + 1.46*M_for_e + 0.21*M_h2o_e + 3.59*M_h_e
		glc_anaerobic	;	# 5 M5 M_glc_D_e::M_glc_D_e + 0.31*M_h2o_e + 0.13*M_nh3_e + 0.09*M_pi_e --> 0.46*M_ac_e + 0.02*M_bio_e + 0.83*M_etoh_e + 1.36*M_for_e + 1.64*M_h_e + 0.35*M_pyr_e
		glc_anaerobic	;	# 6 M6 M_glc_D_e::M_glc_D_e + 0.13*M_nh3_e + 0.09*M_pi_e --> 0.16*M_ac_e + 0.02*M_bio_e + 0.17*M_etoh_e + 0.4*M_for_e + 1.64*M_h_e + 1.31*M_lac_D_e
		ac_sat	;	# 7 M7 M_ac_e::M_ac_e + 0.12*M_nh3_e + 1.02*M_o2_e + 0.08*M_pi_e --> 0.02*M_bio_e + 1.04*M_co2_e + 1.21*M_h2o_e + 1.56*M_h_e
		o2_sat	;	# 7 M7 M_o2_e::M_ac_e + 0.12*M_nh3_e + 1.02*M_o2_e + 0.08*M_pi_e --> 0.02*M_bio_e + 1.04*M_co2_e + 1.21*M_h2o_e + 1.56*M_h_e
	]

  return saturation_constant_array
end
