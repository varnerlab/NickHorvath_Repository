include("CalcError.jl")
include("DataDictionary.jl")

# Setup the timescale
TSTART = 0.0
TSTOP = 3.0
Ts = 0.01

# Create dictionary of parameters
data_dictionary_best = DataDictionary(TSTART,TSTOP,Ts)
experiment_data_dictionary = data_dictionary_best["EXPERIMENT_DATA_DICTIONARY"]

# Initialize number of parameters to be varied
num_rate = 408
num_rxn = convert(Int64,num_rate/2)
num_sat = 548
num_cont = 34
num_params = num_rate+num_sat+num_cont

num_dir = convert(Int64,readdlm("Ensemble/num_dir")[1])
Tsim = vec(readdlm("Ensemble/Best/Tsim"))

rate_best = vec(readdlm("Ensemble/Best/rate_constant.dat"))
sat_best = vec(readdlm("Ensemble/Best/saturation_constant.dat"))
cont_best = vec(readdlm("Ensemble/Best/control_constant.dat"))
params_best = [rate_best;sat_best[find(sat_best.>0)];cont_best]

#index = Int64[]
#cost = Float64[]
#pearson = Float64[]
for i in 1:num_dir
    if isdir("Ensemble/$i")
        println(i)
#        X = readdlm("Ensemble/$i/X")
#        Error,Keys = CalcError(experiment_data_dictionary,Tsim,X)
#        c = sum(Error)
        rate = vec(readdlm("Ensemble/$i/rate_constant.dat"))
        sat = vec(readdlm("Ensemble/$i/saturation_constant.dat"))
        cont = vec(readdlm("Ensemble/$i/control_constant.dat"))
        params = [rate;sat[find(sat.>0)];cont]
        p = cor(params,params_best)
#        push!(index,i)
#        push!(cost,c)
        push!(pearson,p)
#        writedlm("Ensemble/$i/cost_unweighted",c)
#        writedlm("Ensemble/$i/KE",[Keys Error])
    end
end
writedlm("Ensemble/ICP",[index cost pearson])

