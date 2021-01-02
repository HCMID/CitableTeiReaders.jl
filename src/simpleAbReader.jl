



"""
$(SIGNATURES)
Read a TEI document with 1-tier citation values on `/TEI/text/body/ab` elements.

# Examples
```julia-repl
julia>
corpus = simpleAbReader(xmlString, CtsUrn("urn:cts:lycian:tl56.v1:") )
```
"""
function simpleAbReader(xml::AbstractString, urnBase::CtsUrn)
    doc = parsexml(xml)
    xp = "/ns:TEI/ns:text/ns:body/ns:ab"
    blocks = findall(xp, doc.root,["ns"=> teins])
    blocks
end


"""
$(SIGNATURES)
Construct a `CitableNode` from an `ab` element with citable value on `@n` attribute.
"""
function abNode(n, docUrn::CtsUrn)::CitableNode
    nodeUrn = addpassage(docUrn,n["n"])
    CitableNode(nodeUrn, n.content)
end