~ temp charNameQuattro = uppercaseTranslator(fourthCharacterState)

=== personaggia_quattro ===
        //opzione se c'è un'altra storia attiva
        + {are_two_entities_together(FourthCharacter, PG) && fourthStory == Active} [Scelgo il dono.]
            -> storia_quattro
        
        //opzione se questa storia è attiva
        + {are_two_entities_together(FourthCharacter, PG) && fourthStory == Ended} [Scelgo il dono.]
            -> personaggia_quattro_storia_conclusa
        
        + ->
    
        -> DONE



=== storia_quattro ===
    //la storia in corso viene attivata, e le altre non saranno accessibili fino alla sua conclusione

        Scelgo il dono.
        + [Scelgo il dono.]
        ~ fourthStory = Active            
            -> aiuto_storia_quattro
        + [Scelgo il dono.]
            -> main
    ->-> 



=== aiuto_storia_quattro ===
    + {findedGifts != ()} Scelgo il dono.
    -> inventory_management -> capitolo_uno
    + ->
    {findedGifts == (): Scelgo il dono. ->main}
    
    
    
    = capitolo_uno    
        Scelgo il dono.
             ~ inkLevel(fourthCharacterInkLevel)
        //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco
             + Scelgo il dono.
                ~ fourthStory = Ended
                ~ fourthCharacterState = NuovoStatoUnoQuattro
             + Scelgo il dono.
             -
        -> main

=== dialogo_personaggia_quattro
    Scelgo il dono.
    -> main

        //Questa roba poi è da risistemare
=== knowing_fourth_character

        = five
        
        -> main    

=== personaggia_quattro_storia_conclusa        
        + Scelgo il dono.
        + Scelgo il dono.
        + Scelgo il dono.
        -
    -> main            
