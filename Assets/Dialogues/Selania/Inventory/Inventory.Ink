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
        <i>{translator(firstCharacterState)} è confusa dal dono.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            ~ firstGift += EderaDelleAmanti
            ~ currentReceiver = ()
                -> first_story_gift.ink_outcome
        
        
        - currentReceiver has SecondCharacter:
            {translator(secondCharacterState)} ti guarda disgustato.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            ~ secondGift += EderaDelleAmanti
            ~ currentReceiver = ()
                -> second_story_gift.ink_outcome
        
    }
        -> main



+ {findedGifts has BaccaDellaAddolorata} [Una bacca della Addolorata.]
    ~ findedGifts -= BaccaDellaAddolorata

    {
        - currentReceiver has FirstCharacter:
            <i>{translator(firstCharacterState)} ti sorride.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            <i>Si rigira la bacca tra la mani, sembra più serena.</i>
            ~ firstCharacterInkLevel ++
            ~ firstGift += BaccaDellaAddolorata
            ~ currentReceiver = ()
                -> first_story_gift.ink_outcome
            
        
        - currentReceiver has SecondCharacter:
            <i>Hai regalato a {translator(secondCharacterState)} qualcosa che proprio non gli interessa.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            ~ secondGift += BaccaDellaAddolorata
            ~ currentReceiver = ()
                -> second_story_gift.ink_outcome
    
    }
    -> main    




+ {findedGifts has LaSpazzata} [Un frammento della Spezzata.]
    ~ findedGifts -= LaSpazzata
    
    {
        - currentReceiver has FirstCharacter:
            <i>{translator(firstCharacterState)} è infastidita dalla tensione che viene dal frammento, e se lo getta alle spalle.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            ~ firstGift += LaSpazzata
            ~ currentReceiver = ()            
                -> first_story_gift.ink_outcome
    
        - currentReceiver has SecondCharacter:
            ~ secondCharacterInkLevel ++
            <i> Hai regalato a {translator(secondCharacterState)} qualcosa che lo esalta.</i> #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            <i>Continua a rigirarsi il frammento tra le dita, pieno di gioia rabbiosa.</i>
                ~ secondGift += LaSpazzata
                ~ currentReceiver = ()
                -> second_story_gift.ink_outcome
    
    }
    -> main



+ {findedGifts has BrinaDellImpossibile} [Un frammento di Brina dell'Impossibile.]
    ~ findedGifts -= BrinaDellImpossibile

    {
        - currentReceiver has FirstCharacter:
            <i>{translator(firstCharacterState)} getta a terra il tuo dono, disgustata.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            <i>Le linee della tua mano ricompaiono, i pezzi si rinsaldano.</i>
                ~ firstGift += BrinaDellImpossibile
                ~ currentReceiver = ()
                -> first_story_gift.ink_outcome
    
    
        - currentReceiver has SecondCharacter:
            ~ secondCharacterInkLevel ++
            ~ secondCharacterInkLevel ++
            <i>Sorprendentemente {translator(secondCharacterState)} inizia a tremare.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            <i>Cerca di trattenere le lacrime, ma alcune gli scappano a fatica dagli occhi.</i>
            <i>Le linee della tua mano ricompaiono, i pezzi si rinsaldano.</i>
                ~ secondGift += BrinaDellImpossibile
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
        <i>{translator(firstCharacterState)} inizia a saltellare di gioia.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            ~ firstGift += CantoDelleCompagne
            ~ currentReceiver = ()
            -> first_story_gift.ink_outcome



    - currentReceiver has SecondCharacter:
        <i>{translator(secondCharacterState)} ti guarda disgustato.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Finge persino di vomitare.</i>
            ~ secondGift += CantoDelleCompagne
            ~ currentReceiver = ()
            -> second_story_gift.ink_outcome

    }
        -> main

+ {findedGifts has LicheneDegliAbissi} [Una traccia dell'odore del Lichene degli Abissi.]
    ~ findedGifts -= LicheneDegliAbissi

    {
    - currentReceiver has FirstCharacter:
        <i>{translator(firstCharacterState)} ti guarda delusa.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            ~ firstGift += LicheneDegliAbissi
            ~ currentReceiver = ()
            -> first_story_gift.ink_outcome
    

    - currentReceiver has SecondCharacter:
        <i>{translator(secondCharacterState)} sembra ferito.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Ti guarda, fa per dire qualcosa, e poi si zittisce.</i>
            ~ secondGift += LicheneDegliAbissi
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
        <i>{translator(firstCharacterState)} sussurra "nonno".</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Le lacrime le rigano il viso.</i>
            ~ firstGift += NonTiScordarDiTe
            ~ currentReceiver = ()
            -> first_story_gift.ink_outcome


    - currentReceiver has SecondCharacter:
        ~ secondCharacterInkLevel ++
        ~ secondCharacterInkLevel ++
        <i>{translator(secondCharacterState)} fa qualcosa di inaspettato: ti abbraccia.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Poi si allontana imbarazzato.</i>
            ~ secondGift += NonTiScordarDiTe
            ~ currentReceiver = ()
            -> second_story_gift.ink_outcome
        
    }
        -> main


+ {findedGifts has CardoAspinato} [Un ciuffo di peli di Cardo Aspinato.]
    ~ findedGifts -= CardoAspinato

    {
    - currentReceiver has FirstCharacter:
        ~ firstCharacterInkLevel ++
        <i>{translator(firstCharacterState)} sembra prima disgustata, poi divertita.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>E poi comprensione compare sul suo volto.</i>
            ~ firstGift += CardoAspinato
            ~ currentReceiver = ()
            -> first_story_gift.ink_outcome


    - currentReceiver has SecondCharacter:
        ~ secondCharacterInkLevel ++
        <i>{translator(secondCharacterState)} inizia a ridere.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        <i>Poi sorride imbarazzato.</i>
        Grazie, {name}. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
            ~ secondGift += CardoAspinato
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
