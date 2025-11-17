=== frog_about_who_questions
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
Quindi, come posso aiutarti {player_name}? #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral

- (top)
    
    + {firstChar_storyStatus == story_storyStarted} [Ho bisogno di una mano con {charNameOne}.]
        ~  frog_aboutGiftRequest = missionCharOne
  
        {
            - LIST_COUNT(charOneGifts) == 4:
                Temo tu sappia già tutto su di lei, perché non proviamo qualcos'altro?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                {debug: la quantità di doni di PNGUno è {LIST_COUNT(charOneGifts)},}
                        -> top
            - else:
                {
                    - (firstChar_giftedObject == () && charOneGifts hasnt charOneCultivable) or (!ending_cooking_with_first_char && charOneGifts hasnt charOneCooking) or (player_accessiblePlaces has Nest && charOneGifts hasnt charOneEmotionalWord) or (player_accessiblePlaces has Library && charOneGifts hasnt charOneLibrary):
                        Credo proprio di poterti aiutare. #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                        -> frog_gift_dispatcher
                    
                    - else:
                        Per ora non ho altro per aiutarti con {charNameOne}, ma prova più avanti e son sicuro che qualcosina di utile lo trovo! #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                            -> top
                }
                
        }
            
        
    
    + {secondChar_storyStatus == story_storyStarted} [Ho bisogno di una mano con {charNameTwo}.]
        ~  frog_aboutGiftRequest = missionCharTwo
        {
            - LIST_COUNT(charTwoGifts) == 4:
                Temo tu sappia già tutto su di lui, perché non proviamo qualcos'altro?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                {debug: la quantità di doni di PNGDue è {LIST_COUNT(charTwoGifts)},}
                        -> top
            - else:
                {
                    - (secondChar_giftedObject == () && charTwoGifts hasnt charTwoCultivable) or (!ending_cooking_with_second_char && charTwoGifts hasnt charTwoCooking) or (player_accessiblePlaces has Nest && charTwoGifts hasnt charTwoEmotionalWord) or (player_accessiblePlaces has Library && charTwoGifts hasnt charTwoLibrary):
                        Credo proprio di poterti aiutare. #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                        -> frog_gift_dispatcher
                    
                    - else:
                       Per ora non ho altro per aiutarti con {charNameTwo}, ma prova più avanti e son sicuro che qualcosina di utile lo trovo! #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                            -> top
                }
                
        }
        
    
    + {thirdChar_storyStatus == story_storyStarted} [PNG 3]
        ~  frog_aboutGiftRequest = missionCharThree
            -> frog_gift_dispatcher
        
    + {fourthChar_storyStatus == story_storyStarted} [PNG 4]
        ~  frog_aboutGiftRequest = missionCharFour
            -> frog_gift_dispatcher
        
    + {fifthChar_storyStatus == story_storyStarted} [PNG 5 (non come mentore)]
        ~  frog_aboutGiftRequest = missionCharFive
            -> frog_gift_dispatcher
        
    
    + {recoverableCultivables != ()}[Ho bisogno di recuperare una pianta che ho utilizzato.]
        //Nota: per ora sono quattro massimi gli utilizzi di un coltivabile, per cui non serve un menu ad hoc. Poi capire come fare.
            -> cultivable_recovery
    
    + [Ho cambiato idea.]
        -> main
    -

->->


=== frog_gift_dispatcher ===
{debug_frog: passo frog_gift_dispatcher.}
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
//Qui è dove distribuiamo i doni a seconda della situazione
    {frog_aboutGiftRequest:
        - missionCharOne:
            -> char_one_gifts
        - missionCharTwo:
            -> char_two_gifts
        //- missionCharThree:
        //- missionCharFour:
        //- missionCharFive:
        - missionObjects:
            -> mission_objects
        - else:
            ERROR: il valore di frog_aboutGiftRequest è {frog_aboutGiftRequest} e non so a quale parte di dono passare.
    }

