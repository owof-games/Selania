                                                        /* ---------------------------------
                                                        
                                                                LISTE E VARIABILI
                                                        
                                                        ----------------------------------*/


//Gestione del ritmo della storia
    //Stato della storia 
        //Non avviata, avviata, conclusa
        VAR firstChar_storyStatus = story_storyNotStarted
        //Ordine di conclusione della riscrittura (prima storia conclusa, seconda storia conclusa)
        VAR firstChar_storyEndingPosition = ()
        //Quantità di storylets letti dalla giocatrice prima di accedere alla riscrittura
        VAR firstChar_minStoryletsForRewriting = grimFirstCharNine
        //Abbiamo l'info speciale su Mentore? Se le condizioni sono corrette, viene messa su true dalla funzione inkLevel(Character)
        VAR firstChar_specialEvent = false
        //Cconteggio totale delle scelte prese con la PNG
        VAR firstChar_totalChoices = 0

    //Ritmo della storia    
        //Variabili per mettere in pausa la conversazione
        VAR firstChar_pauseTalking = 0
        VAR firstChar_pauseDuration = 1
        //Questa variabile verifica se abbiamo appena parlato con unx PNG, in modo tale da presentarci in modo diverso le possibili proposte che possiamo farle.
        VAR firstChar_justTalked = false
        //Variabile per il tempo di attesa tra una lettera e l'altra
        VAR firstChar_mailPause = 0
        VAR firstChar_mailPauseDuration = 5


//Stato della PNG
    //Gestione nomi
    LIST firstChar_possibleStates = Chitarra, (Triangolo), (Orchestra), (FlautoDolce), (Ocarina), (Violino)
    VAR firstChar_ActualName = Chitarra

    //Registro delle scelte prese
    VAR firstChar_aether = 0
    VAR firstChar_earth = 0
    VAR firstChar_air = 0
    VAR firstChar_water = 0
    VAR firstChar_fire= 0
    
        //Storage del valore precedente
        VAR firstChar_last_aether = 0
        VAR firstChar_last_earth = 0
        VAR firstChar_last_air = 0
        VAR firstChar_last_water = 0
        VAR firstChar_last_fire= 0

    //Utilizzo dei sigilli
    VAR firstChar_usedSigil = 0
    VAR firstChar_usedSigilsTracking = ()

    //Moltiplicatore per la riscrittura
    VAR firstChar_glyphVariation = 2

//Tracciamento della relazione
    //Indicatore della relazione
    VAR firstChar_relationshipIndicator = 0
    VAR firstChar_lastRelationshipIndicator = 0
    //Status = chiamato da cucina e prima della riscrittura per valutare il rapporto creato e il relativo inchiostro. Ora è un insieme di valori "scritti"
    VAR firstChar_relationshipStatus = neutral
    //Reaction: qui registriamo la reazione che verrà attivata coi sigilli
    VAR firstChar_relationshipReaction = neutral

//Gestione dei doni
    //Tracciamento apprezzamento doni/ingredienti. Tutto ciò che è fuori da questa lista = reazione neutrale/disgustata.
    VAR firstChar_favouritesGifts = (NonTiScordarDiTe, BaccaDellaAddolorata, CantoDelleCompagne)
    VAR firstChar_goodGifts = (ErbaLiccia, Olobino, BastoneDellOzioso, LanaNotturna)
    //Dono consigliato dalla rana
    VAR frog_first_char_gift = ""
    VAR frog_first_temp_growing_gift = false
    //Dono effettuato
    VAR firstChar_giftedObject = ()


//Tracciamento cucina
    //Autonoma
        VAR kitchen_firstCharIsCooking = false
        VAR kitchen_firstCharCookingTime = 0
        VAR kitchen_firstCharHasCooked = false
        //Tempo che ci impiega a fare la sua ricetta
        VAR kitchen_firstCharCookingMaxTime = 8
    //Nostro invito
        //l'abbiamo invitata
        VAR kitchen_firstCharCookingTogetherInvite = false
        //Quante volte l'abbiamo invitata
        VAR kitchen_firstCharCookingTogetherNumberInvite = 0
        //Da quanto ci sta aspettando
        VAR kitchen_firstCharCookingTogetherWaiting = 0
        //Quanta pazienza ha ad aspettarci
        VAR kitchen_firstCharCookingMAXTogetherWaiting = 8
        //Ricetta creata
        VAR kitchen_firstCharRecipe = ""
        //Suggerimento rana
        VAR frog_first_char_ingredient = ""
        VAR frog_first_temp_growing_ingredient = false
            
    //Valore ingredienti
        VAR kitchen_firstCharRecipeNoun = ""
        VAR kitchen_firstCharRecipeAdjective = ""
        VAR kitchen_firstCharRecipeComplement = ""
        VAR kitchen_firstCharExtraIngredient = ()
        VAR kitchen_firstCharExtraIngredientReaction = notReaction

