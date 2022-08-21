using Revise
using MaxPro
using Plots

max_pro_design(25, 8)

#= scatter(design0[:,1],design0[:,2],grid=false,label="LHD")
scatter!(opti_sol.u[:,1],opti_sol.u[:,2],grid=false,label="MaxPro")
plot!(legendposition=:outertopright)
 =#
