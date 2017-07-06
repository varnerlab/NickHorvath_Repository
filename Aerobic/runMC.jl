include("Include.jl")
include("Objective.jl")

# Script to solve the balance equations -
time_start = 0.0
time_stop = 10.5
time_step_size = 0.01

u_dir = Float64[]
v_dir = Float64[]
t_dir = Float64[]
# Load the data dictionary -
data_dictionary = DataDictionary(time_start,time_stop,time_step_size)


#Initialize Parameter set
Param = zeros(13)
Param[1:7] = data_dictionary["rate_constant_array"]
Param[8] = data_dictionary["enzyme_synthesis_constant"]
Param[9] = data_dictionary["glc_saturation"]
Param[10] = data_dictionary["o2_saturation"]
Param[11] = data_dictionary["ac_saturation"]
Param[12] = data_dictionary["glc_anaerobic"]
Param[13] = data_dictionary["o2_mass_transfer"]
Param = readdlm("kbest.dat")

#Initialize Fit
cost = Objective(time_start,time_stop,time_step_size,data_dictionary,Param)
Best = cost

dt = 0.005 #step size
var_dt = 1.005
Temp = 1.0
#============================================#
for i = 1:500
  Param_new = Param + dt*randn(length(Param))
  Param_new = max(Param_new,0.001)

  cost_new = Objective(time_start,time_stop,time_step_size,data_dictionary,Param_new)
  Delta = cost_new - cost

  if (Delta < 0)
    cost = deepcopy(cost_new)
      if cost_new < Best
        Best = deepcopy(cost_new)
        writedlm("kbest.dat",Param_new)
      end
    dt = dt*var_dt
    Param = Param_new
  elseif rand() < exp(-Delta/Temp)
    cost = cost_new
    Param = Param_new
  else
    dt = dt/var_dt
  end

  println(i," ",Best," ", cost_new," ", Delta," ",dt)
  #writedlm("param_dir.dat",param_dir)
  #writecsv("ensemble.csv",cost,Param)
end

include("Driver.jl")
