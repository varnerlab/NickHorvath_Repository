include("Include.jl")

# Script to solve the balance equations -
time_start = 0.0
time_stop = 10.5
time_step_size = 0.01
u_dir = Float64[]
v_dir = Float64[]
t_dir = Float64[]
flux_dir = Float64[]
# Load the data dictionary -
data_dictionary = DataDictionary(time_start,time_stop,time_step_size)
Param = Float64[]
#Param = readdlm("kbest.dat")
# Solve the model equations -
(T,X) = SolveBalances(time_start,time_stop,time_step_size,data_dictionary,Param)
xGlc = X[:,14]
xAce = X[:,8]
xBio = X[:,9]

flux = reshape(flux_dir,(111,div(length(flux_dir),111)))
Ac = readdlm("Data/Aerobic/Ac.dat")
Glc = readdlm("Data/Aerobic/Glc.dat")
Bio = readdlm("Data/Aerobic/Biomass.dat")
using PyPlot
figure(1)
subplot(2,2,1)
errorbar(Bio[:,1],Bio[:,2],0.1*Bio[:,2],fmt="ok")
a=plt[:plot](T,xBio,color="black",linewidth=1.5) #Biomass
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

figure(2)
scatter(t_dir,flux[24,:])
scatter(t_dir,flux[13,:])

using PyCall
@pyimport numpy as np

GSim = np.interp(Glc[:,1],T,xGlc)
ASim = np.interp(Ac[:,1],T,xAce)
ASim = np.interp(Ac[:,1],T,xAce)
BSim = np.interp(Bio[:,1],T,xBio)

zB = sum(((BSim-Bio[:,2])./Bio[:,2]).^2)
zG = sum(((GSim-Glc[:,2])./Glc[:,2]).^2)
zA = sum(((ASim-Ac[:,2])./Ac[:,2]).^2)

#zB = sum((BSim-Bio[:,2]).^2)
#zG = sum((GSim-Glc[:,2]).^2)
#zA = sum((ASim-Ac[:,2]).^2)

  cost = 5*zB + 0.5*zG + 1.5*zA
cost = zG + zA
