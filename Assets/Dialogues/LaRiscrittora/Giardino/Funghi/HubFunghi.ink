=== hub_funghi ===
#background: {tag_background()}
#ambientSounds: {tag_ambientSounds()}
<i>Eccoti nella serra</i>
    -> randomizzazione_dono_luoghi ->
    {
        - fungoProposto != (): -> cura
        - else: -> pre_test
    }


=== pre_test
    <i>{~ In questo momento la serra è vuota|Non c'è nulla in crescita}</i>
        + [Voglio consultare la serra]
            -> test_coltivazioni
        + [Mi guardo attorno]
        -
            -> main

=== cura
    <i>{~ L'aria sembra più dolce oggi|Da qualche parte, tra le foglie, qualcosa canta|Piccole luci sfarfallano sopra il terreno}</i>
        -> plant_check -> 
    + [Mi guardo attorno]
    -
        -> main
    
=== call_test
    + {contenutoFunghi has PG} [Wheelbarrow]
        {
        
            - fungoProposto != ():
                -> cura
            - else:
                -> test_coltivazioni
            
        }
    
