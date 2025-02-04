~ temp charNameSei = uppercaseTranslator(sixthCharacterState)

=== personaggia_sei===
         //opzione se questa storia è attiva
        + {are_two_entities_together(SixthCharacter, PG) && sixthStory == Active} [SixthCharacter]
                -> storia_sei
        
        //opzione se c'è un'altra storia attiva
        + {are_two_entities_together(SixthCharacter, PG) && sixthStory == Ended}[SixthCharacter]
                -> personaggia_sei_storia_conclusa
                
        + ->
    
        -> DONE


=== storia_sei ===
    //la storia in corso viene attivata, e le altre non saranno accessibili fino alla sua conclusione

        <i>Vuoi ascoltare la sua storia?</i>
        + [Sì]
        ~ sixthStory = Active        
            -> aiuto_storia_sei
        + [No]
            -> main
    ->-> 



=== aiuto_storia_sei ===
    + {findedGifts != ()} Offro un dono.
    -> gestione_inventario -> capitolo_uno
    + ->
    {findedGifts == (): Non parlo senza un dono adeguato! ->main}
    
    
    
    = capitolo_uno    
        Dopo il tuo dono, la quantità di inchiostro a disposizione è {sixthCharacterInkLevel}.
             ~ inkActions(sixthCharacterInkLevel)
        //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco
             + Ho risolto la sesta storia dando al sesto spettro un nuovo stato
                ~ sixthStory = Ended
                ~ sixthCharacterState = NuovoStatoUnoSei
             + Non ho risolto la storia
             -
        -> main

=== personaggia_sei_storia_conclusa        
        + opzione
        + opzione
        + opzione
        -
    -> main            