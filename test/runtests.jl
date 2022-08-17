using MaxPro
using Test
using Random

@testset "MaxPro.jl" begin
    n,d = 25,8
    design0, _ = MaxPro.LHCoptim(n,d,1000;rng=MersenneTwister(0))
    design0 = (design0.-one(n))./(n-one(n))
    @test MaxPro.max_pro_criterion(design0) ≈ 30.4333599696552
    @test MaxPro.max_pro_criterion(max_pro_design(design0)) ≈ 19.7820616759956
    @test MaxPro.max_pro_criterion(max_pro_design(n,d)) ≈ 19.7820616759956
    @test_throws DomainError max_pro_design(-1,1)
    @test_throws DomainError max_pro_design(1,-1)
end
