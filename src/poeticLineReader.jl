
"""
$(SIGNATURES)
Read a TEI document with 1-tier citation values on `/TEI/text/body/l` elements.
"""
function poeticLineReader(xml::AbstractString, urnBase::CtsUrn)::CitableCorpus
    doc = parsexml(xml)
    xp = "/ns:TEI/ns:text/ns:body/ns:l"
    blocks = findall(xp, doc.root,["ns"=> teins])
    cnodes = map(b -> citeNAttr(b, urnBase), blocks)
    CitableCorpus(cnodes)
end

