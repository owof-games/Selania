                                                        /* ---------------------------------
                                                        
                                                                LISTE E VARIABILI
                                                        
                                                        ----------------------------------*/
//REMIND IN MERITO A USO DIFFERENZIATO MENTOR/FIFTHCHARACTER
// Allo stato attuale, Mentor è un oggetto, una variante di FifthCharacter allo stesso modo per cui Franco e FrancoCucina sono comunque due varianti di Franco. L'unica eccezione è per glyph_choice_manager, dove Mentor è qualcosa di gestito in modo totalmente diverso da FifthCharacter: preferisco comunque tenere i contatori separati tra Mentor e FifthCharacter per questioni di possibili scelte di design.
// cosa a sé invece è Mentore (e non Mentor), che è una voce ad hoc per la parte dei ritratti su Unity, ma è sempre gestita da charTag.



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
        //Stati dell'uovo
        VAR fifthChar_fromEggToMonster = 8
        //Frasi recovery
        VAR fifthChar_recoveryMaxValue = 8
        VAR fifthChar_recovery = 0


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
    VAR fifthChar_favouritesGifts = (ErbaLiccia, LanaNotturna)
    VAR fifthChar_goodGifts = (BarbaDellInciampo, BrinaDellImpossibile, FalsaPalude)
    //Dono consigliato dalla rana
    VAR frog_fifth_char_text_gift = ""
    VAR frog_fifth_temp_growing_gift = false
    VAR frog_fifth_char_object_gift = ()
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
        VAR frog_fifth_char_text_ingredient = ""
        VAR frog_fifth_temp_growing_ingredient = false
        VAR frog_fifth_char_object_ingredient = ()
            
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

    //Aggiorniamo il contatore degli spoons nel caso in cui fosse in conversazione con qualcuno.
        {
        - are_two_entities_together(Mentor, FourthCharacter):
            ~ fifth_char_spoons_decrement(fifthLightEvent)
        }

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


VAR fifth_char_spoons_value = 0
VAR fifth_char_restart_value = 7
VAR fifth_char_min_restart_value = 2
LIST list_fifth_char_event_values = fifthLightEvent, fifthMediumEvent, fifthStrongEvent
VAR fifth_char_meltdown_countdown = 8
VAR fifth_char_meltdown_activated = false

TODO: da integrare in giro dopo il testing per i valori Medium.
TODO: in un paio di condizioni (es:quando esce dalla serra come Mostro per la prima volta, o meglio ancora, se ci sono state poche interazioni mentre era uovo), aumenta il valore di fifth_char_restart_value di uno.
=== function fifth_char_spoons_decrement(eventValue)
//Chiamo questa funzione nei momenti critici di Mostro/Mentore per ridurre lo stato degli spoons e, nel caso, decrementarli
// Da integrare: SPOONS. Se ci sono litigi, se ci sono rumori improvvisi (es: il treno) o se partecipa a molti dialoghi condivisi, un indicatore interno che traccia il “sensory overload” di Mentore (che chiameremo spoons) si riduce, e quando si azzera finisce che Mentore si ritira in serra, dove fa dei commenti generici tipo Certe cose per me sono davvero difficili a volte, o Vorrei essere più forte ma…. Vediamo anche dei pensieri fortemente negativi e dei commenti che ci fanno capire che questa cosa è stata un problema anche a casa etc. Così rendiamo anche il passaggio in serra poi col meltdown più ovvio.

//Step zero: mi salvo location Mentore/Mostro per capire se siamo fuori dalla greenhouse
~ temp fifthLocation = false
{
- entity_location(FifthCharacter) == Greenhouse:
    ~ fifthLocation = true
}

{
- entity_location(Mentor) == Greenhouse:
    ~ fifthLocation = true
}
    

//Primo step: diminuire il valore
    
    {eventValue:
        - fifthLightEvent: 
            ~ fifth_char_spoons_value --

        - fifthMediumEvent: 
            ~ fifth_char_spoons_value --
            ~ fifth_char_spoons_value --

        //Solo per fuga Boccale. Viene fatto un check costante in un link molto frequentato (es: appena parliamo con Mentore).
        //La prima volta che le condizioni sono raggiunte si attiva il "countDown", e Mentore ci dice qualcosa sul dover stare da sola. Da quel momento ogni volta il valore di countdown diminuisce, fino a quando non arriviamo al breakdown
        - fifthStrongEvent && thirdChar_storyStatus == story_storyRemote && fifth_char_meltdown_activated == false && grimoire_fifthChar hasnt grimMentorMeltdown: 
            ~ fifth_char_spoons_value --
            ~ fifth_char_spoons_value --
            ~ fifth_char_spoons_value --
            ~ fifth_char_spoons_value --
            ~ fifth_char_spoons_value --
            ~ fifth_char_spoons_value --
            ~ fifth_char_spoons_value --
            //Poi attiviamo il countdown
            ~ fifth_char_meltdown_activated = true
            TODO: aggiungere frase mentore
    }



//Poi, se il valore di fifth_char_spoons_value è <= di 0, spostiamo Mentore o Mostro in serra.
{
    //Se non siamo ancora in serra, diminuiamo anche il numero massimo di spoons per Mentore/Mostro.
    //Non lo faccio se il countdown è stato attivato.
    - fifth_char_spoons_value <= 0 && fifthLocation == false && fifth_char_meltdown_activated == false:
        //Prima di tutto diminuisco il valore massimo degli spoons
            {
            - fifth_char_restart_value > fifth_char_min_restart_value:
                ~ fifth_char_restart_value --
            }

        //Poi procedo col cambio di luogo
            {
            //Se è Mostro    
            - fifthChar_storyStatus != story_storyNotStarted:
                ~ move_entity(FifthCharacter, Greenhouse)

            //Se è Mentore
            - else:
                ~ move_entity(Mentor, Greenhouse)
            }
}