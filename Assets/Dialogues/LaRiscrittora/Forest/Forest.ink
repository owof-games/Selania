=== forest ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
{forest == 1:<i>La foresta ti accoglie con le sue ombre.</i>|<i>{~La foresta è una distesa di fresca ombra.|La foresta è canto sospeso.|La foresta cresce lentamente.|La resina raccoglie il tempo.|I rami si scaldano al vento.|Il sottobosco condivide pettegolezzi.|Sulla panchina scivolano ricordi.}</i>}
    
        {firstTier && findedGifts hasnt emptyvase:
            ~ temp dice = RANDOM(1, 2)
                {
                    - dice == 1:
                        <i>C'è un vaso vuoto.</i>
                        <i>In questo luogo anche la cosa più insolita può essere un tesoro.</i>
                        Hai ottenuto: <b>vaso vuoto</b>
                        ~ findedGifts += emptyvase
                        -> main
                    - dice == 2:
                    -> main
                }
        }    
        
        + [Mi guardo attorno.]
        -
            -> main


=== bench
+ {are_two_entities_together(Bench, PG)} [Bench]
    <i>La panchina vibra, attendendo la sua ricostruzione.</i>.
    {firstTier && findedGifts hasnt blanket:
        ~ temp dice = RANDOM(1, 2)
        {
            - dice == 1:
                <i>C'è una coperta abbandonata sulla panchina.</i>
                <i>Portala con te: qualcuno potrebbe avere freddo.</i>
                Hai ottenuto: <b>coperta</b>
                ~ findedGifts += blanket
                -> main
            - dice == 2:
            -> main
        }
    }
    -> main

