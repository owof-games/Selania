=== greenhouse ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
{not are_two_entities_together(WateringCan, PG) && (not stolen_watering_can): -> stolen_watering_can}
{greenhouse == 1:<i>Eccoti nella serra.</i>|{~ <i>La serra pulsa nell'aria tiepida.|<i>C'è odore di terra e tranquillità.|<i>I vasi chiedono di essere ascoltati.|<i>Le ragnatele raccolgono risposte.|<i>Le venature del legno propongono domande.}</i>}

{
	- chosenCultivable != ():
        -> plant_check
        
    - else:
    {
        - backupCultivable != ():
            -> pre_test
        - else:
            <i>Al momento non è possibile coltivare nulla</i>.
	    -> main
        
    }
}



=== pre_test
    <i>{~ In questo momento non c'è nulla in crescita.|La serra attende le tue visioni.}</i>
        + [Mi guardo attorno.]
        -
            -> main
    
=== call_test
    + {are_two_entities_together(WateringCan, PG)} [WateringCan]
    {
    	- backupCultivable != ():
            {
                - chosenCultivable != ():
                        -> plant_check
                - else:     
                        -> cultivable_test
            }
            	- else:
    	    <i>Al momento non è possibile coltivare nulla.</i>
    	    -> main
    }
    
    {
	- chosenCultivable != ():
        -> plant_check
        
    - else:
    {
        - backupCultivable != ():
            -> pre_test
        - else:
            <i>Al momento non è possibile coltivare nulla.</i>
	    -> main
        
    }
}

=== stolen_watering_can
<i>La serra è smarrita, non si trova più il suo innaffiatoio, e ora non sa più cosa cantare.</i>
-> main

    
