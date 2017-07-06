include("FindMin.jl")

num_dir = convert(Int64,readdlm("Ensemble/num_dir")[1])
#Cost = Float64[]
#for i in 1:num_dir
#    cost = readdlm("Ensemble/$i/cost")[1]
#    push!(Cost,cost)
#end
#writedlm("Ensemble/Cost",Cost)
Cost = readdlm("Ensemble/Cost")
Cost_original = copy(Cost)

#rate = readdlm("Ensemble/Best/rate_constant.dat")
#sat = readdlm("Ensemble/Best/saturation_constant.dat")
#s = vec(sat)
#s = s[find(s.>0)]
#cont = readdlm("Ensemble/Best/control_constant.dat")
#Param = [rate;s;cont[:,1];cont[:,2]]
#for i in 1:num_dir
#    println(i)
#    rate = readdlm("Ensemble/$i/rate_constant.dat")
#    sat = readdlm("Ensemble/Best/saturation_constant.dat")
#    s = vec(sat)
#    s = s[find(s.>0)]
#    cont = readdlm("Ensemble/$i/control_constant.dat")
#    tmp = [rate;s;cont[:,1];cont[:,2]]
#    Param = [Param tmp]
#end
#Param = Param[:,2:end]
#writedlm("Ensemble/Param",Param)
Param = readdlm("Ensemble/Param")

remaining_sets = (1:num_dir .== 1:num_dir)
Index = Int64[]
for j in 1:1000
    println(j)
    index = FindMin(Cost)
    push!(Index,index)
    remaining_sets[index] = false

    remaining_indices = [1:num_dir][collect(find(remaining_sets))]
    p_ref = Param[:,index]
    C = Float64[]
    for i in remaining_indices
        p = Param[:,i]
        c = cor(p_ref,p)
        push!(C,c)
    end

    remaining_sets[remaining_indices[find(C.>.999991)]] = false
    remaining_indices = [1:num_dir][collect(find(remaining_sets))]
    
    Cost = 777*ones(length(Cost_original))
    Cost[remaining_indices] = Cost_original[remaining_indices]
end

#Z = zeros(length(S),length(S))
#for i in 1:length(S)
#    p1 = Param[:,S[i]]
#    for j in i+1:length(S)
#        p2 = Param[:,S[j]]
#        Z[i,j] = cor(p1,p2)
#        Z[j,i] = cor(p1,p2)
#    end
#end

