include("SolveModel.jl")
Samples = readdlm("Samples.txt")
Productivity = Float64[]
for i in 1:size(Samples,1);println(i)
	params = Samples[i,:]
	productivity = SolveModel(params)
	push!(Productivity,productivity)
	mkdir("Sobol/$i")
	writedlm("Sobol/$i/productivity",productivity)
end
writedlm("Productivity.txt",Productivity)
