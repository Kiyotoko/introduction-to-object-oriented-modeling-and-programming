#import "../common/callouts.typ": *

= Ausdrücke
Um gespeicherte Informationen verarbeiten zu können braucht es eine eindeutige Interpretation der gespeicherten Bits. Gleichzeitig soll beim Programmieren von der Hardwaredarstellung der Informationen abstrahiert werden. Dafür werden *Datentypen* definiert.

#definition("Datentypen")[
  Ein Datentyp (engl. _data type_) ist gekennzeichnet durch einen Wertebereich sowie Operationen auf diesem Wertebereich.
]

In Java sind primitive Datentypen für Zahlen, Wahrheitswerte und Zeichen definiert. Es gibt dabei verschiedene Varianten, je nachdem wie viel Speicher für einen Wert dieses Datentyps reserviert wird. Zeichenketten werden durch die Klasse `String` dargestellt.
Zahlen in Java sind entweder Ganzzahlen (Integers) oder Gleitkommazahlen (engl. _floating point numbers_). Alle Zahlen in Java werden mit einem Vorzeichen abgespeichert (Plus/Minus). In der folgenden Tabelle sind Javas primitiven Datentypen für Zahlen angegeben:

#table(
  columns: (auto, auto, auto, auto, auto),
  table.header([*Typ*], [*Größe*], [*Fließkommazahl*], [*Beispiel*], [*Wertebereich*]),
  `byte`, [8 Bit], [Nein], `(byte) 42`, [$-2^7$ bis $2^7 - 1 $],
  `short`, [16 Bit], [Nein], `(short) 42`, [$-2^15$ bis $2^15 -1$],
  `int`, [32 Bit], [Nein], `42`,[$-2^31$ bis $2^31 - 1$],
  `long`, [64 Bit], [Nein], `42L`, [$-2^63$ bis $2^63 - 1 $],
  `float`, [32 Bit], [Ja], `4.2F`,[$~-3.403 dot 10^38$ bis $~3.403 dot 10^38$],
  `double`, [64 Bit], [Ja], `4.2`,[$~-1.798 dot 10^308$ bis $~1.798 dot 10^308$],
)

Die anderen primitiven Datentypen werden später besprochen. Zuerst wollen wir Daten mit Variablen und Operatoren verbinden und so neue Werte beschreiben. Analog wie Terme in der Mathematik verwenden wir dazu Ausdrücke:

#definition("Ausdruck", [
  Ein Ausdruck (engl. _expression_) ist ein Syntaxkonstrukt, das zur Beschreibung eines Wertes dient. Es gibt folgende Arten von Ausdrücken:

  - Literale
  - Variablen
  - Operationen

])

#definition("Auswertung", [
  Die Auswertung (engl.: _evaluation_) eines Ausdrucks ist die Bestimmung des Wertes dieses Ausdrucks.
 ])

== Literale

Ein Literal ist eine Schreibweise, mit der ein Wert direkt im Quellcode angegeben wird. Zu den Literalen gehören Zahlen, Booleans und Chars.

Beispiele für Zahlliterale sind 
```java
42 // Integer
42L // Long
3.5 // Double
3.5f // Float
+31 // Positiv, + ist implizit
-31 // Negativ
```

Booleans sind Wahrheitswerte, welche entweder den Wert wahr (`true`) oder falsch (`false`) haben. Dabei sind `true` und `false` Schlüsselwörter.

#definition("Schlüsselwort")[
  Schlüsselwörter (engl. _keywords_ oder _reserved words_) bestehen wie Bezeichner aus Buchstaben-Zahlen-Kombinationen, haben aber eine feste Bedeutung innerhalb der Programmiersprache, stehen daher nicht als Bezeichner zur Verfügung.
]

Chars sind einzelne Zeichen wie Buchstaben, Nummern oder Satzzeichen. Ein String ist eine Zeichenkette.

```java
'a' // Zeichen
"abc" // Zeichenkette
```

== Variable

Variablen sind benannte Speicherstellen, die Werte eines bestimmten Datentyps speichern. In der Auswertung werden sie durch die konkreten Werte ersetzt. Als Variablennamen stehen in Java alle nichtleeren Folgen von Zeichen `[a-zA-Z0-9_]` zur Verfügung, die nicht mit einer Ziffer beginnen und kein Schlüsselwort sind. Wie diese genau funktionieren, wird in @declaration vorgestellt.

Als nächstes wollen wir uns die wichtigsten Operationen auf primitiven Datentypen anschauen. 

== Unäre Operationen

Unäre Operationen sind Operationen, welche *einen* Ausdruck nehmen und einen neuen Wert zurückgeben. Zu den wichtigsten unären Operatoren gehören das unäre Plus (`+`), das unäre Minus (`-`) sowie die logische Negation (`!`). Bitoperationen sind Operationen, welche direkt mit den einzelnen Bits eines Wertes arbeiten wie zum Beispiel Bitwise Komplement. Diese sind in anderen Modulen relevant (siehe Grundlagen der technischen Informatik), werden hier aber nicht weiter behandelt.

```java
+42
-42
!true // false
```

== Binäre Operationen

Binäre Operationen sind Operationen, welche *zwei* Ausdrücke nehmen und einen neuen Wert zurückgeben. Dazu gehören Arithmetik-, Vergleichs-, Logik- und Zuweisungsoperatoren

Häufige Operationen auf Zahlen sind:

```java
jshell> 1.0 + 2.0
$1 ==> 3.0
jshell> 1.0 - 2.0
$2 ==> -1.0
jshell> 1.0 * 2.0
$3 ==> 2.0
jshell> 1.0 / 2.0
$4 ==> 0.5
jshell> 15 % 6 // Modulo
$5 ==> 3
```

#example("Ganzzahldivision", [
  Wenn beide Seiten einer Division Integer sind, wird Ganzzahldivision verwendet. Dabei wird nur das ganzzahlige Ergebnis der Division verwendet und der Rest wird ignoriert. Somit ergibt:

  ```java
  jshell> 1 / 3
  ```

  nicht etwa ~`0.3333`, sondern `0`.
])

Häufige Boolean Operationen sind:

```java
jshell> true && true // Und
$6 ==> true
jshell> true && false
$7 ==> false
jshell> true || false // Oder
$8 ==> true
jshell> false || false
$9 ==> false
```

Die Operationen Und sowie Oder haben in Java Lazy Evaluation. Dies bedeutet, dass der zweite Operand nur ausgewertet wird, wenn sein Wert für das Ergebnis benötigt wird.

```java
jshell> false && (1 / 0 == 0)
$10 ==> false
jshell> true || (1 / 0 == 0)
$11 ==> true
jshell> false || (1 / 0 == 0)
|  Exception java.lang.ArithmeticException: / by zero
|        at (#2:1)
```

== Ternäre Operationen

Der bedingte Operator (?:), häufig auch Ternary Operator genannt, ist der einzige ternäre Operator in Java. Ein ternäre Operator bestimmt einen neuen Wert anhand von *drei* Ausdrücken. Die Zeichen `?` und `:` gehören beide zum selben Operator. Sie können die Zeichen nicht einzeln verwenden. Der Operator evaluiert die Bedingung. Falls die Bedingung wahr ist, wird der erste Ausdruck zurückgegeben, ansonsten der zweite Ausdruck.

```java
condition ? expr1 : expr2
```

```java
jshell> true ? "Wahr" : "Falsch"
$12 ==> "Wahr"
```
