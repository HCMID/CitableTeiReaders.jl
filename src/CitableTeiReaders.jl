module CitableTeiReaders

using CitableText, EzXML, Documenter, DocStringExtensions

export ezxmlstring
export simpleAbReader

"TEI namespace"
teins = "http://www.tei-c.org/ns/1.0"

include("simpleAbReader.jl")


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

end # module
