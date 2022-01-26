# API documentation

## The `readcitable` function

Use the `readcitable` function to create a citable corpus from a source document.

```@docs
readcitable
```

## Subtypes of `CiteStructureTrait`

Any package can implement the `CiteStructure` with a custom type to supply to the `readcitable` function.  The following types are included in the `CitableTeiReaders` package.

### Delimited-text file

```@docs
DelimitedText
```

### XML cited by one-tier citation scheme

```@docs
TEIPoeticLine
TEIAnonblock
```
### XML cited by two-tier citation scheme

```@docs
TEIDivAb
TEIDivLine
```
### XML cited by three-tier citation scheme

```@docs
TEIDivDivDiv
TEIThreeDivsGrouped
```


## A useful utility function


```@docs
ezxmlstring
```


## Functions used internally

```@docs
CitableTeiReaders.citeNAttr
CitableTeiReaders.nodefromline
```