= Exceptions

In Java werden Fehler über sogenannte Exceptions behandelt. Eine Methode kann eine Exception werfen. Dadurch wird die Methode abgebrochen und in die vorherige Methode zurückgekehrt. Diese kann den Fehler "fangen" und beheben. Falls sie dies nicht tut, wird auch aus dieser Methode in die vorherige zurückgekehrt. Sollte am Ende auch die Main Methode dadurch abgebrochen werden, stürzt des Programm ab.

Wenn eine Methode aufgerufen wird, kommt sie auf einen sogenannten Stack. Der Stack ist dafür da, damit Java nach jedem `return` Statement weiß, bei welcher Methode es zurückkehren muss. Exceptions nutzen den Stack, um nachvollziehen zu können, wo ein Fehler entstanden ist. Die Liste der Methodenaufrufe nennt man Stacktrace. Dieser kann direkt mit der Methode `printStackTrace()` im Terminal ausgegeben werden.

== Fehler werfen

== Fehler behandeln

== Eigene Fehlertypen erstellen