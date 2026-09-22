= Immutable in Java

Generell sind Daten, Methoden als auch Klassen in Java veränderbar. Eine Variable kann zum Beispiel überschrieben oder eine Klasse erweiter werden. Dies ist allerdings nicht immer gewollt. 

Wenn etwas veränderbar ist, nennen wir es mutable. Wenn es nicht veränderbar ist, immutable.

== Der Modifikator `final`

Um etwas als immutable zu kennzeichen, können wir den Modifikator `final` davor schreiben.

```java
final class Person {
  final long birthday;

  final boolean older(Person other) {
    return birthday > other.birthday;
  }
}
```

Ein Attribut mit `final` kann nur wenn es initialisiert wird beschrieben werden, also maximal nur einmal und auch nur im Konstruktor. Danach kann der Wert des Attributes nicht verändert werden.

Doch vorsicht! Objekte werden in der Regel als Referenz abgespeichert. Eine Referenz zeigt auf die konkrete Instanz. Wenn wir eine Referenz als `final` markieren, können wir ihr keine neue Instanz zuweisen. Was jedoch immer noch möglich ist, ist alle Attribute innerhalb der Referenz zu verändern. Um dies zu verhindern, müssen auch hier wieder alle Attribute als `final` markiert werden.

== String vs. StringBuilder
