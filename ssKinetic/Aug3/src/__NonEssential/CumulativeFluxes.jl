num_flux = convert(Int64,readcsv("flux/num_flux")[1])
freq = 1
flux_array = readcsv("flux/$freq")
FA = zeros(length(flux_array),num_flux)
for i in 2*freq:freq:num_flux
    FA[:,i] = readcsv("flux/$i")
end
flux_array = sortrows(FA')' # Sort columns of flux_array, if timepoints are out of order
Tsim = vec(flux_array[1,:])
flux_array = flux_array[2:end,:]

writedlm("Flux/Tsim",Tsim)
writedlm("Flux/flux_array",flux_array)

flux_array = readdlm("Flux/flux_array")
Tsim = readdlm("Flux/Tsim")

Cumulative = zeros(size(flux_array))
for i in 1:size(flux_array,1)
	flux_vector = flux_array[i,:]
	cumulative = [0;cumsum(.5*(Tsim[2:end]-Tsim[1:end-1]).*(flux_vector[2:end]+flux_vector[1:end-1]))] # Integrate using trapezoid rule
	Cumulative[i,:] = cumulative
end

# Setup the timescale
TSTART = 0.0
TSTOP = 3.0
Ts = 0.01

T_interval = collect(TSTART:Ts:TSTOP)

Idx = Int64[]
for t in T_interval
	t_diff = abs(t-Tsim)
	idx = find(t_diff.==minimum(t_diff))
	push!(Idx,idx[Int64(ceil(end/2))])
end

CI = Cumulative[:,Idx]

CI_overall = CI[:,end]
CI_phase1 = CI[:,101]
CI_phase2 = CI[:,end]-CI[:,101]
writedlm("Flux/CI",CI_overall)
writedlm("Flux/CI_1",CI_phase1)
writedlm("Flux/CI_2",CI_phase2)

