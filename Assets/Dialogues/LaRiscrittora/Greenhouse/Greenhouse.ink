=== greenhouse ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
{greenhouse == 1:<i> Eccoti nella serra</i>|<i>La serra {~ pulsa nell'aria tiepida|risplende|ti attende quieta}</i>}.

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
    <i>{~ In questo momento non c'è nulla in crescita|Cose}.</i>
        + [Mi guardo attorno.]
        -
            -> main

=== cure
    <i>{~ L'aria sembra più dolce oggi|Da qualche parte, tra le foglie, qualcosa canta|Piccole luci sfarfallano sopra il terreno}.</i>
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

    
