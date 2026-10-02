#import "../common/callouts.typ": *

= Klassen

#definition("Klasse")[
  Eine Klasse definiert einen Typ und beschreibt, welche Daten und welches Verhalten Objekte dieses Typs besitzen. Objekte derselben Klasse besitzen dieselbe Struktur: Sie können dieselben Attribute und Methoden haben. Die konkreten Werte ihrer Attribute können sich jedoch unterscheiden.
]

Um zu verstehen, was Klassen sind und warum man sie verwendet, betrachten wir die Klasse ```java Student```. Jeder Student besitzt einen Namen und eine Matrikelnummer. Zusätzlich können Studenten lernen.
Zwei konkrete Studenten (Objekte) sind Alice und Bob. Alice hat die Matrikelnummer 3727001 und Bob die Nummer 3727002.

Eine neue Klasse kann mit dem Schlüsselwort ```java class``` deklariert werden. Hier ist eine konkrete Implementierung für die Klasse ```java Student```.

```java
public class Student {
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

== Klassen vs. Instanzen

Eine Klasse beschreibt unter anderem die Attribute und Methoden, die ihre Instanzen besitzen.

Eine Instanz ist ein konkretes Objekt einer Klasse. Sie besitzt ihren eigenen Zustand, der durch die Werte ihrer Instanzattribute bestimmt wird. Die Werte der Attribute zweier verschiedener Instanzen sind voneinander unabhängig.
Alle Instanzen derselben Klasse haben dieselbe Struktur, aber nicht zwingend dieselben Werte.

Im Beispiel oben heißt die Klasse Student. Diese definiert alle möglichen Attribute und Methoden. Sie legt keine Werte fest. In der `main`-Methode werden zwei Objekte der Klasse Student erstellt und den Variablen `alice` und `bob` zugewiesen. Beim Erzeugen werden jeweils der Name und die Matrikelnummer über den Konstruktor festgelegt. Die konkreten Werte sind jeweils von den anderen Instanzen unabhängig. Da beide zur selben Klasse gehören, haben sowohl Bob als auch Alice dieselbe Struktur. Dies bedeutet, dass beide zum Beispiel die Methode lernen haben.

Die Variable `alice` enthält nicht das Objekt selbst, sondern eine Referenz auf das erzeugte Objekt. Der Ausdruck `new Student(...)` erzeugt ein neues Objekt und liefert eine Referenz auf dieses Objekt zurück.

#complementary("Referenzen")[
  Referenzen ermöglichen den Zugriff auf Objekte. Eine Referenz wie `alice` enthält nicht das Objekt selbst, sondern verweist auf ein Objekt.

  #align(center)[```
  alice ──────► Student-Objekt
                 ► name = "Alice"
                 ► campusCard = 3727001
  ```]

  Es kann mehrere Referenzen zum selben Objekt geben. Wenn dann ein Objekt geändert wird, betrifft dies auch alle anderen Objekte.

  ```
  Student alice = new Student("Alice", 3727001);
  Student alex = alice;
  alice.name = "Alex";
  System.out.println(alex); // Alex
  ```
]

== Attribute

Ein Attribut (engl: _field_) ist eine Variable, die innerhalb einer Klasse deklariert wird. Ein Instanzattribut gehört zu einem konkreten Objekt. Deshalb besitzt jedes Objekt seinen eigenen Wert für dieses Attribut. Oben hat die Klasse `Student` genau zwei Attribute angelegt: Name und Campus Card.

Wenn ein Instanzattribut nicht explizit initialisiert wird, erhält es automatisch den Standardwert seines Typs. Numerische Typen erhalten 0, boolean erhält false und Referenztypen erhalten null. Für lokale Variablen gelten diese Standardwerte hingegen nicht.

Im Gegensatz zu lokalen Variablen können Attribute mit einem Zugriffsmodifikator versehen werden. Was genau ein solcher Modifikator macht und welche es überhaupt gibt, wird in einem späteren Kapitel erklärt.

== Der Modifikator `static`

Es gibt außerdem `static`-Attribute und -Methoden. Diese gehören nicht zu einer einzelnen Instanz, sondern sind an die Klasse gebunden. Eine `static`-Methode kann ohne eine Instanz aufgerufen werden. Deshalb kann sie nicht direkt auf Instanzattribute oder Instanzmethoden zugreifen: Es gibt keine aktuelle Instanz, auf die sich ein solcher Zugriff beziehen könnte. Über eine Referenz auf ein Objekt ist der Zugriff allerdings möglich. Die `main`-Methode ist `static`, weil sie vom Java-Laufzeitsystem aufgerufen wird, ohne zuvor eine Instanz der Klasse zu erzeugen.

```java
public class Cat {
      // vvvvvv Datentyp
  public String owner;
//^^^^^^        ^^^^^ Modifikator und Name
  boolean fluffy = true;
              // ^^^^^^ Explizit initialisiert

