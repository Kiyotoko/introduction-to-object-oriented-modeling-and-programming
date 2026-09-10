= I/O Streams

Damit ein Programm überhaupt eine Eingabe lesen oder eine Ausgabe schreiben kann, gibt es Streams. Ein Stream kann entweder vom Terminal, von einer Datei oder einem Netzwerk Socket lesen und schreiben. In der Vorlesung werden wir uns primär mit dem Schrieben und Lesen des Terminals beschäftigen.

== Standard Output Stream

Um in das Terminal zu schreiben, gibt es zwei Output Streams. Diese hatten wir bereits verwendet, ohne sie genauer zu erklären. In der Regel wird der Output Stream `out` für die reguläre Ausgabe verwendet und `err` für Fehler.

Jeder Stream hat die beiden Methoden `write(...)` und `flush()`. Mit `write(...)` kann man Daten (Bytes) in den Stream schreiben. Allerdings ist damit nicht garantiert, dass diese Daten auch wirklich ins Terminal oder in die Datei geschrieben wurden.

Immer wenn wir in ein Terminal oder Datei schreiben oder lesen, müssen wir dafür das Betriebssystem anfragen (Syscall). Wenn wir zum Beispiel in eine Datei einhundert mal eine Zeile schreiben würden, müssten wir auch einhundert mal die Datei öffnen, die Zeile schreiben und dann wieder die Datei schließen. Dies wäre sehr langsam.

Um dieses Problem zu lösen, verwenden Output Streams Buffer. Ein Buffer ist ein Bereich im Arbeitsspeicher (z.B. RAM), auf dem die Daten zwischengespeichert werden. Wenn wir hier einhundert mal die Methode `write` aufrufen, wird zuerst in den Buffer geschrieben. Wenn zwischendurch der Buffer voll ist, wird alles in die Datei geschrieben und der Buffer gelehrt. Um am Ende sicherzugehen, dass alles aus dem Buffer auch wirklich geschrieben wurde, können wir nun die Methode `flush` verwenden. Diese garantiert, dass am Ende der Buffer gelehrt wird und alles auch geschrieben wird.

Die Streams `out` und `err` haben zusätzlich noch die Methoden `print(...)` und `println(...)`. Die Methode `print` ruft am Ende immer automatisch `flush` auf. Mit `println` kann man zusätzlich einen Zeilenumbruch einfügen.

```java
int age = ...;
if (age < 0) {
  System.err.println("age should be positive");
} else {
  System.out.println("you are " + age + " years old");
}
```

== Input Stream

Input Streams sind, wie der Name bereits andeutet, dafür da, um eine Eingabe zu lesen.

```java
import java.util.Scanner;

...

Scanner scanner = new Scanner(System.in);

System.out.print("Enter your name: ");
String name = scanner.nextLine();

System.out.print("Enter your age: ");
int age = scanner.nextInt();
```
