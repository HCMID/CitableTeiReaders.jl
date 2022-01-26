"Singleton type for TEI document cited by poetic line using TEI `l`."
struct TEIPoeticLine <: CiteStructureTrait end

"Implementation of `readcitable` for type `TEIPoeticLine`."
function readcitable(src::AbstractString, urn::CtsUrn, rdr::Type{TEIPoeticLine})
    doc = parsexml(src)
    xp = "/ns:TEI/ns:text/ns:body/ns:l"
    blocks = findall(xp, doc.root,["ns"=> teins])
    cnodes = map(b -> citeNAttr(b, urn), blocks)
    CitableTextCorpus(cnodes)
end
