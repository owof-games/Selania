                    /* ---------------------------------
                    
                      Gestione timing e valori della storia
                    
                     ----------------------------------*/
//Possibili nomi:
    LIST thirdChar_possibleStates = Prova, Provata, Provatina, Boccale
    VAR thirdChar_ActualName = Boccale
    
    VAR thirdChar_storyStatus = story_storyNotStarted
    VAR thirdChar_storyEndingPosition = ()

//Tracciamento della relazione
    VAR thirdChar_relationshipStatus = 0
    VAR thirdChar_relationshipIndicator = 0
    VAR thirdChar_relationshipReaction = neutral

//Tracciamento apprezzamento doni/ingredienti. Tutto ciò che è fuori da questa lista = reazione neutrale/disgustata.
    VAR thirdChar_favouritesGifts = ()
    VAR thirdChar_goodGifts = ()
    //Dono consigliato dalla rana
    VAR frog_third_char_gift = ""
    VAR frog_third_temp_growing_gift = false

//Tracciamento del dono
    VAR thirdChar_giftedObject = ()
    
//Tracciamento del racconto
    VAR frog_third_novel = ""    
    
//Tracciamento attivazione thirdo elemento tutorial
    VAR thirdChar_tutorial = true
    
//Tracciamento cucina
    //autonoma
        VAR kitchen_thirdCharIsCooking = false
        VAR kitchen_thirdCharCookingTime = 0
        //Tempo che ci impiega a fare la sua ricetta
        VAR kitchen_thirdCharCookingMaxTime = 7
    //Nostro invito
        //l'abbiamo invitata
        VAR kitchen_thirdCharCookingTogetherInvite = false
        //Quante volte l'abbiamo invitata
        VAR kitchen_thirdCharCookingTogetherNumberInvite = 0
        //Da quanto ci sta aspettando
        VAR kitchen_thirdCharCookingTogetherWaiting = 0
        //Quanta pazienza ha ad aspettarci
        VAR kitchen_thirdCharCookingMAXTogetherWaiting = 5
        //Ricetta creata
        VAR kitchen_thirdCharRecipe = ""
         //Suggerimento rana
        VAR frog_third_char_ingredient = ""
        VAR frog_third_temp_growing_ingredient = false
    
    //Valore quarto ingrediente
        VAR kitchen_thirdCharExtraIngredient = ()
        VAR kitchen_thirdCharExtraIngredientReaction = notReaction   

//Tracciamento apprezzamento glifi. Tutto ciò che è fuori da questa lista = reazione neutrale.
    VAR thirdChar_positiveGlyphs = ()
    VAR thirdChar_negativeGlyphs = ()
    
//Tengo conto delle interazioni avute per aprire la possibilità della riscrittura
    VAR thirdChar_storyletsForRewritingCount = 0.00
    VAR thirdChar_minStoryletsForRewriting = 9.00   
    VAR thirdChar_specialEvent = false
    VAR thirdChar_justTalked = false

//Questo è per il conteggio totale delle scelte prese con la PNG
    VAR thirdChar_totalChoices = 0    


//Variabili per mettere in pausa la conversazione
    VAR thirdChar_pauseTalking = 0
    VAR thirdChar_pauseDuration = 1
    
//Variabile per il countdown per la sua uscita di scena
    VAR thirdChar_exitCounter = 0
    VAR thirdChar_startingValueExitCounter = 4

//Variabile per il tempo di attesa tra una lettera e l'altra
    VAR thirdChar_mailPause = 0
    VAR thirdChar_mailPauseDuration = 5
    
//Moltiplicatore del colore per il personaggio
    VAR thirdChar_glyphVariation = 3.0
    
//UP: coerenza.
//DOWN: incoerenza, cose random
    VAR thirdChar_aether = 0.00
    VAR thirdChar_earth = 0.00
    VAR thirdChar_air = 0.00
    VAR thirdChar_water = 0.00
    VAR thirdChar_fire = 0.00

    //Storage precedente valore
    VAR thirdChar_last_aether = 0.00
    VAR thirdChar_last_earth = 0.00
    VAR thirdChar_last_air = 0.00
    VAR thirdChar_last_water = 0.00
    VAR thirdChar_last_fire= 0.00       
                     
                    /* ---------------------------------
                    
                       Gestione relazione e nomi
                    
                     ----------------------------------*/

