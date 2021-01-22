



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
        top = d["n"]            
        for div2 in eachelement(div1)
            cn = citeNAttr(ab, urnBase, top * "." * div1["n"]         
            push!(citableNodes, cn)
        end
    end
    CitableCorpus(citableNodes)
end




"""
$(SIGNATURES)
Read a TEI document with two citation tiers on `/TEI/text/body/div` and contained `l` elements.
"""
function divLineReader(xml::AbstractString, urnBase::CtsUrn)::CitableCorpus
    doc = parsexml(xml)
    xp = "/ns:TEI/ns:text/ns:body/ns:div"
    divs = findall(xp, root(doc),["ns"=> teins])
    citableNodes = []
    # two-tier for loop:
    for d in divs
        psg = d["n"]            
        for l in eachelement(d)
            cn = citeNAttr(ab, urnBase, psg)            
            push!(citableNodes, cn)
        end
    end
    CitableCorpus(citableNodes)
end