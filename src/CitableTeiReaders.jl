module CitableTeiReaders

using CitableText, EzXML, Documenter, DocStringExtensions

export ezxmlstring
export simpleAbReader, poeticLineReader

"TEI namespace"
teins = "http://www.tei-c.org/ns/1.0"

include("simpleAbReader.jl")
include("poeticLineReader.jl")


"""
$(SIGNATURES)
Serialize an `EzXML.Node` to an XML string.
If a node `n` was created by parsing an XML string,
the output of `ezxmlstring(n)` should be XML equivalent
to the source string.
"""
function ezxmlstring(n::EzXML.Node)
	ibuff = IOBuffer()
	print(ibuff, n)
	String(take!(ibuff))
end


"""
$(SIGNATURES)
Construct a `CitableNode` from an  element with citable value on `@n` attribute.
"""
function citeNAttr(n, docUrn::CtsUrn)::CitableNode
    nodeUrn = addpassage(docUrn,n["n"])
    CitableNode(nodeUrn, ezxmlstring(n))
end

end # module
