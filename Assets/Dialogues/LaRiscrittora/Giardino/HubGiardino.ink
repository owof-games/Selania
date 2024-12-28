=== hub_giardino ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
<i>Questo è il giardino</i>
-> randomizzazione_dono_luoghi ->
//Questo è il punto che troveremo a inizio gioco, e che fa da hub centrale della storia.
//Troveremo sempre un piccolo descrittore (randomico o meno, da vedere)
    + [Mi guardo attorno]
    + [Mi siedo sulla panchina]
        -> panchina
    -

-> main


=== panchina
+ {contenutoGiardino has PG} [Panchina]
    <i>Questo posto è pieno di serenità</i>
    -> main

