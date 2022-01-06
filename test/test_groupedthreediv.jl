

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
    c =  readcitable(groupedDivsTei, urn, TEIThreeDivsGrouped)  #groupedThreeDivReader(groupedDivsTei, urn)

    @test  isa(c, CitableTextCorpus)
    @test length(c.passages) == 3
    @test c.passages[1].urn == CtsUrn("urn:cts:greekLit:tlg5026.e3.v1:10.124r_1.lemma")
    expected = "<div n=\"lemma\"> <p><num value=\"9\">θ</num></p> </div>"
    actualtidied =  replace(c.passages[1].text, r"[ \t\n]+" => " ")
    @test actualtidied == expected
end

@testset "Test multiple texts grouped in one TEI document" begin
  #f = open("data/groupedthree.xml", "r")
  # read entire file into a string
  #s = read(f, String)       
  #close(f)
  f = joinpath("data", "groupethree.xml")

  urn = CtsUrn("urn:cts:greekLit:tlg5026.burney86il.v1:")
  c =  readcitable(f, urn, TEIThreeDivsGrouped, FileReader)  #groupedThreeDivReader(s, urn)

  @test  isa(c, CitableTextCorpus)
  @test length(c.passages) == 3
end