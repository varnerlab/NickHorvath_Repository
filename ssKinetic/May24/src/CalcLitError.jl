function CalcLitError(params)

num_rxn = 188 # Exclude TX/TL reactions
avg_val = 145

lit_vals = avg_val*ones(num_rxn)

lit_vals[4] = 5544
lit_vals[12] = 43
lit_vals[14] = 11
lit_vals[16] = 132
lit_vals[18] = 250
lit_vals[20] = 354
lit_vals[23] = 32
lit_vals[25] = 32
lit_vals[26] = 32
lit_vals[39] = 420
lit_vals[42] = 119
lit_vals[45] = 47
lit_vals[46] = 1.21
lit_vals[50] = 330
lit_vals[65] = 354
lit_vals[66] = 354
lit_vals[74] = 58
lit_vals[79] = 131
lit_vals[81] = 258
lit_vals[115] = 104
lit_vals[120] = 120
lit_vals[122] = 122

p = params[1:num_rxn]

error = abs(log(p./lit_vals))

weight = ones(num_rxn)
weight[[4;12;14;16;18;20;23;25;26;39;42;45;46;50;65;66;74;79;81;115;120;122]] = 3

error .*= weight

off_rxns = (p.==0) # Remove errors for reactions that are turned off
error = error[!off_rxns]

rev_rxns = [3;7;9;11;13;15;17;24;28;30;32;34;36;41;43;49;51;68;70;73;75;80;114;134;136] # Remove all reverse reactions
sort!(rev_rxns,rev=true) # Sort descending for proper array deletion

for rxn in rev_rxns
    deleteat!(error,rxn)
end

cost = sum(error)

return cost
end
