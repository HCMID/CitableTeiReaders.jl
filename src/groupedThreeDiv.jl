
"Singleton type for grouped TEI documents cited in three tiers using TEI `group`, `div` and `div`."
struct TEIThreeDivsGrouped <: CiteStructureTrait end

"Implementation of `readcitable` for type `TEIThreeDivsGrouped`."
function readcitable(src::AbstractString, urn::CtsUrn, rdr::Type{TEIThreeDivsGrouped})
    urnwork = split(workcomponent(urn), ".")[2]
    doc = parsexml(src)
    xp = "/ns:TEI/ns:text/ns:group"
    groups = findall(xp, root(doc),["ns"=> teins])
    CitablePassages = []
    # three-tier for loop:
    for grp in groups
        toppsg = grp["n"] 
        for teitext in elements(grp) 
            #teitext = elements(grp)[1]
            workid = teitext["n"]
            
            if workid != urnwork
                # Skip it
            else
                teibody = elements(teitext)[1]
                for div1 in eachelement(teibody)
                
                    tier2psg = toppsg * "." * div1["n"]
                    for div2 in eachelement(div1)
                        cn = citeNAttr(div2, urn, tier2psg)       
                        push!(CitablePassages, cn)
                    end
                end
            end
        end
    end
    CitableTextCorpus(CitablePassages)
end

