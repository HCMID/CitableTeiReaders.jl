"Abstract type for readers capable of parsing citation structure of a source text."
abstract type CiteStructureTrait end

"Singleton type for unrecognized source document cited by poetic line."
struct UnrecognizedCitationScheme <: CiteStructureTrait end

"""Read from `src`  a citable document identified by `urn` and cited by citation scheme `citescheme`.
$(SIGNATURES)
"""
function readcitable(src::AbstractString, urn::CtsUrn, citescheme::Type{<: CiteStructureTrait})
    throw(DomainError(rdr), "`readcitable` not implemented for type $(typeof(rdr))")
end

"""Read from file `fname`  a citable document identified by `urn` and cited by citation scheme `citescheme`.
$(SIGNATURES)
"""
function readcitable(fname::AbstractString, urn::CtsUrn, citescheme::Type{<: CiteStructureTrait},
    rdr::Type{FileReader}
    )
    xml = read(fname, String)
    readcitable(xml, urn, citescheme)
end

"""Read from `url`  a citable document identified by `urn` and cited by citation scheme `citescheme`.
$(SIGNATURES)
"""
function readcitable(url::AbstractString, urn::CtsUrn, citescheme::Type{<: CiteStructureTrait},
    rdr::Type{UrlReader}
    )
    xml = HTTP.get(url).body |>  String
    readcitable(xml, urn, citescheme)
end