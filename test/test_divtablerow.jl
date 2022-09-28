@testset "Construct a citable corpus from a TEI document citing by `div`, `table` and `row`." begin

    f = joinpath(pwd(), "data", "jerometable.xml")
    xml = read(f) |> String
    u = CtsUrn("urn:cts:latinLit:stoa0162.stoa005.gen49:")

    c = readcitable(xml, u, TEIDivTableRow) 

    @test  isa(c, CitableTextCorpus)
    @test length(c.passages) == 4
    @test c.passages[3].urn == CtsUrn("urn:cts:latinLit:stoa0162.stoa005.gen49:14.t1.1.1")
    @test contains(c.passages[2].text, "Regnal")
end