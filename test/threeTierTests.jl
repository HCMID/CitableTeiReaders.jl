



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
    c = threeDivReader(threeDivTEI, urn)

    @test  isa(c, CitableTextCorpus)
    @test length(c.corpus) == 2
    @test c.corpus[1].urn == CtsUrn("urn:cts:madeup:fake.group.v1:1.1r_1.lemma")
    @test c.corpus[1].text === """<div n="lemma"><p>Wrath</p></div>"""
end


groupedDivsTei = """
<?xml version="1.0" encoding="UTF-8"?>
<?xml-model  href="https://vault.tei-c.org/P5/current/xml/tei/custom/schema/relaxng/tei_all.rng" schematypens="http://relaxng.org/ns/structure/1.0" type="application/xml"?>
<TEI xmlns="http://www.tei-c.org/ns/1.0">
  <teiHeader>
    <fileDesc>
      <titleStmt>
        <title>Scholia to Escorial Upsilon 1.1</title>
        <author>Rebecca Rose Kaczmarek</author>
        <author> Thomas Anthony Posillico</author>
      </titleStmt>
      <publicationStmt>
        <p>Unpublished</p>
      </publicationStmt>
      <sourceDesc>
        <p>Transcribed from Upsilon 1.1 MS</p>
      </sourceDesc>
    </fileDesc>
  </teiHeader>
  <text>
    <group n="10">
      <text n="e3">
        <body>

          <div n="124r_1" type="scholion">
              <div n="lemma">
                  <p><num value="9">θ</num></p>
              </div>
              <div n="ref">
                  <p>urn:cts:greekLit:tlg0012.tlg001.e3:10.1</p>
              </div>
              <div n="comment">
                  <p>οἱ γὰρ φύλακες ἔξω νεῶν ἦσαν κοιμώμενοι⁑</p>
              </div>
          </div>
        </body>
    </text>
</group>
</text>
</TEI>
"""

@testset "Construct a citable corpus from a HMT-style organizatoin of scholia." begin
    urn = CtsUrn("urn:cts:greekLit:tlg5026.e3.v1:")
    c = groupedThreeDivReader(groupedDivsTei, urn)

    @test  isa(c, CitableTextCorpus)
    @test length(c.corpus) == 3
    @test c.corpus[1].urn == CtsUrn("urn:cts:greekLit:tlg5026.e3.v1:10.124r_1.lemma")
    expected = "<div n=\"lemma\"> <p><num value=\"9\">θ</num></p> </div>"
    actualtidied =  replace(c.corpus[1].text, r"[ \t\n]+" => " ")
    @test actualtidied == expected
end