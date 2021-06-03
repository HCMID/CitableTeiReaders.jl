
@testset "Construct a CitableNode from parsed XML" begin
    docurn = CtsUrn("urn:cts:lycian:tl.tl56.v1:")
    nodexml = """<ab n="1"><w><unclear>e</unclear>beis</w> : tokedres : <unclear>?</unclear></ab>"""
    ab = findfirst("/ab", parsexml(nodexml).root)
    cn = CitableTeiReaders.citeNAttr(ab, docurn)
    @test isa(cn, CitableNode)
    @test cn.urn == CtsUrn("urn:cts:lycian:tl.tl56.v1:1")
    @test cn.text == nodexml
end


# Test a short, but complete TEI document
simpleAbTEI = """
<?xml version="1.0" encoding="UTF-8"?>

<TEI xmlns="http://www.tei-c.org/ns/1.0">
  <teiHeader>
    <fileDesc>
      <titleStmt>
        <title>TL 25</title>
        <editor>Dane Scott</editor>
      </titleStmt>
      <publicationStmt>
        <p>Unpublished edition</p>
      </publicationStmt>
      <sourceDesc>
        <p>Edited directly from digital images</p>
      </sourceDesc>
    </fileDesc>
  </teiHeader>
  <text>
    <body>
     <ab n="1"><w><unclear>e</unclear>beis</w> : tokedres : <unclear>?</unclear></ab>
     <ab n="2"><w><unclear>t</unclear>owetE</w> : xssbezE : <w>kro<unclear>p</unclear></w></ab>
     <ab n="3">tideimi : se porihi <w>me=<supplied>ti</supplied></w></ab>
     <ab n="4">tohes : <placeName><w>tlANna</w></placeName> atro : <w>ehb<supplied>i</supplied></w></ab>
     <ab n="5">se lado : ehbi : <persName><w>tikeokEprE</w></persName></ab>
     <ab n="6">pilleNni : <persName><w>ortaqeyahN</w></persName> : kbatro</ab>
     <ab n="7">se priyenobehN : tohesN</ab>
    </body>
  </text>
</TEI>
"""

@testset "Construct a citable corpus from a TEI document citing by `ab`." begin
    urn = CtsUrn("urn:cts:lycian:tl.tl56.v1:")
    c = simpleAbReader(simpleAbTEI, urn)
    expectednodes = 7
    @test  isa(c, CitableTextCorpus)
    @test size(c.corpus, 1) == expectednodes
    @test c.corpus[7].urn == CtsUrn("urn:cts:lycian:tl.tl56.v1:7")
    @test c.corpus[7].text === """<ab n="7">se priyenobehN : tohesN</ab>"""
end

