# ----------------------------------------------------------------------------------- #
# Copyright (c) 2017 Varnerlab
# Robert Frederick School of Chemical and Biomolecular Engineering
# Cornell University, Ithaca NY 14850

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

# ----------------------------------------------------------------------------------- #
# SolveBalances: Solves model equations from TSTART to TSTOP given parameters in data_dictionary.
# Type: HCM-JULIA
# Version: 1.0
#
# Input arguments:
# TSTART  - Time start
# TSTOP  - Time stop
# Ts - Time step
# data_dictionary  - Data dictionary instance (holds model parameters)
#
# Return arguments:
# TSIM - Simulation time vector
# X - Simulation state array (NTIME x NSPECIES)
# ----------------------------------------------------------------------------------- #
include("Write_saturation_array.jl")
function SolveBalances(time_start::Float64,time_stop::Float64,time_step_size::Float64,data_dictionary::Dict{AbstractString,Any},Param)

  # define the time vector -
  time_array = collect(time_start:time_step_size:time_stop)

  # Get the required parameters from the data_dictionary -
  initial_condition_array = data_dictionary["initial_condition_array"]
  if isempty(Param)
    data_dictionary = data_dictionary
  else
    VMax = Param[1:7]
    #VMax[5] = 2.8417
    #VMax[6] = 1.7765
    KE = Param[8]
    glc_saturation = Param[9]
    o2_saturation = Param[10]
    ac_saturation = Param[11]
    glc_anaerobic = Param[12]
    o2_mass_transfer = Param[13]
    alpha = Param[14]
    beta = Param[15:21]
    K = Write_saturation_array(glc_saturation,o2_saturation,ac_saturation,glc_anaerobic)
    o2_mass_transfer_array = zeros(25)
    o2_mass_transfer_array[22] =	o2_mass_transfer

    #Rewrite Data Dictionary
    data_dictionary["rate_constant_array"] = VMax
    data_dictionary["enzyme_synthesis_constant"] = KE
    data_dictionary["saturation_constant_array"] = K
    data_dictionary["o2_mass_transfer_array"] = o2_mass_transfer_array
    data_dictionary["basal_enzyme_synthesis"] = alpha
    data_dictionary["degradation_constant_array"] = beta
    data_dictionary = data_dictionary
  end
  # Run the ODE solver -
  f(t,x,dxdt) = Balances(t,x,dxdt,data_dictionary)
  state_array = Sundials.cvode(f,initial_condition_array,time_array,reltol=1e-3,abstol=1e-6,integrator=:BDF)

  # return -
  return (time_array,state_array)
end
