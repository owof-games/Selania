=== greenhouse ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
{greenhouse == 1:<i>Eccoti nella serra</i>|<i>La serra {~pulsa nell'aria tiepida|odora di terra e tranquillità|chiede ascolto|raccoglie risponste|propone domande}</i>}.

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
    <i>{~ In questo momento non c'è nulla in crescita|La serra attende le tue visioni}.</i>
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
                        -> test_coltivazioni
            }
            	- else:
    	    <i>Al momento non è possibile coltivare nulla</i>.
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
            <i>Al momento non è possibile coltivare nulla</i>.
	    -> main
        
    }
}

    