//Aggiorniamo lo stato relazionale                     
=== thirdAffinityCalc ===
{debug: passo da thirdAffinityCalc}
//Per il thirdo personaggio la cosa che conta è coerenza. Ha bisogno di stabilità. A manoni la logica sarà: tengo conto di un greenhouse_questionsCounter delle domande a cui ha risposto la giocatrice e se un determinato valore è >= di greenhouse_questionsCounter - x allora ++, se >= greenhouse_questionsCounter -x-1 allora +. Probabilmente da bilanciare.

    //In questa prima fase di testing, punterò su una soluzione di difficoltà media.
    //L'obbiettivo è: beccare almeno il 66% delle risposte.
    //Invece di complicarmi la vita posso usare la matematica.
    
    
            ->->




//Abbiamo un feedback da parte della PNG sul suo stato prima di confessare (che brutta parola)        
=== thirdAffinityFeedback
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    ~ temp charNameTwo = translator(thirdChar_ActualName)
{debug: passo per thirdAffinityFeedback. Lo stato di inchiostro è {thirdChar_InkLevel}.}


        {
            -   are_two_entities_together(FirstCharacter, PG):
                    E questo è il momento per me di levarmi da qui e lasciarvi in pace. #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                    Anche se sono stracuriosa.
                    Poi non dite che non vi voglio bene!
                            ~ change_entity_place(FirstCharacter)
        }
        
        {
            -   are_two_entities_together(Mentor, PG):
                    Immagino sia giusto lasciarvi la vostra privacy.#speaker:{mentor_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:mentor_neutral
                        ~ change_entity_place(Mentor)
        }
        {
            - are_two_entities_together(Franco, PG):
                Io sto cra buono buono.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                In silenzio.
                A ricordarmi il numero della scuola dei girini.
                Che non ricordo a che ora chiude.
                Di nuovo.     
        }

        Ecco... #speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
    
        {
            - thirdChar_InkLevel == ink_empty:
                    Che thirdo me mi tratti come un bambino.#speaker:{thirdChar_tag()} #portrait:riccio_angry
                    Tutte le cose che dici cambiano, sono disordinate.#speaker:{thirdChar_tag()} #portrait:riccio_neutral
                    Come i camaleonti che sono verdi sulle foglie e bianchi sul muro.
                    Non mi piace mica come cosa.#speaker:{thirdChar_tag()} #portrait:riccio_melanchonic
                    Mi sa che mi hai ascoltato, ma non mi hai mica capito!
            
            
            - thirdChar_InkLevel == ink_low:
                    Che io non ho mica capito cosa pensi.#speaker:{thirdChar_tag()} #portrait:riccio_melanchonic
                    Sei come quando guardo nel terrario e non capisco se c'è l'insetto stecco o sono solo rami.
                    Magari c'hai provato a capirmi ma boh, mica ci sei {player_pronouns has him:riuscito|{player_pronouns has her:riuscita|riuscitə}}.
            
            - thirdChar_InkLevel == ink_normal:
                    Che si vede che sei grande.#speaker:{thirdChar_tag()} #portrait:riccio_melanchonic
                    Che a volte non è male, a volte però mi agita.
                    Mi chiedo sei mi ascolti davvero.
                    Però per lo meno ti sei {player_pronouns has him:impegnato|{player_pronouns has her:impegnata|impegnatə}}.
            
            - thirdChar_InkLevel == ink_medium:
                    Che un po' mi fido#speaker:{thirdChar_tag()} #portrait:riccio_neutral
                    Thirdo me non dici <i>sempre sempre sempre</i> le cose in modo preciso.
                    Sembri un po' un gatto.
                    Ma mi fido.
            
            - thirdChar_InkLevel == ink_high:
                    Che non sei mica male per essere grande.#speaker:{thirdChar_tag()} #portrait:riccio_emotional
                    Dici sempre le cose allo stesso modo.#speaker:{thirdChar_tag()} #portrait:riccio_neutral
                    Come un cane che scodinzola se è felice ma abbaia se arrabbiato.
                    E questo mi fa stare al sicuro.#speaker:{thirdChar_tag()} #portrait:riccio_emotional
                    Mi dice che mi hai ascoltato, ed è una cosa bella.
        }
    

->->        
        

