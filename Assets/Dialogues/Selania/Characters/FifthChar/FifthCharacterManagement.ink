                                                        /* ---------------------------------
                                                        
                                                                LISTE E VARIABILI
                                                        
                                                        ----------------------------------*/


//Gestione del ritmo della storia
    //Stato della storia 
        //Non avviata, avviata, conclusa
        VAR fifthChar_storyStatus = story_storyNotStarted
        //Ordine di conclusione della riscrittura (prima storia conclusa, seconda storia conclusa)
        VAR fifthChar_storyEndingPosition = ()
        //Quantità di storylets letti dalla giocatrice prima di accedere alla riscrittura
        VAR fifthChar_minStoryletsForRewriting = grimFifthCharNine
        //Abbiamo l'info speciale su Mentore? Se le condizioni sono corrette, viene messa su true dalla funzione inkLevel(Character)
        VAR fifthChar_specialEvent = false
        //Conteggio totale delle scelte prese con la PNG
        VAR fifthChar_totalChoices = 0

    //Ritmo della storia    
        //Variabili per mettere in pausa la conversazione
        VAR fifthChar_pauseTalking = 0
        VAR fifthChar_pauseDuration = 1
        //Questa variabile verifica se abbiamo appena parlato con unx PNG, in modo tale da presentarci in modo diverso le possibili proposte che possiamo farle.
        VAR fifthChar_justTalked = false
        //Variabile per il tempo di attesa tra una lettera e l'altra
        VAR fifthChar_mailPause = 0
        VAR fifthChar_mailPauseDuration = 5
    //Altre variabili ad hoc
        //Tracciamento delle parolacce dette da Boccale
        VAR fifthChar_slurDetector = 0    


//Stato della PNG
    //Gestione nomi
    LIST fifthChar_possibleStates = Mentore, Mostro, (FifthB), (FifthC), (FifthD), (FifthE), (FifthF)
    VAR fifthChar_ActualName = Mentore

    //Registro delle scelte prese
    VAR fifthChar_aether = 0.00
    VAR fifthChar_earth = 0.00
    VAR fifthChar_air = 0.00
    VAR fifthChar_water = 0.00
    VAR fifthChar_fire= 0.00
    
        //Storage del valore precedente
        VAR fifthChar_last_aether = 0.00
        VAR fifthChar_last_earth = 0.00
        VAR fifthChar_last_air = 0.00
        VAR fifthChar_last_water = 0.00
        VAR fifthChar_last_fire= 0.00

    //Utilizzo dei sigilli
    VAR fifthChar_usedSigil = 0
    VAR fifthChar_usedSigilsTracking = ()

    //Moltiplicatore per la riscrittura
    VAR fifthChar_glyphVariation = 2

//Tracciamento della relazione
    //Indicatore della relazione
    VAR fifthChar_relationshipIndicator = 0
    VAR fifthChar_lastRelationshipIndicator = 0
    //Status = chiamato da cucina e prima della riscrittura per valutare il rapporto creato e il relativo inchiostro. Ora è un insieme di valori "scritti"
    VAR fifthChar_relationshipStatus = neutral
    //Reaction: qui registriamo la reazione che verrà attivata coi sigilli
    VAR fifthChar_relationshipReaction = neutral

//Gestione dei doni
    //Tracciamento apprezzamento doni/ingredienti. Tutto ciò che è fuori da questa lista = reazione neutrale/disgustata.
    VAR fifthChar_favouritesGifts = (NonTiScordarDiTe, BaccaDellaAddolorata, CantoDelleCompagne)
    VAR fifthChar_goodGifts = (ErbaLiccia, Olobino, BastoneDellOzioso, LanaNotturna)
    //Dono consigliato dalla rana
    VAR frog_fifth_char_gift = ""
    VAR frog_fifth_temp_growing_gift = false
    //Dono effettuato
    VAR fifthChar_giftedObject = ()


