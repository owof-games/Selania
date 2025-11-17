//con questa logica traccio chi è l'effettivo ricettore del dono, così da presentare la linea di dialogo corretta

VAR gift_currentReceiver = ()

=== backpack_contents ===
+ [Backpack]
    {backpack_findedGifts != (): -> Backpack|-> empty}

    = Backpack
    <i>Hai con te {list_with_commas(backpack_findedGifts)}.</i>
    -> main

    = empty
    <i>L'inventario è vuoto.</i>
    -> main


=== backpack_management ===
~ temp charNameFive = uppercaseTranslator(fifthChar_ActualName)
{debug: I doni trovati sono {backpack_findedGifts}.}
Dono...
/* ---------------------------------

            Coltivabili

 ----------------------------------*/


+ {backpack_findedGifts has MuschioDelleAmanti} [Del muschio delle amanti.]
    ~ backpack_findedGifts -= MuschioDelleAmanti
    {
        - gift_currentReceiver has FirstCharacter:
        <i>{uppercaseTranslator(firstCharacterState)} è confusa dal dono.</i>
            ~ gift_currentReceiver = ()
            -> first_story_gift.ink_outcome
        
        
        - gift_currentReceiver has SecondCharacter:
            {uppercaseTranslator(secondCharacterState)} ti guarda disgustato.
            ~ gift_currentReceiver = ()
            -> second_story_gift.ink_outcome
        
    }
    -> main



+ {backpack_findedGifts has BaccaDellaAddolorata} [Una bacca della Addolorata.]
    ~ backpack_findedGifts -= BaccaDellaAddolorata

    {
    - gift_currentReceiver has FirstCharacter:
        <i>{uppercaseTranslator(firstCharacterState)} ti sorride.</i>
        <i>Si rigira la bacca tra la mani, sembra più serena.</i>
        ~ firstCharacterInkLevel ++
        ~ gift_currentReceiver = ()
        -> first_story_gift.ink_outcome
        
    
    - gift_currentReceiver has SecondCharacter:
        <i>Hai regalato a {uppercaseTranslator(secondCharacterState)} qualcosa che proprio non gli interessa.</i>
        ~ gift_currentReceiver = ()
        -> second_story_gift.ink_outcome
    
    }
   -> main    




+ {backpack_findedGifts has LaSpazzata} [Un frammento della Spezzata.]
    ~ backpack_findedGifts -= LaSpazzata
    
    {
    - gift_currentReceiver has FirstCharacter:
        <i>{uppercaseTranslator(firstCharacterState)} è infastidita dalla tensione che viene dal frammento, e se lo getta alle spalle.</i>
        -> first_story_gift.ink_outcome

    - gift_currentReceiver has SecondCharacter:
        ~ secondCharacterInkLevel ++
        <i> Hai regalato a {uppercaseTranslator(secondCharacterState)} qualcosa che lo esalta.</i>
        <i>Continua a rigirarsi il frammento tra le dita, pieno di gioia rabbiosa.</i>
        -> second_story_gift.ink_outcome
    
    }
   -> main



