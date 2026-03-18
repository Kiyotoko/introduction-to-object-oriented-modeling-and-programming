#import "../common/config.typ": conf

#show: conf.with(lang: "de")

#align(center + horizon, {
  text(
    26pt,
    "Einführung in die objekt-orientierte Modellierung und Programmierung",
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
  "arrays.typ",
  "classes-and-inheritance.typ",
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
