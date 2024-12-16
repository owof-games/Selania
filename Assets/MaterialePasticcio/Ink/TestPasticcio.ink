-> main

//Ricorda: in INK la logica è che una riga è attaccata a tutte le scelte dopo, per cui @interacti è collegato ora anche a mentore, anima.

=== main
@interact
<- mentore
<- anima
<- inventario
+ -> main

=== mentore
+ [Mentore]
Mentore: Ti dico delle cose.
Mentore: E altre cose.
Mentore: Giusto per vedere quanto la tiro lunga.
-
    + Buffo no?
    + Altra scelta
-
-> main

=== anima
+[Anima]
Anima: Io dico altre cose.
- 
    + Cosa ne pensi?
-    
-> main

=== inventario
+ [Inventario]
Nell'inventario ci sono mele, pere, kiwi.
    -
    + Manca qualcosa?
    -
-> main