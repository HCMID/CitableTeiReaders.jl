module CitableTeiReaders

using CitableBase
using CitableText
using CitableCorpus

using EzXML
using HTTP

using Documenter, DocStringExtensions

export ezxmlstring
export readcitable

# Delimited-text citation
export DelimitedText

# One-tier XML citation:
export TEIPoeticLine

export TEIAnonblock
# Two-tier XML citation:
export TEIDivAb
export TEIDivLine
# Three-tier XML citation:
export TEIDivDivDiv, TEIDivDivLine, TEIThreeDivsGrouped
export TEIDivTableRow

include("generic.jl")
include("xmlutilities.jl")

include("poeticLineReader.jl")


include("simpleAbReader.jl")

include("divAbReader.jl")
include("divLineReader.jl")
include("divDivLineReader.jl")

include("threedivReader.jl")
include("groupedThreeDiv.jl")

include("twocolumnReader.jl")
include("divTableRowReader.jl")

end # module
