=== bedroom ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
{debug: <i>La lista degli oggetti nella stanza è: {bedroomContents}.}
            ~ arrivingFrom = ()
            ~ arrivingFrom = Bedroom
    
{
    - fourthTier && fifthStory ==Ended:
        <i>Frasi legate al finale del gioco</i>.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: moon_neutral
    
    -fourthTier:
        <i>Frasi legate al quarto tier</i>.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: moon_neutral
    
    -thirdTier:
        <i>Frasi legate al terzo tier</i>.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: moon_neutral

    -secondTier:
        <i>Frasi legate al secondo tier</i>.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: moon_neutral

    -firstTier:
        <i>Frasi legate al primo tier</i>.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: moon_neutral
    - else:
        <i>Commenti iniziali</i>.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: moon_neutral

}    
    -> main


=== settings_management
    + {are_two_entities_together(PG, settings)} [settings]
        <i>Accesso alle impostazioni</i>  #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            -> main
            
    + {are_two_entities_together(PG, SettingsBookVersion)} [SettingsBookVersion]
    <i>Accesso alle impostazioni</i>  #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            -> main