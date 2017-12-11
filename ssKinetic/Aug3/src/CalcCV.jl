using PyPlot
using KernelDensity

rate = readdlm("Ensemble/1/rate_constant.dat")
sat = readdlm("Ensemble/1/saturation_constant.dat")
sat = sat'
cont = readdlm("Ensemble/1/control_constant.dat")

rate_labels = Array{String,2}(length(rate),1)
for i in 1:length(rate_labels)
	rate_labels[i] = "rate_$i"
end

sat_indices = Array{String,2}(size(sat))
for i in 1:size(sat_indices,1)
	for j in 1:size(sat_indices,2)
		sat_indices[i,j] = "sat_$j"*"_$i" # The equivalent of a transpose
	end
end
nonzero_sat_indices = sat_indices[find(sat)]

cont_labels = Array{String,2}(length(vec(cont)),1)
for i in 1:length(cont_labels)
	cont_labels[i] = "cont_$i"
end

Param = zeros(length(rate)+length(nonzero_sat_indices)+length(vec(cont)),100)
for i in 1:100
	rate = readdlm("Ensemble/$i/rate_constant.dat")
	sat = readdlm("Ensemble/$i/saturation_constant.dat")
	sat = sat'
	cont = readdlm("Ensemble/$i/control_constant.dat")
	Param[:,i] = [rate;sat[find(sat)];vec(cont)]
end

Mean = zeros(size(Param,1),1)
Std = zeros(size(Param,1),1)
for i in 1:size(Param,1)
	Mean[i] = mean(Param[i,:])
	Std[i] = std(Param[i,:])
end
writedlm("Mean",Mean)
writedlm("Std",Std)

CV = Std./Mean
CV = [CV [rate_labels;nonzero_sat_indices;cont_labels]]
CV = CV[find(Mean),:]
CV = sortrows(CV)
CV = [CV collect(1:size(CV,1))]
writedlm("CV",CV)

CV_rate = ["value" "parameter" "index"]
CV_sat = ["value" "parameter" "index"]
CV_cont = ["value" "parameter" "index"]
for i in 1:size(CV,1)
	if CV[i,2][1] == 'r'
		CV_rate = [CV_rate;CV[i,:]']
	elseif CV[i,2][1] == 's'
		CV_sat = [CV_sat;CV[i,:]']
	elseif CV[i,2][1] == 'c'
		CV_cont = [CV_cont;CV[i,:]']
	end
end

x = collect(0:1:size(CV,1))

figure(figsize=(20,8))
semilogy(CV_rate[2:end,3],CV_rate[2:end,1]*.9,"s",color="gray",markersize=3)
semilogy(CV_sat[2:end,3],CV_sat[2:end,1]*1.0,"o",color="gray",markersize=4)
semilogy(CV_cont[2:end,3],CV_cont[2:end,1]*1.15,"^",color="gray",markersize=6)
semilogy([0;1000],[1;1],"k")
semilogy([873;873],[0;4],"k")
tight_layout()

#rate_kernel = kde(vec(Array{Int64}(CV_rate[2:end,3])))
#figure(figsize=(20,4))
#plot(x,pdf(rate_kernel,x),"r")
#tight_layout()

#sat_kernel = kde(vec(Array{Int64}(CV_sat[2:end,3])))
##figure(figsize=(20,4))
#plot(x,pdf(sat_kernel,x),"b")
#tight_layout()

#cont_kernel = kde(vec(Array{Int64}(CV_cont[2:end,3])))
##figure(figsize=(20,4))
#plot(x,pdf(cont_kernel,x),"g")
#tight_layout()

#horiz_cutoff = 1
#vert_cutoff = find(CV[:,1].>horiz_cutoff)[1]

#x_max = 1000 # size(CV,1)
#y_max = 4 # CV[end,1]

#figure(figsize=(23.2,12.5))

#subplot(2,1,1)
#plot(CV[:,3],CV[:,1],color="red")
#plot([0;1000],[horiz_cutoff;horiz_cutoff],"k")
#plot([vert_cutoff;vert_cutoff],[0;4],"k")
#axis([0,x_max,0,y_max])

#subplot(6,1,4)
#rate_kernel = kde(vec(Array{Int64}(CV_rate[2:end,3])))
#plot(x,pdf(rate_kernel,x),"r")
#plot([vert_cutoff;vert_cutoff],[0;4],"k")
#axis([0,x_max,0,.002])

#subplot(6,1,5)
#sat_kernel = kde(vec(Array{Int64}(CV_sat[2:end,3])))
#plot(x,pdf(sat_kernel,x),"r")
#plot([vert_cutoff;vert_cutoff],[0;4],"k")
#axis([0,x_max,0,.002])

#subplot(6,1,6)
#cont_kernel = kde(vec(Array{Int64}(CV_cont[2:end,3])))
#plot(x,pdf(cont_kernel,x),"r")
#plot([vert_cutoff;vert_cutoff],[0;4],"k")
#axis([0,x_max,0,.002])

#tight_layout()
