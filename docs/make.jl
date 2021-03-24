using Pkg
pkg"activate ."
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
