using Pkg
Pkg.activate(".")
Pkg.instantiate()

push!(LOAD_PATH,"..")

using Documenter, DocStringExtensions
using CitableText
using CitableTeiReaders
using EzXML

makedocs(
    sitename = "CitableTeiReaders",
    pages = [
        "Home" => "index.md",
        "Guide" => [
            "guide/guide.md"
        ],
        "API documentation" => [
            "man/index.md"
        ]
    ]
)

deploydocs(
    repo = "github.com/HCMID/CitableTeiReaders.jl.git",
)


