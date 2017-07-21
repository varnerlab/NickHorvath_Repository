using Interpolations

function CalcErrorUnweighted(experiment_data_dictionary,Tsim,X)

# Initialize arrays
Error = Float64[]
Keys = AbstractString[]

for (key,dataset) in experiment_data_dictionary
    # Get raw data and timepoints
    raw_array = dataset.raw_measurement_array
    data_tps = raw_array[:,1]
    data_vals = raw_array[:,2]
    # Interpolate simulation array to fit dataset
    index = dataset.model_index
    sim = X[:,index]
    itp = interpolate((Tsim,),sim,Gridded(Linear()))
    sim_itp = itp[data_tps]
    # Calculate error
    norm_diff = (sim_itp-data_vals)/maximum(data_vals)
    error = sum(norm_diff.^2)
    # Push to arrays
    push!(Error,error)
    push!(Keys,key)
end

return Error,Keys
end
