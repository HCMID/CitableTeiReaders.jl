



"""
$(SIGNATURES)
Read a TEI document with two citation tiers on `/TEI/text/body/div` and contained `ab` elements.
"""
function threeDivReader(xml::AbstractString, urnBase::CtsUrn)::CitableCorpus
    doc = parsexml(xml)
    xp = "/ns:TEI/ns:text/ns:body/ns:div"
    divs = findall(xp, root(doc),["ns"=> teins])
    citableNodes = []
    # three-tier for loop:
    for div1 in divs
        toppsg = div1["n"]            
        for div2 in eachelement(div1)
            tier2psg = toppsg * "." * div2["n"]
            for div3 in eachelement(div2)
                cn = citeNAttr(div3, urnBase, tier2psg)       
                push!(citableNodes, cn)
            end
        end
    end
    CitableCorpus(citableNodes)
end
