                                                        /* ---------------------------------
                                                        
                                                                LISTE E VARIABILI
                                                        
                                                        ----------------------------------*/


//Gestione del ritmo della storia
    //Stato della storia 
        //Non avviata, avviata, conclusa
        VAR thirdChar_storyStatus = story_storyNotStarted
        //Ordine di conclusione della riscrittura (prima storia conclusa, seconda storia conclusa)
        VAR thirdChar_storyEndingPosition = ()
        //Quantità di storylets letti dalla giocatrice prima di accedere alla riscrittura
        VAR thirdChar_minStoryletsForRewriting = grimThirdCharNine
        //Abbiamo l'info speciale su Mentore? Se le condizioni sono corrette, viene messa su true dalla funzione inkLevel(Character)
        VAR thirdChar_specialEvent = false
        //Cconteggio totale delle scelte prese con la PNG
        VAR thirdChar_totalChoices = 0

    //Ritmo della storia    
        //Variabili per mettere in pausa la conversazione
        VAR thirdChar_pauseTalking = 0
        VAR thirdChar_pauseDuration = 1
        //Questa variabile verifica se abbiamo appena parlato con unx PNG, in modo tale da presentarci in modo diverso le possibili proposte che possiamo farle.
        VAR thirdChar_justTalked = false
        //Variabile per il tempo di attesa tra una lettera e l'altra
        VAR thirdChar_mailPause = 0
        VAR thirdChar_mailPauseDuration = 5


//Stato della PNG
    //Gestione nomi
    LIST thirdChar_possibleStates = Boccale, (ThirdB), (ThirdC), (ThirdD), (ThirdE), (ThirdF)
    VAR thirdChar_ActualName = Boccale

    //Registro delle scelte prese
    VAR thirdChar_aether = 0.00
    VAR thirdChar_earth = 0.00
    VAR thirdChar_air = 0.00
    VAR thirdChar_water = 0.00
    VAR thirdChar_fire= 0.00
    
        //Storage del valore precedente
        VAR thirdChar_last_aether = 0.00
        VAR thirdChar_last_earth = 0.00
        VAR thirdChar_last_air = 0.00
        VAR thirdChar_last_water = 0.00
        VAR thirdChar_last_fire= 0.00

    //Utilizzo dei sigilli
    VAR thirdChar_usedSigil = 0
    VAR thirdChar_usedSigilsTracking = ()

    //Moltiplicatore per la riscrittura
    VAR thirdChar_glyphVariation = 3.0 

//Tracciamento della relazione
    //Indicatore della relazione
    VAR thirdChar_relationshipIndicator = 0
    VAR thirdChar_lastRelationshipIndicator = 0
    //Status = chiamato da cucina e prima della riscrittura per valutare il rapporto creato e il relativo inchiostro. Ora è un insieme di valori "scritti"
    VAR thirdChar_relationshipStatus = neutral
    //Reaction: qui registriamo la reazione che verrà attivata coi sigilli
    VAR thirdChar_relationshipReaction = neutral

//Gestione dei doni
    //Tracciamento apprezzamento doni/ingredienti. Tutto ciò che è fuori da questa lista = reazione neutrale/disgustata.
    VAR thirdChar_favouritesGifts = (NonTiScordarDiTe, BaccaDellaAddolorata, CantoDelleCompagne)
    VAR thirdChar_goodGifts = (ErbaLiccia, Olobino, BastoneDellOzioso, LanaNotturna)
    //Dono consigliato dalla rana
    VAR frog_third_char_gift = ""
    VAR frog_third_temp_growing_gift = false
    //Dono effettuato
    VAR thirdChar_giftedObject = ()


//Tracciamento cucina
    //Autonoma
        VAR kitchen_thirdCharIsCooking = false
        VAR kitchen_thirdCharCookingTime = 0
        VAR kitchen_thirdCharHasCooked = false
        //Tempo che ci impiega a fare la sua ricetta
        VAR kitchen_thirdCharCookingMaxTime = 8
    //Nostro invito
        //l'abbiamo invitata
        VAR kitchen_thirdCharCookingTogetherInvite = false
        //Quante volte l'abbiamo invitata
        VAR kitchen_thirdCharCookingTogetherNumberInvite = 0
        //Da quanto ci sta aspettando
        VAR kitchen_thirdCharCookingTogetherWaiting = 0
        //Quanta pazienza ha ad aspettarci
        VAR kitchen_thirdCharCookingMAXTogetherWaiting = 8
        //Ricetta creata
        VAR kitchen_thirdCharRecipe = ""
        //Suggerimento rana
        VAR frog_third_char_ingredient = ""
        VAR frog_third_temp_growing_ingredient = false
            
    //Valore ingredienti
        VAR kitchen_thirdCharRecipeNoun = ""
        VAR kitchen_thirdCharRecipeAdjective = ""
        VAR kitchen_thirdCharRecipeComplement = ""
        VAR kitchen_thirdCharExtraIngredient = ()
        VAR kitchen_thirdCharExtraIngredientReaction = notReaction

