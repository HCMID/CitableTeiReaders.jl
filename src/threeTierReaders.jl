



"""
Read a TEI document with three citation tiers on `/TEI/text/body/div` and contained `ab` elements.
$(SIGNATURES)
"""
function threeDivReader(xml::AbstractString, urnBase::CtsUrn)::CitableTextCorpus
    doc = parsexml(xml)
    xp = "/ns:TEI/ns:text/ns:body/ns:div"
    divs = findall(xp, root(doc),["ns"=> teins])
    CitablePassages = []
    # three-tier for loop:
    for div1 in divs
        toppsg = div1["n"]            
        for div2 in eachelement(div1)
            tier2psg = toppsg * "." * div2["n"]
            for div3 in eachelement(div2)
                cn = citeNAttr(div3, urnBase, tier2psg)       
                push!(CitablePassages, cn)
            end
        end
    end
    CitableTextCorpus(CitablePassages)
end


"""Read a TEI document with trhee citation tiers on 
`/TEI/text/group/text`; contained `/body/div` and
contained `div` elements. The base URN is modified
by using the `group`element's URN as the work component's
work identifier.

$(SIGNATURES)
"""
function groupedThreeDivReader(xml::AbstractString, urnBase::CtsUrn)::CitableTextCorpus
    urnwork = split(workcomponent(urnBase), ".")[2]
    doc = parsexml(xml)
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
                        cn = citeNAttr(div2, urnBase, tier2psg)       
                        push!(CitablePassages, cn)
                    end
                end
            end
        end
    end
    CitableTextCorpus(CitablePassages)
end
