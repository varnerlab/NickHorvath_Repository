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
function Balances(time::Float64,state_array::Array{Float64,1},dxdt_vector::Array{Float64,1},data_dictionary::Dict{AbstractString,Any})

  # Correct for smalls -
  idx = find(state_array.<1e-9)
  state_array[idx] = 1e-9

  # get parameters fron the data dictionary -
  beta = data_dictionary["degradation_constant_array"]
  mode_matrix = data_dictionary["flux_balance_modes_matrix"]
  stoichiometric_matrix = data_dictionary["external_stoichiometric_matrix"]
  alpha = data_dictionary["basal_enzyme_synthesis"]
  o2_mass_transfer_array = data_dictionary["o2_mass_transfer_array"]
  S = data_dictionary["stoichiometric_matrix"]

  # what is my system size?
  (number_of_reactions,number_of_modes) = size(mode_matrix)

  # Define rate vector
  kinetic_rate_array, enzyme_rate_array = Kinetics(time,state_array,data_dictionary);

  # Define the dilution/feed vector -
  dilution_rate_array = Dilution(time,state_array,data_dictionary)

  # calculate the control vector -
  u, v = Control(time,state_array,kinetic_rate_array,data_dictionary)

  # correct the rates (rate*control) -
  kinetic_rate_array = kinetic_rate_array.*v;
  enzyme_rate_array = enzyme_rate_array.*u;
  growth_rate = sum(mode_matrix[109,:].*kinetic_rate_array);

  # calculate the enzyme balances -
  dxdt_vector[1:number_of_modes] = alpha + enzyme_rate_array - (beta+growth_rate).*state_array[1:number_of_modes]
  # calculate the metabolic models -
  dxdt_vector[(number_of_modes+1):end] = stoichiometric_matrix*mode_matrix*kinetic_rate_array*state_array[9] + o2_mass_transfer_array[(number_of_modes+1):end]*(.21-state_array[22])

  flux = mode_matrix*kinetic_rate_array
#  push!(t_dir,time)
#  append!(flux_dir,flux)

if !isfile("u")
	writedlm("u",u')
else
	tmp = readdlm("u")
	tmp = [tmp;u']
	writedlm("u",tmp)
end

if !isfile("v")
	writedlm("v",v')
else
	tmp = readdlm("v")
	tmp = [tmp;v']
	writedlm("v",tmp)
end

if !isfile("k")
	writedlm("k",kinetic_rate_array')
else
	tmp = readdlm("k")
	tmp = [tmp;kinetic_rate_array']
	writedlm("k",tmp)
end

if !isfile("z")
	writedlm("z",enzyme_rate_array')
else
	tmp = readdlm("z")
	tmp = [tmp;enzyme_rate_array']
	writedlm("z",tmp)
end

end
