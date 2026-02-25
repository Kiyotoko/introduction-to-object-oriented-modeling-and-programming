#align(center + horizon, [
  #text(26pt, "Einführung in die objekt-orientierte Modellierung und Programmierung", weight: "extrabold")
])

#show link: underline
#set page(numbering: "1")
#set heading(numbering: "1.")
#set text(14pt)

#pagebreak()

#align(bottom, [
  #include "../common/notice.typ"
])

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
  "software-engineering.typ"
) {
  include file
  pagebreak()
}
