module MaxPro

using LatinHypercubeSampling
using Optimization, OptimizationNLopt
using ReverseDiff
using Random

function max_pro_criterion(design::AbstractArray{T},p::NamedTuple{(:n, :d), Tuple{V, V}}) where{T, V<:Integer}
    n,d = p.n, p.d
    design = reshape(design,n,d)
    return max_pro_criterion(design)
end
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
function max_pro_design(design0::Matrix{T}) where T
    n,d = size(design0)
    design0 = reshape(design0,n*d)
    f = OptimizationFunction(max_pro_criterion, Optimization.AutoReverseDiff())
    opti_prob = OptimizationProblem(f, design0, (n=n,d=d), lb = zeros(n*d), ub = ones(n*d))
    opti_sol = solve(opti_prob, NLopt.LD_LBFGS()) #TBD: make BFGS options available to user
    return reshape(opti_sol.u,n,d)
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
