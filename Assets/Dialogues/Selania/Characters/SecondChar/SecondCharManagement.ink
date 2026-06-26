                                                        /* ---------------------------------
                                                        
                                                                LISTE E VARIABILI
                                                        
                                                        ----------------------------------*/

//Gestione del ritmo della storia
    //Stato della storia 
        //Non avviata, avviata, conclusa
        VAR secondChar_storyStatus = story_storyNotStarted
        //Ordine di conclusione della riscrittura (prima storia conclusa, seconda storia conclusa)
        VAR secondChar_storyEndingPosition = ()
        //Quantità di storylets letti dalla giocatrice prima di accedere alla riscrittura
        VAR secondChar_minStoryletsForRewriting = grimSecondCharNine
        //Abbiamo l'info speciale su Mentore? Se le condizioni sono corrette, viene messa su true dalla funzione inkLevel(Character)
        VAR secondChar_specialEvent = false
        //Conteggio totale delle scelte prese con la PNG
        VAR secondChar_totalChoices = 0
        //Pausa per parlare di Franco
        VAR secondChar_frogPresentationPause = false

    //Ritmo della storia    
        //Variabili per mettere in pausa la conversazione
        VAR secondChar_pauseTalking = 0
        VAR secondChar_pauseDuration = 1
        //Questa variabile verifica se abbiamo appena parlato con unx PNG, in modo tale da presentarci in modo diverso le possibili proposte che possiamo farle.
        VAR secondChar_justTalked = false
        //Variabile per il tempo di attesa tra una lettera e l'altra
        VAR secondChar_mailPause = 0
        VAR secondChar_mailPauseDuration = 5


//Stato della PNG
    //Gestione nomi
    LIST secondChar_possibleStates = Riccio, (Orso), (Lupo), (Delfino), (Capibara), (Corvo)
    VAR secondChar_ActualName = Riccio

    //Registro delle scelte prese
    VAR secondChar_aether = 0
    VAR secondChar_earth = 0
    VAR secondChar_air = 0
    VAR secondChar_water = 0
    VAR secondChar_fire= 0
    
        //Storage del valore precedente
        VAR secondChar_last_aether = 0
        VAR secondChar_last_earth = 0
        VAR secondChar_last_air = 0
        VAR secondChar_last_water = 0
        VAR secondChar_last_fire= 0

    //Utilizzo dei sigilli
    VAR secondChar_usedSigil = 0
    VAR secondChar_usedSigilsTracking = ()

    //Moltiplicatore per la riscrittura
    VAR secondChar_glyphVariation = 2

//Tracciamento della relazione
    //Indicatore della relazione
    VAR secondChar_relationshipIndicator = 0
    VAR secondChar_lastRelationshipIndicator = 0
    //Status = chiamato da cucina e prima della riscrittura per valutare il rapporto creato e il relativo inchiostro. Ora è un insieme di valori "scritti"
    VAR secondChar_relationshipStatus = neutral
    //Reaction: qui registriamo la reazione che verrà attivata coi sigilli
    VAR secondChar_relationshipReaction = neutral
    
    //VALORI SPECIALI PER RICCIO
    //Valori per definire l'esito del nome
        //Valore medio per indicare una buona relazione. PROBABILMENTE NON MI SERVE PIU' A NULLA
        VAR secondChar_relationshipGoodPercentage = 66.00
        
        //come minimo, otteniamo 20% (prendo esattamente la stessa quantità di risposte per ogni colore)
        //quindi divido l'intervallo 20% - 100% in cinque blocchi, a distanza uniforme: 20%-36%, 36%-52%,
        //ecc ecc... NOTA: PROBABILMENTE NON MI SERVONO PIU' A NULLA
        VAR secondChar_crowPercentage = 84.00
        VAR secondChar_capibaraPercentage = 68.00
        VAR secondChar_dolphinePercentage = 52.00
        VAR secondChar_wolfPercentage = 36.00

        //Questi li usiamo per verificare se il valore dell'ultimo glifo è variato. LAST: dato aggiornato dopo la scelta. Actual: dato controllato durante la scelta.
        VAR secondChar_relationshipLastDominantGlyph = ()
        VAR secondChar_relationshipLastDominantGlyphValue = 0
        VAR secondChar_relationshipLastSecondDominantGlyph = ()
        VAR secondChar_relationshipLastSecondDominantGlyphValue = 0

        VAR secondChar_relationshipActualDominantGlyph = ()
        VAR secondChar_relationshipActualDominantGlyphValue = 0
        VAR secondChar_relationshipActualSecondDominantGlyph = ()
        VAR secondChar_relationshipActualSecondDominantGlyphValue = 0

        VAR secondChar_relationshipTrackingChoice = ()

//Gestione dei doni
    //Tracciamento apprezzamento doni/ingredienti. Tutto ciò che è fuori da questa lista = reazione neutrale/disgustata.
    VAR secondChar_favouritesGifts = (BrinaDellImpossibile, BastoneDellOzioso, LicheneDegliAbissi)
    VAR secondChar_goodGifts = (Spazzata, NonTiScordarDiTe)
    //Dono consigliato dalla rana
    VAR frog_second_char_text_gift = ""
    VAR frog_second_temp_growing_gift = false
    VAR frog_second_char_object_gift = ()
    //Dono effettuato
    VAR secondChar_giftedObject = ()



