module MaxPro

using LatinHypercubeSampling
using Optimization, OptimizationOptimJL
using ReverseDiff
using Random

function max_pro_criterion(design::AbstractMatrix{T}) where T
    n,d = size(design)
    sum_d = zero(T)
    for i in 1:n-1, j in i+1:n
        pointi = @view design[i,:]
        pointj = @view design[j,:]
        sum_d += inv(prod((pointi .- pointj).^2))
    end
    return (sum_d/T(binomial(n,2)))^T(1/d)
end
max_pro_criterion(design,p::SciMLBase.NullParameters) = max_pro_criterion(design)

function max_pro_design(design0::AbstractMatrix{T}) where T
    n,d = size(design0)
    f = OptimizationFunction(max_pro_criterion, Optimization.AutoReverseDiff())
    opti_prob = OptimizationProblem(f, design0, p=nothing, lb = zeros(n,d), ub = ones(n,d))
    opti_sol = solve(opti_prob, Fminbox(BFGS())) #TBD: make BFGS options available to user
    return opti_sol.u
end
function max_pro_design(n::Int,d::Int)
    n>zero(n) || throw(DomainError(n,"Number of design points n must be strictly positive"))
    d>zero(d) || throw(DomainError(d,"Dimensions d must be strictly positive"))
    design0, _ = LHCoptim(n,d,1000;rng=MersenneTwister(0)) #TBD: make LHC options available to user
    design0 = (design0.-one(n))./(n-one(n))
    max_pro_design(design0)
end
export max_pro_design
end
