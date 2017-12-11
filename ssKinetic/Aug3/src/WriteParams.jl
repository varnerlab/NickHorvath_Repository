rate = readdlm("../Best/rate_constant.dat")
TX_Vmax = rate[181]
TX_Vmax_lower_bound = TX_Vmax/10
TX_Vmax_upper_bound = TX_Vmax*10
TX_Vmax_log_lower_bound = log(10,TX_Vmax_lower_bound)
TX_Vmax_log_upper_bound = log(10,TX_Vmax_upper_bound)

TL_Vmax = rate[184]
TL_Vmax_lower_bound = TL_Vmax/10
TL_Vmax_upper_bound = TL_Vmax*10
TL_Vmax_log_lower_bound = log(10,TL_Vmax_lower_bound)
TL_Vmax_log_upper_bound = log(10,TL_Vmax_upper_bound)

params = ["TX_Vmax" TX_Vmax_log_lower_bound TX_Vmax_log_upper_bound; "TL_Vmax" TL_Vmax_log_lower_bound TL_Vmax_log_upper_bound]
writedlm("Parameters.txt",params)
