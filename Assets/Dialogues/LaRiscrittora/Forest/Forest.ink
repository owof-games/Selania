=== forest ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
{forest == 1:<i>La foresta ti accoglie con le sue ombre e l'odore di resina</i>|<i>La foresta{~ è una distesa di fresca ombra|è canto sospeso|cresce lentamente}</i>}.
    + [Mi guardo attorno.]
    -
    -> main


=== bench
+ {are_two_entities_together(Bench, PG)} [Bench]
    <i>Questo posto è pieno di serenità</i>.
    {firstTier && findedGifts hasnt blanket:
        ~ temp dice = RANDOM(1, 2)
        {
            - dice == 1:
                <i>C'è una coperta abbandonata sulla panchina.</i>
                <i>Portala con te: qualcuno potrebbe avere freddo.</i>
                <b>Hai ottenuto: coperta</b>
                ~ findedGifts += blanket
                -> main
            - dice == 2:
            -> main
        }
    }
    -> main

=== the_fungus
+ {are_two_entities_together(TheFungus, PG)} [TheFungus]
    <i>L'albero è smonco</i>.
    {firstTier && findedGifts hasnt emptyvase:
        ~ temp dice = RANDOM(1, 2)
        {
            - dice == 1:
                <i>C'è un vaso vuoto.</i>
                <i>In questo luogo anche la cosa più insolita può essere un tesoro.</i>
                <b>Hai ottenuto: vaso vuoto</b>
                ~ findedGifts += emptyvase
                -> main
            - dice == 2:
            -> main
        }
    }    
    -> main
