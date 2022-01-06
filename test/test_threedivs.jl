



# Test a short, but complete TEI document
threeDivTEI = """
<?xml version="1.0" encoding="UTF-8"?>

<TEI xmlns="http://www.tei-c.org/ns/1.0">
  <teiHeader>
    <fileDesc>
      <titleStmt>
        <title>Sample document</title>
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
     <div n="1r_1">
     <div n="lemma"><p>Wrath</p></div>
     <div n="comment"><p>Scholion 1 on page 1r.</p></div>
     </div>
  </div>
    </body>
  </text>
</TEI>
"""

@testset "Construct a citable corpus from a TEI document citing by `ab`." begin
    urn = CtsUrn("urn:cts:madeup:fake.group.v1:")
    c = readcitable(threeDivTEI, urn, TEIDivDivDiv) #threeDivReader(threeDivTEI, urn)

    @test  isa(c, CitableTextCorpus)
    @test length(c.passages) == 2
    @test c.passages[1].urn == CtsUrn("urn:cts:madeup:fake.group.v1:1.1r_1.lemma")
    @test c.passages[1].text === """<div n="lemma"><p>Wrath</p></div>"""
end
