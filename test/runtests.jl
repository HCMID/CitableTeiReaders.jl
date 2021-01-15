using CitableTeiReaders
using Test
using CitableText
using EzXML



@testset "Serialize a parsed node" begin
    xml = "<root><choice><abbr>Mr.</abbr><expan>Mister</expan></choice> Big.</root>"
    parsed = parsexml(xml)
    elem = findfirst("/root", parsed.root)
    @test ezxmlstring(elem) === xml
end


include("simpleAbTests.jl")
include("poeticLineTests.jl")
include("twocolumnTests.jl")
