                                                        /* ---------------------------------
                                                        
                                                                LISTE E VARIABILI
                                                        
                                                        ----------------------------------*/


//Gestione del ritmo della storia
    //Stato della storia 
        //Non avviata, avviata, conclusa
        VAR fourthChar_storyStatus = story_storyNotStarted
        //Ordine di conclusione della riscrittura (prima storia conclusa, seconda storia conclusa)
        VAR fourthChar_storyEndingPosition = ()
        //Quantità di storylets letti dalla giocatrice prima di accedere alla riscrittura
        VAR fourthChar_minStoryletsForRewriting = grimFourthCharNine
        //Abbiamo l'info speciale su Mentore? Se le condizioni sono corrette, viene messa su true dalla funzione inkLevel(Character)
        VAR fourthChar_specialEvent = false
        //Cconteggio totale delle scelte prese con la PNG
        VAR fourthChar_totalChoices = 0

    //Ritmo della storia    
        //Variabili per mettere in pausa la conversazione
        VAR fourthChar_pauseTalking = 0
        VAR fourthChar_pauseDuration = 1
        //Questa variabile verifica se abbiamo appena parlato con unx PNG, in modo tale da presentarci in modo diverso le possibili proposte che possiamo farle.
        VAR fourthChar_justTalked = false
        //Variabile per il tempo di attesa tra una lettera e l'altra
        VAR fourthChar_mailPause = 0
        VAR fourthChar_mailPauseDuration = 5


//Stato della PNG
    //Gestione nomi
    LIST fourthChar_possibleStates = NonnaMolotov, (FourthB), (FourthC), (FourthD), (FourthE), (FourthF)
    VAR fourthChar_ActualName = NonnaMolotov

    //Registro delle scelte prese
    VAR fourthChar_aether = 0.00
    VAR fourthChar_earth = 0.00
    VAR fourthChar_air = 0.00
    VAR fourthChar_water = 0.00
    VAR fourthChar_fire= 0.00
    
        //Storage del valore precedente
        VAR fourthChar_last_aether = 0.00
        VAR fourthChar_last_earth = 0.00
        VAR fourthChar_last_air = 0.00
        VAR fourthChar_last_water = 0.00
        VAR fourthChar_last_fire= 0.00

    //Utilizzo dei sigilli
    VAR fourthChar_usedSigil = 0
    VAR fourthChar_usedSigilsTracking = ()

    //Moltiplicatore per la riscrittura
    VAR fourthChar_glyphVariation = 3.0 

//Tracciamento della relazione
    //Indicatore della relazione
    VAR fourthChar_relationshipIndicator = 0
    VAR fourthChar_lastRelationshipIndicator = 0
    //Status = chiamato da cucina e prima della riscrittura per valutare il rapporto creato e il relativo inchiostro. Ora è un insieme di valori "scritti"
    VAR fourthChar_relationshipStatus = neutral
    //Reaction: qui registriamo la reazione che verrà attivata coi sigilli
    VAR fourthChar_relationshipReaction = neutral

//Gestione dei doni
    //Tracciamento apprezzamento doni/ingredienti. Tutto ciò che è fuori da questa lista = reazione neutrale/disgustata.
    VAR fourthChar_favouritesGifts = (NonTiScordarDiTe, BaccaDellaAddolorata, CantoDelleCompagne)
    VAR fourthChar_goodGifts = (ErbaLiccia, Olobino, BastoneDellOzioso, LanaNotturna)
    //Dono consigliato dalla rana
    VAR frog_fourth_char_gift = ""
    VAR frog_fourth_temp_growing_gift = false
    //Dono effettuato
    VAR fourthChar_giftedObject = ()


//Tracciamento cucina
    //Autonoma
        VAR kitchen_fourthCharIsCooking = false
        VAR kitchen_fourthCharCookingTime = 0
        VAR kitchen_fourthCharHasCooked = false
        //Tempo che ci impiega a fare la sua ricetta
        VAR kitchen_fourthCharCookingMaxTime = 8
    //Nostro invito
        //l'abbiamo invitata
        VAR kitchen_fourthCharCookingTogetherInvite = false
        //Quante volte l'abbiamo invitata
        VAR kitchen_fourthCharCookingTogetherNumberInvite = 0
        //Da quanto ci sta aspettando
        VAR kitchen_fourthCharCookingTogetherWaiting = 0
        //Quanta pazienza ha ad aspettarci
        VAR kitchen_fourthCharCookingMAXTogetherWaiting = 8
        //Ricetta creata
        VAR kitchen_fourthCharRecipe = ""
        //Suggerimento rana
        VAR frog_fourth_char_ingredient = ""
        VAR frog_fourth_temp_growing_ingredient = false
            
    //Valore ingredienti
        VAR kitchen_fourthCharRecipeNoun = ""
        VAR kitchen_fourthCharRecipeAdjective = ""
        VAR kitchen_fourthCharRecipeComplement = ""
        VAR kitchen_fourthCharExtraIngredient = ()
        VAR kitchen_fourthCharExtraIngredientReaction = notReaction

