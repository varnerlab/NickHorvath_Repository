include("DataDictionary.jl")
include("CalcAIC.jl")

# Setup the timescale
TSTART = 0.0
TSTOP = 3.0
Ts = 0.01

# Create dictionary of parameters
data_dictionary_best = DataDictionary(TSTART,TSTOP,Ts)
experiment_data_dictionary = data_dictionary_best["EXPERIMENT_DATA_DICTIONARY"]

# Calculate AIC of first set
Tsim = vec(readdlm("Ensemble/1/Tsim"))
X = readdlm("Ensemble/1/X")
AIC,Keys = CalcAIC(experiment_data_dictionary,Tsim,X)

# Calculate AIC of other sets
Ensemble_AIC = AIC
for i in 2:100
	X = readdlm("Ensemble/$i/X")
	AIC,Keys_new = CalcAIC(experiment_data_dictionary,Tsim,X)
	if Keys_new == Keys
		Ensemble_AIC = [Ensemble_AIC AIC]
	else
		throw("Keys are wrong")
	end
end
Ensemble_AIC = Array{Float64}(Ensemble_AIC)
#Ensemble_AIC_table = sortrows([Keys Ensemble_AIC])
#Ensemble_mean_std = [Ensemble_AIC_table[:,1] mean(tmp,2) std(tmp,2)]

# Calculate AIC of first set
Tsim = vec(readdlm("Rand/1/Tsim"))
X = readdlm("Rand/1/X")
AIC,Keys = CalcAIC(experiment_data_dictionary,Tsim,X)

# Calculate AIC of other sets
Rand_AIC = AIC
for i in 2:100
	X = readdlm("Rand/$i/X")
	AIC,Keys_new = CalcAIC(experiment_data_dictionary,Tsim,X)
	if Keys_new == Keys
		Rand_AIC = [Rand_AIC AIC]
	else
		throw("Keys are wrong")
	end
end
Rand_AIC = Array{Float64}(Rand_AIC)
#Rand_AIC_table = sortrows([Keys Rand_AIC])
#Rand_mean_std = [Rand_AIC_table[:,1] mean(tmp,2) std(tmp,2)]

Comparison_table = sortrows([Keys round(mean(Ensemble_AIC,2),1) round(std(Ensemble_AIC,2),1) round(mean(Rand_AIC,2),1) round(std(Rand_AIC,2),1) round(mean(Rand_AIC,2)-mean(Ensemble_AIC,2),1)])

#Diff = Rand_AIC-Ensemble_AIC
#Comparison_table = sortrows([Keys round(mean(Diff,2),1) round(std(Diff,2),1)])

