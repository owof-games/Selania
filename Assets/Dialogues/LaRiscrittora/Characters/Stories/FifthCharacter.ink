~ temp charNameCinque= uppercaseTranslator(fifthCharacterState)

=== personaggia_cinque ===
        //opzione se questa storia è attiva
        + {are_two_entities_together(FifthCharacter, PG) && fifthStory == Active} [FifthCharacter]
                -> storia_cinque
        
        //opzione se c'è un'altra storia attiva
        + {are_two_entities_together(FifthCharacter, PG) && fifthStory == Ended}[FifthCharacter]
                -> personaggia_cinque_storia_conclusa
                
        + ->
    
        -> DONE


=== storia_cinque ===
    //la storia in corso viene attivata, e le altre non saranno accessibili fino alla sua conclusione

        <i>Vuoi ascoltare la sua storia?</i>
        + [Sì]
            ~ fifthStory = Active        
            -> aiuto_storia_cinque
        + [No]
            -> main
    ->-> 


=== aiuto_storia_cinque ===
    + {findedGifts != ()} Offro un dono.
    -> gestione_inventario -> capitolo_uno
    + ->
    {findedGifts == (): Non parlo senza un dono adeguato! ->main}
    
    
    
    = capitolo_uno    
        Dopo il tuo dono, la quantità di inchiostro a disposizione è {fifthCharacterInkLevel}.
             -> inkActions ->
        //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco
             + Ho risolto la quinta storia dando al quinto spettro un nuovo stato
                ~ fifthStory = Ended
                ~ fifthCharacterState = NuovoStatoUnoCinque
             + Non ho risolto la storia
             -
        -> main
        
=== personaggia_cinque_storia_conclusa        
        + opzione
        + opzione
        + opzione
        -
    -> main            