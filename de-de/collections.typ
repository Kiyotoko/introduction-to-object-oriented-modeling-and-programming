#import "../common/callouts.typ": complementary
#import "@preview/cetz:0.4.2"

= Collections

Die Java Collections API erlaubt es, Daten auf verschiedene Daten abzuspeichern und anzuordnen. Man verwendet verschiedene Datentypen für verschiedene Verwendungszwecke. Die richte Sammlung (engl.: „collection“) auszuwählen ist ein wichtiger Faktor für die Performance Ihrer Anwendungen.

== List

Listen sind eine Sammlung von Elementen, welche Duplikate haben kann und die Reihenfolge der Elemente relevant ist.

Auf das Element einer Liste kann mit dem Index zugegriffen werden.

#complementary("Interne Speicherung von Linked Lists")[
  #align(center, {
    cetz.canvas({
      import cetz.draw: *

      rect((0, 0), (2, 1), name: "size")
      rect((2, 0), (4, 1), name: "head")

      rect((5, 0), (7, 1), name: "v0")
      rect((7, 0), (9, 1), name: "n0")

      rect((10, 0), (12, 1), name: "v1")
      rect((12, 0), (14, 1), name: "n1")

      line((3.85, 0.5), (4.95, 0.5), mark: (end: ">>"))
      line((8.85, 0.5), (9.95, 0.5), mark: (end: ">>"))

      content((name: "size"), `size`)
      content((name: "head"), `head`)
      content((name: "v0"), `0`)
      content((name: "n0"), `next`)
      content((name: "v1"), `1`)
      content((name: "n1"), `next`)
    })
  })

  Linked Lists werden als eine Verkettung von Zeigern abgespeichert. Die List selbst besteht aus der Länge sowie einem Zeiger auf den ersten Knoten (hier `head`). Der erste Knoten enthält den Wert und einen Zeiger auf das nächste Element, und so weiter. Die Werte werden in Java immer als Zeiger auf die Instanz abgespeichert.
]

#complementary("Interne Speicherung von Array Lists")[
  #align(center, {
    cetz.canvas({
      import cetz.draw: *

      rect((0, 0), (2, 1), name: "size")
      rect((2, 0), (4, 1), name: "array")

      rect((5, 0), (7, 1), name: "length")
      rect((7, 0), (8, 1), name: "0")
      rect((8, 0), (9, 1), name: "1")
      rect((9, 0), (10.5, 1), name: "idots")

      line((3.85, 0.5), (4.95, 0.5), mark: (end: ">>"))

      content((name: "size"), `size`)
      content((name: "length"), `length`)
      content((name: "array"), `array`)
      content((name: "0"), `0`)
      content((name: "1"), `1`)
      content((name: "idots"), `...`)
    })
  })

  Array Lists bestehen aus einem einzigen Array. In der Liste wird die Anzahl der Elemente und ein Zeiger auf das Array selbst abgespeichert. Die Elemente werden in das Array geschrieben. Wenn das Array voll ist, wird ein neues Array mit mehr Kapazität erstellt, alle Elemente werden kopiert und der Zeiger der Array Liste wird auf das neue Array geändert.

]

== Set

Sets sind Sammlungen, welche keine Duplikate haben. Sie sind vergleichbar mit Mengen, welche bereits aus Ihren Mathe-Modulen bekannt sein sollten.

== Map

Maps sind keine Collections, sondern eine eigene Art, Daten abzuspeichern. Diese bilden Daten auf andere Daten ab. Sie sind vergleichbar mit Abbildungen aus Diskrete Strukturen.
