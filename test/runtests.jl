using CitableTeiReaders
using Test
using CitableText, CitableCorpus, CitableBase
using EzXML



@testset "Serialize a parsed node" begin
    xml = "<root><choice><abbr>Mr.</abbr><expan>Mister</expan></choice> Big.</root>"
    parsed = parsexml(xml)
    elem = findfirst("/root", parsed.root)
    @test ezxmlstring(elem) === xml
end



include("test_poeticline.jl")

include("test_simpleAb.jl")

include("test_divab.jl")
include("test_divline.jl")

include("test_threedivs.jl")
include("test_divdivline.jl")


include("test_twocolumn.jl")

