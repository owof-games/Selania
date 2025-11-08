//con questa logica traccio chi è l'effettivo ricettore del dono, così da presentare la linea di dialogo corretta

VAR currentReceiver = ()


=== inventory_contents ===
+ {are_two_entities_together(Inventory, PG) && !debugStochastic}[Inventory]
    ~ enableBigDialogue()
    {findedGifts != (): -> inventory ->|-> empty ->}
    ~ disableBigDialogue()
    -> main

    = inventory
        Hai con te {list_with_commas(findedGifts)}.
        ->->

    = empty
        L'inventario è vuoto.
        ->->


=== inventory_management ===
    ~ temp charNameFive = translator(fifthCharacterState)
    {debug: I doni trovati sono {list_with_commas(findedGifts)}.}
    Dono...
    
/* ---------------------------------

            Coltivabili

 ----------------------------------*/
+ {findedGifts has BaccaDellaAddolorata} [Una bacca della Addolorata.]
    ~ findedGifts -= BaccaDellaAddolorata
    {
        - recoveredCultivables hasnt BaccaDellaAddolorata:
        ~ recoverableCultivables += BaccaDellaAddolorata
    }    

    {
        - currentReceiver has FirstCharacter:
            {translator(firstCharacterState)} ti sorride.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            Si rigira la bacca tra la mani, sembra più serena.
                ~ firstCharacterInkLevel ++
                ~ firstGift += BaccaDellaAddolorata
                ~ currentReceiver = ()
                    -> first_story_gift.ink_outcome
            
        
        - currentReceiver has SecondCharacter:
            Hai donato a {translator(secondCharacterState)} qualcosa che non gli interessa.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                ~ secondGift += BaccaDellaAddolorata
                ~ currentReceiver = ()
                    -> second_story_gift.ink_outcome
    
    }
        -> main

