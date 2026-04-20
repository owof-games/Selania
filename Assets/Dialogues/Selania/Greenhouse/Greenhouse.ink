=== greenhouse ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
            
{debug: <i>La lista degli oggetti nella stanza è: {contentsGreenhouse}.}

{
    - greenhouse == 1:
        {charTag(TheWitch, witch_state())}:   <i>Nella serra a lungo dimenticata i vasi attendono sussurri e confidenze.</i>
}

    

{
    //Sta crescendo qualcosa: vado ad aggiornarne lo stato
    - greenhouse_chosenCultivable != ():
        {debug: greenhouse_chosenCultivable è uguale a {greenhouse_chosenCultivable}, per cui vado a growing_updater}        
        -> growing_value_updater
        
    //Non sta crescendo nulla: verifico se ci sono altre piante che possono crescere, e in quel caso propongo il "test", altrimenti informo che non c'è nulla.    
    - else:
    {
        - greenhouse_backupCultivable != ():
            -> greenhouse_entry_check
        - else:
            {charTag(TheWitch, witch_state())}:   <i>Al momento la serra non ha domande da porre a {player_name}.</i>
        -> main
        
    }
}


=== greenhouse_entry_check
    {charTag(TheWitch, witch_state())}:   <i>La serra attende risposte.</i>
        +  {greenhouse_backupCultivable != ()}\ {charTag(PG, "neutral")}:         <i>Voglio coltivare qualcosa.</i>
                -> cultivable_test
        +  \ {charTag(PG, "neutral")}:         <i>{~ Mi aggiro per la serra.|Osservo ciò che è in crescita.|Ascolto i rumori della serra.|Mi rilasso un attimo.|Mi perdo nei colori dei vasi.}</i>
                -> main

    
