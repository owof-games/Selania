=== hub_giardino ===


//Questo è il punto che troveremo a inizio gioco, e che fa da hub centrale della storia.
//Troveremo sempre un piccolo descrittore (randomico o meno, da vedere)

//Solo a inizio storia partirà la parte di "intro", utile a dare un benvenuto
    + Ti guardi attorno
    + Ti siedi sulla panchina
    -> panchina
    -

-> main


=== panchina

-> main

//Passiamo da qui solo a inizio del gioco.
=== inizio
La storia inizia ora
    + Qualcuno ti osserva: gli parli
        -> presentazioni
    -
-> main