#import "../common/callouts.typ": *

= I/O Streams

Damit ein Programm Eingaben lesen oder Ausgaben schreiben kann, benötigt es sogenannte Streams. Ein Stream stellt einen Datenfluss zwischen einem Programm und einer Datenquelle bzw. einem Datenziel dar. Eine Datenquelle kann beispielsweise das Terminal, eine Datei oder ein Netzwerk-Socket sein.

In dieser Vorlesung betrachten wir zunächst die Standard-Streams eines Java-Programms. Java stellt dafür drei Standard-Streams bereit:

- `System.in` für die Standardeingabe
- `System.out` für die Standardausgabe
- `System.err` für die Standardfehlerausgabe

Die Standard-Streams werden beim Start eines Java-Programms automatisch bereitgestellt. Wir müssen sie daher nicht selbst öffnen. Sie sind bei interaktiven Programmen häufig mit dem Terminal verbunden, können aber beispielsweise auch auf eine Datei oder einen anderen Stream umgeleitet werden.

== Standard Output

Um Daten in das Terminal zu schreiben, stehen uns `System.out` und `System.err` zur Verfügung. Beide haben wir bereits verwendet, ohne die zugrunde liegenden Streams genauer zu betrachten.

`System.out` wird normalerweise für die reguläre Ausgabe verwendet. `System.err` ist für Fehlermeldungen und andere diagnostische Ausgaben vorgesehen. Zum Beispiel:

```java
int age = 42;
if (age < 0) {
  System.err.println("age should be positive");
} else {
  System.out.println("you are " + age + " years old");
}
```

Obwohl beide Streams normalerweise im selben Terminal sichtbar sind, handelt es sich um zwei unterschiedliche Ausgabekanäle. Das Betriebssystem kann Standardausgabe und Standardfehler beispielsweise getrennt umleiten.


`System.out` und `System.err` sind Instanzen der Klasse `PrintStream`. PrintStream stellt unter anderem die Methoden `print(...)` und `println(...)` bereit. Diese Klasse stellt komfortable Methoden für die Ausgabe von Text und anderen Datentypen bereit.

Wie bereits aus vorherigen Kapitel bekannt, verwenden  wir besonders häufig:
- ```java print(...)``` gibt einen Wert aus, ohne automatisch einen Zeilenumbruch anzufügen.
- ```java println(...)``` gibt einen Wert aus und fügt anschließend einen Zeilenumbruch an.

Zum Beispiel:

```java
System.out.print("Hello ");
System.out.print("World");
// Ergibt: Hello World
```

Dagegen:

```java
System.out.println("Hello");
System.out.println("World");
// Ergibt:
// Hello
// World
```

#complementary("Write und Flush")[
  Ein Output Stream stellt unter anderem die Methoden `write(...)` und `flush()` bereit. Mit `write(...)` können Daten in den Stream geschrieben werden. Bei einem byteorientierten Stream geschieht dies zunächst in Form einzelner Bytes.

  Das Schreiben in einen Stream bedeutet nicht zwangsläufig, dass die Daten sofort am endgültigen Ziel ankommen. Bei vielen Streams werden Daten zunächst in einem Puffer zwischengespeichert. Dadurch können mehrere Schreibvorgänge gesammelt und gemeinsam an das Ziel weitergegeben werden, wodurch die Anzahl notwendiger System Calls reduziert wird.

  Die Methode `flush()` fordert den Stream dazu auf, ausstehende Daten weiterzugeben. Bei einem gepufferten Stream werden dabei insbesondere die aktuell im Puffer befindlichen Daten an das Ziel weitergeleitet. Beispielsweise:

  ```java
  System.out.write("Hello".getBytes());
  System.out.flush();
  ```

  `flush()` ist vor allem dann relevant, wenn Daten sofort sichtbar bzw. weitergegeben werden sollen, obwohl der Puffer noch nicht voll ist. Es garantiert jedoch nicht, dass die Daten bereits dauerhaft auf einem Speichermedium gespeichert wurden.
]

== Input Stream

Input Streams sind dafür zuständig, Daten aus einer Quelle zu lesen. Der Standard-Input-Stream eines Java-Programms ist `System.in`.
`System.in` ist ein byteorientierter InputStream. Das direkte Lesen einzelner Bytes ist für typische Benutzereingaben allerdings eher umständlich. Deshalb verwenden wir häufig die Klasse `Scanner`, die Daten aus einem Input Stream lesen und in verschiedene Java-Datentypen umwandeln kann.

Wichtig: Ein Scanner ist selbst kein Stream. Er ist eine Hilfsklasse, die einen Stream liest und die darin enthaltenen Daten interpretiert.

```java
import java.util.Scanner;

...

Scanner scanner = new Scanner(System.in);

System.out.print("Enter your name: ");
String name = scanner.nextLine();

System.out.print("Enter your age: ");
int age = scanner.nextInt();
```

Hier passiert Folgendes:
- `System.in` stellt die Eingabe des Programms bereit.
- `new Scanner(System.in)` erzeugt einen Scanner, der diesen Input Stream liest.
- `nextLine()` liest Text bis zum Ende einer Zeile.
- `nextInt()` liest das nächste Token und wandelt es in einen ```java int``` um.

Der Scanner übernimmt damit einen Teil der Arbeit, die beim direkten Lesen eines Streams notwendig wäre.
