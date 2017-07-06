rate_best = vec(readdlm("Ensemble/Best/rate_constant.dat"))
sat_best = vec(readdlm("Ensemble/Best/saturation_constant.dat"))
cont_best = vec(readdlm("Ensemble/Best/control_constant.dat"))
params_best = [rate_best;sat_best[find(sat_best.>0)];cont_best]

Index = Int64[]
push!(Index,0) # "0" is best-fit set

Cost = Float64[]
push!(Cost,readdlm("Ensemble/Best/cost")[1])

PM = Float64[]
push!(PM,1.0)

P = params_best

cost_threshold = 19.6475 #19.652 #19.655 #55.15 #89 #34.666 #26.203
pearson_threshold = 0.999999999 #0.999999 #0.99999 #0.9999 #0.997 #0.996 #0.998 #0.999

ordered = convert(Array{Int64},readdlm("Ensemble/ordered"))
#for i in 3875:-1:1
for i in ordered
    if isdir("Ensemble/$i")
#        println(i)
        cost = readdlm("Ensemble/$i/cost_unweighted")[1]
        if cost < cost_threshold
		    rate = vec(readdlm("Ensemble/$i/rate_constant.dat"))
		    sat = vec(readdlm("Ensemble/$i/saturation_constant.dat"))
		    cont = vec(readdlm("Ensemble/$i/control_constant.dat"))
		    params = [rate;sat[find(sat.>0)];cont]
		    Pearson = Float64[]
		    for j in 1:size(P,2)
		    	p_j = P[:,j]
		    	pearson = cor(params,p_j)
		    	push!(Pearson,pearson)
		    end
		    Pearson_max = maximum(Pearson)
		    if Pearson_max < pearson_threshold
		    	push!(Index,i)
		    	push!(Cost,cost)
		    	push!(PM,Pearson_max)
		    	P = [P params]
		    	println("length: ",length(Index))
		    end
		end
    end
end

P = zeros(990,1)
for i in 1:100
	rate = vec(readdlm("Ensemble100/$i/rate_constant.dat"))
    sat = vec(readdlm("Ensemble100/$i/saturation_constant.dat"))
    cont = vec(readdlm("Ensemble100/$i/control_constant.dat"))
    params = [rate;sat[find(sat.>0)];cont]
	P = [P params]
end
P = P[:,2:end]

Z = zeros(100,100)
for i in 1:100
	p_i = P[:,i]
	for j in i+1:100
		p_j = P[:,j]
		Z[i,j] = cor(p_i,p_j)
#		if Z[i,j]>.999999
#			println(i," ",j)
#		end
	end
end

z = vec(Z)
z = z[find(z.>0)]
z_stats = [minimum(z) median(z) mean(z) maximum(z)]