//Tracciamento del racconto
    VAR frog_first_novel = ""


                                                        /* ---------------------------------
                                                        
                                                            FUNZIONI PER AFFINITA' E NOME
                                                        
                                                        ----------------------------------*/
=== firstAffinityCalc ===
{debug: passo per firstAffinityCalc.}
//Questo mi serve per aggiornare il valore di affinità.
//Viene chiamato a ridosso della riscrittura per definire lo stato di inchiostro

    //Prima di tutto chiamo la funzione per il calcolo dello stato della relazione
        ~ affinity_calc(FirstCharacter)

    //"Trasformo" la relazione in inchiostro
        ~ fromRelationshipToInk(FirstCharacter)
    
    //Mando ai feedback
        -> firstAffinityFeedback ->
    
    //Arriva il commento della strega
        ~ inkLevel(FirstCharacter)
    
    //Salvo il massimo di inchiostro raggiunto con la personaggia
        ~ maxInkLevelUpdater(FirstCharacter)

    //Esco dal flusso 
    ->-> 

  

=== firstAffinityFeedback
{debug: passo per firstAffinityFeedback. Lo stato di inchiostro è {firstChar_InkLevel}.}
//Utilizziamo questa funzione per far fare alla PNG un commento esplicito sullo stato della relazione.
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    Prima però ci terrei a dirti come sono andate le cose tra noi, qui.
            
        {
            -   are_two_entities_together(Mentor, PG):
                {charTag(FifthCharacter, "neutral")}:               Vi lascio un po' di privacy. In bocca al lupo {player_name} e {charNameOne}.
                    ~ change_entity_place(Mentor)
        }
        {
            -   are_two_entities_together(ThirdCharacter, PG):
                {charTag(ThirdCharacter, "neutral")}:               Mi levo dalle scatole.
                    ~ change_entity_place(ThirdCharacter)
        }
        {
            -   are_two_entities_together(SecondCharacter, PG):
                {charTag(FirstCharacter, "affectionate")}:          {charNameTwo}, potresti lasciarci un po' da sol3?
                {charTag(SecondCharacter, "emotional")}:            Certissimamente! A dopo!
                    ~ change_entity_place(SecondCharacter)
        }
        {
            - are_two_entities_together(Franco, PG):
                {charTag(Franco, "{portrait_Franco()}")}:           Non fate caso a me, sto provando a raccogliere tutte le bolle in un unico posto, ma continuano a scappare.     
        }

        
        {
            - firstChar_InkLevel == ink_empty:
                {charTag(FirstCharacter, "annoyed")}:               Come direbbe la mia vecchia insegnate di piano: apprezzo lo sforzo, manca il risultato.
                                                                    Ci sono stati momenti carini, ma ammetto che per lo più non mi sono sentita molto capita da te.
                                                                    Scusa.

            - firstChar_InkLevel == ink_low:
                {charTag(FirstCharacter, "annoyed")}:               E, insomma.
                                                                    Non è che ci capiamo molto noi due, sai?
                                                                    È come se io suonassi Chopin e tu la lambada.
                                                                    E la lambada è carina, ma non è roba mia.
                                                                    Ha senso? 
                                                                
            - firstChar_InkLevel == ink_normal:
                {charTag(FirstCharacter, "neutral")}:               Ci sono stati beni momenti tra noi, sai?
                                                                    Ma anche momenti no, in cui non mi sono sentita capita.
                                                                    Non è un reato.
                                                                    Ma, insomma, non riesco a fidarmi fino in fondo.
                                                                    Scusa.
            
            
            - firstChar_InkLevel == ink_medium:
                {charTag(FirstCharacter, "affectionate")}:          E {player_name}: non pensavo avrei trovato una persona amica, qui.
                                                                    Mi hai reso l'assenza di Talco, di Ennio, di Valeria moooolto più sopportabile.
                                                                    Grazie.
            
            
            - firstChar_InkLevel == ink_high:
                {charTag(FirstCharacter, "affectionate")}:          E mi chiedevo: ma che ci hanno separat3 alla nascita?
                                                                    Perché mi sento tipo come se avessimo un unico neurone.
                                                                    Unit3 in tutto.
                                                                    Ed è figa come cosa.
                                                                    Talco continua a mancarmi, ma con te mi sento come se fossimo parte da sempre della stessa band.
        }

->->

        
//Formula per la chiusura di uno storylet
=== first_char_closing_storylet
    //Questo evita che venga proposto un altro storylet fino a quando la pausa non è finita
    ~ firstChar_pauseTalking = firstChar_pauseDuration
    //Questo è per la gestione delle domande
    ~ firstChar_justTalked = true

    //Aggiornamento storylets
    -> grimoire_storylets_updater ->


->->

=== first_char_closing_letters
    ~ firstChar_mailPause = firstChar_mailPauseDuration
    ~ letters_doggoPause = false

    ~ move_entity(DoggoFirstLetters, Safekeeping)
    ~ move_entity(DoggoNoLetters, TrainStop)
    
    //Aggiornamento storylets
    -> grimoire_storylets_updater ->


->->