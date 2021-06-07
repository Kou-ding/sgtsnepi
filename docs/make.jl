using SGtSNEpi
using Documenter
using DocumenterCitations

bib = CitationBibliography(joinpath(@__DIR__, "sgtsnepi.bib"))

DocMeta.setdocmeta!(SGtSNEpi, :DocTestSetup, :(using SGtSNEpi); recursive=true)

makedocs( bib,
    modules=[SGtSNEpi],
    authors="Nikos Pitsianis <nikos@cs.duke.edu>, Dimitris Floros <fcdimitr@ece.auth.gr>, Alexandros-Stavros Iliopoulos <ailiop@mit.edu>, Xiaobai Sun <xiaobai@cs.duke.edu>",
    repo="https://github.com/fcdimitr/SGtSNEpi.jl/blob/{commit}{path}#{line}",
    sitename="SGtSNEpi.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://fcdimitr.github.io/SGtSNEpi.jl",
        assets=String[],
    ),
    doctest = false,
    pages=[
      "Home" => "index.md",
      "API" => "API.md",
    ],
)

deploydocs(;
    repo="github.com/fcdimitr/SGtSNEpi.jl",
)
