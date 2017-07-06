include("Include.jl")

if isfile("u")
	rm("u")
end

if isfile("v")
	rm("v")
end

if isfile("k")
	rm("k")
end

if isfile("z")
	rm("z")
end

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

Param = readdlm("Param")
# Solve the model equations -
(T,X) = SolveBalances(time_start,time_stop,time_step_size,data_dictionary,Param)
xGlc = X[:,14]
xAce = X[:,8]
xBio = X[:,9]
xO2 = X[:,22]

Ac = readdlm("Data/Aerobic/Ac.dat")
Glc = readdlm("Data/Aerobic/Glc.dat")
Bio = readdlm("Data/Aerobic/Biomass.dat")

plot_color = "k"

using PyPlot
figure(1)
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


figure(2,figsize=(20,12))
subplot(4,1,1)
u = readdlm("u")
plot(collect(0:size(u,1)-1),u)
#xlabel("Time (h)")
ylabel("u")

subplot(4,1,2)
v = readdlm("v")
plot(collect(0:size(v,1)-1),v)
#xlabel("Time (h)")
ylabel("v")

subplot(4,1,3)
k = readdlm("k")
plot(collect(0:size(k,1)-1),k)
#xlabel("Time (h)")
ylabel("kinetic rates")

subplot(4,1,4)
z = readdlm("z")
plot(collect(0:size(z,1)-1),z)
#xlabel("Time (h)")
ylabel("enzymes")
tight_layout()




