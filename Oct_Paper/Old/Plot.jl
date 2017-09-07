using PyPlot

function Plot(Upper,Lower,experimental_time,time_state_array)

species_names = SpeciesNames()

for i in 1:5
	figure(figsize=(23,13))
	for j in 30*(i-1)+1:30*i
		if j <= 146
			subplot(5,6,rem(j-1,30)+1)
			plot(experimental_time,time_state_array[j,:],"k")
			fill_between(experimental_time,Upper[species_names[j]],Lower[species_names[j]],color="lightblue")
			title(species_names[j])
		end
	end
	tight_layout()
end

return nothing
end
