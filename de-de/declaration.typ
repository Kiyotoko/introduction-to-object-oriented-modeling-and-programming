#import "../common/callouts.typ": *

= Deklaration <declaration>

#definition(
  "Deklaration",
  "Eine Deklaration (engl.: _declaration_) führt einen Bezeichner ein und legt seine Eigenschaften innerhalb eines Programms fest.",
)

Um eine Variable verwenden zu können, muss sie zunächst deklariert werden. Eine Variablendeklaration legt den Namen und den Datentyp einer Variable fest.

#definition(
  "Datentyp",
  "Ein Datentyp (engl.: _data type_) ist gekennzeichnet durch einen Wertebereich sowie Operationen auf diesem Wertebereich",
)

Es wird immer zuerst der Datentyp festgelegt und dann der Name der Variable. Anschließend kann der Variablen direkt ein Wert zugewiesen werden.
Beispiel für eine Variablendeklaration mit Initialisierung:

```java
jshell> int a = 1;
a ==> 1
```

Hier wurde eine Variable `a` vom Datentyp `int` mit dem Wert `1` initialisiert. Eine Variable kann zunächst ohne Wert deklariert werden. Lokale Variablen müssen jedoch vor ihrer Verwendung einen Wert erhalten. Attribute von Objekten und statische Variablen erhalten automatisch einen Standardwert.

```java
int a = 1; // Deklaration + Initialisierung
int b; // Deklaration
b = 2; // Zuweisung
```

Hier wurde `b` kein Wert bei der Deklaration zugewiesen. Das Lesen einer nicht initialisierten lokalen Variable ist nicht erlaubt:

```java
{ int i; System.out.println(i);}
|  Error:
|  variable i might not have been initialized
|  { int i; System.out.println(i);}
|                              ^
```

Bei Attributen und Array-Elementen wird der Standardwert genutzt. Bei Zahlen ist dies `0` bzw. `0.0` für Gleitkommazahlen, bei Booleans `false` und bei Objekten `null`.

```java
class Example {
  int a; // Automatisch 0
}
```

Deklaration und später auch Anweisungen werden mit einem Semikolon (`;`) beendet. Das Semikolon markiert das Ende vieler Anweisungen in Java. Die Anzahl von Leerzeichen, Tabs oder Zeilenumbrüchen zwischen den Bestandteilen einer Anweisung ist für Java nicht relevant.