//Tracciamento cucina
    //Autonoma
        VAR kitchen_fifthCharIsCooking = false
        VAR kitchen_fifthCharCookingTime = 0
        VAR kitchen_fifthCharHasCooked = false
        //Tempo che ci impiega a fare la sua ricetta
        VAR kitchen_fifthCharCookingMaxTime = 8
    //Nostro invito
        //l'abbiamo invitata
        VAR kitchen_fifthCharCookingTogetherInvite = false
        //Quante volte l'abbiamo invitata
        VAR kitchen_fifthCharCookingTogetherNumberInvite = 0
        //Da quanto ci sta aspettando
        VAR kitchen_fifthCharCookingTogetherWaiting = 0
        //Quanta pazienza ha ad aspettarci
        VAR kitchen_fifthCharCookingMAXTogetherWaiting = 8
        //Ricetta creata
        VAR kitchen_fifthCharRecipe = ""
        //Suggerimento rana
        VAR frog_fifth_char_ingredient = ""
        VAR frog_fifth_temp_growing_ingredient = false
            
    //Valore ingredienti
        VAR kitchen_fifthCharRecipeNoun = ""
        VAR kitchen_fifthCharRecipeAdjective = ""
        VAR kitchen_fifthCharRecipeComplement = ""
        VAR kitchen_fifthCharExtraIngredient = ()
        VAR kitchen_fifthCharExtraIngredientReaction = notReaction

//Tracciamento del racconto
    VAR frog_fifth_novel = ""
                     
                                                        /* ---------------------------------
                                                        
                                                            FUNZIONI PER AFFINITA' E NOME
                                                        
                                                        ----------------------------------*/

=== function fifthAffinityFeedback()
{debug: passo per fifthAffinityFeedback. Lo stato di inchiostro è {fifthChar_InkLevel}.}
//Utilizziamo questa funzione per far fare alla PNG un commento esplicito sullo stato della relazione.
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    Prima però ci terrei a dirti come sono andate le cose tra noi, qui.
            

        {
            -   are_two_entities_together(FourthCharacter, PG):
                {charTag(FourthCharacter, "neutral")}:               Mi levo dalle scatole.
                    ~ change_entity_place(FourthCharacter)
        }

        {
            - are_two_entities_together(Franco, PG):
                {charTag(Franco, neutral)}:                         Non fate caso a me, sto provando a raccogliere tutte le bolle in un unico posto, ma continuano a scappare.     
        }

        
        {
            - fifthChar_InkLevel == ink_empty:
                {charTag(FifthCharacter, "annoyed")}:               Come direbbe la mia vecchia insegnate di piano: apprezzo lo sforzo, manca il risultato.
                                                                    Ci sono stati momenti carini, ma ammetto che per lo più non mi sono sentita molto capita da te.
                                                                    Scusa.

            - fifthChar_InkLevel == ink_low:
                {charTag(FifthCharacter, "annoyed")}:               E, insomma.
                                                                    Non è che ci capiamo molto noi due, sai?
                                                                    È come se io suonassi Chopin e tu la lambada.
                                                                    E la lambada è carina, ma non è roba mia.
                                                                    Ha senso? 
                                                                
            - fifthChar_InkLevel == ink_normal:
                {charTag(FifthCharacter, "neutral")}:               Ci sono stati beni momenti tra noi, sai?
                                                                    Ma anche momenti no, in cui non mi sono sentita capita.
                                                                    Non è un reato.
                                                                    Ma, insomma, non riesco a fidarmi fino in fondo.
                                                                    Scusa.
            
            
            - fifthChar_InkLevel == ink_medium:
                {charTag(FifthCharacter, "affectionate")}:          E {player_name}: non pensavo avrei trovato una persona amica, qui.
                                                                    Mi hai reso l'assenza di Talco, di Ennio, di Valeria moooolto più sopportabile.
                                                                    Grazie.
            
            
            - fifthChar_InkLevel == ink_high:
                {charTag(FifthCharacter, "affectionate")}:          E mi chiedevo: ma che ci hanno separatə alla nascita?
                                                                    Perché mi sento tipo come se avessimo un unico neurone.
                                                                    Unitə in tutto.
                                                                    Ed è figa come cosa.
                                                                    Talco continua a mancarmi, ma con te mi sento come se fossimo parte da sempre della stessa band.
        }



=== fifth_char_closing_storylet ===
    //Questo evita che venga proposto un altro storylet fino a quando la pausa non è finita
    ~ fifthChar_pauseTalking = fifthChar_pauseDuration
    //Questo è per la gestione delle domande
    ~ fifthChar_justTalked = true

    //Aggiornamento storylets
    -> grimoire_storylets_updater ->

->->

=== fifth_char_closing_letters
    ~ fifthChar_mailPause = fifthChar_mailPauseDuration
    ~ letters_doggoPause = false
    
    ~ move_entity(DoggoFifthLetters, Safekeeping)
    ~ move_entity(DoggoNoLetters, TrainStop)
    
    //Aggiornamento storylets
    -> grimoire_storylets_updater ->

->->