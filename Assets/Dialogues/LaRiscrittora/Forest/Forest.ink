=== forest ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
{forest == 1:<i>Questo è il giardino</i>|<i>Il giardino {~ è una distesa di fresca ombra|è canto sospeso|riposa}</i>}.
    + [Mi guardo attorno.]
    -
    -> main


=== bench
+ {are_two_entities_together(Bench, PG)} [Bench]
    <i>Questo posto è pieno di serenità</i>.
    {firstTier && doniTrovati hasnt coperta:
        ~ temp dice = RANDOM(1, 2)
        {
            - dice == 1:
                <i>C'è una coperta abbandonata sulla panchina.</i>
                <i>Portala con te: qualcuno potrebbe avere freddo.</i>
                <b>Hai ottenuto: coperta</b>
                ~ doniTrovati += coperta
                -> main
            - dice == 2:
            -> main
        }
    }
    -> main

=== the_fungus
+ {are_two_entities_together(TheFungus, PG)} [TheFungus]
    <i>L'albero è smonco</i>.
    {firstTier && doniTrovati hasnt vasovuoto:
        ~ temp dice = RANDOM(1, 2)
        {
            - dice == 1:
                <i>C'è un vaso vuoto.</i>
                <i>In questo luogo anche la cosa più insolita può essere un tesoro.</i>
                <b>Hai ottenuto: vaso vuoto</b>
                ~ doniTrovati += vasovuoto
                -> main
            - dice == 2:
            -> main
        }
    }    
    -> main
