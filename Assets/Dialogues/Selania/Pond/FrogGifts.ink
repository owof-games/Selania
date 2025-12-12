=== frog_about_who_questions
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

Quindi, cosa può fare Franco la rana per te, {player_name}? #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral

- (top)
    
    + {firstChar_storyStatus == story_storyStarted} [Ho bisogno di una mano con {charNameOne}.]
        ~  frog_aboutGiftRequest = missionCharOne
  
        {
            - LIST_COUNT(frog_firstCharObtainedGifts) >= 3:
                Girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Tu sai tutto su {charNameOne}!
                Prova a chiedermi qualcosa di diverso.
                Ma niente con la matematica!
                {debug: la quantità di doni di PNGUno è {LIST_COUNT(frog_firstCharObtainedGifts)},}
                        -> top

            - else:
                {
                    - firstChar_giftedObject == () && frog_firstCharObtainedGifts hasnt charOneCultivable:
                            Uh, mi piace {charNameOne}, è sempre così gentile con me!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                                -> frog_gift_dispatcher

                    - !ending_cooking_with_first_char && frog_firstCharObtainedGifts hasnt charOneCooking && player_accessiblePlaces has Kitchen:
                            Uh, mi piace {charNameOne}, è sempre così gentile con me!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                                -> frog_gift_dispatcher

                    // - player_accessiblePlaces has Nest && frog_firstCharObtainedGifts hasnt charOneEmotionalWord:
                    //         Uh, mi piace {charNameOne}, è sempre così gentile con me!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    //             -> frog_gift_dispatcher

                    - player_accessiblePlaces has Library && frog_firstCharObtainedGifts hasnt charOneLibrary:
                            Uh, mi piace {charNameOne}, è sempre così gentile con me!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                                -> frog_gift_dispatcher
                    
                    - else:
                        Ehm.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                        Provo un po' di imbarazzo, girino.
                        Per ora non ho niente da dirti su {charNameOne}.
                        Ma prova più avanti e sicuro che qualcosina di utile la trovo.
                        Un po' come quando ho fatto la marmellata con i lombrichi.
                        Immangiabile, ma le carpe l'hanno apprezzata!
                            -> top
                }
                
        }
            
        
    
    + {secondChar_storyStatus == story_storyStarted} [Ho bisogno di una mano con {charNameTwo}.]
        ~  frog_aboutGiftRequest = missionCharTwo
        {
            - LIST_COUNT(frog_secondCharObtainedGifts) >= 3:
                Girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                Tu sai tutto su {charNameTwo}!
                Prova a chiedermi qualcosa di diverso.
                Tipo: come fai ad essere così sveglio, Franco?
                Però non saprei risponderti.
                Perché in realtà sto dormendo anche adesso.
                {debug: la quantità di doni di PNGDue è {LIST_COUNT(frog_secondCharObtainedGifts)},}
                        -> top
            
            - else:
                {
                    - secondChar_giftedObject == () && frog_secondCharObtainedGifts hasnt charTwoCultivable:
                        Mi piace {charNameTwo}! Mi ha insegnato tantissime cose!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                            -> frog_gift_dispatcher

                    - !ending_cooking_with_second_char && frog_secondCharObtainedGifts hasnt charTwoCooking && player_accessiblePlaces has Kitchen:
                        Mi piace {charNameTwo}! Mi ha insegnato tantissime cose!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                            -> frog_gift_dispatcher

                    // - player_accessiblePlaces has Nest && frog_secondCharObtainedGifts hasnt charTwoEmotionalWord:
                    //     Mi piace {charNameTwo}! Mi ha insegnato tantissime cose!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    //         -> frog_gift_dispatcher

                    - player_accessiblePlaces has Library && frog_secondCharObtainedGifts hasnt charTwoLibrary:
                        Mi piace {charNameTwo}! Mi ha insegnato tantissime cose!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                            -> frog_gift_dispatcher
                    
                    - else:
                        Ehm.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                        Provo un po' di imbarazzo, girino.
                        Per ora non ho niente da dirti su {charNameTwo}.
                        Ma prova più avanti e sicuro ho nuove informazioni.
                        Come quando ho scoperto che le carpe non si indossano.
                        E le scarpe non nuotano.
                        E ho creato qualche disagio a una vecchia signora.
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
        
    
    + {frog_recoverableCultivables != ()}[Ho bisogno di recuperare una pianta che ho utilizzato.]
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
    ~ temp mentorName = translator(mentor_ActualName)
    
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
            -> END
    }

//Doni generici
    = char_one_gifts
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    //Chitarra
        {debug_frog: passo char_one_gifts.}
        
       Quindi: come posso aiutarti con {charNameOne}?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
       
        + {firstChar_giftedObject == () && frog_firstCharObtainedGifts hasnt charOneCultivable} [Vorrei sapere cosa donare a Chitarra.]
                ~ frog_firstCharObtainedGifts += charOneCultivable
                ~ temp FirstNameGift = greenhouse_chosenCultivable
        
            {   
                //Caso uno: sta già crescendo quello che ti serve
                - (growthCantoDelleCompagne != stepThree) && (growthCantoDelleCompagne != notStarted):
                    Sai {player_name}?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Quello che ti serve sta crescendo proprio ora in serra!
                    Franco ha i superpoteri!
                    Conferma le cose quando sono già accadute!
                            ~ frog_first_char_gift = "{ingredientTranslator(FirstNameGift)}"
                            -> closed_exchange
                    
                - (growthBaccaDellaAddolorata != stepThree) && (growthBaccaDellaAddolorata != notStarted):
                        Sai {player_name}?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                            Quello che ti serve sta crescendo proprio ora in serra!
                            Franco ha i superpoteri!
                            Conferma le cose quando sono già accadute!
                                    ~ frog_first_char_gift = "{ingredientTranslator(FirstNameGift)}"
                                    -> closed_exchange

                - (growthNonTiScordarDiTe != stepThree) && (growthNonTiScordarDiTe != notStarted):
                    Sai {player_name}?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Quello che ti serve sta crescendo proprio ora in serra!
                    Franco ha i superpoteri!
                    Conferma le cose quando sono già accadute!
                            ~ frog_first_char_gift = "{ingredientTranslator(FirstNameGift)}"
                            -> closed_exchange

                
                
                //Caso due: non hai mai posseduto l'oggetto utile, e Franco te lo inserisce nello zaino.
                - (backpack_findedGifts hasnt CantoDelleCompagne) && (backpack_findedGifts hasnt BaccaDellaAddolorata) && (backpack_findedGifts hasnt NonTiScordarDiTe) && (growthCantoDelleCompagne != stepThree or growthBaccaDellaAddolorata != stepThree or  growthNonTiScordarDiTe != stepThree):
                    Allora?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Scusa se ho spiato nello zaino ma no, non hai niente di utile.
                    Ma ora ci penso io.
                    "Care formiche."
                    "Come avrete visto, ora sono vegetariano."
                    "E in onore di questa nostra nuova amicizia vi chiederei un favore: potreste coltivare qualcosa di utile per {charNameOne}?"
                    "E darlo a {player_name}?"
                    "Grazie mille."
                    "PS.: Vi allego un po' del miele di Dora."
                    Ottimo.
                    La prossima volta che coltivi qualcosa in serra vedrai che sarà il dono giusto per {charNameOne}!
                    {
                        - greenhouse_frog_nextCultivableOne == ():
                            ~ greenhouse_frog_nextCultivableOne = CantoDelleCompagne
                            ~ frog_first_char_gift = "{ingredientTranslator(CantoDelleCompagne)}"
                                -> closed_exchange
                            
                        - greenhouse_frog_nextCultivableTwo == () && greenhouse_frog_nextCultivableOne != ():
                            ~ greenhouse_frog_nextCultivableTwo = CantoDelleCompagne
                            ~ frog_first_char_gift = "{ingredientTranslator(CantoDelleCompagne)}"
                                -> closed_exchange
                            
                        - greenhouse_frog_nextCultivableThree == () && greenhouse_frog_nextCultivableTwo != ():
                            ~ greenhouse_frog_nextCultivableThree = CantoDelleCompagne
                            ~ frog_first_char_gift = "{ingredientTranslator(CantoDelleCompagne)}"
                                -> closed_exchange
                        - else:
                            ERROR: non ci sono slot nextCultivable liberi, o la formula ha riscontrato un errore.
                            -> END
                    }
                        -> closed_exchange
                        
                //Caso tre: hai trovato l'oggetto, non l'hai consumato, e Franco ti dà un indizio        
                -  backpack_findedGifts has CantoDelleCompagne or backpack_findedGifts hasnt BaccaDellaAddolorata or backpack_findedGifts hasnt NonTiScordarDiTe:
                    Girino, ma tu sei sempre due balzi avanti!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    E l'hai già nello zainetto.
                    Scusa se ho spiato.
                    E ora il tuo amico Franco ti dà un indizio:
                    {
                        - backpack_findedGifts has CantoDelleCompagne: 
                        Pensa a quanto piacere a {charNameOne} lo stare con persone amiche, e chiediti cosa ricordi una festa.
                            ~ frog_first_char_gift = "qualcosa che parli del piacere dello stare con persone amiche"
                        
                        - backpack_findedGifts has BaccaDellaAddolorata: 
                        Pensa alla difficoltà di {charNameOne} di fare il primo passo, di accogliere il cambiamento. Quale pianta racconta questa cosa?
                            ~ frog_first_char_gift = "qualcosa che parli del fare il primo passo, di accogliere il cambiamento"
                        
                        - else:
                            {charNameOne} ama suo padre. Quale pianta può ricordarglielo?
                            ~ frog_first_char_gift = "qualcosa che parli di chi fa parte di noi, delle nostre radici"
                    }
                    
                    Chiaro, no?
                        -> closed_exchange

                //Caso quattro: l'hai trovato, l'hai utilizzato, e allora Franco te ne ridà una copia.        
                - (backpack_findedGifts hasnt CantoDelleCompagne) && (backpack_findedGifts hasnt BaccaDellaAddolorata) && (backpack_findedGifts hasnt NonTiScordarDiTe) && (growthCantoDelleCompagne == stepThree or growthBaccaDellaAddolorata == stepThree or  growthNonTiScordarDiTe == stepThree):
                    Aspè.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Aspè.
                    Ecco!
                    La vecchia tovaglia di mamma.
                    E tu dirai: che ci fai con la tovaglia?
                    Non me lo ricordo più.
                    Ma ricordo un'altra cosa: l'odore del dono perfetto per {charNameOne}.
                    E il tuo zaino ne è pieno.
                    Ma non c'è più.
                    E quindi ci penso io a ridartelo!
                    Ecco qui un po' di <>
                        {
                            - growthCantoDelleCompagne == stepThree:Canto delle Compagne.
                                    ~ backpack_findedGifts += CantoDelleCompagne
                                    ~ frog_first_char_gift = "{ingredientTranslator(CantoDelleCompagne)}"
                            - growthBaccaDellaAddolorata == stepThree:Bacca Della Addolorata.
                                    ~ backpack_findedGifts += BaccaDellaAddolorata
                                    ~ frog_first_char_gift = "{ingredientTranslator(BaccaDellaAddolorata)}"
                            - growthNonTiScordarDiTe == stepThree:Non Ti Scordar di Te.
                                    ~ backpack_findedGifts += NonTiScordarDiTe
                                    ~ frog_first_char_gift = "{ingredientTranslator(NonTiScordarDiTe)}"
                        }
                    Te l'ho messo nello zaino.
                    Sono così veloce che ti sono sembrato fermo, vero?
                    @animation: Backpack
                        -> closed_exchange
                
                - else:
                    Non ho niente da consigliarti girino, per ora
                    -> END     
            }
            
        + {!ending_cooking_with_first_char && frog_firstCharObtainedGifts hasnt charOneCooking} [C'è qualcosa che posso usare cucinando con {charNameOne}?]
            ~ frog_firstCharObtainedGifts += charOneCooking
            ~ temp firstNameIngredient = greenhouse_chosenCultivable 
        
            {
                - ((growthCantoDelleCompagne != stepThree) && (growthCantoDelleCompagne != notStarted)):
                    Sai {player_name}?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Quello che ti serve sta crescendo proprio ora in serra!
                    Franco ha i superpoteri!
                    Conferma le cose quando sono già accadute!
                            ~ frog_first_char_ingredient = "{ingredientTranslator(firstNameIngredient)}"
                            -> closed_exchange

                - ((growthBaccaDellaAddolorata != stepThree) && (growthBaccaDellaAddolorata != notStarted)):
                    Sai {player_name}?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Quello che ti serve sta crescendo proprio ora in serra!
                    Franco ha i superpoteri!
                    Conferma le cose quando sono già accadute!
                            ~ frog_first_char_ingredient = "{ingredientTranslator(firstNameIngredient)}"
                            -> closed_exchange

                - ((growthNonTiScordarDiTe != stepThree) && (growthNonTiScordarDiTe != notStarted)): 
                    Sai {player_name}?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Quello che ti serve sta crescendo proprio ora in serra!
                    Franco ha i superpoteri!
                    Conferma le cose quando sono già accadute!
                            ~ frog_first_char_ingredient = "{ingredientTranslator(firstNameIngredient)}"
                            -> closed_exchange

                - (backpack_findedGifts hasnt CantoDelleCompagne) && (backpack_findedGifts hasnt BaccaDellaAddolorata) && (backpack_findedGifts hasnt NonTiScordarDiTe) && (growthCantoDelleCompagne != stepThree or growthBaccaDellaAddolorata != stepThree or  growthNonTiScordarDiTe != stepThree):
                    Allora?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Scusa se ho spiato nello zaino ma no, non hai niente di utile.
                    Ma ora ci penso io.
                    "Care formiche."
                    "Come avrete visto, ora sono vegetariano."
                    "E in onore di questa nostra nuova amicizia vi chiederei un favore: potreste coltivare qualcosa di utile per {charNameOne}?"
                    "E darlo a {player_name}?"
                    "Grazie mille."
                    "PS.: Vi allego un po' del miele di Dora."
                    Ottimo.
                    La prossima volta che coltivi qualcosa in serra vedrai che sarà il dono giusto per {charNameOne}!
                    {
                        - greenhouse_frog_nextCultivableOne == ():
                            ~ greenhouse_frog_nextCultivableOne = BaccaDellaAddolorata
                            ~ frog_first_char_ingredient = "{ingredientTranslator(BaccaDellaAddolorata)}"
                            -> closed_exchange
                            
                        - greenhouse_frog_nextCultivableTwo == () && greenhouse_frog_nextCultivableOne != ():
                            ~ greenhouse_frog_nextCultivableTwo = BaccaDellaAddolorata
                            ~ frog_first_char_ingredient = "{ingredientTranslator(BaccaDellaAddolorata)}"
                            -> closed_exchange
                            
                        - greenhouse_frog_nextCultivableThree == () && greenhouse_frog_nextCultivableTwo != ():
                            ~ greenhouse_frog_nextCultivableThree = BaccaDellaAddolorata
                            ~ frog_first_char_ingredient = "{ingredientTranslator(BaccaDellaAddolorata)}"
                            -> closed_exchange
                        
                        - else:
                            ERROR: non ci sono slot nextCultivable liberi, o la formula ha riscontrato un errore.
                            -> END
                    }
                        
                -  backpack_findedGifts has CantoDelleCompagne or backpack_findedGifts has BaccaDellaAddolorata or backpack_findedGifts has NonTiScordarDiTe:
                    Girino, ma tu sei sempre due balzi avanti!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    E l'hai già nello zainetto.
                    Scusa se ho spiato.
                    E ora il tuo amico Franco ti dà un indizio:
                    {   
                        - backpack_findedGifts has BaccaDellaAddolorata: 
                            Pensa alla difficoltà di {charNameOne} di fare il primo passo, di accogliere il cambiamento. Quale pianta racconta questa cosa?
                             ~ frog_first_char_ingredient = "qualcosa che parli del fare il primo passo, di accogliere il cambiamento" 

                        - backpack_findedGifts has NonTiScordarDiTe: 
                            {charNameOne} ama suo padre. Quale pianta può ricordarglielo?
                             ~ frog_first_char_ingredient = "qualcosa che parli di chi fa parte di noi, delle nostre radici"

                        - else:
                            Pensa a quanto piacere a {charNameOne} lo stare con persone amiche, e chiediti cosa ricordi una festa.
                                ~ frog_first_char_ingredient = "qualcosa che parli del piacere dello stare con persone amiche"
                    }
                    Chiaro, no?
                        -> closed_exchange
            
                - (backpack_findedGifts hasnt CantoDelleCompagne) && (backpack_findedGifts hasnt BaccaDellaAddolorata) && (backpack_findedGifts hasnt NonTiScordarDiTe) && (growthCantoDelleCompagne == stepThree or growthBaccaDellaAddolorata == stepThree or  growthNonTiScordarDiTe == stepThree):
                    Aspè.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Aspè.
                    Ecco!
                    La vecchia tovaglia di mamma.
                    E tu dirai: che ci fai con la tovaglia?
                    Non me lo ricordo più.
                    Ma ricordo un'altra cosa: l'odore del dono perfetto per {charNameOne}.
                    E il tuo zaino ne è pieno.
                    Ma non c'è più.
                    E quindi ci penso io a ridartelo!
                    Ecco qui un po' di <>
                        {
                            - growthBaccaDellaAddolorata == stepThree:Bacca Della Addolorata.
                                    ~ backpack_findedGifts += BaccaDellaAddolorata
                                    ~ frog_first_char_gift = "{ingredientTranslator(BaccaDellaAddolorata)}"
                                    
                            - growthNonTiScordarDiTe == stepThree:Non Ti Scordar di Te.
                                    ~ backpack_findedGifts += NonTiScordarDiTe
                                    ~ frog_first_char_gift = "{ingredientTranslator(NonTiScordarDiTe)}"

                            - growthCantoDelleCompagne == stepThree:Canto delle Compagne.
                                    ~ backpack_findedGifts += CantoDelleCompagne
                                    ~ frog_first_char_gift = "{ingredientTranslator(CantoDelleCompagne)}"
                        }
                    Ce l'hai già nello zaino.
                    Sono così veloce che ti sono sembrato fermo, vero?
                    @animation: Backpack
                    -> closed_exchange
                
            }
            
        // + {player_accessiblePlaces has Nest && frog_firstCharObtainedGifts hasnt charOneEmotionalWord} [Che tipo di parole colorate apprezza?]
        //         ~ frog_firstCharObtainedGifts += charOneEmotionalWord
        //         {charNameOne} è una persona con idee molto sicure su tante cose.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        //         Ma una cosa è certa: odia i discorsi troppo blu.
        //         Hai già capito come far diminuire un colore?
        //         Perché in questo modo potresti già avere la soluzione.
        //         -> closed_exchange
        
        + {player_accessiblePlaces has Library && frog_firstCharObtainedGifts hasnt charOneLibrary} [C'è un racconto della biblioteca che ha nel cuore?]
            ~ frog_firstCharObtainedGifts += charOneLibrary
                {
                    - library_readStories has Aza:
                        Franco vede, vede vede...#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                        Uh, devo aprire gli occhi.
                        Ma mi dicevano i topi della biblioteca che prima hai letto <b>Luna vergine</b> di Aza.
                            {
                                - a_story_of_revenge :
                                    E che ne hai già parlato con {charNameOne}!
                                    Perché non scegli un altro dono?
                                        ~ frog_aboutGiftRequest = ()
                                        ~ frog_first_novel = "<b>Luna vergine</b> di Aza"
                                        -> frog_about_who_questions
                            
                                - else:
                                    Prova a parlare con {charNameOne} e vedrai che avrà sicuramente qualcosa da dirti.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                                    Anche perché so che ha già letto <b>Luna vergine</b> di Aza.
                                    Le persone parlano tanto delle cose che leggono.
                                    O vedono.
                                    O ascoltano.
                                    Per fortuna io parlo poco.
                                        ~ frog_first_novel = "<b>Luna vergine</b> di Aza"
                                        -> closed_exchange
                            
                            }
        
                    - else:
                        C'è una lettera dei topi della biblioteca.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                        "Parola chiave: trasformazione".
                        Ah, e dietro c'è scritto: "Lunga".
                        Forse vogliono diventare zucche?
                        Ma magari tu ci capisci qualcosa e allora trovi il racconto che ti serve!
                            ~ frog_first_novel = "una storia lunga che parli di trasformazione"
                            -> closed_exchange

                }
        + [No, preferisco qualcosa di diverso.]
            ~  frog_aboutGiftRequest = ()
            -> frog_about_who_questions
        
        + [Mi prendo del tempo e torno poi.]
            ~  frog_aboutGiftRequest = ()
            -> main
        + -> 
        Succede anche ai migliore. #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        Figurarsi a me.
        Ma non ho niente di utile da darti per {charNameOne}.
            ~  frog_aboutGiftRequest = ()
            -> frog_about_who_questions
    
    
    
    = char_two_gifts
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    //Riccio
    {debug_frog: passo char_two_gifts.}
    
    Come posso aiutarti con {charNameTwo}?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    
        + {secondChar_giftedObject == () && frog_secondCharObtainedGifts hasnt charTwoCultivable} [Vorrei sapere cosa donare a {charNameTwo}.]
            ~ frog_secondCharObtainedGifts += charTwoCultivable
            ~ temp SecondNameGift = greenhouse_chosenCultivable 
        
             {
                - (growthBrinaDellImpossibile != stepThree) && (growthBrinaDellImpossibile!= notStarted):
                    Girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Quello che ti serve sta crescendo proprio ora in serra!
                    Sento l'odore fino a qui.
                    O forse è solo zia Graaak che non si è ancora lavata.
                            ~ frog_second_char_gift = "{ingredientTranslator(SecondNameGift)}"
                            -> closed_exchange

                - (growthBastoneDellOzioso!= stepThree) && (growthBastoneDellOzioso != notStarted):
                    Girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Quello che ti serve sta crescendo proprio ora in serra!
                    Sento l'odore fino a qui.
                    O forse è solo zia Graaak che non si è ancora lavata.
                            ~ frog_second_char_gift = "{ingredientTranslator(SecondNameGift)}"
                            -> closed_exchange

                - (growthLicheneDegliAbissi!= stepThree) && (growthLicheneDegliAbissi != notStarted): 
                    Girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Quello che ti serve sta crescendo proprio ora in serra!
                    Sento l'odore fino a qui.
                    O forse è solo zia Graaak che non si è ancora lavata.
                            ~ frog_second_char_gift = "{ingredientTranslator(SecondNameGift)}"
                            -> closed_exchange

                - (backpack_findedGifts hasnt BastoneDellOzioso) && (backpack_findedGifts hasnt BrinaDellImpossibile) && (backpack_findedGifts hasnt LicheneDegliAbissi) && (growthBastoneDellOzioso != stepThree or growthBrinaDellImpossibile != stepThree or LicheneDegliAbissi != stepThree):
                    Di sicuro, niente che hai nello zainetto.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Però ho un amico che ha un amico che ha un cugino che può farmi un favore.
                    Tu vai in serra la prossima volta che devi far crescere qualcosa.
                    E fai quello che hai sempre fatto.
                    E poi vedrai che crescerà esattamente quello che serve a {charNameTwo}!
                        {
                        - greenhouse_frog_nextCultivableOne == ():
                            ~ greenhouse_frog_nextCultivableOne = BastoneDellOzioso
                            ~ frog_second_char_gift = "{ingredientTranslator(BastoneDellOzioso)}"
                                -> closed_exchange
                            
                        - greenhouse_frog_nextCultivableTwo == () && greenhouse_frog_nextCultivableOne != ():
                            ~ greenhouse_frog_nextCultivableTwo = BastoneDellOzioso
                            ~ frog_second_char_gift = "{ingredientTranslator(BastoneDellOzioso)}"
                                -> closed_exchange
                            
                        - greenhouse_frog_nextCultivableThree == () && greenhouse_frog_nextCultivableTwo != ():
                            ~ greenhouse_frog_nextCultivableThree = BastoneDellOzioso
                            ~ frog_second_char_gift = "{ingredientTranslator(BastoneDellOzioso)}"
                                -> closed_exchange
                            
                        - else:
                            ERROR: non ci sono slot nextCultivable liberi, o la formula ha riscontrato un errore.
                                -> END
                        }
                        
                - backpack_findedGifts has BastoneDellOzioso or backpack_findedGifts has BrinaDellImpossibile or backpack_findedGifts has LicheneDegliAbissi:
                    Già lo possiedi: ti do un indizio.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    {
                        -backpack_findedGifts has BastoneDellOzioso:
                            Pensa a quanto piacere a {charNameTwo} a viversi le cose per il piacere di farle. Quale pianta racconta questa storia?
                            ~ frog_second_char_gift = "qualcosa che parli del viversi le cose per il piacere di farle"
                        
                        -backpack_findedGifts has BrinaDellImpossibile: 
                            Pensa al bisogno di {charNameTwo} di comprendere che le ferite non ci bloccano nel passato. Quale pianta può aiutarlo?
                            ~ frog_second_char_gift = "qualcosa che aiuti a comprendere le ferite che bloccano nel passato"
                        
                        - else:
                            La relazione tra i genitori di {charNameTwo} è poco equilibrata. Quale pianta può farglielo capire?
                                ~ frog_second_char_gift = "qualcosa che aiuti a capire che la relazione tra i suoi genitori non è equilibrata"
                    }
                        -> closed_exchange
                        
                - (backpack_findedGifts hasnt BastoneDellOzioso) && (backpack_findedGifts hasnt BrinaDellImpossibile) && (backpack_findedGifts hasnt LicheneDegliAbissi)  & (growthBastoneDellOzioso == stepThree or growthBrinaDellImpossibile == stepThree or growthLicheneDegliAbissi== stepThree):
                    Sapevi che da piccolo volevo fare il camion?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Ma mamma Craazia diceva sempre che non avevo abbastanza sale in zucca.
                    E zio Gracco non mi voleva dare il suo sale.
                    Però so trasportare le cose.
                    E a volte trasporto cose che non so se serviranno.
                    Tullio dice che devo buttarle, ma mi ci affeziono girino!
                    Però.
                    So di avere quello che ti serve.
                    Perché tu l'avevi già la cosa perfetta per {charNameTwo}, solo che poi l'hai già usata.
                    Ma Franco il camion è qui per aiutarti!
                    Ecco qui un po' di <>
                        {
                            - growthBastoneDellOzioso == stepThree:Bastone dell'Ozioso.
                                    ~ backpack_findedGifts += BastoneDellOzioso
                                    ~ frog_second_char_gift = "{ingredientTranslator(BastoneDellOzioso)}"
                                    
                            - growthBrinaDellImpossibile == stepThree:Brina dell'Impossibile.
                                    ~ backpack_findedGifts += BrinaDellImpossibile
                                    ~ frog_second_char_gift = "{ingredientTranslator(BrinaDellImpossibile)}"
                                    
                            - growthLicheneDegliAbissi == stepThree:Lichene degli Abissi.
                                    ~ backpack_findedGifts += LicheneDegliAbissi       
                                    ~ frog_second_char_gift = "{ingredientTranslator(LicheneDegliAbissi)}"
                                    
                        }
                    No dai, rimaniamo con Franco la rana, sennò poi ti confondi.
                    Te l'ho messo nello zaino.
                    @animation: Backpack
                        -> closed_exchange
            }
            
        + {!ending_cooking_with_second_char && frog_secondCharObtainedGifts hasnt charTwoCooking} [C'è qualcosa che posso usare cucinando con {charNameTwo}?]
                ~ frog_secondCharObtainedGifts += charTwoCooking
                ~ temp SecondNameIngredient = greenhouse_chosenCultivable

            {   
                - (growthBrinaDellImpossibile != stepThree) && (growthBrinaDellImpossibile!= notStarted):
                    Girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Quello che ti serve sta crescendo proprio ora in serra!
                    Sento l'odore fino a qui.
                    O forse è solo zia Graaak che non si è ancora lavata.
                            ~ frog_second_char_ingredient = "{ingredientTranslator(SecondNameIngredient)}"
                        -> closed_exchange

                - (growthBastoneDellOzioso!= stepThree) && (growthBastoneDellOzioso != notStarted):
                    Girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Quello che ti serve sta crescendo proprio ora in serra!
                    Sento l'odore fino a qui.
                    O forse è solo zia Graaak che non si è ancora lavata.
                            ~ frog_second_char_ingredient = "{ingredientTranslator(SecondNameIngredient)}"
                        -> closed_exchange

                - (growthLicheneDegliAbissi!= stepThree) && (growthLicheneDegliAbissi != notStarted): 
                    Girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Quello che ti serve sta crescendo proprio ora in serra!
                    Sento l'odore fino a qui.
                    O forse è solo zia Graaak che non si è ancora lavata.
                            ~ frog_second_char_ingredient = "{ingredientTranslator(SecondNameIngredient)}"
                        -> closed_exchange

                - (backpack_findedGifts hasnt BastoneDellOzioso) && (backpack_findedGifts hasnt BrinaDellImpossibile) && (backpack_findedGifts hasnt LicheneDegliAbissi) && (growthBastoneDellOzioso != stepThree or growthBrinaDellImpossibile != stepThree or LicheneDegliAbissi != stepThree):
                    Di sicuro, niente che hai nello zainetto.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Però ho un amico che ha un amico che ha un cugino che può farmi un favore.
                    Tu vai in serra la prossima volta che devi far crescere qualcosa.
                    E fai quello che hai sempre fatto.
                    E poi vedrai che crescerà esattamente quello che serve a {charNameTwo}!
                        {
                        
                            - greenhouse_frog_nextCultivableOne == ():
                                ~ greenhouse_frog_nextCultivableOne = BrinaDellImpossibile
                                ~ frog_second_char_ingredient = "{ingredientTranslator(BrinaDellImpossibile)}"
                                    -> closed_exchange

                            - greenhouse_frog_nextCultivableTwo == () && greenhouse_frog_nextCultivableOne != ():
                                ~ greenhouse_frog_nextCultivableTwo = BrinaDellImpossibile
                                ~ frog_second_char_ingredient = "{ingredientTranslator(BrinaDellImpossibile)}"
                                    -> closed_exchange

                            - greenhouse_frog_nextCultivableThree == () && greenhouse_frog_nextCultivableTwo != ():
                                ~ greenhouse_frog_nextCultivableThree = BrinaDellImpossibile
                                ~ frog_second_char_ingredient = "{ingredientTranslator(BrinaDellImpossibile)}"
                                    -> closed_exchange

                            - else:
                                ERROR: non ci sono slot nextCultivable liberi, o la formula ha riscontrato un errore.
                               -> END    
                        }
                            -> closed_exchange
                    
                - backpack_findedGifts has BastoneDellOzioso or backpack_findedGifts has BrinaDellImpossibile or backpack_findedGifts has LicheneDegliAbissi:
                    Girino, ma tu sei sempre due balzi avanti!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    E l'hai già nello zainetto.
                    Scusa se ho spiato.
                    E ora il tuo amico Franco ti dà un indizio:
                        {
                            -backpack_findedGifts has BrinaDellImpossibile: 
                                Pensa al bisogno di {charNameTwo} di comprendere che le ferite non ci bloccano nel passato. Quale pianta può aiutarlo?
                                ~ frog_second_char_ingredient = "qualcosa che aiuti a comprendere le ferite che bloccano nel passato"
                            
                            -backpack_findedGifts has LicheneDegliAbissi:
                                La relazione tra i genitori di {charNameTwo} è poco equilibrata. Quale pianta può farglielo capire?
                                    ~ frog_second_char_ingredient = "qualcosa che aiuti a capire che la relazione tra i suoi genitori non è equilibrata"

                            - else:
                                Pensa a quanto piacere a {charNameTwo} a viversi le cose per il piacere di farle. Quale pianta racconta questa storia?
                                    ~ frog_second_char_ingredient = "qualcosa che parli del viversi le cose per il piacere di farle"
                        }
                    Chiaro, no?
                        -> closed_exchange
                        
                -  (backpack_findedGifts hasnt BastoneDellOzioso) && (backpack_findedGifts hasnt BrinaDellImpossibile) && (backpack_findedGifts hasnt LicheneDegliAbissi)  & (growthBastoneDellOzioso == stepThree or growthBrinaDellImpossibile == stepThree or growthLicheneDegliAbissi== stepThree):
                    Sapevi che da piccolo volevo fare il camion?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                    Ma mamma Craazia diceva sempre che non avevo abbastanza sale in zucca.
                    E zio Gracco non mi voleva dare il suo sale.
                    Però so trasportare le cose.
                    E a volte trasporto cose che non so se serviranno.
                    Tullio dice che devo buttarle, ma mi ci affeziono girino!
                    Però.
                    So di avere quello che ti serve.
                    Perché tu l'avevi già la cosa perfetta per {charNameTwo}, solo che poi l'hai già usata.
                    Ma Franco il camion è qui per aiutarti!
                    Ecco qui un po' di <>
                        {            
                            - growthBrinaDellImpossibile == stepThree:Brina dell'Impossibile.
                                    ~ backpack_findedGifts += BrinaDellImpossibile
                                    ~ frog_second_char_gift = "{ingredientTranslator(BrinaDellImpossibile)}"
                                    
                            - growthLicheneDegliAbissi == stepThree:Lichene degli Abissi.
                                    ~ backpack_findedGifts += LicheneDegliAbissi       
                                    ~ frog_second_char_gift = "{ingredientTranslator(LicheneDegliAbissi)}"

                            - growthBastoneDellOzioso == stepThree:Bastone dell'Ozioso.
                                    ~ backpack_findedGifts += BastoneDellOzioso
                                    ~ frog_second_char_gift = "{ingredientTranslator(BastoneDellOzioso)}"
                        }
                    No dai, rimaniamo con Franco la rana, sennò poi ti confondi.
                    Te l'ho messo nello zaino.
                    @animation: Backpack
                        -> closed_exchange
                
            }
                    
                    
        // + {player_accessiblePlaces has Nest && frog_secondCharObtainedGifts hasnt charTwoEmotionalWord} [Che tipo di parole colorate apprezza?]
        //     ~ frog_secondCharObtainedGifts += charTwoEmotionalWord
        //         {charNameTwo} è una bella testolina.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        //         E quello che posso dirti con certezza, è che apprezza la coerenza.
        //         Lo fa sentire al sicuro.
        //         Se hai capito come funziona l'alchimia del nido, sono sicuro che avrai già capito cosa fare.
        //                 -> closed_exchange
                
        + {player_accessiblePlaces has Library && frog_secondCharObtainedGifts hasnt charTwoLibrary} [C'è un racconto della biblioteca che ha nel cuore?] 
            ~ frog_secondCharObtainedGifts += charTwoLibrary
        {
                    - library_readStories has Lamia:
                        Prima Gliberia, una delle topoline della biblioteca, ha visto che stavi leggendo <b>Il sassolino</b>.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                            {
                                - a_story_of_rebellion:
                                    E che ne avete già parlato con {charNameTwo}.
                                    Perché non scegli un altro dono?
                                        ~ frog_aboutGiftRequest = ()
                                        ~ frog_second_novel = "<b>Il sassolino</b> di Lamia"
                                            -> frog_about_who_questions
                            
                                - else:
                                    Prova a parlare con lui e vedrai che avrà sicuramente qualcosa da dirti.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                                    Anche perché è certissimamerrimo che ha già letto <b>Il sassolino</b>!
                                    A {charNameTwo} piace parlare.
                                    Ora mi sta insegnando come non annegare!
                                        ~ frog_second_novel = "<b>Il sassolino</b> di Lamia"
                                        -> closed_exchange
                            }
        
                    - else:
                        Secondo il manuale della biblioteca, {charNameTwo} è uno da fenotipo "ribellione" combinato con "veloce".#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                        E tu dirai "Franco la rana, cos'è un fenotipo?"
                        E io ti dirò "Un tipo a cui piace tanto il fieno!"
                        E poi aggiungerò "Che è un po' diverso dal topognomastico, che è un topo che mastica gli gnomi."
                        E so che sono tante informazioni anche per una bella testolina come la tua, girino.
                        Per cui vai pure a cercare questa ribellione in biblioteca e vedrai che farai felice {charNameTwo}!
                            ~ frog_second_novel = "qualcosa di veloce che parli di ribellione"
                                -> closed_exchange
                }
            
        + [No, preferisco qualcosa di diverso.]
            ~  frog_aboutGiftRequest = ()
            -> frog_about_who_questions
        + [Mi prendo del tempo e torno poi.]
            ~  frog_aboutGiftRequest = ()
            -> main
        + -> 
        Ehm, che imbarazzo, girino.
        Per ora non ho niente di utile per {charNameTwo}.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                ~  frog_aboutGiftRequest = ()
                -> frog_about_who_questions
            
    = mission_objects
    //Oggetti
    {debug_frog: passo mission_objects.}
    {debug_frog: frog_cultivableRequested è uguale a {frog_cultivableRequested}. Prima dell'intervento, backpack_findedGifts contiene {backpack_findedGifts}.}
        
        Signori e signore e signor3, ecco quanto richiesto dal girino: {ingredientTranslator(frog_cultivableRequested)}! #speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        Direttamente nello zainetto di {player_name}!

            @animation: Backpack
            ~ backpack_findedGifts += frog_cultivableRequested
            ~ frog_recoverableCultivables -= frog_cultivableRequested
            ~ frog_cultivableRequested = ()
            
        {debug_frog: Dopo l'intervento, frog_cultivableRequested è uguale a {frog_cultivableRequested} e backpack_findedGifts contiene {backpack_findedGifts}.}
                -> closed_exchange



=== closed_exchange
{debug_frog: passo closed_exchange.}

    Facciamo un bel duo, noi due.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
    Io il cervello, tu la mano.
    Quella è una mano, vero?
    A dopo girino!

    -> special_mission_pause_check ->
    //Svuoto il destinatario della missione attuale per sicurezza
    ~ frog_aboutGiftRequest = ()
    ~ frog_currentMission = ()
    ~ frog_witch_notification = false
 
     @animation:RewriterBook
-> main