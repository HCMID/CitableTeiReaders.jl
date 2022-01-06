
@testset "Test reading two-column corpus" begin
    src = """urn:cts:hmt:aristonicus.signs.eng:7|He (Aristarchus) took (over) the obelos from the edition of Zenodotus.
urn:cts:hmt:aristonicus.signs.eng:8|And as he rejected lines from the poem, he placed it (the obelos) next to them, as if to corpses of humans.
urn:cts:hmt:aristonicus.signs.eng:9|His (Aristarchus') rationale/reason for athetesis is two-fold.
urn:cts:hmt:aristonicus.signs.eng:10|The first use is when indicating that the line (epos) is not Homeric, as was indicated on the line "he delights in the feast and he has as wife Hebe with lovely ankles."
urn:cts:hmt:aristonicus.signs.eng:11|For it is impossible for the one who is perpetually virgin to be given in marriage.
urn:cts:hmt:aristonicus.signs.eng:12|The second use brings the charge (of athetesis) on the grounds that the lines are out of place"""
    c =  readcitable(src, nothing, DelimitedText) #twocolumnReader(src)
    expectednodes = 6
    @test length(c.passages) == expectednodes
end