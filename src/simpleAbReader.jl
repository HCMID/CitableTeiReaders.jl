



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
    doc
end