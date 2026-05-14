#import "../common/callouts.typ": *

= Ausdrücke
Um gespeicherte Informationen verarbeiten zu können braucht es eine eindeutige Interpretation der gespeicherten Bits. Gleichzeitig soll beim Programmieren von der Hardwaredarstellung der Informationen abstrahiert werden. Dafür werden *Datentypen* definiert.

#definition("Datentypen", [
  Ein *Datentyp* (engl.: "data type") ist gekennzeichnet durch einen Wertebereich sowie Opeartionen auf diesem Wertebereich.
])

In Java sind primitiven Datentypen für Zahlen, Wahrheitswerte, Zeichen und Zeichenketten definiert. Es gibt dabei verschiedene Varianten, je nachdem wie viel Speicher für einen Wert dieses Datentyps reserviert wird.
Zahlen in Java sind entweder Ganzzahlen (Integers) oder Gleitkommazahlen (Floats, auch Fließkommazahl). Alle Zahlen in Java werden mit einem Vorzeichen abgespeichert (Plus/Minus).In der folgenden Tabelle sind Javas primitiven Datentypen für Zahlen angegeben:

#table(
  columns: (auto, auto, auto, auto, auto),
  table.header([*Typ*], [*Größe*], [*Fließkommazahl*], [*Beispiel*], [*Wertebereich*]),
  `byte`, [8 Bit], [Nein], `(byte) 42`, [$-2^7$ bis $2^7 - 1 $],
  `short`, [16 Bit], [Nein], `(short) 42`, [$-2^15$ bis $2^15 -1$],
  `int`, [32 Bit], [Nein], `42`,[$-2^31$ bis $2^31 - 1$],
  `long`, [64 Bit], [Nein], `42L`, [$-263$ bis $263 - 1 $],
  `float`, [32 Bit], [Ja], `4.2F`,[$-3.40282347 dot 10^38$ bis $3.40282347 dot 10^38$],
  `double`, [64 Bit], [Ja], `4.2`,[$-1.79769313486231570 dot 10^308$ bis $1.79769313486231570 dot 10^308$],
)
Die anderen primitiven Datentypen werden später besprochen. Zuerst wollen wir Daten mit Variablen und Operatoren verbinden und so neue Werte beschreiben. Analog wie Terme in der Mathematik verwenden wir dazu Ausdrücke:

#definition("Ausdruck", [
  Ein Ausdruck (engl.: „expression“) ist ein Syntaxkonstrukt, das zur Beschreibung eines Wertes dient. Es gibt folgende Arten von Ausdrücken:

  - Literale
  - Variablen
  - Operationen

])

#definition("Auswertung", [
  Die Auswertung (engl.: „evaluation“) eines Ausdrucks ist die Bestimmung des Wertes dieses Ausdrucks.
 ])

== Literale

Ein Literal ist ein Ausdruck, der direkt einen Wert beschreibt. Zu den Literalen gehören alle Werte eines primitven Datentypes, also Zahlen, Booleans, Strings, Chars und Variablen.

Beispiele für Zahlliterale sind 
```java
42 // Integer
42L // Long
3.5 // Double
3.5f // Float
+31 // Positiv, + ist implizit
-31 // Negativ
```

Booleans sind Wahrheitswerte, welche entweder den Wert Wahr (`true`) oder Falsch (`false`) haben. Dabei sind `true` und `false` Schlüsselwörter.

#definition(
  "Schlüsselwort",
  "Schlüsselwörter (engl. „keywords“ oder „reserved words“) bestehen wie Bezeichner aus Buchstaben-Zahlen-Kombinationen, haben aber eine feste Bedeutung innerhalb der Programmiersprache, stehen daher nicht als Bezeichner zur Verfügung.",
)

Chars sind einzelne Zeichen wie Buchstaben, Nummern oder Satzzeichen. Ein String ist eine Zeichenkette.

```java
'a' // Zeichen
"abc" // Zeichenkette
```

== Variable

Variablen sind Namen, die einen Wert beschreiben. In der Auswertung werden sie durch die konkreten Werte ersetzt. Als Variablennamen stehen in Java alle nichtleeren Folgen von Zeichen `[a-zA-Z0-9_]` zur Verfügung, die nicht mit einer Ziffer beginnen und kein Schlüsselwort sind.

Als nächstes wollen wir uns die wichtigsten Operationen auf primitiven Datentypen anschauen. 

== Unäre Operationen

Unäre Operationen sind Operationen, welche *einen* Ausdruck nehmen und einen neuen Wert zurückgeben. Diese sind Plus, Minus (Negation), Not sowie Bit Operationen. Bit Operationen sind Operationen, welche direkt mit den einzelnen Bits eines Wertes arbeiten wie zum Beispiel Bitwise Complement. Diese sind in anderen Modulen relevant (siehe TI), werden hier aber nicht weiter behandelt.

```java
+42
-42
!true // false
```

== Binäre Operationen

Binäre Operationen sind Operationen, welche *zwei* Ausdrücke nehmen und einen neuen Wert zurückgeben. Diese sind Addition, Substraktion, Multiplikation, Division, Modular, Und, Oder, Gleich, Zuweisung, sowie Bit Operationen.

Häufige Operationen auf Zahlen sind:

```java
1.0 + 2.0
1.0 - 2.0
1.0 * 2.0
1.0 / 2.0
15 % 6 // Modulo, evaluiert zu 3
```

#example("Integer Division", [
  Wenn beide Seiten einer Division Integers sind, wird Integer Division verwendet. Dabei wird nur das ganzzahlige Ergebnis der Division verwendet und der Rest wird ignoriert. Somit ergibt:

  ```java
  1 / 3
  ```

  nicht etwa ~`0.3333`, sondern `0`.
])

Häufige Boolean Operationen sind:

```java
true && true // Und, evaluiert zu true
true && false // Evaluiert zu false
true || false // Oder, evaluiert zu true
false || false // Evaluiert zu false
```

Die Operationen Und sowie Oder haben in Java Lazy Evaluation. Dies bedeutet, dass ein Ausdruck nur dann ausgewertet wird, wenn er verwendet wird.

```java
false && (/* Hier würde ein Fehler entstehen */)
true || (/* Hier würde ein Fehler entstehen */)
```

== Ternäre Operationen

Short Hand If Else (Meistens nur Ternary Operator) ist der einzige Ternäre Operator in Java. Ein ternäre Operator bestimmt einen neuen Wert anhand von *drei* Ausdrücken. Die Zeichen `?` und `:` gehören beide zum selben Operator. Sie können die Zeichen nicht alle verwenden. Der Operator evaluiert die Bedingung. Falls die Bedingung Wahr ist, wird der erste Ausdruck zurück gegeben, ansonsten der zweite Ausdruck.

```java
condition ? expr1 : expr2
```