  public static void main(String[] args) {
    Cat cheshire = new Cat();
    System.out.println(cheshire.owner); // null
    cheshire.owner = "Alice";
    System.out.println(cheshire.owner); // Alice
    System.out.println(cheshire.fluffy); // true
  }
}
```

== Methoden

Um Klassen ein Verhalten zu geben, brauchen wir Methoden.
Eine Methode hat einen Namen, eine Liste von Parametern sowie einen Rückgabetyp. Zusätzlich kann sie einen einzigen Zugriffsmodifikator haben sowie eine beliebige Anzahl weiterer Modifikatoren, die in den nachfolgenden Kapiteln eingeführt werden. Im nachfolgenden Beispiel ist die Methode ```java max``` dargestellt mit allen beschrifteten Bestandteilen:

```java
public int max(int a, int b) {
// ^^^ Zugriffsmodifikator
//     ^^^ Rückgabetyp
//         ^^^ Name
//             ^^^^^^^^^^^^ Parameter
  // List von Anweisungen
  return a > b ? a : b;
}
```

Methoden können einen Wert berechnen und diesen zurückgeben. Der Typ dieses Wertes ist der Rückgabetyp. Die Schritte zur Berechnung bestehen aus einer Liste von Anweisungen. Diese stehen im Körper (_body_) der Methode.

Der Name einer Methode und die Typen ihrer Parameter bilden zusammen ihre Signatur. Die Signatur identifiziert eine Methode anhand ihres Namens und ihrer Parametertypen. Es können nicht zwei Methoden in einer Klasse mit derselben Signatur existieren. Allerdings ist es zum Beispiel möglich, zwei Methoden mit demselben Namen aber anderen Parametern zu haben. Der Rückgabetyp und der Zugriffsmodifikator gehört nicht zur Signatur.

Die Methode `max` hat hier Beispielsweise die Signatur ```java max(int, int)```.

== Konstruktoren

Ein Konstruktor ist in Java keine Methode. Ein Konstruktor wird beim Erzeugen eines Objekts mit ```java new``` aufgerufen und initialisiert das neue Objekt.

```java
public class Cat {
  private String owner;

  public Cat(String owner) {
    this.owner = owner;
  }

  public static void main(String[] args) {
    Cat donut = new Cat("Carl");
    System.out.println(donut.owner); // Carl
    // Da es keinen Default-Konstruktor mehr gibt, funktioniert dies nicht mehr.
    // Versuchen Sie, die nachfolgenden Zeile auszukommentieren.
    // Cat cheshire = new Cat();
  }
}
```

Wenn eine Klasse keinen Konstruktor deklariert, stellt der Compiler implizit einen parameterlosen Default-Konstruktor bereit. Dieser wird als _Default-Konstruktor_ bezeichnet. Die Instanzattribute erhalten dabei ihre normalen Initialwerte beziehungsweise Standardwerte. Im ersten Beispiel in der Klasse Student wurde ein Konstruktor deklariert, welcher die beiden Attribute `name` und `campusCard` initialisiert. Im zweiten Beispiel in der Klasse ```java Cat``` wird kein Konstruktor deklariert. Somit gibt es dort den Default-Konstrukt und es kann eine neue Instanz ohne Argumente erstellt werden.

== Das Schlüsselwort `this`

Innerhalb einer Instanzmethode kann mit this auf die aktuelle Instanz zugegriffen werden.

Doch wann benötigt man überhaupt die aktuelle Instanz, wenn man auch einfach direkt über den Namen des Attributes oder der Methode verwenden kann? Dafür gibt es in der Regel drei mögliche Anwendungsfälle:
1. ```java
  class DNA {
    public DNA clone() {
      // Gib die aktuelle Instanz zurück.
      return this;
    }
  }
  ``` Manchmal müssen wir die Instanz selbst zurück geben oder direkt darauf zugreifen können. Dafür kann `this` verwenden werden. Innerhalb einer Instanzmethode bezeichnet `this` die aktuelle Instanz.
2. ```java
  class DNA {
    // Attribut was wir setzen wollen.
    private String bases;

    public DNA(String bases) {
      // Hilfe! Attribut und Parameter haben den selben Namen.
      this.bases = bases;
    }
  }
  ``` Wenn ein Parameter denselben Namen wie ein Attribut hat, wird innerhalb des betreffenden Gültigkeitsbereichs der Parameter verwendet. Um trotzdem das Attribut zu referenzieren, können wir wie im Fall 1. erwähnt `this` nutzen, um dann auf das Attribut zuzugreifen.
3. ```java
  class DNA {
    public DNA(String bases) { ... }

    public DNA() {
      // Referenzieren einen anderen Konstruktor.
      this("guanine");
    }
  }
  ``` Mit ```java this(...)``` kann ein Konstruktor einen anderen Konstruktor derselben Klasse aufrufen. Dadurch kann gemeinsame Initialisierungslogik an einer Stelle definiert werden. Wichtig: Ein Aufruf von ```java this(...)``` muss die erste Anweisung eines Konstruktors sein.

== Zugriffsmodifikatoren

Attribute, Methoden und Klassen haben einen Zugriffsmodifikator. Der Modifikator steht ganz am Anfang der Deklaration und legt fest, von wo aus im Projekt man auf diese Deklaration zugreifen kann.

#{
  let x = align(center, [x])
  show table.cell.where(y: 0): strong
  table(
    columns: { for _ in range(5) { (auto,) } },
    [Modifikator], [Selbe Klasse], [Selbes Paket], [Subklasse], [Anderes\ Paket],
    ```java private```, x, [], [], [],
    [Kein Modifikator\ (package-private)], x, x, [], [],
    ```java protected```, x, x, x, [],
    ```java public```, x, x, x, x,
  )
}

== Klassen in UML

#align(center)[
```uml
class Student {
  -name: String;
  ~campusCard: long;

