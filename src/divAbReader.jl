



"""
$(SIGNATURES)
Read a TEI document with two citation tiers on `/TEI/text/body/div` and contained `ab` elements.
"""
function divAbReader(xml::AbstractString, urnBase::CtsUrn)::CitableCorpus
    doc = parsexml(xml)
    xp = "/ns:TEI/ns:text/ns:body/ns:div"
    divs = findall(xp, root(doc),["ns"=> teins])
    citableNodes = []
    # two-tier for loop:
    for d in divs
        psg = d["n"]            
        for ab in eachelement(d)
            cn = citeNAttr(ab, urnBase, psg)            
            push!(citableNodes, cn)
        end
    end
    CitableCorpus(citableNodes)
end


