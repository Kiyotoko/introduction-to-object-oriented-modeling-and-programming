#import "../common/callouts.typ": *

= Interfaces

Interfaces sind Schnittstellen, die eine Menge an Methoden bereitstellen. Alle Interfaces sind abstrakt.

- Methoden sind generell ```java public``` und ```java abstract```
- Methoden können einen default Modifikator haben, um eine Implementierung zu erlauben
- Intefaces können keine Konstruktoren irgendeiner Art haben und haben keine Attribute.

```java
public interface Consumer<T> {
  // Abstrakte Methode ohne Body
  void accept(T t);

  // Default Methode mit Body
  default Consumer<T> andThen(Consumer<? super T> after) {
    return t -> {
      this.accept(t);
      after.accept(t);
    };
  }
}
```

== Lambda Ausdrücke

Erstellen ein neues Interface.

Ein Interface kann wie bei abstrakten Klassen und Anonymous inner Class mit dem Schlüsselwort `new` erstellt werden:

```java
Consumer<Object> consumer = new Consumer<>() {
  public void accept(Object t) {
    System.out.println(t);
  }
};
```

== Initialisierung eines neuen Interfaces

Falls ein Interface nur eine einzige abstrakte Methode hat, handelt es sich um ein Functional Interface und man kann einen Lambda-Ausdruck verwenden. Ein Lambda-Ausdruck definiert nur die abstrakte Methode.

```java
Consumer<Object> consumer = (Object t) -> {
  System.out.println(t);
};
```

Dabei sind ```java (Object t)``` die Liste an Argumenten, hier nur ein Objekt namens `t`. Der Pfeil (`->`) zeigt, dass es ein Lambda-Ausdruck ist. Zum Schluss kommt der Body der Methode. Die Bezeichnung der Datentypen können immer weggelassen werden. Falls die Methode nur ein Argument hat, kann man auch die runden Klammern weglassen:

```java
Consumer<Object> consumer = t -> {
  System.out.println(t);
};
```

Wenn der Body des Lambda-Ausdrucks nur aus einem Statement besteht, kann man die Gruppierung weglassen.

```java
Consumer<Object> consumer = t -> System.out.println(t);
```

Falls im Lambda-Ausdruck nur eine Methode aufgerufen wird, welche die exakt gleiche Signatur hat wie das Interface, kann man mit zwei Doppelpunkten (`::`) auch die Methode referenzieren. In unserem Fall nimmt die Methode `println` genau ein Objekt als Argument und gibt nichts (```java void```) zurück. Damit hat es die selbe Signatur wie die Methode `accept`.

```java
Consumer<Object> consumer = System.out::println(t);
```

== Das Interface `Iterable`

Das Interface Iterable ist ein wichtiges Interface der Java Standartbibliothek. Es erlaubt, eine Sammlung von Objekten abzulaufen, ohne deren innere Struktur zu kennen. Dafür müssen zwei Methoden implementiert werden: die erste Methode `hasNext()` gibt an, ob es noch Objekte gibt, die abgelaufen werden müssen. Die zweite Methode `next(...)` gibt das nächste Element zurück und geht dann eins weiter. 

```java
import java.util.*;

...

Iterable<Integer> collection = List.of(-4,-1,0,1,2,3,5,8,13);
Iterator<Integer> iter = collection.iterator();
while (iter.hasNext()) {
  Integer number = iter.next();
  if ((number & 1) == 0)
    System.out.printf("%d is even!%n", number);
}
```

Uff! Zuerst mussten wir einen Iterator `iter` erstellen, um dann immer erst mit `hasNext()` zu überprüfen, ob ein Element existiert. Erst dann konnten wir das Element selbst deklarieren und mit `next()` darauf zugreifen. Glücklicherweiße geht dies auch einfacher, und zwar mit dem For-Each Syntax:

```java
import java.util.*;

...

Iterable<Integer> collection = List.of(-4,-1,0,1,2,3,5,8,13);
for (Integer number : collection) {
  if ((number & 1) == 0)
    System.out.printf("%d is even!%n", number);
}
```

Was passiert hier? Mit dem Doppelpunkt wird hier direkt das erstellen eines Iterators, überprüfen ob noch Elemente übrig sind und das zuweisen dieser in einer Anweisung zusammengefasst. Vor dem Doppelpunkt wird die Variable mit Typ deklariert. Hinter dem Doppelpunkt steht das Iterable Objekt, aus dem der Iterator erstellt werden soll.
Dieser Syntax kann neben Iterable nur noch auf Arrays angewandt werden. Dabei implementieren Arrays nicht Iterable.

