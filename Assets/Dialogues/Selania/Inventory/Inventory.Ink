//con questa logica traccio chi è l'effettivo ricettore del dono, così da presentare la linea di dialogo corretta

VAR currentReceiver = ()

=== inventory_contents ===
+ [Inventory]
    ~ enableBigDialogue()
    {findedGifts != (): -> inventory ->|-> empty ->}
    ~ disableBigDialogue()
    -> main

    = inventory
        <i>Hai con te {list_with_commas(findedGifts)}.</i>
        ->->

    = empty
        <i>L'inventario è vuoto.</i>
        ->->


=== inventory_management ===
    ~ temp charNameFive = translator(fifthCharacterState)
    {debug: I doni trovati sono {findedGifts}.}
    Dono...
    
/* ---------------------------------

            Coltivabili

 ----------------------------------*/


+ {findedGifts has EderaDelleAmanti} [Del muschio delle amanti.]
    ~ findedGifts -= EderaDelleAmanti
    {
        - currentReceiver has FirstCharacter:
        <i>{translator(firstCharacterState)} è confusa dal dono.</i>
            ~ currentReceiver = ()
                -> first_story_gift.ink_outcome
        
        
        - currentReceiver has SecondCharacter:
            {translator(secondCharacterState)} ti guarda disgustato.
            ~ currentReceiver = ()
                -> second_story_gift.ink_outcome
        
    }
        -> main



+ {findedGifts has BaccaDellaAddolorata} [Una bacca della Addolorata.]
    ~ findedGifts -= BaccaDellaAddolorata

    {
        - currentReceiver has FirstCharacter:
            <i>{translator(firstCharacterState)} ti sorride.</i>
            <i>Si rigira la bacca tra la mani, sembra più serena.</i>
            ~ firstCharacterInkLevel ++
            ~ currentReceiver = ()
                -> first_story_gift.ink_outcome
            
        
        - currentReceiver has SecondCharacter:
            <i>Hai regalato a {translator(secondCharacterState)} qualcosa che proprio non gli interessa.</i>
            ~ currentReceiver = ()
                -> second_story_gift.ink_outcome
    
    }
    -> main    




+ {findedGifts has LaSpazzata} [Un frammento della Spezzata.]
    ~ findedGifts -= LaSpazzata
    
    {
        - currentReceiver has FirstCharacter:
            <i>{translator(firstCharacterState)} è infastidita dalla tensione che viene dal frammento, e se lo getta alle spalle.</i>
                -> first_story_gift.ink_outcome
    
        - currentReceiver has SecondCharacter:
            ~ secondCharacterInkLevel ++
            <i> Hai regalato a {translator(secondCharacterState)} qualcosa che lo esalta.</i>
            <i>Continua a rigirarsi il frammento tra le dita, pieno di gioia rabbiosa.</i>
                -> second_story_gift.ink_outcome
    
    }
    -> main



+ {findedGifts has BrinaDellImpossibile} [Un frammento di Brina dell'Impossibile.]
    ~ findedGifts -= BrinaDellImpossibile

    {
        - currentReceiver has FirstCharacter:
            <i>{translator(firstCharacterState)} getta a terra il tuo dono, disgustata.</i>
            <i>Le linee della tua mano ricompaiono, i pezzi si rinsaldano.</i>
             ~ currentReceiver = ()
                -> first_story_gift.ink_outcome
    
    
        - currentReceiver has SecondCharacter:
            ~ secondCharacterInkLevel ++
            ~ secondCharacterInkLevel ++
            <i>Sorprendentemente {translator(secondCharacterState)} inizia a tremare.</i>
            <i>Cerca di trattenere le lacrime, ma alcune gli scappano a fatica dagli occhi.</i>
            <i>Le linee della tua mano ricompaiono, i pezzi si rinsaldano.</i>
            ~ currentReceiver = ()
                -> second_story_gift.ink_outcome

    }
        -> main
    
    
+ {findedGifts has CantoDelleCompagne} [Una goccia di Canto delle Compagne.]
    ~ findedGifts -= CantoDelleCompagne

    {
    - currentReceiver has FirstCharacter:
        ~ firstCharacterInkLevel ++
        ~ firstCharacterInkLevel ++
        <i>{translator(firstCharacterState)} inizia a saltellare di gioia.</i>
         ~ currentReceiver = ()
            -> first_story_gift.ink_outcome



    - currentReceiver has SecondCharacter:
        <i>{translator(secondCharacterState)} ti guarda disgustato.</i>
        <i>Finge persino di vomitare.</i>
        ~ currentReceiver = ()
            -> second_story_gift.ink_outcome

    }
        -> main

+ {findedGifts has LicheneDegliAbissi} [Una traccia dell'odore del Lichene degli Abissi.]
    ~ findedGifts -= LicheneDegliAbissi

    {
    - currentReceiver has FirstCharacter:
        <i>{translator(firstCharacterState)} ti guarda delusa.</i>
         ~ currentReceiver = ()
            -> first_story_gift.ink_outcome
    

    - currentReceiver has SecondCharacter:
        <i>{translator(secondCharacterState)} sembra ferito.</i>
        <i>Ti guarda, fa per dire qualcosa, e poi si zittisce.</i>
        ~ currentReceiver = ()
            -> second_story_gift.ink_outcome
    
    }
        -> main

+ {findedGifts has NonTiScordarDiTe} [L'impronta del Non Ti Scordar di Te.]
    ~ findedGifts -= NonTiScordarDiTe

    {
    - currentReceiver has FirstCharacter:
        ~ firstCharacterInkLevel ++
        ~ firstCharacterInkLevel ++
        <i>{translator(firstCharacterState)} sussurra "nonno".</i>
        <i>Le lacrime le rigano il viso.</i>
         ~ currentReceiver = ()
            -> first_story_gift.ink_outcome


    - currentReceiver has SecondCharacter:
        ~ secondCharacterInkLevel ++
        ~ secondCharacterInkLevel ++
        <i>{translator(secondCharacterState)} fa qualcosa di inaspettato: ti abbraccia.</i>
        <i>Poi si allontana imbarazzato.</i>
        ~ currentReceiver = ()
            -> second_story_gift.ink_outcome
        
    }
        -> main
    

    //Se la lista è vuota
    + {findedGifts == ()} [Non ho nulla da donare.]
        -> main
    
    + [Ho bisogno di ragionarci ancora un poco.]
        ~ currentReceiver = ()
        -> main 
    + ->
    - 
-> main
