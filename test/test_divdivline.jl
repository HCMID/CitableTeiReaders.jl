@testset "Construct a citable corpus from a TEI document citing by `div`, `div` and `l`." begin

    f = joinpath(pwd(), "data", "anthology.xml")
    xml = read(f) |> String
    u = CtsUrn("urn:cts:greekLit:tlg7000.tlg001:")

    c = readcitable(xml, u, TEIDivDivLine) 

    @test  isa(c, CitableTextCorpus)
    @test length(c.passages) == 7
    @test c.passages[2].urn == CtsUrn("urn:cts:greekLit:tlg7000.tlg001:9.387.1")
    @test contains(c.passages[2].text, "κατα χθονὸς")
end