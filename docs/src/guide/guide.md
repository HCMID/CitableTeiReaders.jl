# User's guide
```@meta
CurrentModule = CitableTeiReaders
```

## Converting XML formats to citable objects

TBA 

## Converting other formats to citable objects

TBA

## Other utilities


The package includes an `ezxmlstring` function to serialize nodes parsed with `EzXML`.


```jldoctest
using CitableTeiReaders
using EzXML
xml = "<root><choice><abbr>Mr.</abbr><expan>Mister</expan></choice> Big.</root>"
parsed = parsexml(xml)
elem = findfirst("/root", parsed.root)
ezxmlstring(elem)

# output

"<root><choice><abbr>Mr.</abbr><expan>Mister</expan></choice> Big.</root>"
```
