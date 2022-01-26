```@setup eg
root = pwd() |> dirname |> dirname
```

# CitableTeiReaders.jl Documentation


Read documents in TEI XML and other formats into citable text objects.


!!! note

    The package name is misleading:  converting text documents into citable text objects is not limited to TEI-compliant XML or even to XML at all.

##  Quick example


In the `test/data` directory of this repository, the file `aratea.xml` is a TEI document cited by poetic line (TEI `l` element within `text/body`).  We will start by `using` three packages to work with citable texts, and by defining the URN for the text to read.

```@example eg
using CitableTeiReaders
using CitableText, CitableBase

f = joinpath(root, "test", "data", "aratea.xml")
arateaurn = CtsUrn("urn:cts:latinLit:phi0881.phi003.bern88:")
```

We can create a citable corpus with the `readcitable` function. 

```@example eg
corpus = readcitable(f, arateaurn, TEIPoeticLine, FileReader)
```