#import "../common/callouts.typ": *

= Klassen

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

== Klassen vs. Instanzen

Eine Klasse bezeichnet die Struktur aus Attributen und Methoden.

Eine Instanz ist ein konkretes Objekt mit festen Werten für alle Attribute. Die Werte von Attribute für zwei verschiedene Instanzen sind komplett voneinander Unabhängig.
Alle Instanzen der selben Klasse haben auch die selbe Struktur, nicht zwingend aber auch die selben Werte.

Im Beispiel oben heißt die Klasse Student. Diese definiert alle möglichen Attribute und Methoden. Sie legt keine Werte fest. In der Main-Methode werden die beiden Instanzen Alice und Bob deklariert. Diese legen jeweils den Namen und die Nummer der Studenten fest. Die konkreten Werte sind jeweils von den anderen Instanzen unabhängig. Da beide zur selben Klasse gehören, haben sowohl Bob als auch Alice die selbe Struktur. Dies bedeutet, dass beide zum Beispiel die Methode lernen haben.

== Attribute

Ein Attribut ist eine Variable, welche zu einer Instanz gehört. Alle Klassen haben die gleichen Attribute. Oben hat die Klasse `Student` genau zwei Attribute angelegt: Name und Campus Card. Der Wert eines Attributes wird erst bei der Initialisierung mit `new` festgelegt. Jedes Attribut muss einen Typen und Namen haben.
Zusätzlich kann ein Standard-Wert zugewiesen werden. Genau wie bei Variable haben auch alle Attribute einen Standard-Wert, bis dieser explizit anders deklariert wird. Für Zahlen ist dieser 0, für Wahrheitswerte `false` und für Objekte `null`.
Anders als Variablen gehören Attribute zur Instanz und können einen Sichtbarkeit-Modifikator haben. Was genau ein solcher Modifikator macht und welche es überhaupt gibt, wird in einem späteren Kapitel erklärt.

```java
class Katze {
  public String besitzer;
  //^^^^ Modifikator
  boolean flauschig = true;

  public static void main(String[] args) {
    Katze cheshire = new Katze();
    System.out.println(cheshire.besitzer); // null
    cheshire.besitzer = "Alice";
    System.out.println(cheshire.besitzer); // Alice
    System.out.println(cheshire.flauschig); // true
  }
}
```

== Methoden

Um Klassen ein Verhalten zu geben brauchen wir Methoden. 
Ein Methode hat einen Namen, eine Liste von Argumenten sowie einen Rückgabetyp.

Methoden können einen Wert berechnen und diesen zurückgeben. Der Typ dieses Wertes ist der Rückgabetyp. Die Schritte zur Berechnung besteht aus einer Liste von Anweisungen, die im Körper (_body_) der Methode definiert werden.

Der Name, die Liste der Parametern und der Rückgabetyp bilden zusammen die Signatur. Die Signatur beschreibt vollständig eine Methode.

== Konstruktoren

Ein Konstruktor ist eine Methode, die ein Objekt instanziiert. Der Name des Konstruktor ist immer mit dem Namen der Klasse identisch und hat keinen Rückgabetyp.

Wenn für eine Klasse kein eigener Konstruktor deklariert wird, gibt es immer einen Standard-Konstrukt, welcher keine Argumente nimmt und keine Attribute initialisiert. Im ersten Beispiel in der Klasse Student wurde ein Konstruktor deklariert, welcher die beiden Attribute Name und Campus Card initialisiert. Im zweiten Beispiel in der Klasse Katze wird kein Konstruktor deklariert. Somit gibt es dort den Standard-Konstrukt und es kann eine neue Instanz ohne Argumente erstellt werden.

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

== Das Schlüsselwort `this`

Auf andere Instanzen oder Variablen kan mit Namen zugegriffen werden. Wenn man auf die eigene Instanz zugreifen möchte, kann man dafür `this` verwenden.

Doch wann benötigt man überhaupt die eigene Instanz, wenn man auch einfach direkt über den Namen des Attributes oder der Methode verwenden kann? Dafür gibt es in der Regel drei mögliche Anwendungsfälle:
1. ```java
class DNA {
  public DNA clone() {
    // Gib die aktuelle Instanz zurück.
    return this;
  }
}
``` Manchmal müssen wir die Instanz selbst zurück geben oder direkt darauf zugreifen können. Dafür kann `this` verwenden werden. Dabei ist `this` immer die aktuelle Instanz selbst.
2. ```java
class DNA {
  // Attribut was wir setzen wollen.
  private String bases;

  public DNA(String bases) {
    // Hilfe! Attribut und Parameter haben den selben Namen.
    this.bases = bases;
  }
}
``` Wenn ein Attribut und ein Parameter den selben Namen haben, wird immer der Parameter bevorzugt. Um trotzdem das Attribut zu referenzieren, können wir wie im Fall 1. erwähnt `this` nutzen, um dann auf das Attribut zuzugreifen.
3. ```java
class DNA {
  public DNA(String bases) { ... }

  public DNA() {
    // Referenzieren einen anderen Konstruktor.
    this("guanine");
  }
}
``` Wenn wir eine Methode schreiben, welche von einer anderen abhängig ist, verwenden in der Regel einfach nur den Namen. Wenn wir einen Konstruktor in einem anderen Konstruktor mit `new` aufrufen würden, erstellen wir allerdings direkt eine neue Instanz, anstatt die Methode zu verwenden. Um trotzdem auf diese zugreifen zu können, verwenden wir hier `this`.
