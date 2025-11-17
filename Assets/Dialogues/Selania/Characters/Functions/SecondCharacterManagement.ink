                    /* ---------------------------------
                    
                      Gestione timing e valori della storia
                    
                     ----------------------------------*/
//Possibili nomi:
    LIST secondChar_possibleStates = Riccio, Grizzly, Lupo, Delfino, Capibara, Corvo
    VAR secondChar_ActualName = Riccio
    
    VAR secondChar_storyStatus = story_storyNotStarted
    VAR secondChar_storyEndingPosition = ()

//Tracciamento della relazione
    VAR secondChar_relationshipStatus = 0
    VAR secondChar_relationshipGoodPercentage = 66.00

//Valori per definire l'esito del nome
    VAR secondChar_crowPercentage = 90.00
    VAR secondChar_capibaraPercentage = 70.00
    VAR secondChar_dolphinePercentage = 60.00
    VAR secondChar_wolfPercentage = 40.00

//Tracciamento apprezzamento doni/ingredienti. Tutto ciò che è fuori da questa lista = reazione neutrale/disgustata.
    VAR secondChar_favouritesGifts = (BrinaDellImpossibile, BastoneDellOzioso, LicheneDegliAbissi)
    VAR secondChar_goodGifts = (CantoDelleCompagne, LanaNotturna, LaSpazzata, NonTiScordarDiTe)
       

//Tracciamento del dono
    VAR secondChar_giftedObject = ()
    
//Tracciamento attivazione secondo elemento tutorial
    VAR secondChar_tutorial = true
    
//Tracciamento cucina
    //autonoma
        VAR kitchen_secondCharIsCooking = false
        VAR kitchen_secondCharCookingTime = 0
        //Tempo che ci impiega a fare la sua ricetta
        VAR kitchen_secondCharCookingMaxTime = 5
    //Nostro invito
        VAR kitchen_secondCharCookingTogetherInvite = false
    //Valore quarto ingrediente
        VAR kitchen_secondCharExtraIngredient = ()
        VAR kitchen_secondCharExtraIngredientReaction = notReaction    
    
//Tengo conto delle interazioni avute per aprire la possibilità della riscrittura
    VAR secondChar_storyletsForRewritingCount = 0.00
    VAR secondChar_specialEvent = false
    VAR secondChar_justTalked = false

//Variabili per mettere in pausa la conversazione
    VAR secondChar_pauseTalking = 0
    VAR secondChar_pauseDuration = 1
    
//Variabile per il countdown per la sua uscita di scena
    VAR secondChar_exitCounter = 0
    VAR secondChar_startingValueExitCounter = 4

//Variabile per il tempo di attesa tra una lettera e l'altra
    VAR secondChar_mailPause = 0
    VAR secondChar_mailPauseDuration = 5
    
//Moltiplicatore del colore per il personaggio
    VAR secondChar_colorVariation = 3.0
    
//UP: coerenza.
//DOWN: incoerenza, cose random
    VAR secondChar_purple = 0.00
    VAR secondChar_Yellow = 0.00
    VAR secondChar_Blue = 0.00
    VAR secondChar_Green = 0.00
    VAR secondChar_Red = 0.00                   
                     
                    /* ---------------------------------
                    
                       Gestione relazione e nomi
                    
                     ----------------------------------*/

