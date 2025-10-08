=== greenhouse ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
            
    {debug: <i>La lista degli oggetti nella stanza è: {greenhouseContents}.}
    {debug: <i>La lista degli oggetti nel deposito è: {safekeepingContents}.}

    // {not are_two_entities_together(WateringCan, PG): -> stolen_watering_can}

    {greenhouse == 1:Nella serra a lungo dimenticata i vasi attendono sussurri e confidenze.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}

    ~ arrivingFrom = Greenhouse

// {greenhouse == 1:<i>Eccoti nella serra.</i>|{~<i>La serra pulsa nell'aria tiepida.|<i>C'è odore di terra e tranquillità.|<i>I vasi chiedono di essere ascoltati.|<i>Le ragnatele raccolgono risposte.|<i>Le venature del legno propongono domande.}</i>}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}

{

        - name == "Senza nome":
            -> name_choice -> gender ->
}                



{
	- chosenCultivable != ():
        -> plant_check
        
    - else:
    {
        - backupCultivable != ():
            -> greenhouse_entry_check
        - else:
            Al momento la serra non ha domande da porti.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
	    -> main
        
    }
}


=== greenhouse_entry_check
    La serra attende le tue visioni.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        +  {backupCultivable != ()}[Voglio coltivare qualcosa.]
                -> cultivable_test
        +  [Mi aggiro per la serra.] 
                -> main


// === pre_test

//     <i>{~In questo momento non c'è nulla in crescita.|La serra attende le tue visioni.|Di quali domande hai bisogno?}</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
//             -> main
    
// === call_test
//     + (click) {are_two_entities_together(WateringCan, PG)} [WateringCan]
//     {
//         - click == 1:
//         ~ saturationVar ++
//         ~ move_entity(cultivationKit, Bedroom)
        
//     }


//     {
//     	- backupCultivable != ():
//             {
//                 - chosenCultivable != ():
//                         -> plant_check
//                 - else:     
//                         -> cultivable_test
//             }
//             	- else:
//     	    <i>Il terreno chiede riposo, e nulla per ora può crescere.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
//     	    -> main
//     }
    
//     {
// 	- chosenCultivable != ():
//         -> plant_check
        
//     - else:
//     {
//         - backupCultivable != ():
//             -> pre_test
//         - else:
//             <i>L'acqua stanca chiede riposo, e nulla può crescere.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
// 	    -> main
        
//     }
// }

=== stolen_watering_can
<i>La serra è smarrita, non trova più il suo innaffiatoio, e ora non sa domandare.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
-> main

    
