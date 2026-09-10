#import "../common/callouts.typ": *

= Klassen und Vererbung

#definition("Klasse")[
  Eine Klasse ist ein synthetisches Konstrukt, welches genutzt wird, um Objekte zu erstellen. Objekte der selben Klasse teilen sich die gleiche Art für Zustand (Variablen) und Verhalten (Methoden).
]

Um zu verstehen, was überhaupt Klassen sind und warum man diese überhaupt verwenden möchte, hier ein Beispiel:
Betrachten wir die Klasse ```java Student```. Alle Studenten haben die Werte Name und Matrikelnummer. Zusätzlich haben alle Studenten das Verhalten ```java lernen```.
Zwei konkrete Studenten (Objekte) sind Alice und Bob. Alice hat die Matrikelnummer 3727001 und Bob die Nummer 3727002.

Eine neue Klasse kann mit dem Schlüsselwort ```java class``` deklariert werden. Hier ist eine konkrete Implementierung für die Klasse ```java Student```.

```java
class Student {
  String name;
  long campusCard;

  Student(String name, long campusCard) {
    this.name = name;
    this.campusCard = campusCard;
  }

  void lernen() { ... }

  public static void main(String[] args) {
    Student alice = new Student("Alice", 3727001);
    Student bob = new Student("Bob", 3727002);
  }
}
```

== Sichtbarkeit-Modifikatoren

Attribute, Methoden und Klassen haben einen Sichtbarkeits-Modifikator. Der Modifikator steht ganz am Anfang der Deklaration und legt fest, von wo aus im Projekt man auf diese Deklaration zugreifen kann.

#{
  let x = align(center, [x])
  table(
    columns: { for _ in range(5) { (auto,) } },
    strong[Modifikator], strong[Selbe Klasse], strong[Selbes Paket], strong[Erbt aus Klasse], strong[Überall],
    ```java private```, x, [], [], [],
    [Kein Modifikator], x, x, [], [],
    ```java protected```, x, x, x, [],
    ```java public```, x, x, x, x,
  )
}

== Vererbung

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
