=== bedroom ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
{debug: <i>La lista degli oggetti nella stanza è: {bedroomContents}.}
            ~ arrivingFrom = ()
            ~ arrivingFrom = Bedroom
    
{
    - fourthTier && fifthStory ==Ended:
        <i>Frasi legate al finale del gioco</i>.#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: fungus_neutral
    
    -fourthTier:
        <i>Frasi legate al quarto tier</i>.#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: fungus_neutral
    
    -thirdTier:
        <i>Frasi legate al terzo tier</i>.#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: fungus_neutral

    -secondTier:
        <i>Frasi legate al secondo tier</i>.#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: fungus_neutral

    -firstTier:
        <i>Frasi legate al primo tier</i>.#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: fungus_neutral
    - else:
        <i>Commenti iniziali</i>.#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: fungus_neutral

}    
    -> main

