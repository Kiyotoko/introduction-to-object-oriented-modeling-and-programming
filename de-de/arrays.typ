#import "../common/callouts.typ": *
#import "@preview/cetz:0.4.2"

= Arrays

Arrays sind Felder eines bestimmten Datentypes. Der Ausdruck `new int[3]` entspricht drei Integers, welche hintereinander abgespeichert werden.
Auf das Element eines Arrays kann mit einem Index zugegriffen werden. Ein Index in Java fängt bei 0 an. So gibt zum Beispiel `array[1]` nicht das erste Element, sondern das zweite zurück.

Arrays haben eine feste Länge, die nicht verändert werden kann. Wenn Sie mehr Elemente abspeichern wollen als in einem Array platz ist, muss jedes mal ein neues Array erstellt werden und alle Elemente zum neuen Array kopiert werden. Auf die Länge eines Arrays kann mit dem Attribut `length` zugegriffen werden.

```java
// Erstelle ein neues Array mit den Werten 1, 2 & 3. Die Größe wird
// automatisch aus der Anzahl der Werte bestimmt.
int[] array1 = new int[] {1, 2, 3};

// Erstelle ein neues Array, indem 3 Werte abgespeichert werden
// können.
int[] array2 = new int[3];

// Wenn wir mit Werten das Array initialisieren, kann das doppelte
// schreiben des Datentypes weggelassen werden.
int[] array3 = {1, 2, 3};

// Zugreifen auf das Array an der 1-ten Stelle bzw. 2-tes Element.
int value = array1[1]; // Enthält den Wert 2
```

Um mit Arrays effizient zu arbeiten, kann die Java Standartbibliothek verwendet werden.
Die Methode ```java System.arraycopy(Object src, int srcPos, Object dest, int destPos, int length)``` erlaubt es, Daten von einem Array zu einem anderen zu kopieren.

#complementary("Interne Speicherung von Arrays")[
  #align(center, {
    cetz.canvas({
      import cetz.draw: content, rect

      rect((0, 0), (2, 1), name: "length")
      rect((2, 0), (3, 1), name: "i0")
      rect((3, 0), (4, 1), name: "i1")
      rect((4, 0), (5.5, 1), name: "idots")
      cetz.decorations.brace(
        (2, 0),
        (5.5, 0),
        flip: true,
        name: "elements",
      )
      content((name: "length"), `length`)
      content((name: "i0"), `0`)
      content((name: "i1"), `1`)
      content((name: "idots"), `...`)
      content(
        (name: "elements", anchor: 270deg),
        box(height: 5pt)[Werte],
      )
    })
  })

  In einem Array wird zunächst die Anzahl und dann alle Elemente hintereinander abgespeichert. Bei primitiven Datentypen wird der Wert selber abgespeichert, bei Klassen hingegen nur eine Referenz zum Wert.
]
