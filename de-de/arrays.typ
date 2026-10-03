#import "../common/callouts.typ": *
#import "@preview/cetz:0.4.2"

= Arrays

Ein Array ist eine Datenstruktur, die eine feste Anzahl von Werten desselben Datentyps speichert. Der Ausdruck `new int[3]` erzeugt ein Array mit drei `int`-Elementen. Diese werden bei der Erstellung automatisch mit `0` initialisiert.
Auf das Element eines Arrays kann mit einem Index zugegriffen werden. Ein Index in Java fängt bei 0 an. So gibt zum Beispiel `array[1]` nicht das erste Element, sondern das zweite zurück.

Arrays haben eine feste Länge, die nach der Erstellung nicht verändert werden kann. Wenn mehr Elemente benötigt werden, muss ein neues, längeres Array erstellt werden. Die vorhandenen Elemente können anschließend in das neue Array kopiert werden.
Auf die Länge eines Arrays kann mit dem Attribut `length` zugegriffen werden.

```java
// Erstelle ein neues Array mit den Werten 1, 2 & 3. Die Länge wird
// automatisch aus der Anzahl der Werte bestimmt.
int[] array1 = new int[] {1, 2, 3};
int length = array1.length; // 3

// Erstelle ein neues Array mit Platz für drei int-Werte. Die Elemente
// werden zunächst mit 0 initialisiert.
int[] array2 = new int[3];

// Bei einer Array-Initialisierung mit konkreten Werten kann new int[]
// weggelassen werden.
int[] array3 = {1, 2, 3};

// Zugreifen auf das Array an der 1-ten Stelle bzw. 2-tes Element.
int value = array1[1]; // Enthält den Wert 2
```

Die Java-Standardbibliothek stellt Methoden bereit, mit denen Arrays effizient verarbeitet werden können. Mit ```java System.arraycopy(...)``` können Elemente von einem Array in ein anderes kopiert werden.

```java
int[] source = {1, 2, 3};
int[] target = new int[4];

// Hier werden drei Elemente ab Index 0 von source nach
// target kopiert.
System.arraycopy(source, 0, target, 1, 3);
// Danach enthält target  nun {0, 1, 2, 3}
```

#complementary("Interne Speicherung von Arrays")[
  Ein Array besitzt eine feste Länge und enthält eine feste Anzahl von Elementen. Die Elemente können über ihre Indizes angesprochen werden.

  Die folgende Darstellung zeigt das Array vereinfacht als Folge seiner Elemente.

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
]

#task("Aufmerksame Almaweb Arrays")[
  Erstellen Sie ein Array und füllen Sie es mit Ihren (Wunsch) Modulnoten. Berechnen Sie die Durchschnittsnote anhand der Werte. Geben Sie die beste (kleinste) und schlechteste (größte) Note aus. Sortieren Sie die Noten von der Schlechtesten zur Besten und geben Sie das gesamte Array aus. Zählen Sie danach, wie häufig jede Note vorkommt und geben Sie die Statistik aus. Gewünschtes Verhalten:

  ```java
  double[] grades = {
    1.3, 2.3, 4.0, 3.3, 1.7, 2.3, 1.3, 1.7, 2.3};

  System.out.println(average(grades)); // 2.244...
  System.out.println(best(grades));    // 1.3
  System.out.println(worst(grades));   // 4.0
  System.out.println(toString(sorted(grades));
  // 1.3, 1.3, 1.7, 1.7, 2.3, 2.3, 2.3, 3.3, 4.0,
  System.out.println(stats(grades));
  // 2x 1.3, 2x 1.7, 3x 2.3, 1x 3.3, 1x 4.0,
  ```

  #solution(
    "https://codeberg.org/karlz/introduction-to-oop-and-uml/src/branch/master/solution/attentive-almaweb-arrays.md",
  )[Lösung]
]
