include("DataDictionary.jl")
include("FluxDriver.jl")
include("calculate_constraints.jl")
include("./data/Unpack.jl")
include("Bounds.jl")
include("TXTLDictionary.jl")
include("Utility.jl")
include("CalcError.jl")
include("Plot.jl")
#using PyPlot
using Interpolations
using GLPK
term_out(GLPK.OFF)