+ {findedGifts has BarbaDellInciampo} [Una spina di Barba dell'Inciampo.]
    ~ findedGifts -= BarbaDellInciampo
    {
        - recoveredCultivables hasnt BarbaDellInciampo:
        ~ recoverableCultivables += BarbaDellInciampo
    } 
    {
        - currentReceiver has FirstCharacter:
            {translator(firstCharacterState)} si punge, infastidita.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ firstGift += BarbaDellInciampo
                ~ currentReceiver = ()
                    -> first_story_gift.ink_outcome
        
        
        - currentReceiver has SecondCharacter:
            {translator(secondCharacterState)} si distrae rapidamente, ignorando il dono.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ secondGift += BarbaDellInciampo
                ~ currentReceiver = ()
                    -> second_story_gift.ink_outcome
        
    }        
    -> main    
        
+ {findedGifts has BastoneDellOzioso} [Un nodo di Bastone dell'Ozioso.]
    ~ findedGifts -= BastoneDellOzioso
    {
        - recoveredCultivables hasnt BastoneDellOzioso:
        ~ recoverableCultivables += BastoneDellOzioso
    } 
    {
        - currentReceiver has FirstCharacter:
            {translator(firstCharacterState)} inizia a girarselo tra le dita cantando divertita.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ firstCharacterInkLevel ++
                ~ firstGift += BastoneDellOzioso
                ~ currentReceiver = ()
                    -> first_story_gift.ink_outcome
        
        
        - currentReceiver has SecondCharacter:
            {translator(secondCharacterState)} è entusiasta: inizia a lanciarlo a terra, inseguirlo, riprenderselo ridendo a crepapelle.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ secondCharacterInkLevel ++
                ~ secondCharacterInkLevel ++
                ~ secondGift += BastoneDellOzioso
                ~ currentReceiver = ()
                    -> second_story_gift.ink_outcome
        
    }
        -> main        
    
+ {findedGifts has BrinaDellImpossibile} [Un frammento di Brina dell'Impossibile.]
    ~ findedGifts -= BrinaDellImpossibile
    {
        - recoveredCultivables hasnt BrinaDellImpossibile:
        ~ recoverableCultivables += BrinaDellImpossibile
    } 

    {
        - currentReceiver has FirstCharacter:
            {translator(firstCharacterState)} getta a terra il tuo dono, spaventata.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            Le linee della tua mano ricompaiono, i pezzi si rinsaldano.
                ~ firstGift += BrinaDellImpossibile
                ~ currentReceiver = ()
                    -> first_story_gift.ink_outcome
    
    
        - currentReceiver has SecondCharacter:
            ~ secondCharacterInkLevel ++
            ~ secondCharacterInkLevel ++
            {translator(secondCharacterState)} inizia a tremare.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            Lacrime troppo antiche per un bambino scappano dagli angoli degli occhi.
            Le linee della tua mano ricompaiono, i pezzi si rinsaldano.
                ~ secondGift += BrinaDellImpossibile
                ~ currentReceiver = ()
                    -> second_story_gift.ink_outcome

    }
        -> main

+ {findedGifts has CantoDelleCompagne} [Una goccia di Canto delle Compagne.]
    ~ findedGifts -= CantoDelleCompagne
    {
        - recoveredCultivables hasnt CantoDelleCompagne:
        ~ recoverableCultivables += CantoDelleCompagne
    } 

    {
    - currentReceiver has FirstCharacter:
        ~ firstCharacterInkLevel ++
        ~ firstCharacterInkLevel ++
        {translator(firstCharacterState)} inizia a cantare il nome delle persone che ama.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ firstGift += CantoDelleCompagne
                ~ currentReceiver = ()
                    -> first_story_gift.ink_outcome



    - currentReceiver has SecondCharacter:
        {translator(secondCharacterState)} prova ad assaggiare la goccia.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        E finisce per vomitare.
                ~ secondGift += CantoDelleCompagne
                ~ currentReceiver = ()
                    -> second_story_gift.ink_outcome

    }
        -> main

+ {findedGifts has CardoAspinato} [Un ciuffo di peli di Cardo Aspinato.]
    ~ findedGifts -= CardoAspinato
    {
        - recoveredCultivables hasnt CardoAspinato:
        ~ recoverableCultivables += CardoAspinato
    } 

    {
    - currentReceiver has FirstCharacter:
        ~ firstCharacterInkLevel ++
        {translator(firstCharacterState)} sembra prima disgustata, poi divertita.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        E poi comprensione compare sul suo volto.
                ~ firstGift += CardoAspinato
                ~ currentReceiver = ()
                    -> first_story_gift.ink_outcome


    - currentReceiver has SecondCharacter:
        ~ secondCharacterInkLevel ++
        {translator(secondCharacterState)} inizia a ridere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        Poi sorride imbarazzato.
        Grazie, {name}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_emotional
            ~ secondGift += CardoAspinato
            ~ currentReceiver = ()
            -> second_story_gift.ink_outcome
        
    }
        -> main   
        
+ {findedGifts has EderaDelleAmanti} [Una foglia di Edera delle amanti.]
    ~ findedGifts -= EderaDelleAmanti
    {
        - recoveredCultivables hasnt EderaDelleAmanti:
        ~ recoverableCultivables += EderaDelleAmanti
    } 
    {
        - currentReceiver has FirstCharacter:
            {translator(firstCharacterState)} non comprende il significato del tuo dono.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ firstGift += EderaDelleAmanti
                ~ currentReceiver = ()
                    -> first_story_gift.ink_outcome
        
        
        - currentReceiver has SecondCharacter:
            {translator(secondCharacterState)} ti guarda imbarazzato.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ secondGift += EderaDelleAmanti
                ~ currentReceiver = ()
                    -> second_story_gift.ink_outcome
        
    }
        -> main   
        
+ {findedGifts has ErbaLiccia} [Un ricordo di Erba Liccia.]
        ~ findedGifts -= ErbaLiccia
        {
        - recoveredCultivables hasnt ErbaLiccia:
        ~ recoverableCultivables += ErbaLiccia
    } 
    {
        - currentReceiver has FirstCharacter:
            ~ firstCharacterInkLevel ++
            
            {translator(firstCharacterState)} si mette a canticchiare.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ firstGift += ErbaLiccia
                ~ currentReceiver = ()
                    -> first_story_gift.ink_outcome
        
        - currentReceiver has SecondCharacter:
            ~ secondCharacterInkLevel ++
        
            {translator(secondCharacterState)} intreccia le foglie per farne un cappello. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                    ~ secondGift += ErbaLiccia
                    ~ currentReceiver = ()
                        -> second_story_gift.ink_outcome
        
    }
    
 + {findedGifts has FalsaPalude} [Un petalo di Falsa Palude.]
    ~ findedGifts -= FalsaPalude
    {
        - recoveredCultivables hasnt FalsaPalude:
        ~ recoverableCultivables += FalsaPalude
    } 
    {
        - currentReceiver has FirstCharacter:
            {translator(firstCharacterState)} non sembra colpita.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ firstGift += FalsaPalude
                ~ currentReceiver = ()
                    -> first_story_gift.ink_outcome
        
        
        - currentReceiver has SecondCharacter:
            {translator(secondCharacterState)} continua a mordicchiarsi le unghie sporche.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ secondGift += FalsaPalude
                ~ currentReceiver = ()
                    -> second_story_gift.ink_outcome
        
    }
    
  + {findedGifts has LanaNotturna} [Il calore della Lana Notturna.]
        ~ findedGifts -= LanaNotturna
        {
        - recoveredCultivables hasnt LanaNotturna:
        ~ recoverableCultivables += LanaNotturna
    } 
    {
        - currentReceiver has FirstCharacter:
            ~ firstCharacterInkLevel ++
            ~ firstCharacterInkLevel ++
            {translator(firstCharacterState)} se lo stringe tra le mani, ringraziandoti.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ firstGift += LanaNotturna
                ~ currentReceiver = ()
                    -> first_story_gift.ink_outcome
        
        - currentReceiver has SecondCharacter:
        {translator(secondCharacterState)} prova a leccarlo, poi lo lascia cadere a terra. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ secondGift += LanaNotturna
                ~ currentReceiver = ()
                    -> second_story_gift.ink_outcome
        
    }       
    
    -> main 
    
+ {findedGifts has LicheneDegliAbissi} [Una traccia dell'odore del Lichene degli Abissi.]
    ~ findedGifts -= LicheneDegliAbissi
    {
        - recoveredCultivables hasnt LicheneDegliAbissi:
        ~ recoverableCultivables += LicheneDegliAbissi
    } 

    {
    - currentReceiver has FirstCharacter:
        {translator(firstCharacterState)} sembra sinceramente delusa.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            ~ firstGift += LicheneDegliAbissi
            ~ currentReceiver = ()
            -> first_story_gift.ink_outcome
    

    - currentReceiver has SecondCharacter:
        ~ secondCharacterInkLevel ++
        ~ secondCharacterInkLevel ++
        {translator(secondCharacterState)} è ferito.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Ti guarda, fa per dire qualcosa, e poi si zittisce.
        E ti abbraccia forte.
            ~ secondGift += LicheneDegliAbissi
            ~ currentReceiver = ()
            -> second_story_gift.ink_outcome
    
    }
        -> main

+ {findedGifts has NonTiScordarDiTe} [L'impronta del Non Ti Scordar di Te.]
    ~ findedGifts -= NonTiScordarDiTe
    {
        - recoveredCultivables hasnt NonTiScordarDiTe:
        ~ recoverableCultivables += NonTiScordarDiTe
    } 

    {
    - currentReceiver has FirstCharacter:
        ~ firstCharacterInkLevel ++
        ~ firstCharacterInkLevel ++
        {translator(firstCharacterState)} sussurra "nonno".#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        Le lacrime le rigano il viso.
            ~ firstGift += NonTiScordarDiTe
            ~ currentReceiver = ()
            -> first_story_gift.ink_outcome


    - currentReceiver has SecondCharacter:
        ~ secondCharacterInkLevel ++
        {translator(secondCharacterState)} ti abbraccia.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        E poi si allontana imbarazzato.
                ~ secondGift += NonTiScordarDiTe
                ~ currentReceiver = ()
                    -> second_story_gift.ink_outcome
        
    }
        -> main        

+ {findedGifts has Olobino} [Una cappello di Olobino.]
    ~ findedGifts -= Olobino
    {
        - recoveredCultivables hasnt Olobino:
        ~ recoverableCultivables += Olobino
    } 
    {
        - currentReceiver has FirstCharacter:
            ~ firstCharacterInkLevel ++
            {translator(firstCharacterState)} è estatica.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            Grazie {name}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_affectionate
            Credo mi prenderò un po' di tempo per me con questo dono.
                ~ firstGift += Olobino
                ~ currentReceiver = ()
                    -> first_story_gift.ink_outcome
        
        
        - currentReceiver has SecondCharacter:
            {translator(secondCharacterState)} lo annusa e lo lascia cadere a terra, annoiato.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ secondGift += Olobino
                ~ currentReceiver = ()
                    -> second_story_gift.ink_outcome
        
    }
    -> main
    
+ {findedGifts has LaSpazzata} [Un rametto della Spezzata.]
    ~ findedGifts -= LaSpazzata
    {
        - recoveredCultivables hasnt LaSpazzata:
        ~ recoverableCultivables += LaSpazzata
    } 
    
    {
        - currentReceiver has FirstCharacter:
            {translator(firstCharacterState)} è infastidita dalla tensione che viene dal frammento, lo lancia lontano.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ firstGift += LaSpazzata
                ~ currentReceiver = ()            
                    -> first_story_gift.ink_outcome
    
        - currentReceiver has SecondCharacter:
            ~ secondCharacterInkLevel ++
            Hai regalato a {translator(secondCharacterState)} qualcosa che lo esalta.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            Continua a rigirarsi il frammento tra le dita, pieno di gioia rabbiosa.
                ~ secondGift += LaSpazzata
                ~ currentReceiver = ()
                    -> second_story_gift.ink_outcome
    
    }
        -> main

//Doni insoliti
+ {findedGifts has universalIngredient} [L'ingrediente universale della Rana.]
    ~ findedGifts -= universalIngredient
    
    {
        - currentReceiver has FirstCharacter:
            {translator(firstCharacterState)} è infastidita dal sapore.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ firstGift += universalIngredient
                ~ currentReceiver = ()            
                    -> first_story_gift.ink_outcome
    
        - currentReceiver has SecondCharacter:
            ~ secondCharacterInkLevel ++
            ~ secondCharacterInkLevel ++
            Hai regalato a {translator(secondCharacterState)} qualcosa che lo esalta.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            Se la ride tantissimo.
                ~ secondGift += universalIngredient
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
