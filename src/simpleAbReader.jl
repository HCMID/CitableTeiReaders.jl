
"Singleton type for TEI document cited by prose block using TEI `ab`."
struct TEIAnonblock <: CiteStructureTrait end

"Implementation of `readcitable` for type `TEIAnonblock`."
function readcitable(src::AbstractString, urn::CtsUrn, rdr::Type{TEIAnonblock})
    doc = parsexml(src)
    xp = "/ns:TEI/ns:text/ns:body/ns:ab"
    blocks = findall(xp, doc.root,["ns"=> teins])
    cnodes = map(b -> citeNAttr(b, urn),blocks)
    CitableTextCorpus(cnodes)
end
