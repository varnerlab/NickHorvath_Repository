# ----------------------------------------------------------------------------------- #
# Copyright (c) 2017 Varnerlab
# Robert Frederick Smith School of Chemical and Biomolecular Engineering
# Cornell University, Ithaca NY 14850
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
# ----------------------------------------------------------------------------------- #
#
# ----------------------------------------------------------------------------------- #
# Function: DataDictionary
# Description: Holds simulation and model parameters as key => value pairs in a Julia Dict()
# Generated on: 2017-05-11T15:56:24.452
#
# Input arguments:
# time_start::Float64 => Simulation start time value (scalar)
# time_stop::Float64 => Simulation stop time value (scalar)
# time_step::Float64 => Simulation time step (scalar)
#
# Output arguments:
# data_dictionary::Dict{AbstractString,Any} => Dictionary holding model and simulation parameters as key => value pairs
# ----------------------------------------------------------------------------------- #
function DataDictionary(time_start,time_stop,time_step)

	# Load the networks from disk -
	stoichiometric_matrix = readdlm("Network.dat");
	flux_balance_modes_matrix = readdlm("Modes_flux.dat");

	# How many modes do we have? -
	(number_of_reactions,number_of_modes) = size(flux_balance_modes_matrix)

	# Setup the index_vector_external_species -
	index_vector_external_species = [
		57	;	# 1 M_ac_e
		58	;	# 2 M_bio_e
		59	;	# 3 M_co2_e
		60	;	# 4 M_etoh_e
		61	;	# 5 M_for_e
		62	;	# 6 M_fum_e
		63	;	# 7 M_glc_D_e
		64	;	# 8 M_gln_L_e
		65	;	# 9 M_glu_L_e
		66	;	# 10 M_h2o_e
		67	;	# 11 M_h_e
		68	;	# 12 M_lac_D_e
		69	;	# 13 M_mal_L_e
		70	;	# 14 M_nh3_e
		71	;	# 15 M_o2_e
		72	;	# 16 M_pi_e
		73	;	# 17 M_pyr_e
		74	;	# 18 M_succ_e
	]

	# Setup the uptake_pivot_array -
	uptake_pivot_array = [
		1	;	# M_glc_D_e + 0.5*M_nh3_e + 1.98*M_o2_e + 0.34*M_pi_e --> 0.09*M_bio_e + 2.09*M_co2_e + 2.76*M_h2o_e + 6.37*M_h_e
		1	;	# M_glc_D_e + 0.44*M_nh3_e + 1.5*M_o2_e + 0.29*M_pi_e --> 0.5*M_ac_e + 0.08*M_bio_e + 1.59*M_co2_e + 2.18*M_h2o_e + 5.55*M_h_e
		1	;	# M_glc_D_e + 0.37*M_nh3_e + M_o2_e + 0.25*M_pi_e --> 0.79*M_ac_e + 0.07*M_bio_e + 0.59*M_co2_e + 0.98*M_for_e + 1.07*M_h2o_e + 4.64*M_h_e
		1	;	# 0.09*M_co2_e + M_glc_D_e + 0.28*M_nh3_e + 0.5*M_o2_e + 0.19*M_pi_e --> 1.13*M_ac_e + 0.05*M_bio_e + 0.08*M_etoh_e + 1.46*M_for_e + 0.21*M_h2o_e + 3.59*M_h_e
		1	;	# M_glc_D_e + 0.31*M_h2o_e + 0.13*M_nh3_e + 0.09*M_pi_e --> 0.46*M_ac_e + 0.02*M_bio_e + 0.83*M_etoh_e + 1.36*M_for_e + 1.64*M_h_e + 0.35*M_pyr_e
		1	;	# M_glc_D_e + 0.13*M_nh3_e + 0.09*M_pi_e --> 0.16*M_ac_e + 0.02*M_bio_e + 0.17*M_etoh_e + 0.4*M_for_e + 1.64*M_h_e + 1.31*M_lac_D_e
		101	;	# M_ac_e + 0.12*M_nh3_e + 1.02*M_o2_e + 0.08*M_pi_e --> 0.02*M_bio_e + 1.04*M_co2_e + 1.21*M_h2o_e + 1.56*M_h_e
	]

	# Setup the initial_condition_array -
	initial_condition_array = [

		0.9	;	# 1 E_M1 M_glc_D_e + 0.5*M_nh3_e + 1.98*M_o2_e + 0.34*M_pi_e --> 0.09*M_bio_e + 2.09*M_co2_e + 2.76*M_h2o_e + 6.37*M_h_e
		0.9	;	# 2 E_M2 M_glc_D_e + 0.44*M_nh3_e + 1.5*M_o2_e + 0.29*M_pi_e --> 0.5*M_ac_e + 0.08*M_bio_e + 1.59*M_co2_e + 2.18*M_h2o_e + 5.55*M_h_e
		0.9	;	# 3 E_M3 M_glc_D_e + 0.37*M_nh3_e + M_o2_e + 0.25*M_pi_e --> 0.79*M_ac_e + 0.07*M_bio_e + 0.59*M_co2_e + 0.98*M_for_e + 1.07*M_h2o_e + 4.64*M_h_e
		0.9	;	# 4 E_M4 0.09*M_co2_e + M_glc_D_e + 0.28*M_nh3_e + 0.5*M_o2_e + 0.19*M_pi_e --> 1.13*M_ac_e + 0.05*M_bio_e + 0.08*M_etoh_e + 1.46*M_for_e + 0.21*M_h2o_e + 3.59*M_h_e
		0.9	;	# 5 E_M5 M_glc_D_e + 0.31*M_h2o_e + 0.13*M_nh3_e + 0.09*M_pi_e --> 0.46*M_ac_e + 0.02*M_bio_e + 0.83*M_etoh_e + 1.36*M_for_e + 1.64*M_h_e + 0.35*M_pyr_e
		0.9	;	# 6 E_M6 M_glc_D_e + 0.13*M_nh3_e + 0.09*M_pi_e --> 0.16*M_ac_e + 0.02*M_bio_e + 0.17*M_etoh_e + 0.4*M_for_e + 1.64*M_h_e + 1.31*M_lac_D_e
		0.9	;	# 7 E_M7 M_ac_e + 0.12*M_nh3_e + 1.02*M_o2_e + 0.08*M_pi_e --> 0.02*M_bio_e + 1.04*M_co2_e + 1.21*M_h2o_e + 1.56*M_h_e

		0.35	;	# 8 M_ac_e
		0.003;	# 9 M_bio_e
		100.0	;	# 10 M_co2_e
		0.0	;	# 11 M_etoh_e
		0.0	;	# 12 M_for_e
		0.0	;	# 13 M_fum_e
		11.1	;	# 14 M_glc_D_e
		0.0	;	# 15 M_gln_L_e
		0.0	;	# 16 M_glu_L_e
		100.0	;	# 17 M_h2o_e
		100.0	;	# 18 M_h_e
		0.0	;	# 19 M_lac_D_e
		0.0	;	# 20 M_mal_L_e
		100.0	;	# 21 M_nh3_e
		0.21	;	# 22 M_o2_e
		100.0	;	# 23 M_pi_e
		0.0	;	# 24 M_pyr_e
		0.0	;	# 25 M_succ_e
	]

	# Setup the rate constant array -
	rate_constant_array = [
		4.731198;	# 1 M_glc_D_e + 0.5*M_nh3_e + 1.98*M_o2_e + 0.34*M_pi_e --> 0.09*M_bio_e + 2.09*M_co2_e + 2.76*M_h2o_e + 6.37*M_h_e
		4.75171289	;	# 2 M_glc_D_e + 0.44*M_nh3_e + 1.5*M_o2_e + 0.29*M_pi_e --> 0.5*M_ac_e + 0.08*M_bio_e + 1.59*M_co2_e + 2.18*M_h2o_e + 5.55*M_h_e
		3.99014;	# 3 M_glc_D_e + 0.37*M_nh3_e + M_o2_e + 0.25*M_pi_e --> 0.79*M_ac_e + 0.07*M_bio_e + 0.59*M_co2_e + 0.98*M_for_e + 1.07*M_h2o_e + 4.64*M_h_e
		2.84089	;	# 4 0.09*M_co2_e + M_glc_D_e + 0.28*M_nh3_e + 0.5*M_o2_e + 0.19*M_pi_e --> 1.13*M_ac_e + 0.05*M_bio_e + 0.08*M_etoh_e + 1.46*M_for_e + 0.21*M_h2o_e + 3.59*M_h_e
		2.8417	;	# 5 M_glc_D_e + 0.31*M_h2o_e + 0.13*M_nh3_e + 0.09*M_pi_e --> 0.46*M_ac_e + 0.02*M_bio_e + 0.83*M_etoh_e + 1.36*M_for_e + 1.64*M_h_e + 0.35*M_pyr_e
		1.7765	;	# 6 M_glc_D_e + 0.13*M_nh3_e + 0.09*M_pi_e --> 0.16*M_ac_e + 0.02*M_bio_e + 0.17*M_etoh_e + 0.4*M_for_e + 1.64*M_h_e + 1.31*M_lac_D_e
		3.7317;	# 7 M_ac_e + 0.12*M_nh3_e + 1.02*M_o2_e + 0.08*M_pi_e --> 0.02*M_bio_e + 1.04*M_co2_e + 1.21*M_h2o_e + 1.56*M_h_e
	]



	glc_sat = 0.5
	o2_sat = 0.06
	ac_sat = 0.5
	glc_anaerobic = 2
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

	# Setup the external stoichiometric matrix -
	external_stoichiometric_matrix = stoichiometric_matrix[index_vector_external_species,:]
	o2_mass_transfer = 20
	o2_mass_transfer_array = zeros(length(initial_condition_array))
	o2_mass_transfer_array[22] =	o2_mass_transfer#1/hr

	# Setup the degradation_constant_array -
	default_protein_half_life = 24.0	# units:hr
	default_degrdation_constant = -(1/default_protein_half_life)*log(0.5)	# units: hr^-1
	degradation_constant_array = default_degrdation_constant*ones(number_of_modes)
	enzyme_synthesis_constant = 5.8
	alpha = 0.005
	# =============================== DO NOT EDIT BELOW THIS LINE ============================== #
	data_dictionary = Dict{AbstractString,Any}()
	data_dictionary["stoichiometric_matrix"] = stoichiometric_matrix
	data_dictionary["external_stoichiometric_matrix"] = external_stoichiometric_matrix
	data_dictionary["initial_condition_array"] = initial_condition_array
	data_dictionary["degradation_constant_array"] = degradation_constant_array
	data_dictionary["flux_balance_modes_matrix"] = flux_balance_modes_matrix
	data_dictionary["index_vector_external_species"] = index_vector_external_species
	data_dictionary["saturation_constant_array"] = saturation_constant_array
	data_dictionary["rate_constant_array"] = rate_constant_array
	data_dictionary["uptake_pivot_array"] = uptake_pivot_array
	data_dictionary["basal_enzyme_synthesis"] = alpha
	data_dictionary["enzyme_synthesis_constant"] = enzyme_synthesis_constant
	data_dictionary["o2_mass_transfer_array"] = o2_mass_transfer_array
	data_dictionary["glc_saturation"] = glc_sat
	data_dictionary["o2_saturation"] = o2_sat
	data_dictionary["ac_saturation"] = ac_sat
	data_dictionary["glc_anaerobic"] = glc_anaerobic
	data_dictionary["o2_mass_transfer"] = o2_mass_transfer
	# =============================== DO NOT EDIT ABOVE THIS LINE ============================== #
	return data_dictionary
end
