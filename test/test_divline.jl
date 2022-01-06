
# Test a short, but complete TEI document
divLineTei = """
<?xml version="1.0" encoding="UTF-8"?>

<TEI xmlns="http://www.tei-c.org/ns/1.0">
  <teiHeader>
    <fileDesc>
      <titleStmt>
        <title>Iliad</title>
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
    <div n="1">
     <l n="1">μῆνιν</l>
  </div>
    </body>
  </text>
</TEI>
"""
@testset "Construct a citable corpus from a TEI document citing by `div` and `l`." begin
    urn = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.test:1.1")
    c = readcitable(divLineTei, urn, TEIDivLine) #divLineReader(divLineTei, urn)

    @test  isa(c, CitableTextCorpus)
    @test length(c.passages) == 1
    @test c.passages[1].urn == CtsUrn("urn:cts:greekLit:tlg0012.tlg001.test:1.1")
    @test c.passages[1].text === """<l n="1">μῆνιν</l>"""
end