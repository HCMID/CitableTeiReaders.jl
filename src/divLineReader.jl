"Singleton type for TEI document cited in two tiers using TEI `div` and `l`."
struct TEIDivLine <: CiteStructureTrait end

"Implementation of `readcitable` for type `TEIDivLine`."
function readcitable(src::AbstractString, urn::CtsUrn, rdr::Type{TEIDivLine})
    doc = parsexml(src)
    xp = "/ns:TEI/ns:text/ns:body/ns:div"
    divs = findall(xp, root(doc),["ns"=> teins])
    CitablePassages = []
    # two-tier for loop:
    for d in divs
        psg = d["n"]            
        for l in eachelement(d)
            cn = citeNAttr(l, urn, psg)            
            push!(CitablePassages, cn)
        end
    end
    CitableTextCorpus(CitablePassages)
end