In diesem Kapitel ist zwar das einzige vorgestellte Interface, dennoch gibt es noch viele mehr. Dazu gehören zum Beispiel `Clonable`, `Runnable`, `RandomAccess`, `AutoClosable`, `List`, `Map`, `Set` und noch viele mehr. Viele davon wurden bereits am Rande eingeführt und andere werden noch besprochen. Nur die beiden Interfaces `Iterable` und `AutoClosable` erlauben das verwenden von neuen Syntax Strukturen.

== Darstellung in UML

In UML werden Interfaces mit dem Tag `>>interface<<` dargestellt. Da es keine Attribute gibt, werden nur die Methoden dargestellt. Wenn eine Klasse ein Interface implementiert, wird dies durch einen gestrichelten Pfeil gekenzeichnet. Alles andere wie Vererbung unter Interfaces und Methoden wird genauso dargestellt wie auch bei Klassen.

```source-diagram-java
@Layout(level=0, order=0)
interface Collection {
  public T add();
  public boolean remove(Object obj);
}
@Layout(level=0, order=1)
interface List extends Collection {
  public T get(int index);
  public T set(int index, T value);
}
@Layout(level=0, order=2)
class ArrayList implements List {
  protected int modCount;

  public ArrayList();
}
```

== Annotationen

Alle Annotation sind eigentlich nur Interfaces#footnote[Und Interfaces eigentlich nur besonders tolle abstrakte Klassen.]. Genau wie Interfaces haben diese keine Konstruktoren oder Attribute und bieten stattdessen Methoden als Schnittstellen an. Die Annotation ```java @Override``` haben Sie bereits aus dem Kapitel Vererbung kennengelernt.

Ein wichtiger Unterschied zu normalen Interfaces ist, dass diese keine Schnittstelle im Code darstellen, sodern für die syntaktische Struktur des Codes selbst. Annotation erlauben es, zusätzliche Informationen an Methoden, Klassen oder Attribute zu packen, welche dann vom Compiler oder durch die Java Reflection API abgerufen werden können.

Was ist überhaupt Reflection? Reflection ist ein Paradigma genau wie Funktionale Programmierung oder Objekt Orientierte Programmierung, indem man in einem Programm die Struktur des Programmes selbst untersuchen kann.

```java
@interface Meta {
  // Abstrakte Methoden
  String[] authors();
  String description();
  // Methode mit Default Wert
  double version() default 0.0;
}

// Annotation wird angewendet
@Meta(
  authors={"Alice", "Bob"},
  description="The entry point to your application")
public class Main { ... }
```

Wie genau Annotation funktionieren, was man damit alles machen kann, etc. ist in dieser Vorlesung nicht relevant. Dennoch sollten Sie zumindest wissen, dass diese existieren.

#task("Spaß mit Interfaces", [
  1. Schreibe eine Klasse `Range`, welche eine Startzahl und eine Endzahl nimmt. Diese Klasse hat die Aufgabe, über alle Zahlen vom Start bis zum Ende zu iterieren. Die erstellte Klasse soll das Interface `Iterable` implementieren. Damit soll es möglich sein, über einen Bereich von Zahlen im Einerschritt drüber zu gehen. Beispiel:

    ```java
    for (int number : new Range(0, 10)) {
      System.out.println(number);
    }
    ```
  2. Nutzen Sie Ihre Klasse `Range` aus Aufgabe 1, die Methode `forEach(...)` und einen Lambda-Ausdruck, um für jede Zahl ihre Quadratzahl auszugeben.
  3. Was passiert, wenn eine Klasse sowohl das Interface `Function<Object, Object>` als auch `Converter` implementiert? Dabei erbt `Converter` (siehe unten) aus `Function`. Warum?

    ```java
    interface Converter extends Function<Integer, Double> {}

    static class Test1 implements
      Function<Double, Double>, Converter {}
    ```

    Hinweis: Sie können die Dokumentation zu den Interfaces #link("https://docs.oracle.com/en/java/javase/26/docs/api/java.base/java/util/function/package-summary.html")[hier] finden. Es wird nicht verlangt, dass sie diese auswendig können.

  4. Was passiert, wenn eine Klasse sowohl das Interface `Function<Object, Object>` als auch `UnaryOperator<Object>` implementiert? Dabei erbt `UnaryOperator` aus `Function`. Warum?

    ```java
    class Test2 implements
      Function<Object, Object>,
      UnaryOperator<Object> { ... }
    ```
])

