#import "../common/config.typ": conf

#show: conf.with(lang: "de")

#let title = "Einführung in die objekt-orientierte Modellierung und Programmierung"
#set document(title: title)
#align(center + horizon, {
  text(
    26pt,
    title,
    weight: "extrabold",
  )
})
#pagebreak()

#align(bottom, {
  include "../common/notice.typ"
})
#pagebreak()

#outline(title: "Inhalt")
#pagebreak()

#for file in (
  "introduction.typ",
  "getting-started.typ",
  "expressions.typ",
  "declaration.typ",
  "statements.typ",
  "classes.typ",
  "std-streams.typ",
  "arrays.typ",
  "immutable.typ",
  "inheritance.typ",
  "generics.typ",
  "collections.typ",
  "interfaces.typ",
  "exceptions.typ",
  "multi-threading.typ",
  "software-engineering.typ",
) {
  include file
  pagebreak()
}
