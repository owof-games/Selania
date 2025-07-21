=== forest ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
            ~ arrivingFrom = ()
            ~ arrivingFrom = Forest
{debug: <i>La lista degli oggetti nella stanza è: {forestContents}.}
{forest == 1:<i>La foresta ti accoglie con le sue ombre.</i>|<i>{~La foresta è una distesa di fresca ombra.|La foresta è canto sospeso.|La foresta cresce lentamente.|La resina raccoglie il tempo.|I rami si scaldano al vento.|Il sottobosco condivide pettegolezzi.|Sulla panchina scivolano ricordi.}</i>} #speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: fungus_neutral
    

        + [Mi guardo attorno.]

        -
            -> main


=== bench
+ {are_two_entities_together(Bench, PG)} [Bench]
    <i>La panchina vibra, attendendo la sua ricostruzione.</i> #speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: fungus_neutral
        -> main

