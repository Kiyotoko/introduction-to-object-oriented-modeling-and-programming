= Erste Schritte <getting-started>

== Java installieren

Bevor Sie beginnen, sollten Sie zunächst Java sowie einen Editor oder eine IDE installieren. Die Installation wird am Anfang von den Übungen ausführlich behandelt. Sie können über Adoptium #link("https://adoptium.net/temurin/releases/?version=8&os=any&arch=any")[Java] herunterladen. In diesem Kurs werden wir ausschließlich Java 8 verwenden.

== Hello World

Erstellen Sie ein neues Verzeichnis Ihrer Wahl und darin eine neue Datei namens `Main.java`.

Schreiben Sie den folgenden Inhalt in die Datei:

```java
// Definiert eine Klasse mit dem Namen Main.
public class Main {

  // Die Methode, mit der das Programm beginnt.
  public static void main(String[] args) {

    // Gibt den Text auf der Konsole aus.
    System.out.println("Hello, World!");
  }
}
```

Führen Sie dafür das folgende im Terminal aus:

```sh
javac Main.java
```

Dabei wird die Datei `Main.class` erzeugt. Sie enthält den kompilierten Bytecode, den die Java Virtual Machine (JVM) ausführen kann.

Um diesen Code in der JVM auszuführen, können Sie den folgenden Befehl nutzen:

```sh
java Main
```

Wenn Sie alles richtig gemacht haben, sollte nun die folgende Ausgabe in Ihrem Terminal erscheinen:

```
Hello, World!
```

== Was haben Sie gerade gemacht?

Sie haben gerade eine neue Klasse namens Main erstellt. Da die Klasse ```java public``` ist, muss der Dateiname mit dem Klassennamen übereinstimmen. Dieses Programm enthält eine `main` Methode. Wenn Sie `java Main` ausführen, sucht die JVM nach einer Methode mit der Signatur

```java
public static void main(String[] args)
```

und beginnt dort mit der Ausführung des Programms.

Java Quellcode ist eine menschliche Form, um Code zu beschreiben. Ihr Computer kann jedoch nur Bytecode ausführen. Da wir nicht in Nullen und Einsen programmieren wollen, schreiben wir Programme in Quellcode. Das Übersetzen von Quellcode in Bytecode nennt man kompilieren.
Sie können dieses Java Programm mit dem `javac` Befehl kompilieren.


== JShell

Java enthält das Programm JShell. Damit können Ausdrücke einfach interaktiv ausgewertet werden. Um eine neue JShell zu starten, führen Sie den folgenden Befehl im Terminal aus:

```shell
jshell
|  Welcome to JShell -- Version *.*.*
|  For an introduction type: /help intro
```
```java
jshell> 1+2
$1 ==> 3

jshell> "Hello " + "World!"
$2 ==> "Hello World!"

jshell> {
   ...>     // Very
   ...>     // Long
   ...>     // Block
   ...> }

jshell> int i = 1 + 2;
i ==> 3
```

Was passiert hier? Am Anfang eines jeden Ausdrucks steht der Name des Programmes `jshell>` gefolgt von der Anweisung, welche man ausführen möchte. Jede Anweisung können Sie mit der Eingabetaste ausführen. Danach wird das Ergebnis ausgegeben. Dabei werden die einzelnen Anweisungen automatisch durchnummeriert. So erhält zum Beispiel die erste Anweisung die Nummer 1, die zweite die Nummer 2, etc. Bei der Ausgabe steht zunächst, wo der neue Wert steht, dann ein Pfeil (```java ==>```) gefolgt von dem neuen Wert. Falls einer Variable einem Wert zugewiesen wurde, steht der Name der Variable auf der linken Seite anstatt der Nummer der Anweisung.

Im Verlauf dieses Kurses werden wir JShell verwenden, um Ihnen verschiedene Ausdrücke oder Anweisungen näher zu bringen.

Alternativ können Sie einen der vielen Online-Compiler verwenden, um Java schnell auszuprobieren. Diese eignen sich besonders für kleine Experimente und benötigen keine lokale Installation. Für größere Projekte oder das Praktikum sind sie jedoch ungeeignet, da sie häufig keine Projekte mit mehreren Dateien unterstützen und den Quellcode nicht dauerhaft speichern.
