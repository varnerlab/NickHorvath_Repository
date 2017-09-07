function CalcError(Upper,Lower,experimental_time,time_state_array)

species_names = SpeciesNames()

error = zeros(1,length(species_names))
for i in 1:length(species_names)
	u = Upper[species_names[i]]
	l = Lower[species_names[i]]
	sim = time_state_array[i,:]
	
	error[i] = sum(max(0,sim-u)+max(0,l-sim))
end

return error
end
