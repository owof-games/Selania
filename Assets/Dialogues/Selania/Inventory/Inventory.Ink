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


+ {findedGifts has EderaDelleAmanti} [Una foglia di Edera delle amanti.]
    ~ findedGifts -= EderaDelleAmanti
    {
        - currentReceiver has FirstCharacter:
            <i>{translator(firstCharacterState)} non comprende il significato del tuo dono.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                ~ firstGift += EderaDelleAmanti
                ~ currentReceiver = ()
                    -> first_story_gift.ink_outcome
        
        
        - currentReceiver has SecondCharacter:
            <i>{translator(secondCharacterState)} ti guarda imbarazzato.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
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
            <i>Hai donato a {translator(secondCharacterState)} qualcosa che non gli interessa.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                ~ secondGift += BaccaDellaAddolorata
                ~ currentReceiver = ()
                    -> second_story_gift.ink_outcome
    
    }
        -> main    




+ {findedGifts has LaSpazzata} [Un rametto della Spezzata.]
    ~ findedGifts -= LaSpazzata
    
    {
        - currentReceiver has FirstCharacter:
            <i>{translator(firstCharacterState)} è infastidita dalla tensione che viene dal frammento, lo lancia lontano.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                ~ firstGift += LaSpazzata
                ~ currentReceiver = ()            
                    -> first_story_gift.ink_outcome
    
        - currentReceiver has SecondCharacter:
            ~ secondCharacterInkLevel ++
            <i>Hai regalato a {translator(secondCharacterState)} qualcosa che lo esalta.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
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
            <i>{translator(firstCharacterState)} getta a terra il tuo dono, spaventata.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
            <i>Le linee della tua mano ricompaiono, i pezzi si rinsaldano.</i>
                ~ firstGift += BrinaDellImpossibile
                ~ currentReceiver = ()
                    -> first_story_gift.ink_outcome
    
    
        - currentReceiver has SecondCharacter:
            ~ secondCharacterInkLevel ++
            ~ secondCharacterInkLevel ++
            <i>{translator(secondCharacterState)} inizia a tremare.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
            <i>Lacrime troppo antiche per un bambino scappano dagli angoli degli occhi.</i>
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
        <i>{translator(firstCharacterState)} inizia a cantare il nome delle persone che ama.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                ~ firstGift += CantoDelleCompagne
                ~ currentReceiver = ()
                    -> first_story_gift.ink_outcome



    - currentReceiver has SecondCharacter:
        <i>{translator(secondCharacterState)} prova ad assaggiare la goccia.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        <i>E finisce per vomitare.</i>
                ~ secondGift += CantoDelleCompagne
                ~ currentReceiver = ()
                    -> second_story_gift.ink_outcome

    }
        -> main

+ {findedGifts has LicheneDegliAbissi} [Una traccia dell'odore del Lichene degli Abissi.]
    ~ findedGifts -= LicheneDegliAbissi

    {
    - currentReceiver has FirstCharacter:
        <i>{translator(firstCharacterState)} sembra sinceramente delusa.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
            ~ firstGift += LicheneDegliAbissi
            ~ currentReceiver = ()
            -> first_story_gift.ink_outcome
    

    - currentReceiver has SecondCharacter:
        <i>{translator(secondCharacterState)} è ferito.</i>#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
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
        <i>{translator(firstCharacterState)} sussurra "nonno".</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        <i>Le lacrime le rigano il viso.</i>
            ~ firstGift += NonTiScordarDiTe
            ~ currentReceiver = ()
            -> first_story_gift.ink_outcome


    - currentReceiver has SecondCharacter:
        ~ secondCharacterInkLevel ++
        ~ secondCharacterInkLevel ++
        <i>{translator(secondCharacterState)} ti abbraccia.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        <i>E poi si allontana imbarazzato.</i>
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
        <i>{translator(firstCharacterState)} sembra prima disgustata, poi divertita.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        <i>E poi comprensione compare sul suo volto.</i>
                ~ firstGift += CardoAspinato
                ~ currentReceiver = ()
                    -> first_story_gift.ink_outcome


    - currentReceiver has SecondCharacter:
        ~ secondCharacterInkLevel ++
        <i>{translator(secondCharacterState)} inizia a ridere.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
        <i>Poi sorride imbarazzato.</i>
        Grazie, {name}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_emotional
            ~ secondGift += CardoAspinato
            ~ currentReceiver = ()
            -> second_story_gift.ink_outcome
        
    }
        -> main    



+ {findedGifts has BastoneDellOzioso} [Un nodo di Bastone dell'Ozioso.]
    ~ findedGifts -= BastoneDellOzioso
    {
        - currentReceiver has FirstCharacter:
            <i>{translator(firstCharacterState)} inizia a girarselo tra le dita cantando divertita.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                ~ firstCharacterInkLevel ++
                ~ firstGift += BastoneDellOzioso
                ~ currentReceiver = ()
                    -> first_story_gift.ink_outcome
        
        
        - currentReceiver has SecondCharacter:
            <i>{translator(secondCharacterState)} è entusiasta: inizia a lanciarlo a terra, inseguirlo, riprenderselo ridendo a crepapelle.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                ~ secondCharacterInkLevel ++
                ~ secondCharacterInkLevel ++
                ~ secondGift += BastoneDellOzioso
                ~ currentReceiver = ()
                    -> second_story_gift.ink_outcome
        
    }
        -> main        
    

+ {findedGifts has BarbaDellInciampo} [Una spina di Barba dell'Inciampo.]
    ~ findedGifts -= BarbaDellInciampo
    {
        - currentReceiver has FirstCharacter:
            <i>{translator(firstCharacterState)} si punge, infastidita.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                ~ firstGift += BarbaDellInciampo
                ~ currentReceiver = ()
                    -> first_story_gift.ink_outcome
        
        
        - currentReceiver has SecondCharacter:
            <i>{translator(secondCharacterState)} si distrae rapidamente, ignorando il dono.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                ~ secondGift += BarbaDellInciampo
                ~ currentReceiver = ()
                    -> second_story_gift.ink_outcome
        
    }
    
 + {findedGifts has Olobino} [Una cappello di Olobino.]
    ~ findedGifts -= Olobino
    {
        - currentReceiver has FirstCharacter:
            ~ firstCharacterInkLevel ++
            <i>{translator(firstCharacterState)} è estatica.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
            Grazie {name}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_affectionate
            Credo mi prenderò un po' di tempo per me con questo dono.
                ~ firstGift += Olobino
                ~ currentReceiver = ()
                    -> first_story_gift.ink_outcome
        
        
        - currentReceiver has SecondCharacter:
            <i>{translator(secondCharacterState)} lo annusa e lo lascia cadere a terra, annoiato.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                ~ secondGift += Olobino
                ~ currentReceiver = ()
                    -> second_story_gift.ink_outcome
        
    }   
    
 + {findedGifts has FalsaPalude} [Un petalo di Falsa Palude.]
    ~ findedGifts -= FalsaPalude
    {
        - currentReceiver has FirstCharacter:
            <i>{translator(firstCharacterState)} non sembra colpita.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                ~ firstGift += FalsaPalude
                ~ currentReceiver = ()
                    -> first_story_gift.ink_outcome
        
        
        - currentReceiver has SecondCharacter:
            <i>{translator(secondCharacterState)} continua a mordicchiarsi le unghie sporche.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                ~ secondGift += FalsaPalude
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
