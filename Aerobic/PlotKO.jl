include("Plot.jl")

Param = readdlm("Param")
colors = ["red";"purple";"blue";"green";"yellow";"orange";"pink"]

for i in 1:min(length(Param),length(colors))
#	parameter_vector = copy(Param)
#	parameter_vector[i] = 0
	parameter_vector = copy(Param)
	parameter_vector[1:7] = 0
	if 1==7
	parameter_vector[i] = 1e9
	else
	parameter_vector[i] = 10 #Param[i]
	end
	Param[15:21] = 1
	plot_color = colors[i]
#	figure()
	Plot(parameter_vector,plot_color)
end


#blue
#orange
#green
#red
#purple
#brown
#pink
