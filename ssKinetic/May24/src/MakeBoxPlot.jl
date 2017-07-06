using PyPlot

# Load the data -
# Script to make BoxPlot in octave -
random_data = convert(Array{Float64},readdlm("Random_ensemble_error")[:,2:end]);
#random_data = convert(Array{Float64},readdlm("Random_e5_ensemble_error")[:,2:end]);
trained_data = convert(Array{Float64},readdlm("Ensemble_error")[:,2:end]);

# need to transpose the data -
random_data = transpose(random_data);
trained_data = transpose(trained_data);

# interlace -
(number_of_rows,number_of_cols) = size(random_data);

# ok, initialize a new array -
total_array = zeros(number_of_rows,1)
# for col_index = 1:number_of_cols
#   total_array = [total_array trained_data[:,col_index] random_data[:,col_index]];
# end
total_array = [total_array trained_data random_data];
total_array = total_array[:,2:end];

#----------------------------------
fill_between([42;85],[-8;-8],[8;8],color="lightgray",zorder=-1)
#----------------------------------

# Setup dictionaries -
boxprops_dictionary = Dict{String,String}();
flierprops_dictionary = Dict{String,String}();
whiskers_dictionary = Dict{String,String}();
capprops_dictionary = Dict{String,String}();
medianprops_dictionary = Dict{String,String}();

# plot the trained data -
boxprops_dictionary["color"] = "lightskyblue";
boxprops_dictionary["facecolor"] = "lightskyblue";

flierprops_dictionary["markerfacecolor"] = "lightskyblue";
flierprops_dictionary["markeredgecolor"] = "lightskyblue";

whiskers_dictionary["color"] = "lightskyblue"
capprops_dictionary["color"] = "lightskyblue"
medianprops_dictionary["color"] = "blue"
medianprops_dictionary["linewidth"] = "1"


boxplot(log(trained_data),manage_xticks=false,bootstrap=1000,sym=".",patch_artist=true,
  boxprops=boxprops_dictionary,
  flierprops=flierprops_dictionary,
  whiskerprops=whiskers_dictionary,
  medianprops=medianprops_dictionary,
  zorder=0);

# plot the random data -
boxprops_dictionary["color"] = "salmon";
boxprops_dictionary["facecolor"] = "salmon";

flierprops_dictionary["markerfacecolor"] = "salmon";
flierprops_dictionary["markeredgecolor"] = "salmon";

whiskers_dictionary["color"] = "salmon"
capprops_dictionary["color"] = "salmon"
medianprops_dictionary["color"] = "red"
medianprops_dictionary["linewidth"] = "1"

(number_of_rows_random,number_of_cols_random) = size(random_data);
positions = (number_of_cols+10):(number_of_cols_random+number_of_cols+9)
boxplot(log(random_data),manage_xticks=false,bootstrap=1000,sym=".",patch_artist=true,positions=positions,
  boxprops=boxprops_dictionary,
  flierprops=flierprops_dictionary,
  whiskerprops=whiskers_dictionary,
  capprops=capprops_dictionary,
  medianprops=medianprops_dictionary,
  zorder=0);

# Plot the "line ..."
mean_training = log(median(trained_data))*ones(number_of_cols);
plot(1:number_of_cols,mean_training,"b",lw=2,zorder=1)

mean_random = log(median(random_data))*ones(number_of_cols);
plot((number_of_cols+10):(2*number_of_cols+9),mean_random,"r",lw=2,zorder=1)

axis([0,85,-7,7])
plt[:xticks]([])
plt[:yticks](-6:2:6)



