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
# One-tier citation:
export TEIPoeticLine, TEIAnonblock
# Two-tier citation:
# Three-tier citation:
export TEIDivDivDiv, TEIThreeDivsGrouped

include("generic.jl")
include("xmlutilities.jl")

include("poeticLineReader.jl")
include("simpleAbReader.jl")
include("threedivReader.jl")
include("groupedThreeDiv.jl")

#=
include("twoTierReaders.jl")
include("threeTierReaders.jl")
include("twocolumnReader.jl")
=#


end # module
