=== bedroom ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}

{debug: <i>La lista degli oggetti nella stanza è: {contentsBedroom}.}

{
    - bedroom == 1:
        <i>Un morbido letto è comparso, in attesa di membra stanche.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        
}        

-> main

=== settings_management
//Gestione delle impostazioni, raggiungibile dal libro e dalla camera da letto
    + {are_two_entities_together(PG, Settings)} [Settings]
        <i>Qui in futuro si potranno modificare le impostazioni.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            -> main
            
    + {are_two_entities_together(PG, SettingsBookVersion)} [SettingsBookVersion]
        <i>Qui in futuro si potranno modificare le impostazioni.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            -> rewriter_book_with_flow



=== gm_rm_activation
    <i>(testo temporaneo per il testing interno) Prima di iniziare, ci chiediamo in che modalità giocare.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    <i>La modalità Reader Mode è come il gioco è stato pensato: ogni scelta si deve appoggiare al tuo intuito, alla comprensione delle persone con cui interagisci.
    <i>La modalità Gamer Mode ti offre maggiore supporto con indicatori di diverso tipo, oltre a un tutorial extra ad hoc.</i>

        + <i>Voglio la modalità Gamer Mode</i>
            -> gamerMode_activation ->
        + <i>Voglio la modalità Reader Mode</i>
    -
    <i>Perfetto.
    <i>Buon inizio di questo tuo viaggio.</i>
-> main            