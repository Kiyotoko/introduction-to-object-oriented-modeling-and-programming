#import "../common/callouts.typ": *

= Anweisung

#definition("Anweisung", [
  Eine Anweisung (engl.: _statement_) ist ein Syntaxkonstrukt, das während der Programmausführung eine Aktion ausführt oder den Ablauf der Ausführung beeinflusst.
  Arten von Anweisungen:

  - Auswertungsanweisung
  - Variablendeklaration
  - strukturierte Anweisung
])

Statements können den Zustand (State) des Programms oder den Ablauf der Ausführung steuern.

== Block Statement

In der Regel möchte man mehr als nur ein Statement ausführen. Um mehrere Statements zusammenzufassen, kann man ein Block Statement nutzen. Ein Block Statement besteht aus geschweiften Klammern (`{`, `}`), zwischen denen sich eine Liste von Statements befindet. Die Statements werden von oben nach unten ausgeführt.

```java
{
  statement1;
  statement2;
  ...
  statementN;
}
```

Ein Block kann auch leer sein und beliebig verschachtelt werden.

```java
{
  {
    {}
  }
}
```

Jeder neue Block führt einen neuen Variablenbereich (engl. _scope_) ein. Eine Variable ist nur in einem bestimmten Bereich verfügbar.

```java
int a;
{
  int b;
  // Hier ist a und b verfügbar
  // Der Bereich von b endet hier
}
// Hier ist nur a verfügbar, b ist hier nicht definiert
```

Variablen, welche in einem Block deklariert sind, sind auch nur in ihrem Bereich dort verfügbar. Wenn der Block endet, kann nicht mehr auf die Variable zugegriffen werden. Wenn mehrere Blöcke definiert werden, kann auf alle darüber liegenden Bereiche zugegriffen werden.

```java
jshell> int a; { int b; }
a ==> 0
jshell> a
a ==> 0
jshell> b
|  Error:
|  cannot find symbol
|    symbol:   variable b
|  b
|  
```

== If/Else

#definition(
  "Kontrollstruktur",
  "Kontrollstrukturen (engl.: „control structures“) sind Syntaxkonstrukte, die dazu dienen, Anweisungen zu strukturieren und deren Ausführungsreihenfolge und -häufigkeiten festzulegen.",
)

Bedingte Ausführung kann durch eine If/Else-Verzweigung erreicht werden.

Wenn der boolesche Ausdruck zu `true` ausgewertet wird, dann wird die Anweisung 1 ausgeführt, ansonsten die Anweisung 2. Dabei ist der ```java else```-Teil optional.

```java
if (condition) {
  // Anweisung 1
} else {
  // Anweisung 2
}
```

Es ist möglich, If/Else-Verzweigungen mehrfach aneinander zu reihen:

```java
jshell> int value = -2;
value ==> -2
jshell> if (value < 0) {
   ...>   System.out.println("Negativ");
   ...> } else if (value > 0) {
   ...>   System.out.println("Positiv");
   ...> } else {
   ...>   System.out.println("Null");
   ...> }
Negativ
```

#example("Verzweigungen", [
  Die Abzweigungen bei If/Else heißen Branches. Ein Branch muss kein Block sein, sondern könnte auch jedes andere beliebige Statement sein. Da Einrückungen und Kommentare aber keine Statements sind, kann dies schnell zu Problemen führen. Angenommen, wir wollen von einer Zahl nur den Betrag ausgeben lassen:

  ```java
  int value = ...;
  if (value < 0)
    value = -value;
  else
    // Kommentar
  System.out.println(value);
  ```

  Dies ist semantisch äquivalent zu dem folgenden Code mit Block Statements:

  ```java
  int value = ...;
  if (value < 0) {
    value = -value;
  } else {
    // Kommentar
    System.out.println(value);
  }
  ```

  Somit wird nur dann der Wert ausgegeben, wenn die Zahl positiv ist. Wenn der Wert nicht negativ war, wird stattdessen nichts ausgegeben. Dies passiert, weil die Einrückungen und der Kommentar von Java ignoriert wird.
])

== While

While und später For erlauben eine wiederholte Ausführung. Eine Anweisung wird solange ausgeführt, wie die Bedingung wahr ist. Nach jeder Ausführung des Statements wird die Bedingung erneut überprüft. Hier wird zuerst die Bedingung überprüft und dann das Statement ausgeführt.

```java
while (condition) {
  // Anweisung
}
```

Wenn man erst ein Statement ausführen möchte, und erst danach die Bedingung überprüfen will, kann man die Do/While Schleife nutzen:

```java
do {
  // Anweisung
} while (condition);
```

Wichtig: das Semicolon nach der Do/While Schleife ist wichtig!

== For

In Java kann man mithilfe von For-Schleifen über einen Bereich iterieren. For-Schleifen bestehen aus einer Initialisierung, einer Bedingung und einer Aktualisierung. Die Initialisierung wird einmal zu Beginn ausgeführt, die Bedingung bestimmt, ob die Schleife weiterläuft, und die Aktualisierung verändert die Schleifenvariable nach jedem Durchlauf.

```java
for (initialization; condition; update) {
  // Anweisung
}
```

Um die ersten fünf Quadratzahlen auszugeben, können wir die folgende For-Schleife nutzen:

```java
jshell> for (int i = 1; i <= 5; i += 1) {
   ...>   System.out.println(i * i);
   ...> }
1
4
9
16
25
```

Alternativ kann man erweiterte For-Schleifen verwenden, um über eine Folge von Elementen zu iterieren.

```java
jshell> for (int i : new int[]{ 1, 2, 3 }) {
   ...>   System.out.println(i);
   ...> }
1
2
3
```

Wie genau die hier dargestellten Arrays oder später auch die Java Collections funktionieren, erfahren Sie in einem späteren Kapitel.

== Break

Um aus einer Schleife auszubrechen, kann ```java break``` verwendet werden. Damit wird eine Schleife (oder später Switch/Case) direkt beendet. Wenn mehrere Schleifen ineinander verschachtelt sind, wird die innere Schleife verlassen.

```java
for (...) { // Äußere Schleife
  for (...) { // Innere Schleife, diese Schleife wird durch break verlassen
    break;
  }
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
