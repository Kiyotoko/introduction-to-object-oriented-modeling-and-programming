= Multithreading

== Threads

Ein Thread ist ein Strang von Anweisungen in einem Programm. Ein Thread nimmt eine Anweisung, führt diese aus und geht dann zur nächsten Anweisung.

Bisher haben wir immer nur Programme mit einem einzelnen Thread betrachtet. Jedoch können Programme beliebig viele Threads haben. Dies ist unter anderem Notwendig, wenn wir zwei Aufgaben gleichzeitig ausführen wollen. 

== Locking

Threads warten generell nicht aufeinander. Schließlich nutzen wir Threads überhaupt nur dafür, um Aufgaben gleichzeitig auszuführen. Manchmal benötigen wir aber Ressourcen, auf die niemand anderes gleichzeitig zugreifen soll. Um dies zu erreichen, können wir das Schlüsselwort ```java synchronized``` verwenden. Damit können wir erzwingen, dass der aktuelle Thread auf andere Threads wartet. Verwenden Sie so selten wie möglich `synchronized`, da jedes mal der Thread angehalten werden muss, was sehr viel Zeit kostet. Versuchen Sie stattdessen, dass jeder Thread seine eigenen Ressource zugewiesen bekommt und diese getrennt von einander abspeichert, um am Ende alle Ergebnisse zusammen zu fügen.

Wenn beim Aufruf einer Methode auf alle anderen Threads gewartet werden soll, kann die Methode selbst als `synchronized` markiert werden:

```java
synchronized void waitForAll() { ... }
```

Sollte es stattdessen ausreichen, dass nur der Zugriff auf ein Attribut oder Variable gesichert wird, so kann dies mit dem folgenden Code erreicht werden:

```java
Object shared;

...

synchronized (shared) {
  ...
}
```

== Race Condition

Angenommen wir haben das folgende Problem: Wir starten zwei Threads, die beide eine Variable 10000 mal erhöhen.

```java
class Main {
    static int number = 0;
    
    public static void main(String[] args) {
        Runnable exec = () -> {
            for (int i = 0; i < 10000; i++) number++;
        };
        new Thread(exec).start();
        new Thread(exec).start();

        System.out.println(number);
    }
}
```

Da die Variable zweimal jeweils 10000 mal um 1 erhöht wurde, würden wir erwarten, dass am Ende 20000 ausgegeben wird. Dies passiert in der Regel jedoch nicht.

Stattdessen liest ein Thread den aktuellen Wert der Variable und erhöht ihn um eins. Der andere Thread tut jedoch genau das selbe. Wer auch immer als letztes schreibt, hat gewonnen und das Ergebnis des anderen Threads wird einfach überschrieben! Dieses kongrete Problem nennen wir auch Race Condition.

Wie können wir dieses Problem lösen? Generell ist es am Besten, erst gar keinen solchen Code zu schreiben und wie oben beschrieben jedem Thread seinen eigenen Bereich zuzuteilen. Was ist, wenn wir trotzdem nur eine geteilte Variable nutzen wollen? Dies ist nicht möglich. Selbst mit `synchronized` können wir nicht garantieren, dass wir niemals einen Wert überschreiben werden.

== Dead Lock