module MaxPro

function sample(n::Int,lb::AbstractVector{T},ub::AbstractVector{T}) where T
    design = lb
    for i in 2:n
        design = hcat(design,lb)
    end
    return design
end

end