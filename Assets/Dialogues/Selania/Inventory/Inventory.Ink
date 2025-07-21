//con questa logica traccio chi è l'effettivo ricettore del dono, così da presentare la linea di dialogo corretta

VAR currentReceiver = ()


=== inventory_contents ===
+ {gifts_and_ink.sbadata or cultivable_test}[Inventory]
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


+ {findedGifts has EderaDelleAmanti} [Edera delle amanti.]
    ~ findedGifts -= EderaDelleAmanti
    {
        - currentReceiver has FirstCharacter:
        <i>{translator(firstCharacterState)} è confusa dal dono.</i>#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
            ~ currentReceiver = ()
                -> first_story_gift.ink_outcome
        
        
        - currentReceiver has SecondCharacter:
            {translator(secondCharacterState)} ti guarda disgustato.#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
            ~ currentReceiver = ()
                -> second_story_gift.ink_outcome
        
    }
        -> main



+ {findedGifts has BaccaDellaAddolorata} [Una bacca della Addolorata.]
    ~ findedGifts -= BaccaDellaAddolorata

    {
        - currentReceiver has FirstCharacter:
            <i>{translator(firstCharacterState)} ti sorride.</i>#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
            <i>Si rigira la bacca tra la mani, sembra più serena.</i>
            ~ firstCharacterInkLevel ++
            ~ currentReceiver = ()
                -> first_story_gift.ink_outcome
            
        
        - currentReceiver has SecondCharacter:
            <i>Hai regalato a {translator(secondCharacterState)} qualcosa che proprio non gli interessa.</i>#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
            ~ currentReceiver = ()
                -> second_story_gift.ink_outcome
    
    }
    -> main    




+ {findedGifts has LaSpazzata} [Un frammento della Spezzata.]
    ~ findedGifts -= LaSpazzata
    
    {
        - currentReceiver has FirstCharacter:
            <i>{translator(firstCharacterState)} è infastidita dalla tensione che viene dal frammento, e se lo getta alle spalle.</i>#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
                -> first_story_gift.ink_outcome
    
        - currentReceiver has SecondCharacter:
            ~ secondCharacterInkLevel ++
            <i> Hai regalato a {translator(secondCharacterState)} qualcosa che lo esalta.</i> #speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
            <i>Continua a rigirarsi il frammento tra le dita, pieno di gioia rabbiosa.</i>
                -> second_story_gift.ink_outcome
    
    }
    -> main



+ {findedGifts has BrinaDellImpossibile} [Un frammento di Brina dell'Impossibile.]
    ~ findedGifts -= BrinaDellImpossibile

    {
        - currentReceiver has FirstCharacter:
            <i>{translator(firstCharacterState)} getta a terra il tuo dono, disgustata.</i>#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
            <i>Le linee della tua mano ricompaiono, i pezzi si rinsaldano.</i>
             ~ currentReceiver = ()
                -> first_story_gift.ink_outcome
    
    
        - currentReceiver has SecondCharacter:
            ~ secondCharacterInkLevel ++
            ~ secondCharacterInkLevel ++
            <i>Sorprendentemente {translator(secondCharacterState)} inizia a tremare.</i>#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
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
        <i>{translator(firstCharacterState)} inizia a saltellare di gioia.</i>#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
         ~ currentReceiver = ()
            -> first_story_gift.ink_outcome



    - currentReceiver has SecondCharacter:
        <i>{translator(secondCharacterState)} ti guarda disgustato.</i>#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
        <i>Finge persino di vomitare.</i>
        ~ currentReceiver = ()
            -> second_story_gift.ink_outcome

    }
        -> main

+ {findedGifts has LicheneDegliAbissi} [Una traccia dell'odore del Lichene degli Abissi.]
    ~ findedGifts -= LicheneDegliAbissi

    {
    - currentReceiver has FirstCharacter:
        <i>{translator(firstCharacterState)} ti guarda delusa.</i>#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
         ~ currentReceiver = ()
            -> first_story_gift.ink_outcome
    

    - currentReceiver has SecondCharacter:
        <i>{translator(secondCharacterState)} sembra ferito.</i>#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
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
        <i>{translator(firstCharacterState)} sussurra "nonno".</i>#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
        <i>Le lacrime le rigano il viso.</i>
         ~ currentReceiver = ()
            -> first_story_gift.ink_outcome


    - currentReceiver has SecondCharacter:
        ~ secondCharacterInkLevel ++
        ~ secondCharacterInkLevel ++
        <i>{translator(secondCharacterState)} fa qualcosa di inaspettato: ti abbraccia.</i>#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
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
