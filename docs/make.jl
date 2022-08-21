using MaxPro
using Documenter

DocMeta.setdocmeta!(MaxPro, :DocTestSetup, :(using MaxPro); recursive = true)

makedocs(;
         modules = [MaxPro],
         authors = "ArnoStrouwen <arno.strouwen@telenet.be> and contributors",
         repo = "https://github.com/ArnoStrouwen/MaxPro.jl/blob/{commit}{path}#{line}",
         sitename = "MaxPro.jl",
         format = Documenter.HTML(;
                                  prettyurls = get(ENV, "CI", "false") == "true",
                                  canonical = "https://ArnoStrouwen.github.io/MaxPro.jl",
                                  assets = String[]),
         pages = [
             "Overview" => "index.md",
         ])

deploydocs(;
           repo = "github.com/ArnoStrouwen/MaxPro.jl",
           devbranch = "master")
