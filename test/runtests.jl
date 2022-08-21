using MaxPro
using Test
using Random

@testset "MaxPro.jl" begin
    _design0 = [23 2 7 9 18 7 14 3;
                16 24 14 5 9 20 2 21;
                12 10 5 13 17 25 7 1;
                5 23 17 14 12 10 1 2;
                9 17 3 18 23 14 22 15;
                13 20 21 3 25 9 9 12;
                8 8 9 17 5 1 23 4;
                25 21 16 10 4 23 17 8;
                7 1 11 2 20 3 11 19;
                20 6 12 22 13 24 24 18;
                21 9 15 21 19 5 5 5;
                11 19 2 1 14 4 8 16;
                19 11 25 20 1 15 16 7;
                22 18 1 24 8 11 10 9;
                1 5 19 25 10 8 15 17;
                24 14 20 12 22 19 20 22;
                10 15 8 23 15 13 3 25;
                4 22 6 19 2 18 13 13;
                6 13 24 16 24 22 21 10;
                17 4 4 6 11 17 12 24;
                18 3 22 11 6 12 4 20;
                3 12 10 4 3 16 18 6;
                2 7 23 8 16 21 6 14;
                15 25 18 15 7 6 19 23;
                14 16 13 7 21 2 25 11]
    n, d = size(_design0)
    design0, _ = MaxPro.LHCoptim(n, d, 1000; rng = MersenneTwister(0))
    @test design0 == _design0
    design0 = (design0 .- one(n)) ./ (n - one(n))
    @test isapprox(MaxPro.max_pro_criterion(design0), 30.4333599696552, atol = 1e-7)
    @test isapprox(MaxPro.max_pro_criterion(max_pro_design(design0)), 18.95863107020731,
                   atol = 1e-7)
    @test isapprox(MaxPro.max_pro_criterion(max_pro_design(n, d)), 18.95863107020731,
                   atol = 1e-7)
    @test_throws DomainError max_pro_design(-1, 1)
    @test_throws DomainError max_pro_design(1, -1)
end