//Aggiorniamo lo stato relazionale                     
=== secondAffinityCalc ===
{debug: passo da secondAffinityCalc}
//Per il secondo personaggio la cosa che conta è coerenza. Ha bisogno di stabilità. A manoni la logica sarà: tengo conto di un counter delle domande a cui ha risposto la giocatrice e se un determinato valore è >= di counter - x allora ++, se >= counter -x-1 allora +. Probabilmente da bilanciare.

    //In questa prima fase di testing, punterò su una soluzione di difficoltà media.
    //L'obbiettivo è: beccare almeno il 66% delle risposte.
    //Invece di complicarmi la vita posso usare la matematica.
    
    ~ temp allColorsValue = secondChar_Red + secondChar_Blue + secondChar_Green + secondChar_Yellow + secondChar_purple
    ~ temp minimumPercentValue = ((allColorsValue/100.00)*secondChar_relationshipGoodPercentage)
    
        {debug: La percentuale di risposte coerenti per una buona relazione è di {secondChar_relationshipGoodPercentage}. Il {secondChar_relationshipGoodPercentage}% di tutta la somma dei colori di Riccio (che è {allColorsValue}) è {minimumPercentValue}.}
        {debug: Il valore di viola è: {FLOAT(secondChar_purple)}, di verde è: {FLOAT(secondChar_Green)}, di rosso è: {FLOAT(secondChar_Red)}, di blu è: {FLOAT(secondChar_Blue)}, di giallo è: {FLOAT(secondChar_Yellow)}}
        
        {
            - secondChar_purple > minimumPercentValue:
                    ~ secondChar_relationshipStatus ++
            - secondChar_Green > minimumPercentValue:
                    ~ secondChar_relationshipStatus ++        
            - secondChar_Red > minimumPercentValue:
                    ~ secondChar_relationshipStatus ++        
            - secondChar_Blue > minimumPercentValue:
                    ~ secondChar_relationshipStatus ++
            - secondChar_Yellow > minimumPercentValue:
                    ~ secondChar_relationshipStatus ++
            {debug: Una risposta supera il 66 per cento delle scelte e quindi aumento l'inchiostro del secondo personaggio di un livello. Ora è a {secondChar_relationshipStatus}}
        }    

    
    
        {
            //Se vengo dalla preriscrittura:
            - rewriting_proposal_second_character.rewriting:
                {debug: ho cliccato rewriting e quindi faccio gli ultimi passaggi e attivo il feedback.} 
                //"Trasformo" la relazione in inchiostro
                    ~ fromRelationshipToInk(secondChar_relationshipStatus)
                // Mando ai feedback
                    -> secondAffinityFeedback ->
                //Arriva il commento della strega
                    ~ inkLevel(secondChar_InkLevel)
                    ->-> 
            
            // altrimenti, mando avanti
            - else:
                ->->
        }
    
            ->->




//Abbiamo un feedback da parte della PNG sul suo stato prima di confessare (che brutta parola)        
=== secondAffinityFeedback
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameFive = translator(fifthCharacterState)
    ~ temp charNameTwo = translator(secondChar_ActualName)
{debug: passo per secondAffinityFeedback. Lo stato di inchiostro è {secondChar_InkLevel}.}

    Prima di cominciare: sto pensando tanto al nostro rapporto, sai? #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral

        {
            -   are_two_entities_together(FirstCharacter, PG): E questo è il momento per me di levarmi da qui e lasciarvi in pace. Anche se sono stracuriosa.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                Non ditemi che questo non è un atto d'amore!
                        ~ change_entity_place(FirstCharacter)
        }
        
        {
            -   are_two_entities_together(Mentor, PG): Vi lascio la vostra privacy.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:mentor_neutral
                
                        ~ change_entity_place(Mentor)
        }
            
    
        {
            - secondChar_InkLevel == ink_empty:
                 Secondo me mi tratti come un bambino.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    Tutte le cose che dici cambiano, sono disordinate.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    Come i camaleonti che sono verdi sulle foglie e bianchi sul muro.
                    Non mi piace mica come cosa.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                        <i>{charNameTwo} non si è sentito capito da {player_name}.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            
            
            - secondChar_InkLevel == ink_low:
                Che non ho capito cosa pensi. Sei come quando guardo nel terrario e non capisco se c'è l'insetto stecco o sono solo rami.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            
            - secondChar_InkLevel == ink_normal:
                Si vede che sei grande. Che a volte non è male, a volte però mi agita.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
            
            
            - secondChar_InkLevel == ink_medium:
                    Un po' mi fido#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #portrait:riccio_neutral
                    Secondo me non dici <i>sempre</i> le cose in modo preciso.
                    Sembri un po' un gatto.
                    Ma mi fido.
            
            - secondChar_InkLevel == ink_high:
                    Non sei male, per essere grande.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                    Dici sempre le cose allo stesso modo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    Come un cane che scodinzola se è felice ma abbaia se arrabbiato.
                    E questo mi fa stare al sicuro.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
        }
    

->->        
        
  
        
//Funzione per la gestione della riscrittura
//=== secondColourCheck
//{debugChangeName: Passo per secondColourCheck.}

//VAR secondRedMax = false
//VAR secondBlueMax = false
//VAR secondYellowMax = false
//VAR secondGreenMax = false
//VAR secondPurpleMax = false

//Resettiamo, così che per ogni scelta sia tutto su falso per sicurezza.
//~  secondYellowMax = false
//~  secondGreenMax = false
//~  secondBlueMax = false
//~  secondPurpleMax = false
// ~  secondRedMax = false


//    {
    //Potrebbe capitare un pareggio, e va bene così, così non è punitivo per la giocatrice.
//        - secondChar_Red >= secondChar_Blue && secondChar_Red >= secondChar_Yellow && secondChar_Red >= secondChar_Green && secondChar_Red >= //secondChar_purple && secondChar_Red >= secondChar_Green:
                   // ~  secondRedMax = true
//        {debugChangeName: Il valore di secondRedMax è {secondRedMax}.}
        
 //       - secondChar_Blue >= secondChar_Red && secondChar_Blue >= secondChar_Yellow && secondChar_Blue >= secondChar_Green && secondChar_Blue >= //secondChar_purple && secondChar_Blue >= secondChar_Green:
   //                 ~  secondBlueMax = true
   //      {debugChangeName: Il valore di secondBlueMax è {secondBlueMax}.}
 //        
  //      - secondChar_Green >= secondChar_Blue && secondChar_Green >= secondChar_Yellow && secondChar_Green >= secondChar_Green && secondChar_Green //>= secondChar_purple && secondChar_Green >= secondChar_Red:
  //                  ~  secondGreenMax = true
  //          {debugChangeName: Il valore di secondGreenMax è {secondGreenMax}.}  
   //         
  //      - secondChar_purple >= secondChar_Blue && secondChar_purple >= secondChar_Yellow && secondChar_purple >= secondChar_Green && //secondChar_purple >= secondChar_Red && secondChar_purple >= secondChar_Green:
 //                   ~  secondPurpleMax = true
    //        {debugChangeName: Il valore di secondPurpleMax è {secondPurpleMax}.}  
    //        
//        - secondChar_Yellow >= secondChar_Blue && secondChar_Yellow >= secondChar_Red && secondChar_Yellow >= secondChar_Green && //secondChar_Yellow >= secondChar_purple && secondChar_Yellow >= secondChar_Green:
             //       ~  secondYellowMax = true 
    //    {debugChangeName: Il valore di secondGreenMax è {secondGreenMax}.}                  
  //  }
//        ->->
    


=== secondNaming ==
//Selezione nome prima della riscrittura
//Grizzly è il livello "più basso" per Riccio
//Riutilizziamo la stessa logica prodotta dall'affinity calculator, ma con impatti diversi: > 90, >70, >60, > 40
{debug: passo per secondNaming.}

    ~ temp allColorsValue = secondChar_Red + secondChar_Blue + secondChar_Green + secondChar_Yellow + secondChar_purple
    ~ temp minimumPercentValue = (allColorsValue/100.00)

{debug: Il valore di secondChar_Red è {secondChar_Red} , di secondChar_Blue è {secondChar_Blue}, di secondChar_Green è {secondChar_Green}, di secondChar_Yellow è {secondChar_Yellow} e di secondChar_purple è {secondChar_purple}. La somma di tutti i colori è {allColorsValue}. Il valore di minimumPercentValue è {minimumPercentValue}.}

//Resetto il valore del nome di Riccio
    ~ secondChar_ActualName = ()
    
    {
        - secondChar_purple or secondChar_Green or secondChar_Red or secondChar_Blue or secondChar_Yellow >= (minimumPercentValue * secondChar_crowPercentage):
            ~ secondChar_ActualName += Corvo
                ->->
        
        - secondChar_purple or secondChar_Green or secondChar_Red or secondChar_Blue or secondChar_Yellow >= (minimumPercentValue * secondChar_capibaraPercentage):
            ~ secondChar_ActualName += Capibara   
                ->-> 
        
        - secondChar_purple or secondChar_Green or secondChar_Red or secondChar_Blue or secondChar_Yellow >= (minimumPercentValue * secondChar_dolphinePercentage):
            ~ secondChar_ActualName += Delfino    
                ->->
        
        - secondChar_purple or secondChar_Green or secondChar_Red or secondChar_Blue or secondChar_Yellow >= (minimumPercentValue * secondChar_wolfPercentage):
            ~ secondChar_ActualName += Lupo
                ->->
        
        - else:
            ~ secondChar_ActualName += Grizzly
                ->->
    }
    
        ->-> 
 
     
//=== function secondStatementVariation(color)
////Variazione nome durante la riscrittura   
//~ temp secondCheckColor = false
//{debugChangeName: Passo per function secondStatementVariation.}
//
//    {
//        - color == red:
//           ~ secondCheckColor = secondRedMax
//        - color == blue:
//            ~ secondCheckColor = secondBlueMax
//        - color == yellow:
//            ~ secondCheckColor = secondYellowMax
//        - color == green:
//            ~ secondCheckColor = secondGreenMax
//        - color == purple:
//            ~ secondCheckColor = secondPurpleMax
//            
//    }
//
//    {debugChangeName: Il valore di secondCheckColor è {secondCheckColor}.}
//    
//    //Questi sono check di sicurezza per evitare che vengano prodotti valori fuori dalla lista (non dovrebbe //accadere ma non si sa mai)
//    {
//        - secondCheckColor:
//            {
//             - secondChar_possibleStates hasnt Corvo:
//                ~ secondChar_possibleStates ++
//                {debugChangeName: Aumento lo stato del secondo personaggio, che ora è {secondChar_possibleStates }}
//            }
//        
//        - else:
//            {
//             - secondChar_possibleStates hasnt Grizzly:
//                ~ secondChar_possibleStates --
//            {debugChangeName: Diminuisco lo stato del secondo personaggio, che ora è //{secondChar_possibleStates }}
//            }
//    	            
//    }        
    

