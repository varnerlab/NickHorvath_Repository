GLC = readdlm("Ensemble/GLC_archive.dat")
AC = readdlm("Ensemble/AC_archive.dat")
BIO = readdlm("Ensemble/BIO_archive.dat")
O2 = readdlm("Ensemble/O2_archive.dat")
T = vec(readdlm("Ensemble/Time.dat"))

Ac = readdlm("Data/Aerobic/Ac.dat")
Glc = readdlm("Data/Aerobic/Glc.dat")
Bio = readdlm("Data/Aerobic/Biomass.dat")
xGlc = readdlm("Ensemble/GLC_fit.dat")
xAc = readdlm("Ensemble/AC_fit.dat")
xBio = readdlm("Ensemble/BIO_fit.dat")
xO2 = readdlm("Ensemble/O2_fit.dat")


GLC_mean = Float64[]
GLC_err = Float64[]
AC_mean = Float64[]
AC_err = Float64[]
BIO_mean = Float64[]
BIO_err = Float64[]
O2_mean = Float64[]
O2_err = Float64[]
for i = 1:length(GLC[:,1])
  push!(GLC_mean,mean(GLC[i,:]))
  push!(GLC_err,std(GLC[i,:]))
  push!(AC_mean,mean(AC[i,:]))
  push!(AC_err,std(AC[i,:]))
  push!(BIO_mean,mean(BIO[i,:]))
  push!(BIO_err,std(BIO[i,:]))
  push!(O2_mean,mean(O2[i,:]))
  push!(O2_err,std(O2[i,:]))
end
GLC_max = GLC_mean + 1.96*GLC_err
GLC_min = GLC_mean - 1.96*GLC_err

AC_max = AC_mean + 1.96*AC_err
AC_min = AC_mean - 1.96*AC_err
BIO_max = BIO_mean + 1.96*BIO_err
BIO_min = BIO_mean - 1.96*BIO_err
O2_max = O2_mean + 1.96*O2_err
O2_min = O2_mean - 1.96*O2_err

using PyPlot


figure(1,figsize=(7,6))
subplot(2,2,1)
fill_between(T,BIO_max,BIO_min,color="lightblue")
#plot(T,BIO_mean,color="black",linewidth=1.5)
plt[:plot](T,xBio,color="black",linewidth=1.5) #Biomass
errorbar(Bio[:,1],Bio[:,2],0.1*Bio[:,2],fmt="ok")
axis([0,10.5,0,1.2])
xlabel("Time (h)")
ylabel("Biomass (gDW/L)")
#scatter(Bio[:,1],Bio[:,2])

subplot(2,2,2)
fill_between(T,GLC_max,GLC_min,color="lightblue")
#plot(T,GLC_mean,color="black",linewidth=1.5)
plot(T,xGlc,color="black",linewidth=1.5) #GLC
errorbar(Glc[:,1],Glc[:,2],0.1*Glc[:,2],fmt="ok")
errorbar(Glc[:,1],Glc[:,2],0.1*Glc[:,2],color="black",fmt="o", mfc="white", zorder=3)#fmt="ok")#, edgecolors='r')
axis([0,10.5,0,15])
plt[:yticks]([0:5:15;])
xlabel("Time (h)")
ylabel("Glucose (mM)")

subplot(2,2,3)
fill_between(T,AC_max,AC_min,color="lightblue")
#plot(T,AC_mean,color="black",linewidth=1.5)
plot(T,xAc,color="black",linewidth=1.5) #AC
errorbar(Ac[:,1],Ac[:,2],0.1*Ac[:,2],fmt="ok")
errorbar(Ac[:,1],Ac[:,2],0.1*Ac[:,2],color="black",fmt="o", mfc="white", zorder=3)#fmt="ok")
axis([0,10.5,0,8])
plt[:yticks]([0:2:8;])
xlabel("Time (h)")
ylabel("Acetate (mM)")

subplot(2,2,4)
fill_between(T,O2_max,O2_min,color="lightblue")
#plot(T,O2_mean,color="black",linewidth=1.5)
plot(T,xO2,color="black",linewidth=1.5) #Oxygen
xlabel("Time (h)")
ylabel("Oxygen (mM)")
axis([0,10.5,0,0.3])


figure(2,figsize=(3,7))
subplot(3,1,1)
fill_between(T,BIO_max,BIO_min,color="lightblue")
#plot(T,BIO_mean,color="black",linewidth=1.5)
plt[:plot](T,xBio,color="black",linewidth=1.5) #Biomass
errorbar(Bio[:,1],Bio[:,2],0.1*Bio[:,2],fmt="ok")
axis([0,10.5,0,1.2])
xlabel("Time (h)")
ylabel("Biomass (gDW/L)")
#scatter(Bio[:,1],Bio[:,2])
subplot(3,1,2)
fill_between(T,GLC_max,GLC_min,color="lightblue")
#plot(T,GLC_mean,color="black",linewidth=1.5)
plot(T,xGlc,color="black",linewidth=1.5) #GLC
errorbar(Glc[:,1],Glc[:,2],0.1*Glc[:,2],fmt="ok")
errorbar(Glc[:,1],Glc[:,2],0.1*Glc[:,2],color="black",fmt="o", mfc="white", zorder=3)#fmt="ok")#, edgecolors='r')

axis([0,10.5,0,15])
plt[:yticks]([0:5:15;])
xlabel("Time (h)")
ylabel("Glucose (mM)")

subplot(3,1,3)
fill_between(T,AC_max,AC_min,color="lightblue")
#plot(T,AC_mean,color="black",linewidth=1.5)
plot(T,xAc,color="black",linewidth=1.5) #AC
errorbar(Ac[:,1],Ac[:,2],0.1*Ac[:,2],fmt="ok")
errorbar(Ac[:,1],Ac[:,2],0.1*Ac[:,2],color="black",fmt="o", mfc="white", zorder=3)#fmt="ok")

axis([0,10.5,0,8])
plt[:yticks]([0:2:8;])
xlabel("Time (h)")
ylabel("Acetate (mM)")

tight_layout()
