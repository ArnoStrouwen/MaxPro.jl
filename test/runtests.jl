using MaxPro
using Test

@testset "MaxPro.jl" begin
    @test MaxPro.sample(2,[0.0,0.1],[1.0,2.0]) == [0.0 0.0; 0.1 0.1]
end
