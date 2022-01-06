module CitableTeiReaders

using CitableBase
using CitableText
using CitableCorpus

using EzXML
using HTTP



using Documenter, DocStringExtensions



export ezxmlstring
#=
export twocolumnReader
export simpleAbReader, poeticLineReader
export divAbReader, divLineReader
export threeDivReader, groupedThreeDivReader
=#


export readcitable
export TEIPoeticLine, TEIAnonblock

include("generic.jl")
include("poeticLineReader.jl")



include("xmlutilities.jl")
include("simpleAbReader.jl")

include("twoTierReaders.jl")
include("threeTierReaders.jl")
include("twocolumnReader.jl")



end # module
