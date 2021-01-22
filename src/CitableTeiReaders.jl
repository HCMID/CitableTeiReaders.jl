module CitableTeiReaders

using CitableText, EzXML, Documenter, DocStringExtensions

export ezxmlstring
export simpleAbReader, poeticLineReader
export twocolumnReader
export divAbReader


include("xmlutilities.jl")
include("simpleAbReader.jl")
include("poeticLineReader.jl")
include("divAbReader.jl")
include("twocolumnReader.jl")



end # module
