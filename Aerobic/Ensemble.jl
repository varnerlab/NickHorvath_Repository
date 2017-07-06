include("Include.jl")

# Script to solve the balance equations -
time_start = 0.0
time_stop = 10.5
time_step_size = 0.01
u_dir = Float64[]
v_dir = Float64[]
t_dir = Float64[]
perturb = 0.1
runs = 1000
GLC_archive = zeros(1051,runs)
AC_archive = zeros(1051,runs)
BIO_archive = zeros(1051,runs)
O2_archive = zeros(1051,runs)
for i = 1:runs
  # Load the data dictionary -
  data_dictionary = DataDictionary(time_start,time_stop,time_step_size)
  Param = Float64[]
  Param = zeros(21)
  Param[1:7] = data_dictionary["rate_constant_array"]+perturb*data_dictionary["rate_constant_array"].*randn(7)
  Param[8] = data_dictionary["enzyme_synthesis_constant"]+perturb*data_dictionary["enzyme_synthesis_constant"]*randn()
  Param[9] = data_dictionary["glc_saturation"]+perturb*data_dictionary["glc_saturation"]*randn()
  Param[11] = data_dictionary["ac_saturation"]+perturb*data_dictionary["ac_saturation"]*randn()
  Param[10] = data_dictionary["o2_saturation"]+perturb*data_dictionary["o2_saturation"]*randn()
  Param[12] = data_dictionary["glc_anaerobic"]+perturb*data_dictionary["glc_anaerobic"]*randn()
  Param[13] = data_dictionary["o2_mass_transfer"]+perturb*data_dictionary["o2_mass_transfer"]*randn()
  Param[14] = data_dictionary["basal_enzyme_synthesis"]+perturb*data_dictionary["basal_enzyme_synthesis"]*randn()
  Param[15:21] = data_dictionary["degradation_constant_array"]+perturb*data_dictionary["degradation_constant_array"]*randn()
  #Param = readdlm("kbest.dat")
  # Solve the model equations -
  (T,X) = SolveBalances(time_start,time_stop,time_step_size,data_dictionary,Param)
  xGlc = X[:,14]
  xAce = X[:,8]
  xBio = X[:,9]
  xO2 = X[:,22]
  GLC_archive[:,i] = xGlc
  AC_archive[:,i] = xAce
  BIO_archive[:,i] = xBio
  O2_archive[:,i] = xO2
  println(i)
end

writedlm("Ensemble/GLC_archive.dat",GLC_archive)
writedlm("Ensemble/AC_archive.dat",AC_archive)
writedlm("Ensemble/BIO_archive.dat",BIO_archive)
writedlm("Ensemble/O2_archive.dat",O2_archive)




Ac = readdlm("Data/Aerobic/Ac.dat")
Glc = readdlm("Data/Aerobic/Glc.dat")
Bio = readdlm("Data/Aerobic/Biomass.dat")
using PyPlot
figure(1)
subplot(2,2,1)
errorbar(Bio[:,1],Bio[:,2],0.1*Bio[:,2],fmt="ok")
plt[:plot](T,xBio,color="black",linewidth=1.5) #Biomass
axis([0,10.5,0,1.1])
xlabel("Time (h)")
ylabel("Biomass (gDW/L)")
#scatter(Bio[:,1],Bio[:,2])

subplot(2,2,2)
#scatter(Glc[:,1],Glc[:,2])
errorbar(Glc[:,1],Glc[:,2],0.1*Glc[:,2],fmt="ok")
plot(T,xGlc,color="black",linewidth=1.5) #GLC
axis([0,10.5,0,15])
plt[:yticks]([0:5:15;])
xlabel("Time (h)")
ylabel("Glucose (mM)")

subplot(2,2,3)
#scatter(Ac[:,1],Ac[:,2])
errorbar(Ac[:,1],Ac[:,2],0.1*Ac[:,2],fmt="ok")
plot(T,xAce,color="black",linewidth=1.5) #AC
axis([0,10.5,0,6])
xlabel("Time (h)")
ylabel("Acetate (mM)")

subplot(2,2,4)
plot(T,X[:,22],color="black",linewidth=1.5) #Oxygen
xlabel("Time (h)")
ylabel("Oxygen (mM)")
axis([0,10.5,0,0.3])
tight_layout()
