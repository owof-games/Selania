~ temp charNameSette = uppercaseTranslator(seventhCharacterState)

=== personaggia_sette ===
         //opzione se questa storia è attiva
        + {are_two_entities_together(SeventhCharacter, PG) && seventhStory == Active} [SeventhCharacter]
                -> storia_sei
        
        //opzione se c'è un'altra storia attiva
        + {are_two_entities_together(SeventhCharacter, PG) && seventhStory == Ended}[SeventhCharacter]
                -> personaggia_sette_storia_conclusa
                
        + ->
    
        -> DONE
    

=== storia_sette ===
    //la storia in corso viene attivata, e le altre non saranno accessibili fino alla sua conclusione

        <i>Vuoi ascoltare la sua storia?</i>
        + [Sì]
        ~ seventhStory = Active        
            -> aiuto_storia_sette
        + [No]
            -> main
    ->-> 



=== aiuto_storia_sette ===
    + {findedGifts != ()} Offro un dono.
    -> gestione_inventario -> capitolo_uno
    + ->
    {findedGifts == (): Non parlo senza un dono adeguato! ->main}
    
    
    
    = capitolo_uno    
        Dopo il tuo dono, la quantità di inchiostro a disposizione è {seventhCharacterInkLevel}.
             ~ inkLevel(seventhCharacterInkLevel)
        //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco
             + Ho risolto la settima storia dando al settimo spettro un nuovo stato
                ~ seventhStory = Ended
                ~ seventhCharacterState = NuovoStatoUnoSette
             + Non ho risolto la storia
             -
        -> main
        
=== personaggia_sette_storia_conclusa        
        + opzione
        + opzione
        + opzione
        -
    -> main           