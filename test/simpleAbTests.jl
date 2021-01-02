

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

@testset "Construct citable corpus" begin
    urn = CtsUrn("urn:cts:lycian:tl.tl56.v1:")
    @test simpleAbReader(simpleAbTEI, urn) !== nothing
end