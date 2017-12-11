include("SolveModel.jl")
TX_Vmax = 146.38631119332987
TL_Vmax = 493.99999999999994

prod_orig = SolveModel([log(10,TX_Vmax) log(10,TL_Vmax)])
prod_TX_up_2 = SolveModel([log(10,TX_Vmax*2) log(10,TL_Vmax)])
prod_TL_up_2 = SolveModel([log(10,TX_Vmax) log(10,TL_Vmax*2)])
prod_TX_down_2 = SolveModel([log(10,TX_Vmax/2) log(10,TL_Vmax)])
prod_TL_down_2 = SolveModel([log(10,TX_Vmax) log(10,TL_Vmax/2)])
prod_TX_up_10 = SolveModel([log(10,TX_Vmax*10) log(10,TL_Vmax)])
prod_TL_up_10 = SolveModel([log(10,TX_Vmax) log(10,TL_Vmax*10)])
prod_TX_down_10 = SolveModel([log(10,TX_Vmax/10) log(10,TL_Vmax)])
prod_TL_down_10 = SolveModel([log(10,TX_Vmax) log(10,TL_Vmax/10)])

println("Base-case: ",round(1000*prod_orig,1))
println("TX up 2: ",round(1000*prod_TX_up_2,1))
println("TL up 2: ",round(1000*prod_TL_up_2,1))
println("TX down 2: ",round(1000*prod_TX_down_2,1))
println("TL down 2: ",round(1000*prod_TL_down_2,1))
println("TX up 10: ",round(1000*prod_TX_up_10,1))
println("TL up 10: ",round(1000*prod_TL_up_10,1))
println("TX down 10: ",round(1000*prod_TX_down_10,1))
println("TL down 10: ",round(1000*prod_TL_down_10,1))