//Tracciamento del racconto
    VAR frog_fourth_novel = ""
                     
                                                        /* ---------------------------------
                                                        
                                                            FUNZIONI PER AFFINITA' E NOME
                                                        
                                                        ----------------------------------*/
=== fourthAffinityCalc ===
{debug: passo per fourthAffinityCalc.}
//Questo mi serve per aggiornare il valore di affinità.
//Viene chiamato a ridosso della riscrittura per definire lo stato di inchiostro

    //Prima di tutto chiamo la funzione per il calcolo dello stato della relazione
        ~ affinity_calc(FourthCharacter)

    //"Trasformo" la relazione in inchiostro
        ~ fromRelationshipToInk(FourthCharacter)
    
    //Mando ai feedback
        -> fourthAffinityFeedback ->
    
    //Arriva il commento della strega
        ~ inkLevel(FourthCharacter)
    
    //Salvo il massimo di inchiostro raggiunto con la personaggia
        ~ maxInkLevelUpdater(FourthCharacter)

    //Esco dal flusso 
    ->-> 



=== fourthAffinityFeedback
{debug: passo per fourthAffinityFeedback. Lo stato di inchiostro è {fourthChar_InkLevel}.}
//Utilizziamo questa funzione per far fare alla PNG un commento esplicito sullo stato della relazione.
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    Prima però ci terrei a dirti come sono andate le cose tra noi, qui.
            

        {
            -   are_two_entities_together(FifthCharacter, PG):
                {charTag(FifthCharacter, "neutral")}:               Mi levo dalle scatole.
                    ~ change_entity_place(FifthCharacter)
        }
 
        {
            - are_two_entities_together(Franco, PG):
                {charTag(Franco, "{portrait_Franco()}")}:           Non fate caso a me, sto provando a raccogliere tutte le bolle in un unico posto, ma continuano a scappare.     
        }

        
        {
            - fourthChar_InkLevel == ink_empty:
                {charTag(FourthCharacter, "annoyed")}:               Come direbbe la mia vecchia insegnate di piano: apprezzo lo sforzo, manca il risultato.
                                                                    Ci sono stati momenti carini, ma ammetto che per lo più non mi sono sentita molto capita da te.
                                                                    Scusa.

            - fourthChar_InkLevel == ink_low:
                {charTag(FourthCharacter, "annoyed")}:               E, insomma.
                                                                    Non è che ci capiamo molto noi due, sai?
                                                                    È come se io suonassi Chopin e tu la lambada.
                                                                    E la lambada è carina, ma non è roba mia.
                                                                    Ha senso? 
                                                                
            - fourthChar_InkLevel == ink_normal:
                {charTag(FourthCharacter, "neutral")}:               Ci sono stati beni momenti tra noi, sai?
                                                                    Ma anche momenti no, in cui non mi sono sentita capita.
                                                                    Non è un reato.
                                                                    Ma, insomma, non riesco a fidarmi fino in fondo.
                                                                    Scusa.
            
            
            - fourthChar_InkLevel == ink_medium:
                {charTag(FourthCharacter, "affectionate")}:          E {player_name}: non pensavo avrei trovato una persona amica, qui.
                                                                    Mi hai reso l'assenza di Talco, di Ennio, di Valeria moooolto più sopportabile.
                                                                    Grazie.
            
            
            - fourthChar_InkLevel == ink_high:
                {charTag(FourthCharacter, "affectionate")}:          E mi chiedevo: ma che ci hanno separat3 alla nascita?
                                                                    Perché mi sento tipo come se avessimo un unico neurone.
                                                                    Unit3 in tutto.
                                                                    Ed è figa come cosa.
                                                                    Talco continua a mancarmi, ma con te mi sento come se fossimo parte da sempre della stessa band.
        }

->->


=== fourth_char_closing_storylet ===
    //Questo evita che venga proposto un altro storylet fino a quando la pausa non è finita
    ~ fourthChar_pauseTalking = fourthChar_pauseDuration
    //Questo è per la gestione delle domande
    ~ fourthChar_justTalked = true

    //Aggiornamento storylets
    -> grimoire_storylets_updater ->

->->

=== fourth_char_closing_letters
    ~ fourthChar_mailPause = fourthChar_mailPauseDuration
    ~ letters_doggoPause = false

    ~ move_entity(DoggoFourthLetters, Safekeeping)
    ~ move_entity(DoggoNoLetters, TrainStop)
    
    //Aggiornamento storylets
    -> grimoire_storylets_updater ->

->->