#import "../common/callouts.typ": *

= Einführung

In diesem Modul lernen Sie die Grundlagen der objektorientierten Programmierung in Java sowie der Modellierung mit UML kennen.

== Hinweise zum Skript

Dieses Skript ist als Hilfestellung für Studierende gedacht. Trotz großer Sorgfalt beim Erstellen kann keine Garantie für Fehlerfreiheit übernommen werden. Es wird ausdrücklich darauf hingewiesen, dass der prüfungsrelevante Stoff durch die Vorlesung bestimmt wird und mit dem Skriptinhalt nicht vollständig übereinstimmen muss.

#definition("Begriff", "Eine ausführliche Definition für den Begriff.")

#complementary(
  "Zusatzwissen",
  "Zusätzliches Wissen zu einem Konzept, welches über dieses Modul hinaus geht. Die Konzepte werden eventuell in späteren Modulen erneut aufgegriffen.",
)

#example(
  "Beispiel",
  "Ein Beispiel, welches auf bestimmte Grenzfälle oder häufige Fehler eingeht.",
)

#task(
  "Aufgabe",
  [Eine Aufgabe, in der Sie Ihr Wissen testen und selbst programmieren können. Die Lösungen dazu befinden sich auf #link("https://codeberg.org/karlz/introduction-to-oop-and-uml", "Codeberg").]
)

== Aufbau des Skriptes

In diesem Skript behandeln wir zunächst alle Grundlagen. Die ersten Kapitel befassen sich mit der Installation, einfachen Ausdrücken, Deklarationen und Anweisungen. Dabei werden die Grundlagen des imperativen Programmierens erläutert.

Danach behandeln wir die Konzepte der objektorientierten Programmierung, wie Klassen und Vererbung. Wir betrachten, wie Klassen aufgebaut sind, wie Vererbung funktioniert und wann sie sinnvoll eingesetzt wird. Außerdem beschäftigen wir uns mit der Modellierung von Klassen mithilfe von UML.

Darauf aufbauend beschäftigen wir uns mit Java-spezifischen Konzepten wie Generics, die Java Collections API, Interfaces und Exceptions.

Zum Abschluss behandeln wir kurz einige Konzepte von Software Engineering und wie Sie in Zukunft besseren Code schreiben können.

== Was ist Modellierung?

Bevor wir mit der Modellierung mit UML beginnen, stellt sich die Frage: Was ist überhaupt ein Modell? Was ist Modellierung? Und warum sollten wir überhaupt Modellierung nutzen?

Ein Modell ist:
- *Abbildung:* Basiert auf einem Original
- *Reduktion:* Stellt nur die relevanten Eigenschaften dar
- *Pragmatisch:* Das Modell beschreibt für bestimmte Fragestellungen das Original

Modellierung ist der Prozess, bei dem ein System zu einem Modell umgewandelt wird.

Warum überhaupt Modellierung? Die Probleme der realen Welt sind zu komplex, um sie in der Gänze darzustellen. Stattdessen verwenden wir Modelle, um sie vereinfacht und strukturiert darzustellen. Durch die grafische Darstellung in UML erhalten wir eine einfache Übersicht über die teils sehr komplexe Struktur unserer Projekte. @kuhne2005model

== Was ist Programmierung?

#definition("Algorithmus (modern)")[
  Unter einem Algorithmus versteht man eine präzise, endliche Verarbeitungsvorschrift, die so formuliert ist, dass die in der Vorschrift notierten Elementaroperationen von einer mechanisch oder elektronisch arbeitenden Maschine durchgeführt werden können.
]

#definition("Programm")[
  Ein Programm ist die Umsetzung eines oder mehrerer Algorithmen in einer Programmiersprache.
]

#definition("Programmiersprache")[
  Eine Programmiersprache ist ein notationelles System zur Beschreibung von Berechnungen in durch Maschinen und Menschen lesbarer Form.
]

In der Programmierung wird ein Programm geschrieben, das einen oder mehrere Algorithmen in einer Programmiersprache umsetzt. Da man in der Regel nicht mit 0 und 1 ein Programm beschreiben möchte, verwendet man eine Programmiersprache, hier Java. Das Übersetzen von Java-Quellcode in Java-Bytecode nennt man Kompilieren.

== Was ist objekt-orientierte Programmierung?

In der objektorientierten Programmierung wird ein Programm als Zusammenspiel vieler Objekte betrachtet. Jedes Objekt besitzt einen Zustand und ein Verhalten und kommuniziert mit anderen Objekten. Wir modellieren diese Objekte und Beziehungen zueinander. Gleichartige Objekte fassen wir zu Klassen zusammen. @hesse2008

Zentrale Frage:
#align(center)[
  Wie lässt sich die Welt als Menge von autonomen Objekten, die mittels Nachrichten kommunizieren, beschreiben?
]

- Programme simulieren Objektkommunikation
- Objekte bündeln Daten mit zugehöriger Funktionalität
- Gleich aufgebaute Objekte sind zu Klassen zusammengefasst
- Verhalten bei Eintreffen von Nachricht: meist imperativ beschrieben

== Quellcode

Die Quelldateien zu diesem Skript können auf #link("https://codeberg.org/karlz/introduction-to-oop-and-uml")[Codeberg] gefunden werden.
