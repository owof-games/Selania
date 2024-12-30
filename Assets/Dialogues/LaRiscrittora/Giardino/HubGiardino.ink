=== hub_giardino ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
<i><color=green>Questo è il giardino</color></i>
-> randomizzazione_dono_luoghi ->
    + [Mi guardo attorno]
    -

-> main


=== panchina
+ {are_two_entities_together(Bench, PG)} [Bench]
    <i>Questo posto è pieno di serenità</i>
    -> main

