include("Write_saturation_array.jl")
using PyCall
@pyimport numpy as np

function Objective(time_start::Float64,time_stop::Float64,time_step_size::Float64,data_dictionary::Dict{AbstractString,Any},Param)

  # define the time vector -
  time_array = collect(time_start:time_step_size:time_stop)

  # Get the required parameters from the data_dictionary -
  initial_condition_array = data_dictionary["initial_condition_array"]

  if isempty(Param)
    DF = data_dictionary
  else
    VMax = Param[1:7]
    VMax[5] = 2.8417
    VMax[6] = 1.7765
    KE = Param[8]
    #glc_saturation = Param[9]
    #o2_saturation = Param[10]
    #ac_saturation = Param[11]
    #glc_anaerobic = Param[12]
    #o2_mass_transfer = Param[13]
    #K = Write_saturation_array(glc_saturation,o2_saturation,ac_saturation,glc_anaerobic)
    #o2_mass_transfer_array = zeros(25)
    #o2_mass_transfer_array[22] =	o2_mass_transfer

    #Rewrite Data Dictionary
    data_dictionary["rate_constant_array"] = VMax
    #data_dictionary["enzyme_synthesis_constant"] = KE
    #data_dictionary["saturation_constant_array"] = K
    #data_dictionary["o2_mass_transfer_array"] = o2_mass_transfer_array

    DF = data_dictionary
  end

  f(t,x,dxdt) = Balances(t,x,dxdt,DF)
  state_array = Sundials.cvode(f,initial_condition_array,time_array,reltol=1e-3,abstol=1e-6,integrator=:BDF)
  xGlc = state_array[:,14]
  xAce = state_array[:,8]
  xBio = state_array[:,9]

  #Load Data
  Ac = readdlm("Data/Aerobic/Ac.dat")
  Glc = readdlm("Data/Aerobic/Glc.dat")
  Bio = readdlm("Data/Aerobic/Biomass.dat")

  GSim = np.interp(Glc[:,1],time_array,xGlc)
  ASim = np.interp(Ac[:,1],time_array,xAce)
  BSim = np.interp(Bio[:,1],time_array,xBio)

  zB = sum(((BSim-Bio[:,2])./Bio[:,2]).^2)
  zG = sum(((GSim-Glc[:,2])./Glc[:,2]).^2)
  zA = sum(((ASim-Ac[:,2])./Ac[:,2]).^2)

  #zB = sum((BSim-Bio[:,2]).^2)
  #zG = sum((GSim-Glc[:,2]).^2)
  #zA = sum((ASim-Ac[:,2]).^2)

  cost = 5*zB + 0.5*zG + 1.5*zA
  cost = zG + zA
  #Yield = xBio[end]./((xGlc[1]-xGlc[end]) + (xAce[find(xAce.==maximum(xAce))] - xAce[end]))

  return cost
end
