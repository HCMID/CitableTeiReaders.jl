"Singleton type for TEI document cited three tiers using TEI `div`, `div` and `l`."
struct TEIDivDivLine <: CiteStructureTrait end

"Implementation of `readcitable` for type `TEIDivDivLine`."
function readcitable(src::AbstractString, urn::CtsUrn, rdr::Type{TEIDivDivLine})
    doc = parsexml(src)
    xp = "/ns:TEI/ns:text/ns:body/ns:div"
    divs = findall(xp, root(doc),["ns"=> teins])
    CitablePassages = []
    # two-tier for loop:
    for d in divs
        bk = d["n"]            
        for poem in eachelement(d)
            bkpoem = bk * "." * poem["n"]
            for poeticline in eachelement(poem)
                try 
                    cn = citeNAttr(poeticline, urn, bkpoem)            
                    push!(CitablePassages, cn)
                catch e
                    @warn("Error: $(e)")
                end
            end
        end
    end
    CitableTextCorpus(CitablePassages)
end

