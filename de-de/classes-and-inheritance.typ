= Klassen und Vererbung

Eine neue Klasse kann mit dem Schlüsselwort `class` deklariert werden.

== Vererbung

```java
class YourClass extends BaseClass {
  @Override
  void baseMethod() { ... }

  void yourMethod() { ... } 
}
```

== Die Klasse `Object`

Jede Klasse erbt implizit aus der Klasse `Object`. Diese Klasse stellt eine Reihe von Methoden zur Verfügung, die alle Objekte nutzen können.

== Abstrakte Klassen

```java
abstract class YourClass {
  abstract void yourMethod();
}
```

== Verschachtelte Klassen

Eine verschachtelte Klasse (engl.: „nested class“) ist eine Klasse, welche in einer anderen Klasse verschachtelt ist. Eine solche Klasse kann auf alle private Attribute und Methode der äußeren Klasse (engl.: „outer class“) zugreifen.

Es gibt statische und nicht-statische verschachtelte Klassen. Statische Klasse sind unabhängig von den Instanzen der äußeren Klasse und können wie andere Klassen direkt über `new` erstellt werden. Nicht-statische Klassen sind 

```java
class Outer {
  satic class StaticNested {
    // Klasse befindet sich innerhalb einer anderen Klassen
  }

  class NonStaticNested {

  }
}
```

== Anonymous Inner Class

Anonymous Inner Classes ermöglichen es, Instanzen einer Klasse zu erstellen, ohne der Klasse selber einen Namen zu geben.

```java
Anonymous ano = new Anonymous() {
  @Override
  public String toString() { ... }
};
```