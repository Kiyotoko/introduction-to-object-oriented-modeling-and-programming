#import "../common/callouts.typ": *

= Anweisung

#definition("Anweisung", [
  Eine Anweisung (engl.: „statement“) ist ein Syntaxkonstrukt, das eine Zustandsänderung des Programms beschreibt.
  Arten von Anweisungen:

  - Auswertungsanweisung
  - Variablendeklaration
  - strukturierte Anweisung
])

Statements verändern den Zustand (State) des Programms.

== Block Statement

In der Regel möchte man mehr als nur ein Statement ausführen. Um mehrere Statements zusammenzufassen, kann man ein Block Statement nutzen. Ein Block Statement besteht aus geschweiften Klammern (`{`, `}`), in der sich eine Liste von Statements befindet. Die Statements werden von oben nach unten ausgeführt.

```java
{
  statement1;
  statement2;
  ...
  statementN;
}
```

Ein Block kann auch Leer sein und beliebig verschachtelt werden.

```java
{
  {
    {}
  }
}
```

Jeder neue Block führt einen neuen Scope ein. Ein Scope ist der Bereich, indem eine Variable verfügbar ist.

```java
int a;
{
  int b;
  // Hier ist a und b verfügbar
  // Der Scope von b endet hier
}
// Hier ist nur a verfügbar, b ist hier nicht definiert
```

== If/Else

#definition(
  "Kontrollstruktur",
  "Kontrollstrukturen (engl.: „control structures“) sind Syntaxkonstrukte, die dazu dienen, Anweisungen zu strukturieren und deren Ausführungsreihenfolge und -häufigkeiten festzulegen.",
)

Bedingte Ausführung kann durch If/Else erreicht werden.

Wenn Boolean-Ausdruck (Condition) den Wert `true` hat, dann ist der Wert gleich dem Wert von Ausdruck 1 sonst dem Wert von Ausdruck 2. Dabei ist der Else-Teil optional.

```java
if (condition) {
  // Ausdruck 1
} else {
  // Ausdruck 2
}
```

Es ist möglich, If/Else mehrfach aneinander zu reihen:

```java
int value = ...;
if (value < 0) {
  // Wert ist negativ
} else if (value > 0) {
  // Wert ist positiv
} else {
  // Ansonsten, Wert ist 0
}
```

#example("If Branch", [
  Die Abzweigungen bei If/Else heisen Branches. Ein Branch muss kein Block sein, sondern könnte auch jedes andere beliebige Statement sein. Da Einrückungen und Kommentare aber keine Statements sind, kann dies schnell zu Problemen führen. Angenommen, wir wollen von einer Zahl nur den Betrag ausgeben lassen:

  ```java
  int value = ...;
  if (value < 0)
    value = -value;
  else
    // Kommentar
  System.out.println(value)
  ```

  Dies ist semantisch äquivalent zu dem folgenden Code mit Block Statements:

  ```java
  int value = ...;
  if (value < 0) {
    value = -value;
  } else {
    // Kommentar
    System.out.println(value)
  }
  ```

  Somit wird nur dann der Wert ausgeben, wenn die Zahl positiv ist. Wenn der Wert positiv war, wird stattdessen nichts ausgegeben. Dies passiert, weil die Einrückungen und der Kommentar von Java ignoriert wird.
])

== While

While und später For erlauben eine wiederholte Ausführung. Ein Statement wird solange ausgeführt, wie die Bedingung wahr ist. Nach jeder Ausführung des Statements wird die Bedingung erneut überprüft. Hier wird erst die Bedingung überprüft und dann das Statement ausgeführt.

```java
while (condition) {
  // Ausdruck
}
```

Wenn man erst ein Statement ausführen möchte, und erst danach die Bedingung überprüfen will, kann man die Do/While Schleife nutzen:

```java
do {
  // Ausdruck
} while (condition);
```

Wichtig: das Semicolon nach der Do/While Schleife ist wichtig!

== For

```java
for (declaration; condition; expression) {
  // Ausdruck
}
```

== Break

Um aus einer Schleife auszubrechen, kann Break verwendet werden. Damit wird eine Schleife (oder später Switch/Case) direkt beendet. Wenn mehrer Schleifen ineinander verschachtelt sind, wird die innere Schleife verlassen.

```java
for (...) { // Äusere Schleife
  for (...) { // Innere Schleife, diese Schleife wird durch break verlassen
    break;
  }
}
```

#complementary("Labels", [
  Was macht man, wenn man nicht die innere, sonderen die äußere Schleife verlassen will? Dafür kann man Labels verwenden. Labels sind Namen, mit denen man auf Statements verweisen kann. Labels bestehen aus einem Bezeichner und einem Doppelpunkt (`:`). Manche Statements wie zum Beispiel `break` können auf diese Labels verweisen.

  ```java
  label1: for (...) { // Äusere Schleife, diese Schleife wird durch break verlassen
    label2: for (...) { // Innere Schleife
      break label1; // Verweise auf das Label
    }
  }
  ```

  Labels können nicht nur Schleifen, sondern auch andere Statements markieren.

  ```java
  label: {
    ...
    break label;
    ... // Wird nicht mehr ausgeführt, da durch break der Block verlassen wurde
  }
  ```

  Labels sind ein sehr spezielles Konzept, welches selten verwendet wird. In der Regel sollte versucht werden, keine Labels zu verwenden.
])

== Switch/Case

In einem Switch/Case Statement kann ein Wert direkt mit anderen Werten verglichen werden. Aufgrund des Wertes wird ein Fall (`case`) ausgewählt. Falls kein Fall ausgewählt wird, wird stattdessen der Standart Fall (`default`) ausgewählt. Es können nur konstante Werte miteinander verglichen werden. Dazu gehören Zahlen, Chars, Strings und Enums. Objekte und Arrays können nicht miteinander verglichen werden.

```java
switch (value) {
  case A:
  case B:
    // Ausdruck 1, wird sowohl bei
    // value == A und value == B ausgewählt
    break;
  case C:
    // Ausdruck 2, wird bei value == C ausgewählt
    break;
  default:
    // Ausdruck 3, wird ansonsten ausgewählt
    break;
}
```
