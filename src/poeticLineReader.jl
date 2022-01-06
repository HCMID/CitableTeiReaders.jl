#=
"""
$(SIGNATURES)
Read a TEI document with 1-tier citation values on `/TEI/text/body/l` elements.
"""
function poeticLineReader(xml::AbstractString, urnBase::CtsUrn)::CitableTextCorpus
    doc = parsexml(xml)
    xp = "/ns:TEI/ns:text/ns:body/ns:l"
    blocks = findall(xp, doc.root,["ns"=> teins])
    cnodes = map(b -> citeNAttr(b, urnBase), blocks)
    CitableTextCorpus(cnodes)
end

=#


"Singleton type for TEI document cited by poetic line."
struct TEIPoeticLine <: CiteStructureTrait end

"Implementation of `readcitable` for type `TEIPoeticLine`."
function readcitable(src::AbstractString, urn::CtsUrn, rdr::Type{TEIPoeticLine})
    doc = parsexml(src)
    xp = "/ns:TEI/ns:text/ns:body/ns:l"
    blocks = findall(xp, doc.root,["ns"=> teins])
    cnodes = map(b -> citeNAttr(b, urn), blocks)
    CitableTextCorpus(cnodes)
end
