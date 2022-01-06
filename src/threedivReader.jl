"Singleton type for TEI document cited by poetic line."
struct TEIDivDivDiv <: CiteStructureTrait end

"Implementation of `readcitable` for type `TEIDivDivDiv`."
function readcitable(src::AbstractString, urn::CtsUrn, rdr::Type{TEIDivDivDiv})
    doc = parsexml(src)
    xp = "/ns:TEI/ns:text/ns:body/ns:div"
    divs = findall(xp, root(doc),["ns"=> teins])
    CitablePassages = []
    # three-tier for loop:
    for div1 in divs
        toppsg = div1["n"]            
        for div2 in eachelement(div1)
            tier2psg = toppsg * "." * div2["n"]
            for div3 in eachelement(div2)
                cn = citeNAttr(div3, urn, tier2psg)       
                push!(CitablePassages, cn)
            end
        end
    end
    CitableTextCorpus(CitablePassages)
end
