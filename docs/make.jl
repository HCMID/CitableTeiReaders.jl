using Pkg
pkg"activate .."
push!(LOAD_PATH,"../src/")
using Documenter, DocStringExtensions, CitableTeiReaders

makedocs(sitename = "CitableTeiReaders Documentation")
