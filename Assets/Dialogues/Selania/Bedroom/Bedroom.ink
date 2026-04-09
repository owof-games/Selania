=== bedroom ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}

{debug: <i>La lista degli oggetti nella stanza è: {contentsBedroom}.}

{
    - bedroom == 1:
        {charTag(TheWitch, "{witch_state()}")}:   <i>Un morbido letto è comparso, in attesa di membra stanche.</i>
        
}        

-> main

=== settings_management
//Gestione delle impostazioni, raggiungibile dal libro e dalla camera da letto
    + {are_two_entities_together(PG, Settings)} [Settings]
        {charTag(TheWitch, "{witch_state()}")}:   <i>Qui in futuro si potranno modificare le impostazioni.</i>
            -> main
            
    + {are_two_entities_together(PG, SettingsBookVersion)} [SettingsBookVersion]
        {charTag(TheWitch, "{witch_state()}")}:   <i>Qui in futuro si potranno modificare le impostazioni.</i>
            -> rewriter_book_with_flow



=== gm_rm_activation
    {charTag(TheWitch, "{witch_state()}")}:   <i>(testo temporaneo per il testing interno) Prima di iniziare, ci chiediamo in che modalità giocare.</i>
    <i>La modalità Reader Mode è come il gioco è stato pensato: <i>ogni scelta si deve appoggiare al tuo intuito, alla comprensione delle persone con cui interagisci.
    <i>La modalità Gamer Mode ti offre maggiore supporto con indicatori di diverso tipo, oltre a un tutorial extra ad hoc.</i>

        + / {charTag(PG, "neutral")}:   <i>Voglio la modalità Gamer Mode</i>
            -> gamerMode_activation ->
        + / {charTag(PG, "neutral")}:   <i>Voglio la modalità Reader Mode</i>
    -
    {charTag(TheWitch, "{witch_state()}")}:     <i>Perfetto.
    <i>Buon inizio di questo tuo viaggio.</i>
-> main            