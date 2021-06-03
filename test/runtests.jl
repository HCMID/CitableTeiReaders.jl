using CitableTeiReaders
using Test
using CitableText, CitableCorpus
using EzXML



@testset "Serialize a parsed node" begin
    xml = "<root><choice><abbr>Mr.</abbr><expan>Mister</expan></choice> Big.</root>"
    parsed = parsexml(xml)
    elem = findfirst("/root", parsed.root)
    @test ezxmlstring(elem) === xml
end

include("twocolumnTests.jl")
include("simpleAbTests.jl")
include("poeticLineTests.jl")
include("twoTierTests.jl")
include("threeTierTests.jl")