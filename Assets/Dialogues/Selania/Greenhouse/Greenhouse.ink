=== greenhouse ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
            
    {debug: <i>La lista degli oggetti nella stanza è: {contentsGreenhouse}.}
    {debug: <i>La lista degli oggetti nel deposito è: {contentsSafekeeping}.}


    {greenhouse == 1:<i>Nella serra a lungo dimenticata i vasi attendono sussurri e confidenze.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            -> witch_frog_mission_notifier ->
            -> talk_to_me ->
    {debug: sono uscito da talk_to_me}        

    ~ book_arrivingFromTracking = Greenhouse
    {debug: ho aggiornato book_arrivingFromTracking, che ora è {book_arrivingFromTracking}}

    {
        - player_name == "Senza nome":
            -> name_choice -> gender ->
    }                
     

{
	- greenhouse_chosenCultivable != ():
        {debug: greenhouse_chosenCultivable è uguale a {greenhouse_chosenCultivable}, per cui vado a growing_updater}        
        -> growing_updater
        
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

    
