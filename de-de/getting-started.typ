= Erste Schritte <getting-started>

== Java installieren

Bevor Sie anfangen, sollten Sie zunächst Java sowie einen Editor oder eine IDE installieren. Dies wird Primär in den Übungen besprochen. Sie können über Oracle #link("https://www.oracle.com/java/technologies/javase/javase8u211-later-archive-downloads.html")[Java] herunter laden.

== Hello World

Erstellen Sie ein neues Verzeichnis ihrer Wahl und darin eine neue Datei namens `Main.java`. 

Schreiben Sie den folgenden Inhalt in die Datei:

```java
public class Main {
  public static void main(String[] args) {
    System.out.println("Hello, World!");
  }
}
```

Dieses Programm erstellt eine neue Klasse. Der Name der Klasse muss mit dem Namen der Datei übereinstimmen. Dieses Programm enthält eine `main` Methode. Diese Methode ist der Eintrittspunkt in ihr Programm.

Java Quellcode ist eine menschliche Form, um Code zu beschreiben. Ihr Computer kann jedoch nur Maschinencode ausführen. Da wir nicht in 0 und 1 Programmieren wollen, schreiben wir Programme in Quellcode. Das übersetzen von Quellcode in Maschinencode nennt man kompilieren.
Sie können dieses Java Programm mit dem `javac` Befehl kompilieren. Führen Sie dafür das folgende im Terminal aus:

```sh
javac Main.java
```

Dieser Befehl generiert `.class`-Dateien. Diese Datein können über die Java VM ausgeführt werden.
Um diesen Code in der Java VM auszuführen, können Sie den folgenden Befehl nutzen:

```sh
java Main.class
```
