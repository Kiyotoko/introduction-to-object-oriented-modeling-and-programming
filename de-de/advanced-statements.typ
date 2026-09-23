#import "../common/callouts.typ": *

= Fortgeschrittene Anweisungen

Dieses Kapitel enthält einige Anweisungen, welche etwas Komplexer sind und bisher noch nicht benötigt wurden.

== Break

Um aus einer Schleife auszubrechen, kann ```java break``` verwendet werden. Damit wird eine Schleife (oder später Switch/Case) direkt beendet. Wenn mehrere Schleifen ineinander verschachtelt sind, wird die innere Schleife verlassen.

```java
for (...) { // Äußere Schleife
  for (...) { // Innere Schleife, diese Schleife wird durch break verlassen
    break;
  }
}
```

== Continue

Ähnlich zu Break gibt es ebenfalls Continue. Anstatt eine Schleife zu beenden, wird stattdessen nur der aktuelle Durchlauf beendet und zum nächsten gegangen.

```java
long l = 10.0;
for (double r = -10.0; r <= 10.0; r++) {
  // Verhindere Division By 0
  if (r == 0.0) continue;
  System.out.println(l / r);
}
```

#complementary("Labels", [
  Was macht man, wenn man nicht die innere, sondern die äußere Schleife verlassen will? Dafür kann man Labels verwenden. Labels sind Namen, mit denen man auf Anweisungen verweisen kann. Labels bestehen aus einem Bezeichner und einem Doppelpunkt (`:`). Manche Anweisungen wie zum Beispiel `break` können auf diese Labels verweisen.

  ```java
  label1: for (...) { // Äußere Schleife, diese Schleife wird durch break verlassen
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

In einem Switch/Case Statement kann ein Wert direkt mit anderen Werten verglichen werden. Aufgrund des Wertes wird ein Fall (`case`) ausgewählt. Falls kein Fall ausgewählt wird, wird stattdessen der Standardfall (`default`) ausgewählt. Die möglichen Fälle werden durch konstante Werte angegeben. Unterstützt werden unter anderem Zahlen, Zeichen, Strings und Enums. Objekte und Arrays hingegen werden nicht von Switch/Case unterstützt.

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
