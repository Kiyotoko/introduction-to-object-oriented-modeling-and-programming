#import "../common/callouts.typ": example

= Generics

Generics erlauben es, Datentypen als Parameter zu übergeben. Dies ermöglicht es, Klassen, Interfaces oder Methoden für verschiedene Datentypen zu verwenden.

- Generics kommen nach dem Modifikator, aber vor dem Return Type
- Generics können mit ```java extends``` und ```java super``` eingeschränkt werden
- Generics erlauben das Nutzen von Wildcards (?)
- Es können beliebig viele Datentypen definiert werden

```java
// Methode mit 2 Generic Types, wobe A von B abhängt.
static <B, A extends B> A upcast(B b) {
  return (A) b;
}

// Generics können Typen verwenden, bevor diese definiert wurden.
static <A extends B, B> A upcast(B b) {
  return (A) b;
}

// Die Typen können mit Wildcards, `super` und `extends` kombiniert werden.
static <T> void consumeAll(Consumer<? super T> consumer,
    Collection<? extends T> collection) {
  for (T element : collection) consumer.accept(element);
}

// Generics können wiederum an die Generics von Interfaces und co. weitergegeben werden.
static <T> T op(T left, BinaryOperator<T> op, T right) {
  return op.apply(left, right);
}
```

Als Datentyp können nur Klassen als Generic übergeben werden. Primitive Datentypen wie in ```java Consumer<int>``` sind somit nicht erlaubt. Stattdessen muss auf die jeweilige Wrapper-Klasse zurückgegriffen werden, hier zum Beispiel ```java Integer```.

Wildcards stehen für beliebige Typen. Jede verwendete Wildcard ist vom Typen unterschiedlich zu jeder anderen Wildcard. Jede Wildcard kann zu jedem beliebigen Typen gecastet werden, und jeder Typ kann zu einer Wildcard gecastet werden. Erst während der Runtime werden die Typen überprüft und gegebenfalls ein Fehler geworfen.

Die Einschränkung `extends` sorgt dafür, dass der Datentyp Links aus dem Datentyp Rechts erben muss. Die Einschränkung `super` verlangt, dass der Datentyp Links eine Unterklasse von Rechts sein muss, dass heißt der Datentyp Rechts muss aus dem Datentyp Links erben. Wann sollte man welche Einschränkung verwenden? Einschränkungen als auch Wildcards sollten fast immer nur bei Methoden verwendet werden. Bei Suppliern (Methoden, die einen Datentyp ausgeben) verwendet man `extends`, bei Consumern (Methoden, die einen Datentyp als Eingabe bekommen) `super`.

Diese Methoden können wie folgt aufgerufen werden:

```java
Object b = "World";
String a = upcast(b);
System.out.println(a); // Gibt "World" aus.

consumeAll(System.out::println, List.of("a", "b", "c"));
// Gibt "a", "b" und "c" auf jeweils einer neuen Zeile aus.

System.out.println(op("Hello", (l, r) -> l + ", " + r, "World")); // Gibt "Hello World" aus.
```

#example("Incompatible Types")[
  Was passiert, wenn es keine Typen gibt, welche die Einschränkungen der Generics erfüllt? Das folgende Beispiel behandelt die Funktion `downcast`, welche eine Instanz in einen niedrigeren Typen umwandelt.

  ```java
  static <A, B extends A> A downcast(B b) {
    return (A) b;
  }
  ```

  Der folgende Aufruf ist legitim:

  ```java
  Object a = downcast("abc");
  ```

  Wenn jedoch versucht wird, die Funktion auf ein Object anzuwenden, um es zu einem String umzuwandeln, entsteht ein Fehler:

  ```java
  Object b = "asfd";
  String a = downcast(b);
  ```

  Dies liegt daran, dass Object nicht aus String erbt, und somit nicht die Bedingung erfüllen kann. Die folgende Fehlermeldung wird zur Compilezeit ausgegeben:

  ```log
  error: incompatible types: inference variable A has incompatible bounds
        String a = downcast(b);
                           ^
    upper bounds: String,Object
    lower bounds: B,Object
  where A,B are type-variables:
    A extends Object declared in method <A,B>downcast(B)
    B extends A declared in method <A,B>downcast(B)
  ```
]

