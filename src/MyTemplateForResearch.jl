module MyTemplateForResearch

using LinearAlgebra

# Write your package code here.

# -----------------------------------------------
# utils
include("utils/calc.jl")
export drop_noise

# -----------------------------------------------
# core
include("core/main.jl")
# export

end # module MyTemplateForResearch
