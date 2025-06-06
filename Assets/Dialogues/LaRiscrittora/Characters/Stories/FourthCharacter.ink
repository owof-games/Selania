~ temp charNameQuattro = translator(fourthCharacterState)

=== fourth_character ===
        //opzione se c'è un'altra storia attiva
        + {are_two_entities_together(FourthCharacter, PG) && fourthStory == Active} [FourthCharacter]
            -> talk_with_fourth_character
        
        //opzione se questa storia è attiva
        + {are_two_entities_together(FourthCharacter, PG) && fourthStory == Ended} [FourthCharacter]
            -> fourth_char_story_ended
        
        + ->
    
        -> DONE



=== talk_with_fourth_character ===
    //la storia in corso viene attivata, e le altre non saranno accessibili fino alla sua conclusione

        <i>Vuoi ascoltare la sua storia?</i>
        + [Sì]
        ~ fourthStory = Active            
            -> aiuto_storia_quattro
        + [No]
            -> main
    ->-> 



=== aiuto_storia_quattro ===
    + {findedGifts != ()} Offro un dono.
    -> inventory_management -> capitolo_uno
    + ->
    {findedGifts == (): Non parlo senza un dono adeguato! ->main}
    
    
    
    = capitolo_uno    
        Dopo il tuo dono, la quantità di inchiostro a disposizione è {fourthCharacterInkLevel}.
             ~ inkLevel(fourthCharacterInkLevel)
        //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco
             + Ho risolto la quarta storia dando al quarto spettro un nuovo stato
                ~ fourthStory = Ended
                ~ fourthCharacterState = NuovoStatoUnoQuattro
             + Non ho risolto la storia
             -
        -> main

=== dialogo_personaggia_quattro
    sss
    -> main

        //Questa roba poi è da risistemare
=== knowing_fourth_character

        = five
        
        -> main    

=== fourth_char_story_ended       
        + opzione
        + opzione
        + opzione
        -
    -> main            