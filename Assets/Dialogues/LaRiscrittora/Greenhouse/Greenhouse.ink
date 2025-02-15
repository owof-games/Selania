=== greenhouse ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
{greenhouse == 1:<i>Eccoti nella serra.</i>|<i>{~La serra pulsa nell'aria tiepida.|C'è odore di terra e tranquillità.|I vasi chiedono di essere ascoltati.|Le ragnatele raccolgono risposte.|Le venature del legno propongono domande.}</i>}

{
	- chosenCultivable != ():
        -> cure
        
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

=== cure
        -> plant_check -> 
    + [Mi guardo attorno.]
    -
        -> main
    
=== call_test
    + {are_two_entities_together(WateringCan, PG)} [WateringCan]
    {
    	- backupCultivable != ():
            {
                - chosenCultivable != ():
                        -> cure
                - else:     
                        -> cultivable_test
            }
            	- else:
    	    <i>Al momento non è possibile coltivare nulla.</i>
    	    -> main
    }
    
    {
	- chosenCultivable != ():
        -> cure
        
    - else:
    {
        - backupCultivable != ():
            -> pre_test
        - else:
            <i>Al momento non è possibile coltivare nulla.</i>
	    -> main
        
    }
}

    
