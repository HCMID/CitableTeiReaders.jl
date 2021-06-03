module CitableTeiReaders

using CitableText, CitableCorpus, EzXML
using Documenter, DocStringExtensions

export ezxmlstring
export twocolumnReader
export simpleAbReader, poeticLineReader
export divAbReader, divLineReader
export threeDivReader, groupedThreeDivReader

include("xmlutilities.jl")
include("simpleAbReader.jl")
include("poeticLineReader.jl")
include("twoTierReaders.jl")
include("threeTierReaders.jl")
include("twocolumnReader.jl")



end # module
