=== hub_giardino ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
{hub_giardino == 1:<i>Questo è il giardino</i>|<i>Il giardino {~ è una distesa di fresca ombra|è canto sospeso|riposa}</i>}.
-> randomizzazione_dono_luoghi ->
    + [Mi guardo attorno.]
    -

-> main


=== bench
+ {are_two_entities_together(Bench, PG)} [Bench]
    <i>Questo posto è pieno di serenità</i>.
    -> main

=== tree
+ {are_two_entities_together(Tree, PG)} [Tree]
    <i>L'albero è smonco</i>.
    -> main
