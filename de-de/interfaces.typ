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

Zeigt an, dass man For Each anwenden kann.

```java
List<Object> list = ...
for (Object element : list) {
  ...
}
```
