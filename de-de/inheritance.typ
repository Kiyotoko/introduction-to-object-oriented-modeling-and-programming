= Vererbung

Klassen können aus anderen Klassen erben. Vererben bedeutet, dass alle Attribute und Methoden aus der Basisklasse übernehmen.

Java erlaubt keine Mehrfachvererbung, d.b. jede Klasse kann aus maximal einer anderen Klasse erben. Alle Klassen erben, wenn nicht explizit angegeben, aus der Klasse ```java Object```.

Methoden können aus der Basisklasse überschrieben werden. Dafür muss in der Klasse eine Methode deklariert werden, welche die selbe Signatur hat wie die Methode aus der Basisklasse, welche überschrieben werden soll.

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

Abstrakte Methoden sind Methoden, die keine Implementierung haben. Die Methoden stellen eine Funktionalität bereit.

```java
abstract class YourClass {
  abstract void yourMethod();
}
```

== Verschachtelte Klassen

Eine verschachtelte Klasse (engl.: _nested class_) ist eine Klasse, welche in einer anderen Klasse verschachtelt ist. Eine solche Klasse kann auf alle private Attribute und Methode der äußeren Klasse (engl.: _outer class_) zugreifen.

Es gibt statische und nicht-statische verschachtelte Klassen. Statische Klasse sind unabhängig von den Instanzen der äußeren Klasse und können wie andere Klassen direkt über `new` erstellt werden. Nicht-statische Klassen sind

```java
class Outer {
  static class StaticNested {
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
