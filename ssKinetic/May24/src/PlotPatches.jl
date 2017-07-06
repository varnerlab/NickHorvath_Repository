using PyPlot
using PyCall

@pyimport matplotlib.patches as patches

number_of_cols = 19
number_of_rows = 19

# what are my colors?
color_2 = (1/255)*[255,238,225]
color_1 = (1/255)*[255,99,71]

# load data array -
raw_data_array = readdlm("Group_KO/Productivity_1.txt")
diagonal_array = diagm(diag(raw_data_array))
raw_data_array = raw_data_array - diagonal_array;

# decompese -
(D,V) = eig(raw_data_array)

# what are the big eigenvalues?
idx_eigenvalues = sortperm(abs(D),rev=true)

# grab the top 3 eigenvectors -
top_eigenvectors = abs(V[:,idx_eigenvalues[1:number_of_cols]])

# sort by the biggest -
idx_eigenvectors = sortperm(top_eigenvectors[:,1],rev=true)
data_slice = top_eigenvectors[idx_eigenvectors[1:number_of_rows],:]

# add an extra col for colorbar -
colorbar_col = vec(transpose(linspace(0,1,number_of_rows)))

# main drawing loop -
for col_index = 1:number_of_cols

  Z = data_slice[:,col_index]

  # scale Z -
  Z = abs(Z)
  min_value = minimum(Z)
  max_value = maximum(Z)

  if (min_value == max_value)
    data_scaled = 0.0
  else
    data_scaled = (Z-min_value)./(max_value - min_value)
  end



  # how many patches per col?
  number_of_patches = length(data_scaled)
  epsilon = 0.2;
  ax = gca()
  for row_index = 1:number_of_patches

    origin_point = [(col_index - 1)+(col_index - 1)*epsilon + 1,(row_index - 1)+(row_index - 1)*epsilon+1];

    # compute color -


    # what color?
    fraction = (data_scaled[row_index]^2)/(0.15+data_scaled[row_index]^2)
    color_value = fraction*color_1+(1-fraction)*color_2


    # draw the square -
    ax[:add_patch](

               patches.Rectangle(origin_point,   # (x,y)
                   1.0,          # width
                   1.0,          # height
                   facecolor=color_value,
                   edgecolor="grey",
                   linewidth=0.5,
               )
           )


  end
end

# add the colorbar -
for col_index = 1:1

  Z = colorbar_col

  # scale Z -
  Z = abs(Z)
  min_value = minimum(Z)
  max_value = maximum(Z)
  data_scaled = (Z-min_value)./(max_value - min_value)

  # how many patches per col?
  number_of_patches = length(data_scaled)
  epsilon = 0.2;
  ax = gca()
  for row_index = 1:number_of_patches

    origin_point = [(col_index - 1)+(col_index - 1)*epsilon+round(1.30*number_of_cols)+1,(row_index - 1)+(row_index - 1)*epsilon+1];

    # what color?
    fraction = (data_scaled[row_index]^2)/(0.15+data_scaled[row_index]^2)
    color_value = fraction*color_1+(1-fraction)*color_2


    # draw the square -
    ax[:add_patch](

               patches.Rectangle(origin_point,   # (x,y)
                   1.0,          # width
                   1.0,          # height
                   facecolor=color_value,
                   edgecolor="grey",
                   linewidth=0.5,
               )
           )


  end
end

axis("square")
axis("off")
savefig("Norm-System-Raw.pdf")
