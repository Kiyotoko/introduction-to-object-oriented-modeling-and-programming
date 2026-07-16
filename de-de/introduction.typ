#import "../common/callouts.typ": *

= Einführung

In diesem Modul werden Sie object-orientierte Programmierung in Java sowie Modellierung in UML lernen.

== Hinweise zum Script

Dieses Skript ist als Hilfestellung für Studierende gedacht. Trotz großer Sorgfalt beim Erstellen kann keine Garantie für Fehlerfreiheit übernommen werden. Es wird ausdrücklich darauf hingewiesen, dass der prüfungsrelevante Stoff durch die Vorlesung bestimmt wird und mit dem Skriptinhalt nicht vollständig übereinstimmen muss.

#definition("Begriff", "Ein ausführliche Definition für den Begriff.")

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

In diesem Skript behandelt wir zunächst alle Grundlagen. Die ersten Kapiteln befassen sich mit der Installation, einfachen Ausdrücken, Deklarationen und Anweisungen. Dabei werden die Basics von imperativen Programmieren erklärt.

Danach befassen wir uns mit objekt orientierten Konzeption wie Klassen und Vererbung. Wir werden uns anschauen, wie Klassen funktionieren, wie Vererbung funktioniert und wann man sie überhaupt nutzen sollte. Dabei werden wir uns ebenfalls mit Moddellirung von Klassen mithilfe von UML beschäftigen.

Wir werden auf Java Spezifische Strukturen wie Generics, die Java Collections API eingehen als auch Interfaces, Exceptions und mehr eingehen.

Zum Abschluss behandeln wirkurz einige Konzepte von Software Engineering und wie Sie in Zukunft besseren Code schreiben können.

== Was ist Modellierung?

Bevor wir mit der Moddellirung mit UML anfangen, stellt sich die Frage: Was ist überhaupt ein Modell? Was ist Modellierung? Und warum sollten wir überhaupt Moddellirung nutzen?

Ein Modell ist:
- *Abbildung:* Basiert auf einem Original
- *Reduktion:* Stellt nur die relevanten Eigenschaften dar
- *Pragmatisch:* Das Modell beschreibt für bestimmte Fragestellungen das Original

Modellierung ist der Prozess, indem ein System zu einem Modell umgewandelt wird.

Warum überhaupt Modellierung? Die Probleme der realen Welt sind zu komplex, um sie in der gänze darzustellen. Stattdessen verwenden wir Modelle, um sie vereinfacht und struturiert darzustellen. Durch die graphische Darstellung in UML erhalten wir eine einfache Übersicht über die Teils sehr komplexe Struktur unserer Projekte. @kuhne2005model

== Was ist Programmierung?

#definition("Algorithmus (modern)")[
  Unter einem Algorithmus versteht man eine präzise, endliche Verarbeitungsvorschrift, die so formuliert ist, dass die in der Vorschrift notierten Elementaroperationen von einer mechanisch oder elektronisch arbeitenden Maschine durchgeführt werden können.
]

#definition("Programm")[
  Ein Programm ist ein Algorithmus in maschinenlesbarer Form.
]

#definition("Programmiersprache")[
  Eine Programmiersprache ist ein notationelles System zur Beschreibung von Berechnungen in durch Maschinen und Menschen lesbarer Form.
]

In der Programmierung wird ein Programm geschrieben, welche einen Algorithmus in maschinenlesbarer Form beschreibt. Da man in der Regel nicht mit 0 und 1 ein Programm beschreiben möchte, verwendet man eine Programmiersprache, hier Java. Das Umwandeln der Programmiersprache in Bytecode nennt man compilieren.

== Was ist objekt-orientierte Programmierung?

Unsere Systeme bestehen aus Objekten, die im Austausch miteinander stehen. Wir modellieren diese Objekte und Beziehungen zueinander. Gleichartige Objekte fassen wir zu Klassen zusammen. @hesse2008

Zentrale Frage:
#align(center)[
  Wie lässt sich die Welt als Menge von autonomen Objekten, die mittels Nachrichten kommunizieren, beschreiben?
]

- Programme simulieren Objektkommunikation
- Objekte bündeln Daten mit zugehöriger Funktionalität
- Gleich aufgebaute Objekte sind zu Klassen zusammengefasst
- Verhalten bei Eintreffen von Nachricht: meist imperativ beschrieben

== Source Code

Die Quelldateien zu diesem Script können auf #link("https://codeberg.org/karlz/introduction-to-oop-and-uml")[Codeberg] gefunden werden.
