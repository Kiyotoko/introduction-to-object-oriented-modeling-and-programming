#import "../common/callouts.typ": *

= Deklaration

#definition(
  "Deklaration",
  "Eine Deklaration (engl.: „declaration“) vereinbart die Rolle eines Bezeichners innerhalb eines Programms.",
)

Um eine Variable zu erstellen, muss diese zuerst deklariert werden. Das Deklarieren eines Datentypes spezifiziert die Daten und den Datentyp eines Datentypes.

#definition(
  "Datentyp",
  "Ein Datentyp (engl.: „data type“) ist gekennzeichnet durch einen Wertebereich sowie Operationen auf diesem Wertebereich",
)

Es wird immer zuerst der Datentyp festgelegt und dann der Name der Variable. Danach kann der Variable direkt ein Wert zugewiesen werden.
Deklarieren von Datentypen:

```java
int a = 1;
```

Hier wurde der Variable `a` vom Datentyp `int` dem Wert `1` zugewiesen. Die Zuweisung ist optional:

```java
int a;
```

Hier wurde `a` kein Wert bei der Deklaration zugewiesen. In diesem Fall wird der Default Wert genutzt. Bei Zahlen ist dies `0` bzw. `0.0`, bei Booleans `false` und bei Objekten `null`.

Deklaration und später auch Statements werden mit einem Semicolon (`;`) beendet. Das Semicolon zeigt an, wann eine Deklaration endet und die nächste Anfängt. Wie viele Leerzeichen, Tabs oder neue Zeilen dazwischen liegen, ist für Java nicht relevant.
