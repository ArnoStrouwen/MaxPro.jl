```@meta
CurrentModule = MaxPro
```

# MaxPro: maximum projection designs

Implementation of maximum projection designs by
[Joseph et al. (2015).](https://www.osti.gov/pages/servlets/purl/1405144)
These are space filling designs that not only try to fill up the entire design space,
but also, all projections of the design space to a subset of factors.
Often only a limited subset of factors play an important role,
while other factors turn out to not be very influential.
A design that fills the design space projected
onto the important factors performs well in that situation.
But apriori  we do not know which subset is active,
thus all subsets must be considered.

To generate 25 points in an 8 dimensional factor space,
with all factors automatically constrained between 0 and 1,
we can do:
```@example ex1
using MaxPro
opt_design = max_pro_design(25,8)
```
We can visualize the projection onto the first two factors:
```@example ex1
using Plots
scatter!(opt_design[:,1],opt_design[:,2],label="MaxPro")
plot!(legendposition=:outertopright,grid=false,xlabel="factor 1",ylabel="factor 2")
```

## API
```@autodocs
Modules = [MaxPro]
```
