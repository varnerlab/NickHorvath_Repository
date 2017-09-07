include("Unpack.jl")

Mean = Unpack("data/Mean")
Std = Unpack("data/Std")
Upper = Unpack("data/Upper")
Lower = Unpack("data/Lower")

delete!(Mean,"OPEN_GENE_CAT")
delete!(Mean,"RIBOSOME_START_CAT")

delete!(Std,"OPEN_GENE_CAT")
delete!(Std,"RIBOSOME_START_CAT")

delete!(Upper,"OPEN_GENE_CAT")
delete!(Upper,"RIBOSOME_START_CAT")

delete!(Lower,"OPEN_GENE_CAT")
delete!(Lower,"RIBOSOME_START_CAT")
