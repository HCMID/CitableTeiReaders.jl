module CitableTeiReaders
using CitableBase
using CitableText, CitableCorpus, EzXML
using Documenter, DocStringExtensions


#export citestructuretrait

export ezxmlstring
export twocolumnReader
export simpleAbReader, poeticLineReader
export divAbReader, divLineReader
export threeDivReader, groupedThreeDivReader

export readcitable
export TEIPoeticLine

include("generic.jl")
include("poeticLineReader.jl")



include("xmlutilities.jl")
include("simpleAbReader.jl")

include("twoTierReaders.jl")
include("threeTierReaders.jl")
include("twocolumnReader.jl")



end # module
