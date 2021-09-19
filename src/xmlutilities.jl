


"TEI namespace"
teins = "http://www.tei-c.org/ns/1.0"


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
Construct a `CitablePassage` from an  element with a citable value on `@n` attribute.
"""
function citeNAttr(n, docUrn::CtsUrn)::CitablePassage
    try
        nodeUrn = addpassage(docUrn,n["n"])
        CitablePassage(nodeUrn, ezxmlstring(n))
    catch e
        throw(DomainError("No `n` attribute found for XML node with content $(n.content)"))
    end
end


"""
$(SIGNATURES)
Construct a `CitablePassage` from an  element with citable value on `@n` attribute.
"""
function citeNAttr(n, docUrn::CtsUrn, psg::AbstractString)::CitablePassage
    try 
        nattr = n["n"]
        nodeUrn = addpassage(docUrn,psg * "." * nattr)
        CitablePassage(nodeUrn, ezxmlstring(n))
    catch e
        throw(DomainError("No `n` attribute found for XML node with content $(n.content)"))
    end

end
