module CitableTeiReaders

using CitableText, EzXML, Documenter, DocStringExtensions

export simpleAbReader

"TEI namespace"
teins = "http://www.tei-c.org/ns/1.0"

include("simpleAbReader.jl")

end # module
