X = readdlm("Best/X")
Tsim = readdlm("Best/Tsim")

pyr = X[:,102]
start_idx = 101 #find(pyr.==maximum(pyr))[1]
end_idx = find(pyr[start_idx:end].<.001)[1]+start_idx-1
pyr_cons_rate = (pyr[start_idx]-pyr[end_idx])/(Tsim[end_idx]-Tsim[start_idx])

lac = X[:,104]
start_idx = 101
end_idx = 301
lac_cons_rate = (lac[start_idx]-lac[end_idx])/(Tsim[end_idx]-Tsim[start_idx])

succ = X[:,118]
start_idx = 101
end_idx = 301
succ_cons_rate = (succ[start_idx]-succ[end_idx])/(Tsim[end_idx]-Tsim[start_idx])

mal = X[:,105]
start_idx = 101
end_idx = 301
mal_cons_rate = (mal[start_idx]-mal[end_idx])/(Tsim[end_idx]-Tsim[start_idx])

ac = X[:,103]
start_idx = 101
end_idx = 301
ac_acc_rate = (ac[end_idx]-ac[start_idx])/(Tsim[end_idx]-Tsim[start_idx])

X_nc = readdlm("Best/X_nc")

pyr = X_nc[:,102]
start_idx = 101
end_idx = find(pyr[start_idx:end].<.001)[1]+start_idx-1
pyr_cons_rate_nc = (pyr[start_idx]-pyr[end_idx])/(Tsim[end_idx]-Tsim[start_idx])

lac = X_nc[:,104]
start_idx = 101
end_idx = 301
lac_cons_rate_nc = (lac[start_idx]-lac[end_idx])/(Tsim[end_idx]-Tsim[start_idx])

succ = X_nc[:,118]
start_idx = 101
end_idx = 301
succ_cons_rate_nc = (succ[start_idx]-succ[end_idx])/(Tsim[end_idx]-Tsim[start_idx])

mal = X_nc[:,105]
start_idx = 101
end_idx = 301
mal_cons_rate_nc = (mal[start_idx]-mal[end_idx])/(Tsim[end_idx]-Tsim[start_idx])

ac = X_nc[:,103]
start_idx = 101
end_idx = 301
ac_acc_rate_nc = (ac[end_idx]-ac[start_idx])/(Tsim[end_idx]-Tsim[start_idx])

org_acids = [pyr_cons_rate;lac_cons_rate;succ_cons_rate;mal_cons_rate;ac_acc_rate]

org_acids_nc = [pyr_cons_rate_nc;lac_cons_rate_nc;succ_cons_rate_nc;mal_cons_rate_nc;ac_acc_rate_nc]

percent_increase = round((org_acids_nc-org_acids)./org_acids*100,0)

[["pyruvate";"lactate";"succinate";"malate";"acetate"] org_acids org_acids_nc percent_increase]
