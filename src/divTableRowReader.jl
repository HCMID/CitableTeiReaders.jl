"Singleton type for TEI document cited in three tiers using TEI `div`, `table` and `row`."
struct TEIDivTableRow <: CiteStructureTrait end

"Implementation of `readcitable` for type `TEIDivDivDiv`."
function readcitable(src::AbstractString, urn::CtsUrn, rdr::Type{TEIDivTableRow})
    doc = parsexml(src)
    xp = "/ns:TEI/ns:text/ns:body/ns:div"
    divs = findall(xp, root(doc),["ns"=> teins])
    citablePassages = []
    # three-tier for loop:
    for div in divs
        divref = div["n"]   
        tabs = findall("ns:table", div, ["ns"=> CitableTeiReaders.teins])  

        for t in tabs
            tableref = t["n"]
            rows = findall("ns:row", t, ["ns"=> CitableTeiReaders.teins])
            for r in rows
                rowref = r["n"]
                ref = "$(divref).$(tableref).$(rowref)"
                @info("Ref: $(divref).$(tableref).$(rowref)")
                
                
                cells = findall("ns:cell", r, ["ns"=> CitableTeiReaders.teins])
                @info("Push $(length(cells)) cells")

                cell_list = String[]
                for c in cells
                    @info(ezxmlstring(c))
                    push!(cell_list, ezxmlstring(c))
                end
                @info("Got cells vect $(cell_list)")
                txt = string("| ", join(cell_list, " | "), " |")
                u = addpassage(urn, ref)

                push!(citablePassages, CitablePassage(u, txt))
            end
        end 
        
        
        
        #for in 
        #=
        for div2 in eachelement(div1)
            tier2psg = toppsg * "." * div2["n"]
            for div3 in eachelement(div2)
                cn = citeNAttr(div3, urn, tier2psg)       
                push!(CitablePassages, cn)
            end
        end
        =#
    end
    CitableTextCorpus(citablePassages)
end