//Doni generici
    = char_one_gifts
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    //Chitarra
        {debug_frog: passo char_one_gifts.}
        
       Come posso aiutarti con {charNameOne}?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
       
        + {firstChar_giftedObject == () && charOneGifts hasnt charOneCultivable} [Vorrei sapere cosa donare a Chitarra.]
            ~ charOneGifts += charOneCultivable
        
            {
                - (findedGifts hasnt CantoDelleCompagne) && (findedGifts hasnt LanaNotturna) && (findedGifts hasnt NonTiScordarDiTe) && (growthCantoDelleCompagne != stepThree or growthLanaNotturna != stepThree or  growthNonTiScordarDiTe != stepThree):
                    Ancora non possiedi niente di adatto.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Ma posso fare una cosa: la prossima volta che inizierai a coltivare qualcosa in serra, crescerà un dono adatto.
                    Fanne tesoro.
                    {
                        - greenhouse_frog_nextCultivableOne == ():
                            ~ greenhouse_frog_nextCultivableOne = CantoDelleCompagne
                        - greenhouse_frog_nextCultivableTwo == () && greenhouse_frog_nextCultivableOne != ():
                            ~ greenhouse_frog_nextCultivableTwo = CantoDelleCompagne
                        - greenhouse_frog_nextCultivableThree == () && greenhouse_frog_nextCultivableTwo != ():
                            ~ greenhouse_frog_nextCultivableThree = CantoDelleCompagne
                        - else:
                            ERROR: non ci sono slot nextCultivable liberi, o la formula ha riscontrato un errore.
                    }
                        -> closed_exchange
                        
                        
                -  findedGifts has CantoDelleCompagne or findedGifts hasnt LanaNotturna or findedGifts hasnt NonTiScordarDiTe:
                    Già lo possiedi: ti do un indizio.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    {findedGifts has CantoDelleCompagne: Pensa a quanto piacere a Chitarra lo stare con persone amiche, e chiediti cosa ricordi una festa.|{findedGifts has LanaNotturna: Pensa al bisogno di Chitarra di sapere che non tutto è perduto, che c'è ancora la possibilità di sbocciare. Quale pianta racconta questa cosa?|Chitarra ama suo nonno. Quale pianta può ricordarglielo?}}
                        -> closed_exchange
                        
                - (findedGifts hasnt CantoDelleCompagne) && (findedGifts hasnt LanaNotturna) && (findedGifts hasnt NonTiScordarDiTe) && (growthCantoDelleCompagne == stepThree or growthLanaNotturna == stepThree or  growthNonTiScordarDiTe == stepThree):
                    Hai posseduto qualcosa di perfetto, ma l'hai utilizzato altrove.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Credo però di averne un poco nella mia scorta.
                    Ecco qui un po' di <>
                        {
                            - growthCantoDelleCompagne == stepThree:Canto delle Compagne.
                                    ~ findedGifts += CantoDelleCompagne
                            - growthLanaNotturna == stepThree:Lana Notturna.
                                    ~ findedGifts += LanaNotturna
                            - growthNonTiScordarDiTe == stepThree:Non Ti Scordar di Te.
                                    ~ findedGifts += NonTiScordarDiTe 
                        }
                    
                    Sicuro, adorerà!
                    Te l'ho messo nell'inventario.
                    @animation: Inventory
                    -> closed_exchange
            }
            
        + {!ending_cooking_with_first_char && charOneGifts hasnt charOneCooking} [C'è qualcosa che posso usare cucinando con {charNameOne}?]
        ~ charOneGifts += charOneCooking
        
            {
                - (findedGifts hasnt CantoDelleCompagne) && (findedGifts hasnt LanaNotturna) && (findedGifts hasnt NonTiScordarDiTe) && (growthCantoDelleCompagne != stepThree or growthLanaNotturna != stepThree or  growthNonTiScordarDiTe != stepThree):
                    Ancora non possiedi niente di adatto.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Ma posso fare una cosa: la prossima volta che inizierai a coltivare qualcosa in serra, crescerà un ingrediente adatto.
                    Fanne tesoro.
                    {
                        - greenhouse_frog_nextCultivableOne == ():
                            ~ greenhouse_frog_nextCultivableOne = LanaNotturna
                        - greenhouse_frog_nextCultivableTwo == () && greenhouse_frog_nextCultivableOne != ():
                            ~ greenhouse_frog_nextCultivableTwo = LanaNotturna
                        - greenhouse_frog_nextCultivableThree == () && greenhouse_frog_nextCultivableTwo != ():
                            ~ greenhouse_frog_nextCultivableThree = LanaNotturna
                        - else:
                            ERROR: non ci sono slot nextCultivable liberi, o la formula ha riscontrato un errore.
                    }
                        -> closed_exchange
                        
                -  findedGifts has CantoDelleCompagne or findedGifts has LanaNotturna or findedGifts has NonTiScordarDiTe:
                    Già lo possiedi: ti do un indizio.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    {findedGifts has CantoDelleCompagne: Pensa a quanto piacere a {charNameOne} lo stare con persone amiche, e chiediti cosa ricordi una festa.|{findedGifts has LanaNotturna: Pensa al bisogno di {charNameOne} di sapere che non tutto è perduto, che c'è ancora la possibilità di sbocciare. Quale pianta racconta questa cosa?|{charNameOne} ama suo nonno. Quale pianta può ricordarglielo?}}
                        -> closed_exchange
            
                - (findedGifts hasnt CantoDelleCompagne) && (findedGifts hasnt LanaNotturna) && (findedGifts hasnt NonTiScordarDiTe) && (growthCantoDelleCompagne == stepThree or growthLanaNotturna == stepThree or  growthNonTiScordarDiTe == stepThree):
                    Hai posseduto qualcosa di perfetto, ma l'hai utilizzato altrove.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Credo però di averne un poco nella mia scorta.
                    Ecco qui un po' di <>
                        {
                            - growthCantoDelleCompagne == stepThree:Canto delle Compagne.
                                    ~ findedGifts += CantoDelleCompagne
                            - growthLanaNotturna == stepThree:Lana Notturna.
                                    ~ findedGifts += LanaNotturna 
                            - growthNonTiScordarDiTe == stepThree:Non Ti Scordar di Te.
                                    ~ findedGifts += NonTiScordarDiTe
                        }
                    
                    Sicuro, insaporirà alla perfezione il tuo piatto!
                    Te l'ho messo nell'inventario.
                    @animation: Inventory
                    -> closed_exchange
                
            }
            
        + {player_accessiblePlaces has Nest && charOneGifts hasnt charOneEmotionalWord} [Che tipo di parole colorate apprezza?]
                ~ charOneGifts += charOneEmotionalWord
                {charNameOne} è una persona con idee molto sicure su tante cose.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Ma una cosa è certa: odia i discorsi troppo blu.
                Hai già capito come far diminuire un colore?
                Perché in questo modo potresti già avere la soluzione.
                -> closed_exchange
        
        + {player_accessiblePlaces has Library && charOneGifts hasnt charOneLibrary} [C'è un racconto della biblioteca che ha nel cuore?]
            ~ charOneGifts += charOneLibrary
                {
                    - library_readStories has Salvo:
                        Uh, vedo che hai già letto <b>Il cancello</b>.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                            {
                                - a_story_of_transformation:
                                    E che ne avete già parlato.
                                    Perché non scegli un altro    dono?
                                    ~  frog_aboutGiftRequest = ()
                                    -> frog_about_who_questions
                                
                                
                                - else:
                                    Prova a parlare con lei e vedrai che avrà sicuramente qualcosa da dirti.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                                    -> closed_exchange
                            
                            }
        
                    - else:
                        Prova a leggere qualcosa che abbia a che fare con la trasformazione.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                        E troverai la risposta che ti serve.
                        -> closed_exchange

                }
        + [No, preferisco qualcosa di diverso.]
            ~  frog_aboutGiftRequest = ()
            -> frog_about_who_questions
        + [Mi prendo del tempo e torno poi.]
            ~  frog_aboutGiftRequest = ()
            -> main
        + -> 
        Ad ora non ho doni utili per {charNameOne}.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            ~  frog_aboutGiftRequest = ()
            -> frog_about_who_questions
    
    
    = char_two_gifts
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    //Riccio
    {debug_frog: passo char_two_gifts.}
    
    Come posso aiutarti con {charNameTwo}?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    
        + {secondChar_giftedObject == () && charTwoGifts hasnt charTwoCultivable} [Vorrei sapere cosa donare a {charNameTwo}.]
        ~ charTwoGifts += charTwoCultivable
        
             {
                - (findedGifts hasnt BastoneDellOzioso) && (findedGifts hasnt BrinaDellImpossibile) && (findedGifts hasnt LicheneDegliAbissi) && (growthBastoneDellOzioso != stepThree or growthBrinaDellImpossibile != stepThree or LicheneDegliAbissi != stepThree):
                    Ancora non possiedi niente di adatto.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Ma posso fare una cosa: la prossima volta che inizierai a coltivare qualcosa in serra, crescerà un dono adatto.
                    Fanne tesoro.
                        {
                        - greenhouse_frog_nextCultivableOne == ():
                            ~ greenhouse_frog_nextCultivableOne = BastoneDellOzioso
                        - greenhouse_frog_nextCultivableTwo == () && greenhouse_frog_nextCultivableOne != ():
                            ~ greenhouse_frog_nextCultivableTwo = BastoneDellOzioso
                        - greenhouse_frog_nextCultivableThree == () && greenhouse_frog_nextCultivableTwo != ():
                            ~ greenhouse_frog_nextCultivableThree = BastoneDellOzioso
                        - else:
                            ERROR: non ci sono slot nextCultivable liberi, o la formula ha riscontrato un errore.
                        }
                        -> closed_exchange
                        
                - findedGifts has BastoneDellOzioso or findedGifts has BrinaDellImpossibile or findedGifts has LicheneDegliAbissi:
                    Già lo possiedi: ti do un indizio.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    {findedGifts has BastoneDellOzioso: Pensa a quanto piacere a {charNameTwo} a viversi le cose per il piacere di farle. Quale pianta racconta questa storia?|{findedGifts has BrinaDellImpossibile: Pensa al bisogno di {charNameTwo} di comprendere che le ferite non ci bloccano nel passato. Quale pianta può aiutarlo?|La relazione tra i genitori di {charNameTwo} è pessima. Quale pianta può farglielo capire?}}
                        -> closed_exchange
                        
                - (findedGifts hasnt BastoneDellOzioso) && (findedGifts hasnt BrinaDellImpossibile) && (findedGifts hasnt LicheneDegliAbissi)  & (growthBastoneDellOzioso == stepThree or growthBrinaDellImpossibile == stepThree or growthLicheneDegliAbissi== stepThree):
                    Hai posseduto qualcosa di perfetto, ma l'hai utilizzato altrove.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Credo però di averne un poco nella mia scorta.
                    Ecco qui un po' di <>
                        {
                            - growthBastoneDellOzioso == stepThree:Bastone dell'Ozioso.
                                    ~ findedGifts += BastoneDellOzioso
                            - growthBrinaDellImpossibile == stepThree:Brina dell'Impossibile.
                                    ~ findedGifts += BrinaDellImpossibile
                        }
                    
                    Sicuro, adorerà!
                    Te l'ho messo nell'inventario.
                    @animation: Inventory
                    -> closed_exchange
            }
            
        + {!ending_cooking_with_second_char && charTwoGifts hasnt charTwoCooking} [C'è qualcosa che posso usare cucinando con {charNameTwo}?]
            ~ charTwoGifts += charTwoCooking
            {
                - (findedGifts hasnt BastoneDellOzioso) && (findedGifts hasnt BrinaDellImpossibile) && (findedGifts hasnt LicheneDegliAbissi) && (growthBastoneDellOzioso != stepThree or growthBrinaDellImpossibile != stepThree or LicheneDegliAbissi != stepThree):
                    Ancora non possiedi niente di adatto.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Ma posso fare una cosa: la prossima volta che inizierai a coltivare qualcosa in serra, crescerà un dono adatto.
                    Fanne tesoro.
                        {
                        - greenhouse_frog_nextCultivableOne == ():
                            ~ greenhouse_frog_nextCultivableOne = BrinaDellImpossibile
                        - greenhouse_frog_nextCultivableTwo == () && greenhouse_frog_nextCultivableOne != ():
                            ~ greenhouse_frog_nextCultivableTwo = BrinaDellImpossibile
                        - greenhouse_frog_nextCultivableThree == () && greenhouse_frog_nextCultivableTwo != ():
                            ~ greenhouse_frog_nextCultivableThree = BrinaDellImpossibile
                        - else:
                            ERROR: non ci sono slot nextCultivable liberi, o la formula ha riscontrato un errore.
                        }
                        -> closed_exchange
                    
                - findedGifts has BastoneDellOzioso or findedGifts has BrinaDellImpossibile or findedGifts has LicheneDegliAbissi:
                    Già lo possiedi: ti do un indizio.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    {findedGifts has BastoneDellOzioso: Pensa a quanto piacere a {charNameTwo} a viversi le cose per il piacere di farle. Quale pianta racconta questa storia?|{findedGifts has BrinaDellImpossibile: Pensa al bisogno di {charNameTwo} di comprendere che le ferite non ci bloccano nel passato. Quale pianta può aiutarlo?|La relazione tra i genitori di {charNameTwo} è pessima. Quale pianta può farglielo capire?}}
                        -> closed_exchange
                        
                -  (findedGifts hasnt BastoneDellOzioso) && (findedGifts hasnt BrinaDellImpossibile) && (findedGifts hasnt LicheneDegliAbissi)  & (growthBastoneDellOzioso == stepThree or growthBrinaDellImpossibile == stepThree or growthLicheneDegliAbissi== stepThree):
                    Hai posseduto qualcosa di perfetto, ma l'hai utilizzato altrove.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Credo però di averne un poco nella mia scorta.
                    Ecco qui un po' di <>
                        {
                            - growthBastoneDellOzioso == stepThree:
                                Bastone dell'Ozioso.
                                    ~ findedGifts += BastoneDellOzioso
                            - growthBrinaDellImpossibile == stepThree:
                                Brina dell'Impossibile.
                                    ~ findedGifts += BrinaDellImpossibile
                        }
                    
                    Sicuro, adorerà!
                    Te l'ho messo nell'inventario.
                    @animation: Inventory
                
            }
                    -> closed_exchange
                    
        + {player_accessiblePlaces has Nest && charTwoGifts hasnt charTwoEmotionalWord} [Che tipo di parole colorate apprezza?]
            ~ charTwoGifts += charTwoEmotionalWord
                {charNameTwo} è una bella testolina.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                E quello che posso dirti con certezza, è che apprezza la coerenza.
                Lo fa sentire al sicuro.
                Se hai capito come funziona l'alchimia del nido, sono sicuro che avrai già capito cosa fare.
                        -> closed_exchange
                
        + {player_accessiblePlaces has Library && charTwoGifts hasnt charTwoLibrary} [C'è un racconto della biblioteca che ha nel cuore?] 
            ~ charTwoGifts += charTwoLibrary
        {
                    - library_readStories has Lamia:
                        Uh, vedo che hai già letto <b>Il sassolino</b>.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                            {
                                - a_story_of_transformation:
                                    E che ne avete già parlato.
                                    Perché non scegli un altro dono?
                                    ~  frog_aboutGiftRequest = ()
                                    -> frog_about_who_questions
                                
                                
                                - else:
                                    Prova a parlare con lui e vedrai che avrà sicuramente qualcosa da dirti.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                                    -> closed_exchange
                            }
        
                    - else:
                        Prova a leggere qualcosa che abbia a che fare con la ribellione.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                        E troverai la risposta che ti serve.
                                -> closed_exchange
                }
            
        + [No, preferisco qualcosa di diverso.]
            ~  frog_aboutGiftRequest = ()
            -> frog_about_who_questions
        + [Mi prendo del tempo e torno poi.]
            ~  frog_aboutGiftRequest = ()
            -> main
        + -> 
        Ad ora non ho doni utili per {charNameTwo}.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            ~  frog_aboutGiftRequest = ()
            -> frog_about_who_questions
            
    = mission_objects
    //Oggetti
    {debug_frog: passo mission_objects.}
    {debug_frog: searchedCultivableRecovery è uguale a {searchedCultivableRecovery}. Prima dell'intervento, findedGifts contiene {findedGifts}.}
        
        Come concordato, eccoti {ingredientTranslator(searchedCultivableRecovery)}. #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        
            ~ findedGifts += searchedCultivableRecovery
            ~ recoverableCultivables -= searchedCultivableRecovery
            ~ searchedCultivableRecovery = ()
            
        {debug_frog: Dopo l'intervento, searchedCultivableRecovery è uguale a {searchedCultivableRecovery} e findedGifts contiene {findedGifts}.}
                -> closed_exchange



=== closed_exchange
{debug_frog: passo closed_exchange.}
E con questo è tutto! #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
A dopo {player_name}!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    -> special_mission_pause_check ->
    //Svuoto il destinatario della missione attuale per sicurezza
    ~ frog_aboutGiftRequest = ()
    ~ frog_currentMission = ()
    ~ witchNotification = false
 
     @animation:RewriterBook
-> main