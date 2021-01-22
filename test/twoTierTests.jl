
@testset "Construct a CitableNode from parsed XML" begin
    docurn = CtsUrn("urn:cts:lycian:tl.tl44.v1:")
    nodexml = """<ab n="1"><gap/>ertqqi tuwijEdi qrbbli</ab>"""

    ab = findfirst("//ab", parsexml(nodexml).root)
    cn = CitableTeiReaders.citeNAttr(ab, docurn, "west")
    @test isa(cn, CitableText.CitableNode)
    @test cn.urn == CtsUrn("urn:cts:lycian:tl.tl44.v1:west.1")
    @test cn.text == nodexml
    
end


# Test a short, but complete TEI document
divAbTEI = """
<?xml version="1.0" encoding="UTF-8"?>

<TEI xmlns="http://www.tei-c.org/ns/1.0">
  <teiHeader>
    <fileDesc>
      <titleStmt>
        <title>TL 44</title>
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
    <div n="west">
     <ab n="1"><gap/>ertqqi tuwijEdi qrbbli</ab>
  </div>
    </body>
  </text>
</TEI>
"""

@testset "Construct a citable corpus from a TEI document citing by `ab`." begin
    urn = CtsUrn("urn:cts:lycian:tl.tl44.v1:")
    c = divAbReader(divAbTEI, urn)

    @test  isa(c, CitableCorpus)
    @test length(c.corpus) == 1
    @test c.corpus[1].urn == CtsUrn("urn:cts:lycian:tl.tl44.v1:west.1")
    @test c.corpus[1].text === """<ab n="1"><gap/>ertqqi tuwijEdi qrbbli</ab>"""
end

