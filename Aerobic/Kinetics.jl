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
# Function: Kinetics
# Description: Calculate the flux array at time t
# Generated on: 2017-05-11T15:56:24.416
#
# Input arguments:
# t::Float64 => Current time value (scalar)
# x::Array{Float64,1} => State array (number_of_species x 1)
# data_dictionary::Dict{AbstractString,Any} => Dictionary holding model parameters
#
# Output arguments:
# flux_array::Array{Float64,1} => Flux array (number_of_rates x 1) at time t
# ----------------------------------------------------------------------------------- #
function Kinetics(time,state_array,data_dictionary)

	# Get data/parameters from the data_dictionary -
	flux_balance_modes_matrix = data_dictionary["flux_balance_modes_matrix"]
	K = data_dictionary["saturation_constant_array"]
	VMax = data_dictionary["rate_constant_array"]
	KE = data_dictionary["enzyme_synthesis_constant"]

	# initialize the kinetic_rate_array -
	(number_of_reactions,number_of_modes) = size(flux_balance_modes_matrix)
	kinetic_rate_array = zeros(number_of_modes)
	enzyme_rate_array = zeros(number_of_modes)

	# alias the state_array -
	E_M1 = state_array[1]
	E_M2 = state_array[2]
	E_M3 = state_array[3]
	E_M4 = state_array[4]
	E_M5 = state_array[5]
	E_M6 = state_array[6]
	E_M7 = state_array[7]

	M_ac_e = state_array[8]
	M_bio_e = state_array[9]
	M_co2_e = state_array[10]
	M_etoh_e = state_array[11]
	M_for_e = state_array[12]
	M_fum_e = state_array[13]
	M_glc_D_e = state_array[14]
	M_gln_L_e = state_array[15]
	M_glu_L_e = state_array[16]
	M_h2o_e = state_array[17]
	M_h_e = state_array[18]
	M_lac_D_e = state_array[19]
	M_mal_L_e = state_array[20]
	M_nh3_e = state_array[21]
	M_o2_e = state_array[22]
	M_pi_e = state_array[23]
	M_pyr_e = state_array[24]
	M_succ_e = state_array[25]

	# build the kinetic rates -
	kinetic_rate_array[1] = VMax[1]*E_M1*(M_glc_D_e/(K[1]+M_glc_D_e))*(M_o2_e/(K[2]+M_o2_e))
	kinetic_rate_array[2] = VMax[2]*E_M2*(M_glc_D_e/(K[3]+M_glc_D_e))*(M_o2_e/(K[4]+M_o2_e))
	kinetic_rate_array[3] = VMax[3]*E_M3*(M_glc_D_e/(K[5]+M_glc_D_e))*(M_o2_e/(K[6]+M_o2_e))
	kinetic_rate_array[4] = VMax[4]*E_M4*(M_glc_D_e/(K[7]+M_glc_D_e))*(M_o2_e/(K[8]+M_o2_e))
	kinetic_rate_array[5] = VMax[5]*E_M5*(M_glc_D_e/(K[9]+M_glc_D_e))
	kinetic_rate_array[6] = VMax[6]*E_M6*(M_glc_D_e/(K[10]+M_glc_D_e))
	kinetic_rate_array[7] = VMax[7]*E_M7*(M_ac_e/(K[11]+M_ac_e))*(M_o2_e/(K[12]+M_o2_e))

	# build the enzyme rates -
	enzyme_rate_array[1] = KE*(M_glc_D_e/(K[1]+M_glc_D_e))*(M_o2_e/(K[2]+M_o2_e))
	enzyme_rate_array[2] = KE*(M_glc_D_e/(K[3]+M_glc_D_e))*(M_o2_e/(K[4]+M_o2_e))
	enzyme_rate_array[3] = KE*(M_glc_D_e/(K[5]+M_glc_D_e))*(M_o2_e/(K[6]+M_o2_e))
	enzyme_rate_array[4] = KE*(M_glc_D_e/(K[7]+M_glc_D_e))*(M_o2_e/(K[8]+M_o2_e))
	enzyme_rate_array[5] = KE*(M_glc_D_e/(K[9]+M_glc_D_e))
	enzyme_rate_array[6] = KE*(M_glc_D_e/(K[10]+M_glc_D_e))
	enzyme_rate_array[7] = KE*(M_ac_e/(K[11]+M_ac_e))*(M_o2_e/(K[12]+M_o2_e))

	return kinetic_rate_array, enzyme_rate_array
end