+ {backpack_findedGifts has BrinaDellImpossibile} [Un frammento di Brina dell'Impossibile.]
    ~ backpack_findedGifts -= BrinaDellImpossibile

    {
    - gift_currentReceiver has FirstCharacter:
        <i>{uppercaseTranslator(firstCharacterState)} getta a terra il tuo dono, disgustata.</i>
        <i>Le linee della tua mano ricompaiono, i pezzi si rinsaldano.</i>
         ~ gift_currentReceiver = ()
        -> first_story_gift.ink_outcome


    - gift_currentReceiver has SecondCharacter:
        ~ secondCharacterInkLevel ++
        ~ secondCharacterInkLevel ++
        <i>Sorprendentemente {uppercaseTranslator(secondCharacterState)} inizia a tremare.</i>
        <i>Cerca di trattenere le lacrime, ma alcune gli scappano a fatica dagli occhi.</i>
        <i>Le linee della tua mano ricompaiono, i pezzi si rinsaldano.</i>
        ~ gift_currentReceiver = ()
        -> second_story_gift.ink_outcome

    }
    -> main
    
    
+ {backpack_findedGifts has CantoDelleCompagne} [Una goccia di Canto delle Compagne.]
    ~ backpack_findedGifts -= CantoDelleCompagne

    {
    - gift_currentReceiver has FirstCharacter:
        ~ firstCharacterInkLevel ++
        ~ firstCharacterInkLevel ++
        <i>{uppercaseTranslator(firstCharacterState)} inizia a saltellare di gioia.</i>
         ~ gift_currentReceiver = ()
        -> first_story_gift.ink_outcome



    - gift_currentReceiver has SecondCharacter:
        <i>{uppercaseTranslator(secondCharacterState)} ti guarda disgustato.</i>
        <i>Finge persino di vomitare.</i>
        ~ gift_currentReceiver = ()
        -> second_story_gift.ink_outcome

    }
    -> main

+ {backpack_findedGifts has LicheneDegliAbissi} [Una traccia dell'odore del Lichene degli Abissi.]
    ~ backpack_findedGifts -= LicheneDegliAbissi

    {
    - gift_currentReceiver has FirstCharacter:
        <i>{uppercaseTranslator(firstCharacterState)} ti guarda delusa.</i>
         ~ gift_currentReceiver = ()
        -> first_story_gift.ink_outcome
        
        

    - gift_currentReceiver has SecondCharacter:
        <i>{uppercaseTranslator(secondCharacterState)} sembra ferito.</i>
        <i>Ti guarda, fa per dire qualcosa, e poi si zittisce.</i>
        ~ gift_currentReceiver = ()
        -> second_story_gift.ink_outcome
    
    }
    -> main

+ {backpack_findedGifts has NonTiScordarDiTe} [L'impronta del Non Ti Scordar di Te.]
    ~ backpack_findedGifts -= NonTiScordarDiTe

    {
    - gift_currentReceiver has FirstCharacter:
        ~ firstCharacterInkLevel ++
        ~ firstCharacterInkLevel ++
        <i>{uppercaseTranslator(firstCharacterState)} sussurra "nonno".</i>
        <i>Le lacrime le rigano il viso.</i>
         ~ gift_currentReceiver = ()
            -> first_story_gift.ink_outcome


    - gift_currentReceiver has SecondCharacter:
        ~ secondCharacterInkLevel ++
        ~ secondCharacterInkLevel ++
        <i>{uppercaseTranslator(secondCharacterState)} fa qualcosa di inaspettato: ti abbraccia.</i>
        <i>Poi si allontana imbarazzato.</i>
        ~ gift_currentReceiver = ()
        -> second_story_gift.ink_outcome
        
    }
    -> main
    
/* ---------------------------------

            Oggetti trovabili

 ----------------------------------*/    
+ {backpack_findedGifts has blanket} [Una coperta.]
    ~ backpack_findedGifts -= blanket
    
    {
    - gift_currentReceiver has FirstCharacter:
        ~ firstCharacterInkLevel ++
        <i>{uppercaseTranslator(firstCharacterState)} la stende a terra e si rilassa.</i>
        ~ gift_currentReceiver = ()
        -> first_story_gift.ink_outcome
    
    
    - gift_currentReceiver has SecondCharacter:
        ~ secondCharacterInkLevel ++
        <i>{uppercaseTranslator(secondCharacterState)} si guarda in giro, cercando qualcosa da catturare.</i>
        <i>O forse {charNameFive}.</i>
        <i>Speriamo non <b>noi</b>.</i>
        -> second_story_gift.ink_outcome

    }

 
    
+ {backpack_findedGifts has emptyvase} [Un vaso vuoto.]
    ~ backpack_findedGifts -= emptyvase
    //Questo è uno dei doni preferiti della mentore, da brava giardiniera.
    
    {
    - gift_currentReceiver has FirstCharacter:
        <i>{uppercaseTranslator(firstCharacterState)} ti guarda perplessa.</i>
        <i>Prova a suonarlo, ma non esce nulla di buono.</i>
        ~ gift_currentReceiver = ()
        -> first_story_gift.ink_outcome
    
    - gift_currentReceiver has SecondCharacter:
        ~ secondCharacterInkLevel ++
        <i>Esaltato, {uppercaseTranslator(secondCharacterState)} lo lancia in terra e inizia a giocare coi frammenti.</i>
        <i>Glieli levi prima che si faccia male.</i>
        ~ gift_currentReceiver = ()
        -> second_story_gift.ink_outcome
    
    }
    
    
    
    -> main
    
    

    //Se la lista è vuota
    + {backpack_findedGifts == ()} [Non ho nulla da donare.]
        -> main
    + [Ho bisogno di ragionarci ancora un poco.]
        ~ gift_currentReceiver = ()
        -> main 
    + ->
    - 
-> main

