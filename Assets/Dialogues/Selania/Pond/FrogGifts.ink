=== frog_gift_dispatcher ===
{frogDebug: passo frog_gift_dispatcher.}
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
//Qui è dove distribuiamo i doni a seconda della situazione
    {currentMissionAboutChar:
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
            ERROR: il valore di currentMissionAboutChar è {currentMissionAboutChar} e non so a quale parte di dono passare.
    }

//Doni generici
    = char_one_gifts
    //Chitarra
        {frogDebug: passo char_one_gifts.}
        
       Cosa vorresti ottenere?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
       
        + {firstGift == () && charOneGifts hasnt charOneCultivable} [Vorrei sapere cosa donare a Chitarra.]
        ~ charOneGifts += charOneCultivable
        
            {
                - (findedGifts hasnt CantoDelleCompagne) && (findedGifts hasnt LanaNotturna) && (findedGifts hasnt NonTiScordarDiTe) && (growthCantoDelleCompagne != stepThree or growthLanaNotturna != stepThree or  growthNonTiScordarDiTe != stepThree):
                    Ancora non possiedi niente di adatto.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Ma posso fare una cosa: la prossima volta che inizierai a coltivare qualcosa in serra, crescerà un dono adatto.
                    Fanne tesoro.
                    {
                        - nextCultivableOne == ():
                            ~ nextCultivableOne = CantoDelleCompagne
                        - nextCultivableTwo == () && nextCultivableOne != ():
                            ~ nextCultivableTwo = CantoDelleCompagne
                        - nextCultivableThree == () && nextCultivableTwo != ():
                            ~ nextCultivableThree = CantoDelleCompagne
                        - else:
                            ERROR: non ci sono slot nextCultivable liberi, o la formula ha riscontrato un errore.
                    }
                        -> closed_exchange
                        
                        
                -  findedGifts has CantoDelleCompagne or findedGifts hasnt LanaNotturna or findedGifts hasnt NonTiScordarDiTe:
                    Già lo possiedi: ti do un indizio.
                    {findedGifts has CantoDelleCompagne: Pensa a quanto piacere a Chitarra lo stare con persone amiche, e chiediti cosa ricordi una festa.|{findedGifts has LanaNotturna: Pensa al bisogno di Chitarra di sapere che non tutto è perduto, che c'è ancora la possibilità di sbocciare. Quale pianta racconta questa cosa?|Chitarra ama suo nonno. Quale pianta può ricordarglielo?}}
                        -> closed_exchange
                        
                - (findedGifts hasnt CantoDelleCompagne) && (findedGifts hasnt LanaNotturna) && (findedGifts hasnt NonTiScordarDiTe) && (growthCantoDelleCompagne == stepThree or growthLanaNotturna == stepThree or  growthNonTiScordarDiTe == stepThree):
                    Hai posseduto qualcosa di perfetto, ma l'hai utilizzato altrove.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Credo però di averne un poco nella mia scorta.
                    Ecco qui un po' di <>
                        {
                            - growthCantoDelleCompagne == stepThree:
                                Canto delle Compagne.
                                    ~ findedGifts += CantoDelleCompagne
                            - growthLanaNotturna == stepThree:
                                Lana Notturna.
                                    ~ findedGifts += LanaNotturna
                            - growthNonTiScordarDiTe == stepThree:
                                Non Ti Scordar di Te.
                                    ~ findedGifts += NonTiScordarDiTe 
                        }
                    
                    Sicuro, adorerà!
                    Te l'ho messo nell'inventario.
                    @animation: Inventory
                    -> closed_exchange
            }
            
        + {!ending_cooking_with_first_char && charOneGifts hasnt charOneCooking} [Vorrei sapere cosa mettere come quarto ingrediente in cucina.]
        ~ charOneGifts += charOneCooking
        
            {
                - (findedGifts hasnt CantoDelleCompagne) && (findedGifts hasnt LanaNotturna) && (findedGifts hasnt NonTiScordarDiTe) && (growthCantoDelleCompagne != stepThree or growthLanaNotturna != stepThree or  growthNonTiScordarDiTe != stepThree):
                    Ancora non possiedi niente di adatto.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Ma posso fare una cosa: la prossima volta che inizierai a coltivare qualcosa in serra, crescerà un ingrediente adatto.
                    Fanne tesoro.
                    {
                        - nextCultivableOne == ():
                            ~ nextCultivableOne = LanaNotturna
                        - nextCultivableTwo == () && nextCultivableOne != ():
                            ~ nextCultivableTwo = LanaNotturna
                        - nextCultivableThree == () && nextCultivableTwo != ():
                            ~ nextCultivableThree = LanaNotturna
                        - else:
                            ERROR: non ci sono slot nextCultivable liberi, o la formula ha riscontrato un errore.
                    }
                        -> closed_exchange
                        
                -  findedGifts has CantoDelleCompagne or findedGifts hasnt LanaNotturna or findedGifts hasnt NonTiScordarDiTe:
                    Già lo possiedi: ti do un indizio.
                    {findedGifts has CantoDelleCompagne: Pensa a quanto piacere a Chitarra lo stare con persone amiche, e chiediti cosa ricordi una festa.|{findedGifts has LanaNotturna: Pensa al bisogno di Chitarra di sapere che non tutto è perduto, che c'è ancora la possibilità di sbocciare. Quale pianta racconta questa cosa?|Chitarra ama suo nonno. Quale pianta può ricordarglielo?}}
                        -> closed_exchange
            
                - (findedGifts hasnt CantoDelleCompagne) && (findedGifts hasnt LanaNotturna) && (findedGifts hasnt NonTiScordarDiTe) && (growthCantoDelleCompagne == stepThree or growthLanaNotturna == stepThree or  growthNonTiScordarDiTe == stepThree):
                    Hai posseduto qualcosa di perfetto, ma l'hai utilizzato altrove.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Credo però di averne un poco nella mia scorta.
                    Ecco qui un po' di <>
                        {
                            - growthCantoDelleCompagne == stepThree:
                                Canto delle Compagne.
                                    ~ findedGifts += CantoDelleCompagne
                            - growthLanaNotturna == stepThree:
                                Lana Notturna.
                                    ~ findedGifts += LanaNotturna 
                            - growthNonTiScordarDiTe == stepThree:
                                Non Ti Scordar di Te.
                                    ~ findedGifts += NonTiScordarDiTe
                        }
                    
                    Sicuro, insaporirà alla perfezione il tuo piatto!
                    Te l'ho messo nell'inventario.
                    @animation: Inventory
                    -> closed_exchange
                
            }
            
        + {playerAccessiblePlaces has Nest && charOneGifts hasnt charOneEmotionalWord} [Quali colori usare al nido.]
            ~ charOneGifts += charOneEmotionalWord
                Chitarra è una persona con idee molto sicure su tante cose.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Ma una cosa è certa: odia i discorsi troppo blu.
                Hai già capito come far diminuire un colore?
                Perché in questo modo potresti già avere la soluzione.
                -> closed_exchange
        
        + {playerAccessiblePlaces has Library && charOneGifts hasnt charOneLibrary} [Quale racconto in biblioteca può essere d'aiuto?]
            ~ charOneGifts += charOneLibrary
                {
                    - readStories has Salvo:
                        Uh, vedo che hai già letto <b>Il cancello</b>.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                            {
                                - a_story_of_transformation:
                                    E che ne avete già parlato.
                                    Perché non scegli un altro dono?
                                    ~  currentMissionAboutChar = ()
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
            ~  currentMissionAboutChar = ()
            -> frog_about_who_questions
        + [Mi prendo del tempo e torno poi.]
            ~  currentMissionAboutChar = ()
            -> main
        
    
    
    = char_two_gifts
    //Riccio
    {frogDebug: passo char_two_gifts.}
    Cosa vorresti ottenere?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    
        + {secondGift == () && charTwoGifts hasnt charTwoCultivable} [Vorrei sapere cosa donare a Riccio.]
        ~ charTwoGifts += charTwoCultivable
        
             {
                - (findedGifts hasnt BastoneDellOzioso) && (findedGifts hasnt BrinaDellImpossibile) && (growthBastoneDellOzioso != stepThree or growthBrinaDellImpossibile != stepThree):
                    Ancora non possiedi niente di adatto.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Ma posso fare una cosa: la prossima volta che inizierai a coltivare qualcosa in serra, crescerà un dono adatto.
                    Fanne tesoro.
                        {
                        - nextCultivableOne == ():
                            ~ nextCultivableOne = BastoneDellOzioso
                        - nextCultivableTwo == () && nextCultivableOne != ():
                            ~ nextCultivableTwo = BastoneDellOzioso
                        - nextCultivableThree == () && nextCultivableTwo != ():
                            ~ nextCultivableThree = BastoneDellOzioso
                        - else:
                            ERROR: non ci sono slot nextCultivable liberi, o la formula ha riscontrato un errore.
                        }
                        -> closed_exchange
                        
                -  findedGifts has BastoneDellOzioso or findedGifts hasnt BrinaDellImpossibile:
                    Già lo possiedi: ti do un indizio.
                    {findedGifts has BastoneDellOzioso: Pensa a quanto piacere a Chitarra lo stare con persone amiche, e chiediti cosa ricordi una festa.|{findedGifts has BrinaDellImpossibile: Pensa al bisogno di Chitarra di sapere che non tutto è perduto, che c'è ancora la possibilità di sbocciare. Quale pianta racconta questa cosa?|Chitarra ama suo nonno. Quale pianta può ricordarglielo?}}
                        -> closed_exchange
                        
                - (findedGifts hasnt BastoneDellOzioso) && (findedGifts hasnt BrinaDellImpossibile) && (growthBastoneDellOzioso == stepThree or growthBrinaDellImpossibile == stepThree):
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
                    -> closed_exchange
            }
            
        + {!ending_cooking_with_second_char && charTwoGifts hasnt charTwoCooking} [Vorrei sapere cosa mettere come quarto ingrediente in cucina.]
            ~ charTwoGifts += charTwoCooking
            {
                - (findedGifts hasnt BastoneDellOzioso) && (findedGifts hasnt BrinaDellImpossibile) && (growthBastoneDellOzioso != stepThree or growthBrinaDellImpossibile != stepThree):
                    Ancora non possiedi niente di adatto.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Ma posso fare una cosa: la prossima volta che inizierai a coltivare qualcosa in serra, crescerà un dono adatto.
                    Fanne tesoro.
                        {
                        - nextCultivableOne == ():
                            ~ nextCultivableOne = BrinaDellImpossibile
                        - nextCultivableTwo == () && nextCultivableOne != ():
                            ~ nextCultivableTwo = BrinaDellImpossibile
                        - nextCultivableThree == () && nextCultivableTwo != ():
                            ~ nextCultivableThree = BrinaDellImpossibile
                        - else:
                            ERROR: non ci sono slot nextCultivable liberi, o la formula ha riscontrato un errore.
                        }
                        -> closed_exchange
                    
                -  findedGifts has BastoneDellOzioso or findedGifts hasnt BrinaDellImpossibile:
                    Già lo possiedi: ti do un indizio.
                    {findedGifts has BastoneDellOzioso: Pensa a quanto piacere a Chitarra lo stare con persone amiche, e chiediti cosa ricordi una festa.|{findedGifts has BrinaDellImpossibile: Pensa al bisogno di Chitarra di sapere che non tutto è perduto, che c'è ancora la possibilità di sbocciare. Quale pianta racconta questa cosa?|Chitarra ama suo nonno. Quale pianta può ricordarglielo?}}
                        -> closed_exchange
                        
                - (findedGifts hasnt BastoneDellOzioso) && (findedGifts hasnt BrinaDellImpossibile) && (growthBastoneDellOzioso == stepThree or growthBrinaDellImpossibile == stepThree):
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
                    
        + {playerAccessiblePlaces has Nest && charTwoGifts hasnt charTwoEmotionalWord} [Quali colori usare al nido.]
            ~ charTwoGifts += charTwoEmotionalWord
                Riccio è una bella testolina.
                E quello che posso dirti con certezza, è che apprezza la coerenza.
                Lo fa sentire al sicuro.
                Se hai capito come funziona l'alchimia del nido, sono sicuro che avrai già capito cosa fare.
                        -> closed_exchange
                
        + {playerAccessiblePlaces has Library && charTwoGifts hasnt charTwoLibrary} [Quale racconto in biblioteca può essere d'aiuto?] 
            ~ charTwoGifts += charTwoLibrary
        {
                    - readStories has Lamia:
                        Uh, vedo che hai già letto <b>Il sassolino</b>.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                            {
                                - a_story_of_transformation:
                                    E che ne avete già parlato.
                                    Perché non scegli un altro dono?
                                    ~  currentMissionAboutChar = ()
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
            ~  currentMissionAboutChar = ()
            -> frog_about_who_questions
        + [Mi prendo del tempo e torno poi.]
            ~  currentMissionAboutChar = ()
            -> main
    
    = mission_objects
    //Oggetti
    {frogDebug: passo mission_objects.}
    {frogDebug: searchedCultivableRecovery è uguale a {searchedCultivableRecovery}. Prima dell'intervento, findedGifts contiene {findedGifts}.}
        
        Come concordato, eccoti {ingredientTranslator(searchedCultivableRecovery)}
            ~ findedGifts += searchedCultivableRecovery
            ~ searchedCultivableRecovery = ()
        {frogDebug: Dopo l'intervento, searchedCultivableRecovery è uguale a {searchedCultivableRecovery} e findedGifts contiene {findedGifts}.}
                -> closed_exchange



=== closed_exchange
{frogDebug: passo closed_exchange.}
Salutino della rana
    //Svuoto il destinatario della missione attuale per sicurezza
    ~ currentMissionAboutChar = ()
    ~ activeMissions = ()
 
     @animation:RewriterBook
-> main