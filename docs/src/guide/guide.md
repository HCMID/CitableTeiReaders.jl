```@setup guide
root = pwd() |> dirname |> dirname |> dirname
```


# User's guide


## Converting text documents to a citable corpus

The `CitableTeiReaders` package provides the `readcitable` function to read a source document and create a `CitableTextCorpus` (from the `CitableCorpus` package), citable by `CtsUrn` (from the `CitableText` package).  


Three arguments are required, and a fourth is optional:

1. the *document source*. The document source is a string value, giving either a literal string of text to parse, a file name, or a URL.
2. the *CTS URN* identifying the document.
3. a subtype of the `CiteStructureTrait`.  This is a Julia type that understands how to parse the citation scheme of the document you want to read.
4. (optional) a subtype of the `ReaderType` (from `CitableBase`).  This parameter may be omitted if the document source is a literal string value; use `FileReader` or `UrlReader` if the document source is a file name or URL, respectively.





### An XML example

You will always want to use these three packages from the CITE architecture:

```@example guide
using CitableTeiReaders
using CitableText, CitableBase
```

We'll work with a valid TEI file, `aratea.xml`, in the `test/data` directory of this repository, and define its URN.  These will be the first two parameters to `readcitable`.
 
```@example guide
f = joinpath(root, "test", "data", "aratea.xml")
arateaurn = CtsUrn("urn:cts:latinLit:phi0881.phi003.bern88:")
```

Since our document cites its passages by poetic line using the TEI `l` element, we will use the `TEIPoeticLine` type as our third parameter.

One option is to read the source file into a string, and call `readcitable` with three arguments.

```@example guide
cexsrc = read(f, String)
stringcorpus = readcitable(cexsrc, arateaurn, TEIPoeticLine)
```


Alternatively, we can include a `FileReader` as the fourth argument, and read the corpus directly from the file. 

```@example guide
filecorpus = readcitable(f, arateaurn, TEIPoeticLine, FileReader)
```

The resulting corpora are identical.

```@example guide
stringcorpus == filecorpus
```

### A non-XML example

The `readcitable` is not limited to XML source documents: it will accept any pairing of source data with a subtype of `CiteStructureTrait` that can parse the source into a `CitableTextCorpus`. For example, the `CitableTeiReaders` packages includes a `DelimitedText` type that parses a delimited-text source in two columns.  The first column contains the CTS URN for the passage, and the second column its text contents.  

Since the source already has computed URN values, we use `nothing` as the value of the document's URN.

```@example guide
src = """urn:cts:hmt:aristonicus.signs.eng:7|He (Aristarchus) took (over) the obelos from the edition of Zenodotus.
urn:cts:hmt:aristonicus.signs.eng:8|And as he rejected lines from the poem, he placed it (the obelos) next to them, as if to corpses of humans.
urn:cts:hmt:aristonicus.signs.eng:9|His (Aristarchus') rationale/reason for athetesis is two-fold.
"""
aristonicus = readcitable(src, nothing, DelimitedText)
```


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
