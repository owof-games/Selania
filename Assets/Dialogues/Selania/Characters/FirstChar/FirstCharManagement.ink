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
    //Questa è una lista che utilizzo in caso di spareggio dei potenziali nomi
    VAR firstChar_randomPossibileNames = ()

    //Registro delle scelte prese
    VAR firstChar_aether = 0.00
    VAR firstChar_earth = 0.00
    VAR firstChar_air = 0.00
    VAR firstChar_water = 0.00
    VAR firstChar_fire= 0.00
    
        //Storage del valore precedente
        VAR firstChar_last_aether = 0.00
        VAR firstChar_last_earth = 0.00
        VAR firstChar_last_air = 0.00
        VAR firstChar_last_water = 0.00
        VAR firstChar_last_fire= 0.00

    //Utilizzo dei sigilli
    VAR firstChar_usedSigil = 0
    VAR firstChar_usedSigilsTracking = ()

    //Moltiplicatore per la riscrittura
    VAR firstChar_glyphVariation = 3.0 

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


//Settaggio nome quando partiamo con la discussione (non finale quindi)
=== function firstNaming()

                                                                                                        /********************
                                                                        Per la riscrittura non si tratta più di creare una relazione, ma di mostrare un mondo. 
                                                                        Per cui non ragioniamo più con le funzioni di relazione ma semplicemente tracciamo il colore delle scelte, ed è quello a definire il nome. 
                                                                        In questo modo non è più un discorso di esito positivo/negativo, ma di espressione.
                                                                        PERO', per non rendere inutile tutta la conversazione precedente, terremo conto anche di tutte le scelte fatte fino a quel momento.
                                                                        In questo modo avere più scelte (e quindi più inchiostro) o utilizzare il giusto sigillo sono cose che creano effettivamente un vantaggio perché per (es) spostare da una visione "fire" a 12 a una "water" che parte da un 6 ho bisogno di più scelte possibile (e qui interviene comunque anche il vantaggio del modificatore.) 
                                                                                                        ********************/
{debug: passo per firstNaming.}
{debug: prima di operare,il valore del nome è: {firstChar_ActualName}.}
 //Svuoto il valore per sicurezza
 ~ firstChar_ActualName = ()
 {debug: svuoto firstChar_ActualName : {firstChar_ActualName}.}
 
    {
        //Aria elemento più usato    
        - (firstChar_air > firstChar_water) && (firstChar_air > firstChar_fire) && (firstChar_air > firstChar_earth) && (firstChar_air > firstChar_aether):
            ~ firstChar_ActualName += Triangolo
            {debug: passo per Triangolo e il nome è : {firstChar_ActualName}.}
        
        //Fuoco elemento più usato          
        - (firstChar_fire> firstChar_water) && (firstChar_fire> firstChar_air) && (firstChar_fire> firstChar_earth) && (firstChar_fire> firstChar_aether):
            ~ firstChar_ActualName += Orchestra
            {debug: passo per Orchestra e il nome è : {firstChar_ActualName}.}
        
        //Acqua elemento più usato        
        - (firstChar_water > firstChar_air) && (firstChar_water > firstChar_fire) && (firstChar_water > firstChar_earth) && (firstChar_water > firstChar_aether):
            ~ firstChar_ActualName += Violino
            {debug: passo per Violino e il nome è : {firstChar_ActualName}.}

        //Terra elemento più usato        
        - (firstChar_earth > firstChar_water) && (firstChar_earth > firstChar_fire) && (firstChar_earth > firstChar_air) && (firstChar_earth > firstChar_aether):
            ~ firstChar_ActualName += Ocarina
            {debug: passo per Ocarina e il nome è : {firstChar_ActualName}.}

        //Spirito elemento più usato          
        - (firstChar_aether > firstChar_water) && (firstChar_aether > firstChar_fire) && (firstChar_aether > firstChar_earth) && (firstChar_aether > firstChar_air):
        {debug: passo per FlautoDolce e il nome è : {firstChar_ActualName}.}
            ~ firstChar_ActualName += FlautoDolce    

                
        - else:
            //In caso di pareggio cerco di assegnare un nome randomico da quelli più plausibili, sempre firsto la logica qui sopra elemento == nome.
            //Qui ragiono per percentuali: prima di tutto calcolo la quantità totale del valore dei glifi
            ~ temp allGlyphsValue = firstChar_fire + firstChar_air + firstChar_water + firstChar_earth + firstChar_aether
            //Poi faccio un conto del valore medio delle scelte
            ~ temp mediumValue = allGlyphsValue/5

            {debug: La somma delle scelte glifo di {firstChar_ActualName} è {allGlyphsValue}, e la media è {mediumValue}.}

            //Poi aggiungo alla lista dei potenziali generatori di nomi solo quei glifi che superano il valore medio delle scelte. 
            {
                - firstChar_aether >= mediumValue:
                        ~ firstChar_randomPossibileNames += Capibara

                - firstChar_water >= mediumValue:
                        ~ firstChar_randomPossibileNames += Lupo

                - firstChar_fire >= mediumValue:
                        ~ firstChar_randomPossibileNames += Grizzly

                - firstChar_air >= mediumValue:
                        ~ firstChar_randomPossibileNames += Corvo

                - firstChar_earth >= mediumValue:
                        ~ firstChar_randomPossibileNames += Delfino

                {debug: La lista di possibili nomi in caso di pareggio è {firstChar_randomPossibileNames}.}
            } 
            
            //E infine ne prendo uno randomico dalla lista. Se dovesse essere vuota, ne assegno uno che ha senso con una cattiva relazione creata con lx png.
            {
                - firstChar_randomPossibileNames == ():
                    ~ firstChar_ActualName += Grizzly

                - else:
                    ~ firstChar_ActualName = LIST_RANDOM(firstChar_randomPossibileNames)
            }
        }

        
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
    
    //Aggiornamento storylets
    -> grimoire_storylets_updater ->


->->