//Tracciamento cucina
    //Autonoma
        VAR kitchen_secondCharIsCooking = false
        VAR kitchen_secondCharCookingTime = 0
        VAR kitchen_secondCharHasCooked = false
        //Tempo che ci impiega a fare la sua ricetta
        VAR kitchen_secondCharCookingMaxTime = 8
    //Nostro invito
        //l'abbiamo invitata
        VAR kitchen_secondCharCookingTogetherInvite = false
        //Quante volte l'abbiamo invitata
        VAR kitchen_secondCharCookingTogetherNumberInvite = 0
        //Da quanto ci sta aspettando
        VAR kitchen_secondCharCookingTogetherWaiting = 0
        //Quanta pazienza ha ad aspettarci
        VAR kitchen_secondCharCookingMAXTogetherWaiting = 8
        //Ricetta creata
        VAR kitchen_secondCharRecipe = ""
        //Suggerimento rana
        VAR frog_second_char_text_ingredient = ""
        VAR frog_second_temp_growing_ingredient = false
        VAR frog_second_char_object_ingredient = ()
            
    //Valore ingredienti
        VAR kitchen_secondCharRecipeNoun = ""
        VAR kitchen_secondCharRecipeAdjective = ""
        VAR kitchen_secondCharRecipeComplement = ""
        VAR kitchen_secondCharExtraIngredient = ()
        VAR kitchen_secondCharExtraIngredientReaction = notReaction

//Tracciamento del racconto
    VAR frog_second_novel = ""




        
                                                        /* ---------------------------------
                                                        
                                                            FUNZIONI PER AFFINITA' E NOME
                                                        
                                                        ----------------------------------*/

//Abbiamo un feedback da parte della PNG sul suo stato prima di confessare (che brutta parola)        
=== function secondAffinityFeedback()
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
{debug: passo per secondAffinityFeedback. Lo stato di inchiostro è {secondChar_InkLevel}.}


        {
            -   are_two_entities_together(FirstCharacter, PG):
                    {charTag(FirstCharacter, "curious")}:                   E questo è il momento per me di levarmi da qui e lasciarvi in pace.
                    Anche se sono stracuriosa.
                    Poi non dite che non vi voglio bene!
                            ~ change_entity_place(FirstCharacter)
        }
        {
            -   are_two_entities_together(ThirdCharacter, PG):
                {charTag(ThirdCharacter, "neutral")}:                       In bocca al lupo ragazzo!
                    ~ change_entity_place(ThirdCharacter)
        }
        
        {
            -   are_two_entities_together(Mentor, PG):
                    {charTag(FifthCharacter, "neutral")}:                   Immagino sia giusto lasciarvi la vostra privacy.
                        ~ change_entity_place(Mentor)
        }
        {
            - are_two_entities_together(Franco, PG):
                    {charTag(Franco, "neutral")}:                           Io sto cra buono buono.
                                                                            In silenzio.
                                                                            A ricordarmi il numero della scuola dei girini.
                    {charTag(Franco, "question")}:                          Che non ricordo a che ora chiude.
                    {charTag(Franco, "neutral")}:                           Di nuovo.     
        }

        {charTag(SecondCharacter, "neutral")}:                              Ecco...
    
        {
            - secondChar_InkLevel == ink_empty:
                    {charTag(SecondCharacter, "angry")}:                    Che secondo me mi tratti come un bambino.
                    {charTag(SecondCharacter, "neutral")}:                  Tutte le cose che dici cambiano, sono disordinate.
                                                                            Come i camaleonti che sono verdi sulle foglie e bianchi sul muro.
                    {charTag(SecondCharacter, "melanchonic")}:              Non mi piace mica come cosa.
                                                                            Mi sa che mi hai ascoltato, ma non mi hai mica capito!
            
            
            - secondChar_InkLevel == ink_low:
                    {charTag(SecondCharacter, "melanchonic")}:              Che io non ho mica capito cosa pensi.
                                                                            Sei come quando guardo nel terrario e non capisco se c'è l'insetto stecco o sono solo rami.
                                                                            Magari hai provato a capirmi ma boh, mica ci sei {player_pronoun has him:riuscito|{player_pronoun has her:riuscita|riuscitə}}.
            
            - secondChar_InkLevel == ink_normal:
                    {charTag(SecondCharacter, "melanchonic")}:              Che si vede che sei grande.
                                                                            Che a volte non è male, a volte però mi agita.
                                                                            Mi chiedo sei mi ascolti davvero.
                                                                            Però per lo meno ti sei {player_pronoun has him:impegnato|{player_pronoun has her:impegnata|impegnatə}}.
            
            - secondChar_InkLevel == ink_medium:
                    {charTag(SecondCharacter, "neutral")}:                  Che un po' mi fido
                                                                            Secondo me non dici <i>sempre sempre sempre</i> le cose in modo preciso.
                                                                            Sembri un po' un gatto.
                                                                            Ma mi fido.
            
            - secondChar_InkLevel == ink_high:
                    {charTag(SecondCharacter, "emotional")}:                Che non sei mica male per essere grande.
                    {charTag(SecondCharacter, "neutral")}:                  Dici sempre le cose allo stesso modo.
                                                                            Come un cane che scodinzola se è felice ma abbaia se arrabbiato.
                    {charTag(SecondCharacter, "emotional")}:                E questo mi fa stare al sicuro.
                                                                            Mi dice che mi hai ascoltato, ed è una cosa bella.
        }
    
 



=== second_char_closing_storylet ===
        //Questo evita che venga proposto un altro storylet fino a quando la pausa non è finita
        ~ secondChar_pauseTalking = secondChar_pauseDuration
        //Questo è per la gestione delle domande
        ~ secondChar_justTalked = true

        //Aggiornamento storylets
    -> grimoire_storylets_updater ->
    

->->

=== second_char_closing_letters
    ~ secondChar_mailPause = secondChar_mailPauseDuration
    ~ letters_doggoPause = false

    ~ move_entity(DoggoSecondLetters, Safekeeping)
    ~ move_entity(DoggoNoLetters, TrainStop)

    //Aggiornamento storylets
    -> grimoire_storylets_updater ->

->->