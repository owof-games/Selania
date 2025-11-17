//con questa logica traccio chi è l'effettivo ricettore del dono, così da presentare la linea di dialogo corretta

VAR gift_currentReceiver = ()


=== backpack_contents ===
+ {are_two_entities_together(Backpack, PG) && !debug_stochastic}[Backpack]
    ~ enableBigDialogue()
    {backpack_findedGifts != (): -> backpack ->|-> empty ->}
    ~ disableBigDialogue()
    -> main

    = backpack
        Hai con te {list_with_commas(backpack_findedGifts)}.
        ->->

    = empty
        Lo zainetto è vuoto.
        ->->


=== backpack_management ===
    ~ temp charNameFive = translator(fifthChar_ActualName)
    {debug: I doni trovati sono {list_with_commas(backpack_findedGifts)}.}
    Dono...
    
/* ---------------------------------

            Coltivabili

 ----------------------------------*/
+ {backpack_findedGifts has BaccaDellaAddolorata} [Una bacca della Addolorata.]
    ~ backpack_findedGifts -= BaccaDellaAddolorata
    {
        - frog_recoveredCultivables hasnt BaccaDellaAddolorata:
        ~ frog_recoverableCultivables += BaccaDellaAddolorata
    }    

    {
        - gift_currentReceiver has FirstCharacter:
            {translator(firstChar_ActualName)} ti sorride.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            Si rigira la bacca tra la mani, sembra più serena.
                ~ firstChar_InkLevel ++
                ~ firstChar_giftedObject += BaccaDellaAddolorata
                ~ gift_currentReceiver = ()
                    -> first_story_gift.ink_outcome
            
        
        - gift_currentReceiver has SecondCharacter:
            Hai donato a {translator(secondChar_ActualName)} qualcosa che non gli interessa.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
                ~ secondChar_giftedObject += BaccaDellaAddolorata
                ~ gift_currentReceiver = ()
                    -> second_story_gift.ink_outcome
    
    }
        -> main

