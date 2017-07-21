include("MassBalances.jl")
using Sundials

function SolveBalances(time_vector,flux_array)

fbalances(t,y,ydot) = MassBalances(t,x,dxdt_vector,time_vector,flux_array)
X = Sundials.cvode(fbalances,initial_condition_vector,time_vector;integrator=:BDF)

return (time_vector,X)
end
