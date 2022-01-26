

"Singleton type for TEI document cited in two tiers using TEI `div` and `ab` elements."
struct TEIDivAb <: CiteStructureTrait end

"Implementation of `readcitable` for type `TEIDivAb`."
function readcitable(src::AbstractString, urn::CtsUrn, rdr::Type{TEIDivAb})
    doc = parsexml(src)
    xp = "/ns:TEI/ns:text/ns:body/ns:div"
    divs = findall(xp, root(doc),["ns"=> teins])
    CitablePassages = []
    # two-tier for loop:
    for d in divs
        psg = d["n"]            
        for ab in eachelement(d)
            cn = citeNAttr(ab, urn, psg)            
            push!(CitablePassages, cn)
        end
    end
    CitableTextCorpus(CitablePassages)
end