  +lernen(): void;
  Student(name: String, campusCard: long );
}
```
]

UML wird genutzt, um die Struktur einer Klasse graphisch darzustellen. Für Klassen müssen daher sowohl alle Attribute als auch Konstruktoren und Methoden enthalten sein. Hier ist die Klasse `Student` dargestellt.

Bei Attributen wird der Name und Datentyp im Diagram abgebildet. Dabei kommt im Gegensatz zu Java der Datentyp hinter den Namen und wird mit einem Doppelpunkt (`:`) getrennt.

Ähnlich dazu wird auch bei Methoden und Attributen der Name dargestellt, gefolgt von der Liste der Parameter und dem Rückgabetyp. Auch hier kommen die Datentypen nach den Namen und nicht davor.

Zum Schluss werden noch die Zugriffsmodifikatoren in UML mithilfe von Symbolen dargestellt

#align(center, table(
  columns: (auto, auto, auto, auto, auto),
  table.header(
    strong[Modifikator], ```java private```, [Kein Modifikator\ (package-private)], ```java protected```, ```java public```
  ),
  strong[Symbol in UML], [`-`], [Kein Symbol (` `)], [`~`], [`+`]
))

== Modellierung von Relationen

Zur Modellierung mit UML gehört nicht nur die Repräsentation der Struktur, sondern auch die Relationen untereinander.

#align(center)[
  ```uml
  class List {
    -head: Node;
    -size: int;

    +List();
  }

  class Node {
    -value: int;

    +Node();
  }
  ```
]

Dabei wird dargestellt, welche Attribute sich auf welche Klassen beziehen. 

#task("Klassen Chaos")[
  1. Erweitere die Klasse `Student` aus dem Anfang des Kapitels um einen Konstruktor.

    Wähle geeignete Zugriffsmodifikatoren für die Attribute, sodass diese nicht von außerhalb der Klasse gelesen oder verändert werden können.

    Erstelle außerdem die Methoden `getName()` und `getCampusCard()`, welche jeweils den Wert des entsprechenden Attributs zurückgeben. Wähle für die Methoden geeignete Zugriffsmodifikatoren, sodass sie auch von Klassen aus anderen Paketen aufgerufen werden können.

    Beispiel:
    ```java

    Student alice = new Student("Alice", 3727001);
    System.out.println(alice.getName()); // Alice
    System.out.println(alice.getCampusCard()); // 3727001
    ```

  2. Erstelle eine Klasse `BankAccount`, die einen Kontostand verwaltet.

    Die Klasse soll einen Konstruktor besitzen, mit dem ein Startguthaben festgelegt werden kann. Außerdem soll sie die Methode transfer(BankAccount, float) anbieten. Mit dieser Methode kann ein Betrag von einem Konto auf ein anderes überwiesen werden.

    Eine Überweisung soll nur durchgeführt werden, wenn das Konto über ausreichend Guthaben verfügt. Andernfalls sollen sich die Kontostände beider Konten nicht verändern.

    Überlege selbst, welche Zugriffsmodifikatoren für die Attribute und Methoden sinnvoll sind.

    Beispiel:
    ```java
    BankAccount a = new BankAccount(100);
    BankAccount b = new BankAccount(0);
    a.transfer(b, 200);
    System.out.println(a); // 100, nichts wurde überwiesen
    a.transfer(b, 60);
    System.out.println(a); // 40
    System.out.println(b); // 60
    ```

  #solution(
    "https://codeberg.org/karlz/introduction-to-oop-and-uml/src/branch/master/solution/class-chaos.md",
  )[Lösung]
]