=== thirdNaming ==
//Selezione nome prima della riscrittura
//Grizzly è il livello "più basso" per Riccio
//Riutilizziamo la stessa logica prodotta dall'affinity calculator, ma con impatti diversi: > 90, >70, >60, > 40
{debug: passo per thirdNaming.}

    ~ temp allColorsValue = thirdChar_fire + thirdChar_air + thirdChar_water + thirdChar_earth + thirdChar_aether
    ~ temp minimumPercentValue = (allColorsValue/100.00)
    ~ temp winnerColor = 0

{debug: Il valore di thirdChar_fire è {thirdChar_fire} , di thirdChar_air è {thirdChar_air}, di thirdChar_water è {thirdChar_water}, di thirdChar_earth è {thirdChar_earth} e di thirdChar_aether è {thirdChar_aether}. La somma di tutti i colori è {allColorsValue}. Il valore di minimumPercentValue è {minimumPercentValue}.}

//Resetto il valore del nome di Riccio
    ~ thirdChar_ActualName = ()

    //Verifico quale sia il valore "vincente"
    {
        - (thirdChar_aether > thirdChar_water) && (thirdChar_aether > thirdChar_fire) && (thirdChar_aether > thirdChar_air) && (thirdChar_aether > thirdChar_earth):
                 ~ winnerColor = thirdChar_aether
                {debug: Il valore di winnerColor è {winnerColor}, pari a quello di thirdChar_aether, che è {thirdChar_aether}.}
    
        - (thirdChar_water > thirdChar_aether) && (thirdChar_water > thirdChar_fire) && (thirdChar_water > thirdChar_air) && (thirdChar_water > thirdChar_earth):
                 ~ winnerColor = thirdChar_water
                {debug: Il valore di winnerColor è {winnerColor}, pari a quello di thirdChar_water, che è {thirdChar_water}.}
        
        - (thirdChar_fire > thirdChar_water) && (thirdChar_fire > thirdChar_aether) && (thirdChar_fire > thirdChar_air) && (thirdChar_fire > thirdChar_earth):
                 ~ winnerColor = thirdChar_fire
                {debug: Il valore di winnerColor è {winnerColor}, pari a quello di thirdChar_fire, che è {thirdChar_fire}.}
        
        - (thirdChar_earth > thirdChar_water) && (thirdChar_earth > thirdChar_aether) && (thirdChar_earth > thirdChar_air) && (thirdChar_earth > thirdChar_fire):
                 ~ winnerColor = thirdChar_earth
                {debug: Il valore di winnerColor è {winnerColor}, pari a quello di thirdChar_earth, che è {thirdChar_earth}.}
        
        - (thirdChar_air > thirdChar_water) && (thirdChar_air > thirdChar_aether) && (thirdChar_air > thirdChar_earth) && (thirdChar_air > thirdChar_fire):
                 ~ winnerColor = thirdChar_air
                {debug: Il valore di winnerColor è {winnerColor}, pari a quello di thirdChar_air, che è {thirdChar_air}.}
    
    }

    // {debug:Il valore da superare per corvo è {minimumPercentValue * thirdChar_crowPercentage}; il valore da superare per capibara è {minimumPercentValue * thirdChar_capibaraPercentage}; Il valore da superare per delfino è {minimumPercentValue * thirdChar_dolphinePercentage}; il valore da superare per lupo è {minimumPercentValue * thirdChar_wolfPercentage}}
    
    // {
    //     - winnerColor >= (minimumPercentValue * thirdChar_crowPercentage):
    //         ~ thirdChar_ActualName += Corvo
        
    //     - winnerColor >= (minimumPercentValue * thirdChar_capibaraPercentage):
    //         ~ thirdChar_ActualName += Capibara   
        
    //     - winnerColor >= (minimumPercentValue * thirdChar_dolphinePercentage):
    //         ~ thirdChar_ActualName += Delfino    
        
    //     - winnerColor >= (minimumPercentValue * thirdChar_wolfPercentage):
    //         ~ thirdChar_ActualName += Lupo
        
    //     - else:
    //         ~ thirdChar_ActualName += Grizzly
    // }
    
    ->-> 



=== third_char_closing_storylet ===
        //Gestione crescita piante
        -> growing_check ->
        //Questo evita che venga proposto un altro storylet fino a quando la pausa non è finita
        ~ thirdChar_pauseTalking = thirdChar_pauseDuration
        //Questo è per la gestione delle domande
        ~ thirdChar_justTalked = true
        //L'animazione per via dell'informazione nuova
        @animation:RewriterBook


->->