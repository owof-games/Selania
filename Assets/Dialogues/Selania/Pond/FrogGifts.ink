=== frog_gift_dispatcher ===
{frogDebug: passo frog_gift_dispatcher.}
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
        
        + {firstGift == ()} [Vorrei sapere cosa donare a Chitarra.]
            {
                - (findedGifts hasnt CantoDelleCompagne) && (findedGifts hasnt LanaNotturna) && (findedGifts hasnt NonTiScordarDiTe) && (growthCantoDelleCompagne != stepThree or growthLanaNotturna != stepThree or  growthNonTiScordarDiTe != stepThree):
                    Ancora non possiedi niente di adatto.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Ma posso fare una cosa: la prossima volta che inizierai a coltivare qualcosa in serra, crescerà un dono adatto.
                    Fanne tesoro.
                        ~ nextCultivable = ()
                        ~ nextCultivable = CantoDelleCompagne
                        
                -  findedGifts has CantoDelleCompagne or findedGifts hasnt LanaNotturna or findedGifts hasnt NonTiScordarDiTe:
                    Già lo possiedi: ti do un indizio.
                    {findedGifts has CantoDelleCompagne: Pensa a quanto piacere a Chitarra lo stare con persone amiche, e chiediti cosa ricordi una festa.|{findedGifts has LanaNotturna: Pensa al bisogno di Chitarra di sapere che non tutto è perduto, che c'è ancora la possibilità di sbocciare. Quale pianta racconta questa cosa?|Chitarra ama suo nonno. Quale pianta può ricordarglielo?}}
            
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
                
            }
            
        + {!ending_cooking_with_first_char} [Vorrei sapere cosa mettere come quarto ingrediente in cucina.]
            {
                - (findedGifts hasnt CantoDelleCompagne) && (findedGifts hasnt LanaNotturna) && (findedGifts hasnt NonTiScordarDiTe) && (growthCantoDelleCompagne != stepThree or growthLanaNotturna != stepThree or  growthNonTiScordarDiTe != stepThree):
                    Ancora non possiedi niente di adatto.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Ma posso fare una cosa: la prossima volta che inizierai a coltivare qualcosa in serra, crescerà un ingrediente adatto.
                    Fanne tesoro.
                        ~ nextCultivable = ()
                        ~ nextCultivable = CantoDelleCompagne
                        
                -  findedGifts has CantoDelleCompagne or findedGifts hasnt LanaNotturna or findedGifts hasnt NonTiScordarDiTe:
                    Già lo possiedi: ti do un indizio.
                    {findedGifts has CantoDelleCompagne: Pensa a quanto piacere a Chitarra lo stare con persone amiche, e chiediti cosa ricordi una festa.|{findedGifts has LanaNotturna: Pensa al bisogno di Chitarra di sapere che non tutto è perduto, che c'è ancora la possibilità di sbocciare. Quale pianta racconta questa cosa?|Chitarra ama suo nonno. Quale pianta può ricordarglielo?}}
            
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
                
            }
            
        + {playerAccessiblePlaces has Nest} Parola magica adatta#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            A prescindere: ti viene suggerito un secondo o terzo colore (mai il primo). Cambia il testo in base a se non la hai già, se lo hai già e non lo hai usato, se lo hai già e lo hai usato altrove: te ne viene dato un altro (ma solo uno per gioco).
        
        + Conversazioni speciali es: storylet che avviene se due png sono vicine, o un racconto da leggere per poterne parlare con una PNG (Ti viene consigliato di continuare ad esplorare un certo tipo di tema.). Non sono mai info dirette.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        -   
        -> closed_exchange
    
    
    = char_two_gifts
    //Riccio
    {frogDebug: passo char_two_gifts.}
    
    
        + {secondGift == ()} [Vorrei sapere cosa donare a Riccio.]
             {
                - (findedGifts hasnt BastoneDellOzioso) && (findedGifts hasnt BrinaDellImpossibile) && (growthBastoneDellOzioso != stepThree or growthBrinaDellImpossibile != stepThree):
                    Ancora non possiedi niente di adatto.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Ma posso fare una cosa: la prossima volta che inizierai a coltivare qualcosa in serra, crescerà un dono adatto.
                    Fanne tesoro.
                        ~ nextCultivable = ()
                        ~ nextCultivable = BastoneDellOzioso
                        
                -  findedGifts has BastoneDellOzioso or findedGifts hasnt BrinaDellImpossibile:
                    Già lo possiedi: ti do un indizio.
                    {findedGifts has BastoneDellOzioso: Pensa a quanto piacere a Chitarra lo stare con persone amiche, e chiediti cosa ricordi una festa.|{findedGifts has BrinaDellImpossibile: Pensa al bisogno di Chitarra di sapere che non tutto è perduto, che c'è ancora la possibilità di sbocciare. Quale pianta racconta questa cosa?|Chitarra ama suo nonno. Quale pianta può ricordarglielo?}}
            
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
            
        + {!ending_cooking_with_second_char} [Vorrei sapere cosa mettere come quarto ingrediente in cucina.]
            {
                - (findedGifts hasnt BastoneDellOzioso) && (findedGifts hasnt BrinaDellImpossibile) && (growthBastoneDellOzioso != stepThree or growthBrinaDellImpossibile != stepThree):
                    Ancora non possiedi niente di adatto.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Ma posso fare una cosa: la prossima volta che inizierai a coltivare qualcosa in serra, crescerà un dono adatto.
                    Fanne tesoro.
                        ~ nextCultivable = ()
                        ~ nextCultivable = BastoneDellOzioso
                        
                -  findedGifts has BastoneDellOzioso or findedGifts hasnt BrinaDellImpossibile:
                    Già lo possiedi: ti do un indizio.
                    {findedGifts has BastoneDellOzioso: Pensa a quanto piacere a Chitarra lo stare con persone amiche, e chiediti cosa ricordi una festa.|{findedGifts has BrinaDellImpossibile: Pensa al bisogno di Chitarra di sapere che non tutto è perduto, che c'è ancora la possibilità di sbocciare. Quale pianta racconta questa cosa?|Chitarra ama suo nonno. Quale pianta può ricordarglielo?}}
            
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
            
        + {playerAccessiblePlaces has Nest} Parola magica adatta
            A prescindere: ti viene suggerito un secondo o terzo colore (mai il primo). Cambia il testo in base a se non la hai già, se lo hai già e non lo hai usato, se lo hai già e lo hai usato altrove: te ne viene dato un altro (ma solo uno per gioco).#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        
        + Conversazioni speciali es: storylet che avviene se due png sono vicine, o un racconto da leggere per poterne parlare con una PNG (Ti viene consigliato di continuare ad esplorare un certo tipo di tema.). Non sono mai info dirette.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            
        - 
        -> closed_exchange
    
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
     @animation:RewriterBook
-> main