//Tracciamento del racconto
    VAR frog_third_novel = ""
                     
                                                        /* ---------------------------------
                                                        
                                                            FUNZIONI PER AFFINITA' E NOME
                                                        
                                                        ----------------------------------*/
=== thirdAffinityCalc ===
{debug: passo per thirdAffinityCalc.}
//Questo mi serve per aggiornare il valore di affinità.
//Viene chiamato a ridosso della riscrittura per definire lo stato di inchiostro

    //Prima di tutto chiamo la funzione per il calcolo dello stato della relazione
        ~ affinity_calc(ThirdCharacter)

    //"Trasformo" la relazione in inchiostro
        ~ fromRelationshipToInk(ThirdCharacter)
    
    //Mando ai feedback
        -> thirdAffinityFeedback ->
    
    //Arriva il commento della strega
        ~ inkLevel(ThirdCharacter)
    
    //Salvo il massimo di inchiostro raggiunto con la personaggia
        ~ maxInkLevelUpdater(ThirdCharacter)

    //Esco dal flusso 
    ->-> 



=== thirdAffinityFeedback
{debug: passo per thirdAffinityFeedback. Lo stato di inchiostro è {thirdChar_InkLevel}.}
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
            -   are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "neutral")}:               Mi levo dalle scatole.
                    ~ change_entity_place(FirstCharacter)
        }
        {
            -   are_two_entities_together(SecondCharacter, PG):
                {charTag(ThirdCharacter, "affectionate")}:          {charNameTwo}, potresti lasciarci un po' da sol3?
                {charTag(SecondCharacter, "emotional")}:            Certissimamente! A dopo!
                    ~ change_entity_place(SecondCharacter)
        }
        {
            - are_two_entities_together(Franco, PG):
                {charTag(Franco, "{portrait_Franco()}")}:           Non fate caso a me, sto provando a raccogliere tutte le bolle in un unico posto, ma continuano a scappare.     
        }

        
        {
            - thirdChar_InkLevel == ink_empty:
                {charTag(ThirdCharacter, "annoyed")}:               Come direbbe la mia vecchia insegnate di piano: apprezzo lo sforzo, manca il risultato.
                                                                    Ci sono stati momenti carini, ma ammetto che per lo più non mi sono sentita molto capita da te.
                                                                    Scusa.

            - thirdChar_InkLevel == ink_low:
                {charTag(ThirdCharacter, "annoyed")}:               E, insomma.
                                                                    Non è che ci capiamo molto noi due, sai?
                                                                    È come se io suonassi Chopin e tu la lambada.
                                                                    E la lambada è carina, ma non è roba mia.
                                                                    Ha senso? 
                                                                
            - thirdChar_InkLevel == ink_normal:
                {charTag(ThirdCharacter, "neutral")}:               Ci sono stati beni momenti tra noi, sai?
                                                                    Ma anche momenti no, in cui non mi sono sentita capita.
                                                                    Non è un reato.
                                                                    Ma, insomma, non riesco a fidarmi fino in fondo.
                                                                    Scusa.
            
            
            - thirdChar_InkLevel == ink_medium:
                {charTag(ThirdCharacter, "affectionate")}:          E {player_name}: non pensavo avrei trovato una persona amica, qui.
                                                                    Mi hai reso l'assenza di Talco, di Ennio, di Valeria moooolto più sopportabile.
                                                                    Grazie.
            
            
            - thirdChar_InkLevel == ink_high:
                {charTag(ThirdCharacter, "affectionate")}:          E mi chiedevo: ma che ci hanno separat3 alla nascita?
                                                                    Perché mi sento tipo come se avessimo un unico neurone.
                                                                    Unit3 in tutto.
                                                                    Ed è figa come cosa.
                                                                    Talco continua a mancarmi, ma con te mi sento come se fossimo parte da sempre della stessa band.
        }

->->


=== third_char_closing_storylet ===
    //Questo evita che venga proposto un altro storylet fino a quando la pausa non è finita
    ~ thirdChar_pauseTalking = thirdChar_pauseDuration
    //Questo è per la gestione delle domande
    ~ thirdChar_justTalked = true

    //Aggiornamento storylets
    -> grimoire_storylets_updater ->

->->

=== third_char_closing_letters
    ~ thirdChar_mailPause = thirdChar_mailPauseDuration
    ~ letters_doggoPause = false
    
    //Aggiornamento storylets
    -> grimoire_storylets_updater ->

->->