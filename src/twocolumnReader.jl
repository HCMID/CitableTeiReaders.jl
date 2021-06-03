
"""
$(SIGNATURES)
Read a delimited-text file with CTS URN and text content
using pipe character as delimiter.
"""
function twocolumnReader(txt::AbstractString, urnPlaceHolder=nothing)::CitableTextCorpus
    lines = split(txt,"\n")
    nonempty = filter(ln -> ! isempty(ln), lines)
    nodes = map(ln -> nodefromline(ln), nonempty)
    CitableTextCorpus(nodes)
end


function nodefromline(s::AbstractString)
    cols = split(s, "|")
    if length(cols) != 2
        nothing
    else
        urn = CtsUrn(cols[1])
        CitableNode(urn, cols[2])
    end
end