"""Create a `CitablePassage` from a string of delimited text.
"""
function nodefromline(s::AbstractString)
    cols = split(s, "|")
    if length(cols) != 2
        nothing
    else
        urn = CtsUrn(cols[1])
        CitablePassage(urn, cols[2])
    end
end



"Singleton type for delimited-text document with citation scheme of arbitrary depth already expressed with URNs."
struct DelimitedText <: CiteStructureTrait end

"Implementation of `readcitable` for type `DelimitedText`."
function readcitable(src::AbstractString, urn::Nothing, rdr::Type{DelimitedText})
    lines = split(src,"\n")
    nonempty = filter(ln -> ! isempty(ln), lines)
    nodes = map(ln -> nodefromline(ln), nonempty)
    CitableTextCorpus(nodes)
end
