=== greenhouse ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
            
{debug: <i>La lista degli oggetti nella stanza è: {contentsGreenhouse}.}

{
    - greenhouse == 1:
        <i>Nella serra a lungo dimenticata i vasi attendono sussurri e confidenze.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
}

    //check storylets soprattutto per far partire il tutorial di Carla, altrimenti la presenza di una scelta blocca il check fino al primo ritorno in main
    {
        - tutorial_ActivateTutorial == true && entity_location(PG) == Greenhouse && not tutorial_greenhouseStorylet:
            -> tutorial_greenhouseStorylet ->
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
            <i>Al momento la serra non ha domande da porre a {player_name}.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        -> main
        
    }
}


=== greenhouse_entry_check
    <i>La serra attende risposte.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        +  {greenhouse_backupCultivable != ()}<i>Voglio coltivare qualcosa.
                -> cultivable_test
        +  <i>{~ Mi aggiro per la serra.|Osservo ciò che è in crescita.|Ascolto i rumori della serra.|Mi rilasso un attimo.|Mi perdo nei colori dei vasi.}
                -> main


// === stolen_watering_can
// <i>La serra è smarrita, non trova più il suo innaffiatoio, e ora non sa domandare.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
// -> main

    