+ {backpack_findedGifts has BarbaDellInciampo} [Una spina di Barba dell'Inciampo.]
    ~ backpack_findedGifts -= BarbaDellInciampo
    {
        - frog_recoveredCultivables hasnt BarbaDellInciampo:
        ~ frog_recoverableCultivables += BarbaDellInciampo
    } 
    {
        - gift_currentReceiver has FirstCharacter:
            {translator(firstChar_ActualName)} si punge, infastidita.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ firstChar_giftedObject += BarbaDellInciampo
                ~ gift_currentReceiver = ()
                    -> first_story_gift.ink_outcome
        
        
        - gift_currentReceiver has SecondCharacter:
            {translator(secondChar_ActualName)} si distrae rapidamente, ignorando il dono.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ secondChar_giftedObject += BarbaDellInciampo
                ~ gift_currentReceiver = ()
                    -> second_story_gift.ink_outcome
        
    }        
    -> main    
        
+ {backpack_findedGifts has BastoneDellOzioso} [Un nodo di Bastone dell'Ozioso.]
    ~ backpack_findedGifts -= BastoneDellOzioso
    {
        - frog_recoveredCultivables hasnt BastoneDellOzioso:
        ~ frog_recoverableCultivables += BastoneDellOzioso
    } 
    {
        - gift_currentReceiver has FirstCharacter:
            {translator(firstChar_ActualName)} inizia a girarselo tra le dita cantando divertita.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ firstChar_InkLevel ++
                ~ firstChar_giftedObject += BastoneDellOzioso
                ~ gift_currentReceiver = ()
                    -> first_story_gift.ink_outcome
        
        
        - gift_currentReceiver has SecondCharacter:
            {translator(secondChar_ActualName)} è entusiasta: inizia a lanciarlo a terra, inseguirlo, riprenderselo ridendo a crepapelle.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ secondChar_InkLevel ++
                ~ secondChar_InkLevel ++
                ~ secondChar_giftedObject += BastoneDellOzioso
                ~ gift_currentReceiver = ()
                    -> second_story_gift.ink_outcome
        
    }
        -> main        
    
+ {backpack_findedGifts has BrinaDellImpossibile} [Un frammento di Brina dell'Impossibile.]
    ~ backpack_findedGifts -= BrinaDellImpossibile
    {
        - frog_recoveredCultivables hasnt BrinaDellImpossibile:
        ~ frog_recoverableCultivables += BrinaDellImpossibile
    } 

    {
        - gift_currentReceiver has FirstCharacter:
            {translator(firstChar_ActualName)} getta a terra il tuo dono, spaventata.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            Le linee della tua mano ricompaiono, i pezzi si rinsaldano.
                ~ firstChar_giftedObject += BrinaDellImpossibile
                ~ gift_currentReceiver = ()
                    -> first_story_gift.ink_outcome
    
    
        - gift_currentReceiver has SecondCharacter:
            ~ secondChar_InkLevel ++
            ~ secondChar_InkLevel ++
            {translator(secondChar_ActualName)} inizia a tremare.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            Lacrime troppo antiche per un bambino scappano dagli angoli degli occhi.
            Le linee della tua mano ricompaiono, i pezzi si rinsaldano.
                ~ secondChar_giftedObject += BrinaDellImpossibile
                ~ gift_currentReceiver = ()
                    -> second_story_gift.ink_outcome

    }
        -> main

+ {backpack_findedGifts has CantoDelleCompagne} [Una goccia di Canto delle Compagne.]
    ~ backpack_findedGifts -= CantoDelleCompagne
    {
        - frog_recoveredCultivables hasnt CantoDelleCompagne:
        ~ frog_recoverableCultivables += CantoDelleCompagne
    } 

    {
    - gift_currentReceiver has FirstCharacter:
        ~ firstChar_InkLevel ++
        ~ firstChar_InkLevel ++
        {translator(firstChar_ActualName)} inizia a cantare il nome delle persone che ama.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ firstChar_giftedObject += CantoDelleCompagne
                ~ gift_currentReceiver = ()
                    -> first_story_gift.ink_outcome



    - gift_currentReceiver has SecondCharacter:
        {translator(secondChar_ActualName)} prova ad assaggiare la goccia.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        E finisce per vomitare.
                ~ secondChar_giftedObject += CantoDelleCompagne
                ~ gift_currentReceiver = ()
                    -> second_story_gift.ink_outcome

    }
        -> main

+ {backpack_findedGifts has CardoAspinato} [Un ciuffo di peli di Cardo Aspinato.]
    ~ backpack_findedGifts -= CardoAspinato
    {
        - frog_recoveredCultivables hasnt CardoAspinato:
        ~ frog_recoverableCultivables += CardoAspinato
    } 

    {
    - gift_currentReceiver has FirstCharacter:
        ~ firstChar_InkLevel ++
        {translator(firstChar_ActualName)} sembra prima disgustata, poi divertita.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        E poi comprensione compare sul suo volto.
                ~ firstChar_giftedObject += CardoAspinato
                ~ gift_currentReceiver = ()
                    -> first_story_gift.ink_outcome


    - gift_currentReceiver has SecondCharacter:
        ~ secondChar_InkLevel ++
        {translator(secondChar_ActualName)} inizia a ridere.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        Poi sorride imbarazzato.
        Grazie, {player_name}.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_emotional
            ~ secondChar_giftedObject += CardoAspinato
            ~ gift_currentReceiver = ()
            -> second_story_gift.ink_outcome
        
    }
        -> main   
        
+ {backpack_findedGifts has EderaDelleAmanti} [Una foglia di Edera delle amanti.]
    ~ backpack_findedGifts -= EderaDelleAmanti
    {
        - frog_recoveredCultivables hasnt EderaDelleAmanti:
        ~ frog_recoverableCultivables += EderaDelleAmanti
    } 
    {
        - gift_currentReceiver has FirstCharacter:
            {translator(firstChar_ActualName)} non comprende il significato del tuo dono.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ firstChar_giftedObject += EderaDelleAmanti
                ~ gift_currentReceiver = ()
                    -> first_story_gift.ink_outcome
        
        
        - gift_currentReceiver has SecondCharacter:
            {translator(secondChar_ActualName)} ti guarda imbarazzato.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ secondChar_giftedObject += EderaDelleAmanti
                ~ gift_currentReceiver = ()
                    -> second_story_gift.ink_outcome
        
    }
        -> main   
        
+ {backpack_findedGifts has ErbaLiccia} [Un ricordo di Erba Liccia.]
        ~ backpack_findedGifts -= ErbaLiccia
        {
        - frog_recoveredCultivables hasnt ErbaLiccia:
        ~ frog_recoverableCultivables += ErbaLiccia
    } 
    {
        - gift_currentReceiver has FirstCharacter:
            ~ firstChar_InkLevel ++
            
            {translator(firstChar_ActualName)} si mette a canticchiare.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ firstChar_giftedObject += ErbaLiccia
                ~ gift_currentReceiver = ()
                    -> first_story_gift.ink_outcome
        
        - gift_currentReceiver has SecondCharacter:
            ~ secondChar_InkLevel ++
        
            {translator(secondChar_ActualName)} intreccia le foglie per farne un cappello. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                    ~ secondChar_giftedObject += ErbaLiccia
                    ~ gift_currentReceiver = ()
                        -> second_story_gift.ink_outcome
        
    }
    
 + {backpack_findedGifts has FalsaPalude} [Un petalo di Falsa Palude.]
    ~ backpack_findedGifts -= FalsaPalude
    {
        - frog_recoveredCultivables hasnt FalsaPalude:
        ~ frog_recoverableCultivables += FalsaPalude
    } 
    {
        - gift_currentReceiver has FirstCharacter:
            {translator(firstChar_ActualName)} non sembra colpita.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ firstChar_giftedObject += FalsaPalude
                ~ gift_currentReceiver = ()
                    -> first_story_gift.ink_outcome
        
        
        - gift_currentReceiver has SecondCharacter:
            {translator(secondChar_ActualName)} continua a mordicchiarsi le unghie sporche.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ secondChar_giftedObject += FalsaPalude
                ~ gift_currentReceiver = ()
                    -> second_story_gift.ink_outcome
        
    }
    
  + {backpack_findedGifts has LanaNotturna} [Il calore della Lana Notturna.]
        ~ backpack_findedGifts -= LanaNotturna
        {
        - frog_recoveredCultivables hasnt LanaNotturna:
        ~ frog_recoverableCultivables += LanaNotturna
    } 
    {
        - gift_currentReceiver has FirstCharacter:
            ~ firstChar_InkLevel ++
            ~ firstChar_InkLevel ++
            {translator(firstChar_ActualName)} se lo stringe tra le mani, ringraziandoti.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ firstChar_giftedObject += LanaNotturna
                ~ gift_currentReceiver = ()
                    -> first_story_gift.ink_outcome
        
        - gift_currentReceiver has SecondCharacter:
        {translator(secondChar_ActualName)} prova a leccarlo, poi lo lascia cadere a terra. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ secondChar_giftedObject += LanaNotturna
                ~ gift_currentReceiver = ()
                    -> second_story_gift.ink_outcome
        
    }       
    
    -> main 
    
+ {backpack_findedGifts has LicheneDegliAbissi} [Una traccia dell'odore del Lichene degli Abissi.]
    ~ backpack_findedGifts -= LicheneDegliAbissi
    {
        - frog_recoveredCultivables hasnt LicheneDegliAbissi:
        ~ frog_recoverableCultivables += LicheneDegliAbissi
    } 

    {
    - gift_currentReceiver has FirstCharacter:
        {translator(firstChar_ActualName)} sembra sinceramente delusa.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            ~ firstChar_giftedObject += LicheneDegliAbissi
            ~ gift_currentReceiver = ()
            -> first_story_gift.ink_outcome
    

    - gift_currentReceiver has SecondCharacter:
        ~ secondChar_InkLevel ++
        ~ secondChar_InkLevel ++
        {translator(secondChar_ActualName)} è ferito.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        Ti guarda, fa per dire qualcosa, e poi si zittisce.
        E ti abbraccia forte.
            ~ secondChar_giftedObject += LicheneDegliAbissi
            ~ gift_currentReceiver = ()
            -> second_story_gift.ink_outcome
    
    }
        -> main

+ {backpack_findedGifts has NonTiScordarDiTe} [L'impronta del Non Ti Scordar di Te.]
    ~ backpack_findedGifts -= NonTiScordarDiTe
    {
        - frog_recoveredCultivables hasnt NonTiScordarDiTe:
        ~ frog_recoverableCultivables += NonTiScordarDiTe
    } 

    {
    - gift_currentReceiver has FirstCharacter:
        ~ firstChar_InkLevel ++
        ~ firstChar_InkLevel ++
        {translator(firstChar_ActualName)} sussurra "nonno".#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        Le lacrime le rigano il viso.
            ~ firstChar_giftedObject += NonTiScordarDiTe
            ~ gift_currentReceiver = ()
            -> first_story_gift.ink_outcome


    - gift_currentReceiver has SecondCharacter:
        ~ secondChar_InkLevel ++
        {translator(secondChar_ActualName)} ti abbraccia.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        E poi si allontana imbarazzato.
                ~ secondChar_giftedObject += NonTiScordarDiTe
                ~ gift_currentReceiver = ()
                    -> second_story_gift.ink_outcome
        
    }
        -> main        

+ {backpack_findedGifts has Olobino} [Una cappello di Olobino.]
    ~ backpack_findedGifts -= Olobino
    {
        - frog_recoveredCultivables hasnt Olobino:
        ~ frog_recoverableCultivables += Olobino
    } 
    {
        - gift_currentReceiver has FirstCharacter:
            ~ firstChar_InkLevel ++
            {translator(firstChar_ActualName)} è estatica.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            Grazie {player_name}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_affectionate
            Credo mi prenderò un po' di tempo per me con questo dono.
                ~ firstChar_giftedObject += Olobino
                ~ gift_currentReceiver = ()
                    -> first_story_gift.ink_outcome
        
        
        - gift_currentReceiver has SecondCharacter:
            {translator(secondChar_ActualName)} lo annusa e lo lascia cadere a terra, annoiato.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ secondChar_giftedObject += Olobino
                ~ gift_currentReceiver = ()
                    -> second_story_gift.ink_outcome
        
    }
    -> main
    
+ {backpack_findedGifts has LaSpazzata} [Un rametto della Spezzata.]
    ~ backpack_findedGifts -= LaSpazzata
    {
        - frog_recoveredCultivables hasnt LaSpazzata:
        ~ frog_recoverableCultivables += LaSpazzata
    } 
    
    {
        - gift_currentReceiver has FirstCharacter:
            {translator(firstChar_ActualName)} è infastidita dalla tensione che viene dal frammento, lo lancia lontano.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ firstChar_giftedObject += LaSpazzata
                ~ gift_currentReceiver = ()            
                    -> first_story_gift.ink_outcome
    
        - gift_currentReceiver has SecondCharacter:
            ~ secondChar_InkLevel ++
            Hai regalato a {translator(secondChar_ActualName)} qualcosa che lo esalta.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            Continua a rigirarsi il frammento tra le dita, pieno di gioia rabbiosa.
                ~ secondChar_giftedObject += LaSpazzata
                ~ gift_currentReceiver = ()
                    -> second_story_gift.ink_outcome
    
    }
        -> main

//Doni insoliti
+ {backpack_findedGifts has universalIngredient} [L'ingrediente universale della Rana.]
    ~ backpack_findedGifts -= universalIngredient
    
    {
        - gift_currentReceiver has FirstCharacter:
            {translator(firstChar_ActualName)} è infastidita dal sapore.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ firstChar_giftedObject += universalIngredient
                ~ gift_currentReceiver = ()            
                    -> first_story_gift.ink_outcome
    
        - gift_currentReceiver has SecondCharacter:
            ~ secondChar_InkLevel ++
            ~ secondChar_InkLevel ++
            Hai regalato a {translator(secondChar_ActualName)} qualcosa che lo esalta.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            Se la ride tantissimo.
                ~ secondChar_giftedObject += universalIngredient
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
