using PyPlot

function Plot(parameter_vector,plot_color)
include("Include.jl")

# Script to solve the balance equations -
time_start = 0.0
time_stop = 10.5
time_step_size = 0.01
u_dir = Float64[]
v_dir = Float64[]
t_dir = Float64[]
perturb = 0.1
runs = 1
GLC_archive = zeros(1051,runs)
AC_archive = zeros(1051,runs)
BIO_archive = zeros(1051,runs)
O2_archive = zeros(1051,runs)

# Load the data dictionary -
data_dictionary = DataDictionary(time_start,time_stop,time_step_size)

#Param = readdlm("Param")
# Solve the model equations -
(T,X) = SolveBalances(time_start,time_stop,time_step_size,data_dictionary,parameter_vector)
xGlc = X[:,14]
xAce = X[:,8]
xBio = X[:,9]
xO2 = X[:,22]

Ac = readdlm("Data/Aerobic/Ac.dat")
Glc = readdlm("Data/Aerobic/Glc.dat")
Bio = readdlm("Data/Aerobic/Biomass.dat")

#plot_color = "r"

#figure(1)
subplot(2,2,1)
errorbar(Bio[:,1],Bio[:,2],0.1*Bio[:,2],fmt="ok")
plt[:plot](T,xBio,color=plot_color,linewidth=1.5) #Biomass
axis([0,10.5,0,1.1])
xlabel("Time (h)")
ylabel("Biomass (gDW/L)")
#scatter(Bio[:,1],Bio[:,2])

subplot(2,2,2)
#scatter(Glc[:,1],Glc[:,2])
errorbar(Glc[:,1],Glc[:,2],0.1*Glc[:,2],fmt="ok")
plot(T,xGlc,color=plot_color,linewidth=1.5) #GLC
axis([0,10.5,0,15])
plt[:yticks]([0:5:15;])
xlabel("Time (h)")
ylabel("Glucose (mM)")

subplot(2,2,3)
#scatter(Ac[:,1],Ac[:,2])
errorbar(Ac[:,1],Ac[:,2],0.1*Ac[:,2],fmt="ok")
plot(T,xAce,color=plot_color,linewidth=1.5) #AC
axis([0,10.5,0,6])
xlabel("Time (h)")
ylabel("Acetate (mM)")

subplot(2,2,4)
plot(T,X[:,22],color=plot_color,linewidth=1.5) #Oxygen
xlabel("Time (h)")
ylabel("Oxygen (mM)")
axis([0,10.5,0,0.3])
tight_layout()
end
