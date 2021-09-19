
aratea = """
<?xml version="1.0" encoding="UTF-8"?>
<TEI xmlns="http://www.tei-c.org/ns/1.0">
  <teiHeader>
    <fileDesc>
      <titleStmt>
        <title>Aratea</title>
        <author>Germanicus Caesar</author>
      </titleStmt>
      <editionStmt>
        <p>Original diplomatic edition of Bern 88</p>
      </editionStmt>
      <publicationStmt>
        <p>Digitally published by HC MID</p>
      </publicationStmt>
      <sourceDesc>
        <p>Directly edited from images</p>
      </sourceDesc>
    </fileDesc>
  </teiHeader>
  <text>
    <body>
      <l n="1">Ab <persName>ioue</persName> principium magno deduxit <persName>Aratus></persName>·</l>
      <l n="2">Carminis at nobis genitor tu maximus auctor·</l>
      <l n="3">Te ueneror · tibi sacra fero · doctique laboris</l>
      <l n="4">Primitias · <unclear>'</unclear> probat ipse deum rectorque satorque</l>
      <l n="5">Quantum et enim <choice><sic>possent</sic><corr>possint</corr></choice> anni certissimia signa·</l>
      <l n="6">Qua sol ardentem cancrum papidissimus ambit·</l>
    </body>
  </text>
</TEI>
"""

@testset "Construct a citable corpus from a complete TEI document citing by `l`." begin
    urn = CtsUrn("urn:cts:latinLit:phi0881.phi003.bern88:")
    c = poeticLineReader(aratea, urn)
    expectednodes = 6
    @test  isa(c, CitableTextCorpus)
    @test size(c.passages, 1) == expectednodes
    @test c.passages[6].urn == CtsUrn("urn:cts:latinLit:phi0881.phi003.bern88:6")
    @test c.passages[6].text === """<l n="6">Qua sol ardentem cancrum papidissimus ambit·</l>"""
end