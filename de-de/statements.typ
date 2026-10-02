#import "../common/callouts.typ": *

= Anweisung <statements>

#definition("Anweisung", [
  Eine Anweisung (engl.: _statement_) ist ein Syntaxkonstrukt, das während der Programmausführung eine Aktion ausführt oder den Ablauf der Ausführung beeinflusst.
  Arten von Anweisungen:

  - Auswertung eines Ausdruckes
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

#compile-error()[

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
]

== Zuweisungungen

Mit `=` kann einer Variable ein neuer Wert zugewiesen werden:

```java
int a = 1; // Deklaration + Initialisierung
int b; // Deklaration
b = 2; // Zuweisung
```

Auf der linken Seite steht die Variable, die verändert werden soll. Auf der rechten Seite steht der neue Wert. Dabei kann die Variable selbst ebenfalls auf der rechten Seite stehen:

```java
int a = 1; // Initialisiert mit 1
a = a + 1; // Variable wird um 1 erhöht
```

Anstatt ```java a = a + 1;``` zu schreiben, können Sie auch ```java a += 1;``` nutzen. Beide Ausdrücke beschreiben das Selbe und können durch das jeweils Andere ersetzt werden. Das Gleiche gilt auch für Subtraktion, Multiplikation und Division mit jeweils `-=`, `*=` und `/=`.

Darüber hinaus kann das Addiren oder Subtrahieren um 1 mit den beiden Operationen `++` und `--` noch einfacher geschrieben werden. Daher kann das obere Beispiel ```java a = a + 1;``` auch einfach durch ```java a++;``` ausgetrückt werden!

Auch wenn lokale Variablen kein Wert zugewiesen werden muss, müssen sie trotzdem vor ihrer Verwendung einen Wert erhalten.
Hier wurde `b` kein Wert bei der Deklaration zugewiesen. Das Lesen einer nicht initialisierten lokalen Variable ist nicht erlaubt:

#compile-error()[
  ```java
  { int i; System.out.println(i);}
  |  Error:
  |  variable i might not have been initialized
  |  { int i; System.out.println(i);}
  |                              ^
  ```
]

#complementary("Zuweisungen sind Ausdrücke")[
  Wie bereits im Text erwähnt, sind Zuweisungen in Java eigentlich Ausdrücke, und nicht Anweisungen. Das bedeutet, dass Zuweisungen auch immer einen Wert berechen und zurückgeben. Nur weil Sie Zuweisungen als Ausdrücke verwenden können, heißt dies nicht, dass Sie das auch tuen sollten. Ein Beispiel: Versuchen Sie das Ergebnis zu bestimmen. 

  #unexpected-result[
    ```java
    jshell> int i = 1;
    i ==> 1
    jshell> (i *= (i += (i = 2))) // ?
    ```
  ]
]

== If/Else

#definition("Kontrollstruktur")[
  Kontrollstrukturen (engl.: _control structures_) sind Syntaxkonstrukte, die dazu dienen, Anweisungen zu strukturieren und deren Ausführungsreihenfolge und -häufigkeiten festzulegen.
]

Bedingte Ausführung kann durch eine If/Else-Verzweigung erreicht werden.

```java
if (condition) {
  // Anweisung 1
} else {
  // Anweisung 2
}
```

Dabei ist `condition` ein boolescher Ausdruck.
Wenn der boolesche Ausdruck zu `true` ausgewertet wird, dann wird die Anweisung 1 ausgeführt, ansonsten die Anweisung 2. Dabei ist der ```java else```-Teil optional.

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

While und später For erlauben eine wiederholte Ausführung. Eine Anweisung wird solange ausgeführt, wie der boolesche Ausdruck (siehe `condition`) wahr ist. Nach jeder Ausführung des Statements wird die Bedingung erneut überprüft. Hier wird zuerst die Bedingung überprüft und dann das Statement ausgeführt.

```java
while (condition) {
  // Anweisung
}
```

Wenn Sie Beispeilsweise die ersten fünf Quadratzahlen ausgeben möchten, können Sie dafür den folgenden Code verwenden:

```java
jshell> int i = 1;
   ...> while (i <= 5) {
   ...>   System.out.printf("%d, ", i * i);
   ...>   i += 1;
   ...> }
1, 4, 9, 16, 25,
```

#complementary("Print mit Formatierung")[
  Mit ```java System.out.println(...)``` kann man etwas auf der Konsole ausgeben und danach eine neue Zeile beginnen. Daneben gibt aber auch ```java System.out.print``` und ```java System.out.printf```. Mit `print` kann man etwas ausgeben, ohne eine neue Zeile auszugeben. Zusätzlich erlaubt `printf` es, einen Formatierungs-String mit anzugeben. Dabei ist ein Formatierungs-String eine Zeichenkette mit verschieden Regeln, wie die danach folgenden Objekte dargestellt werden sollen. Dabei ist `%s` für Strings, `%f` für Fließkommazahlen, `%d` für Ganzzahlen und `%n` für eine neue Zeile. Dazwischen können beliebig viele reguläre Zeichen stehen, welche dann normal dargestellt werden. Es ist ebenfalls möglich, beliebig viele Objekte auf einmal darzustellen:

  ```java
  jshell> { int a = 2; int b = 3;
     ...>   System.out.printf("%d + %d = %d%n", a, b, a+b); }
  2 + 3 = 5
  ```
]

Was passiert, wenn die Bedingung sich nie ändert und immer Wahr bleibt? In diesem Fall erzeugt man eine Endlosschleife und die Anweisung wird immer wieder ausgeführt. Falls dies nicht beabsichtig war, können Sie ein Programm mit `CTRL + C` abbrechen.

Wenn man erst ein Statement ausführen möchte, und erst danach die Bedingung überprüfen will, kann man die Do/While Schleife nutzen:

```java
do {
  // Anweisung
} while (condition);
```

Wichtig: das Semicolon nach der Do/While Schleife kann nicht weggelassen werden!

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
   ...>   System.out.printf("%d, ", i * i);
   ...> }
1, 4, 9, 16, 25,
```

Diese For-Schleife macht das Gleiche wie die While-Schleife im Beispiel weiter oben.

#task("State und Statements")[
  1. Schreibe ein Programm, welches die #link("https://en.wikipedia.org/wiki/Factorial")[Fakultät $n!$] für eine Zahl $n$ ausgibt. Ausgabe für $n = 5$: $120$
  2. Schreibe ein Programm, welches das folgende Muster ausgibt. Ausgabe für $n = 4$:
    ```
       *
      * *
     * * *
    * * * *
     * * *
      * *
       *
    ```
  3. Schreibe ein Programm, welches das folgende Muster ausgibt. Ausgabe für $n = 5$:
    ```
         1
        1 1
       1 2 1
      1 3 3 1
     1 4 6 4 1
    1 5 10 10 5 1
    ```

    Hinweis: Eine Zahl entspricht immer der Summe der beiden oberen Zahlen. Siehe auch #link("https://en.wikipedia.org/wiki/Pascal%27s_triangle")[Pascalsches Dreieck].

  #solution("https://codeberg.org/karlz/introduction-to-oop-and-uml/src/branch/master/solution/state-and-statements.md")[Lösung]
]
