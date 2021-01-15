module CitableTeiReaders

using CitableText, EzXML, Documenter, DocStringExtensions

export ezxmlstring
export simpleAbReader, poeticLineReader
export twocolumnReader


include("xmlutilities.jl")
include("simpleAbReader.jl")
include("poeticLineReader.jl")
include("twocolumnReader.jl")



end # module
