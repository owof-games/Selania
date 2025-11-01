                    /* ---------------------------------
                    
                      Gestione timing e valori della storia
                    
                     ----------------------------------*/
//Possibili nomi:
    LIST secondCharacterPossibleStates = Riccio, Grizzly, Lupo, Delfino, Capibara, Corvo
    VAR secondCharacterState = Riccio
    
    VAR minStoryQuesTCountSecondChar = 8
    
    VAR secondStory = StoryNotStarted
    VAR charTwoEnding = ()

//Tracciamento della relazione
    VAR secondCharStateRelationship = 0
    VAR goodPercentageForRelationship = 66.00

//Valori per definire l'esito del nome
    VAR crowPercentage = 90.00
    VAR capibaraPercentage = 70.00
    VAR dolphinePercentage = 60.00
    VAR wolfPercentage = 40.00

    

//Tracciamento del dono
    VAR secondGift = ()
    
//Tracciamento attivazione secondo elemento tutorial
    VAR secondTutorial = true
    
//Tracciamento cucina
    //autonoma
        VAR secondIsCooking = false
        VAR secondCookingTime = 0
        //Tempo che ci impiega a fare la sua ricetta
        VAR secondCookingMaxTime = 5
    //Nostro invito
        VAR SecondKitchenInvite = false
    //Valore quarto ingrediente
        VAR fourthIngredientNameSecondCharacter = ()
        VAR fourthIngredientReactionSecondCharacter = notReaction    
    
//Tengo conto delle interazioni avute per aprire la possibilità di dare un dono
    VAR secondStoryQuestCount = 0.00
    VAR secondCharacterSpecialEvent = false
    VAR justTalkedSecondChar = false

//Variabili per mettere in pausa la conversazione
    VAR secondPauseTalking = 0
    VAR secondCharPauseDuration = 1
    
//Variabile per il countdown per la sua uscita di scena
    VAR secondCharEndingDialogue = 0    

//Variabile per il tempo di attesa tra una lettera e l'altra
    VAR secondWritingPause = 0
    VAR secondWritingPauseDuration = 5
    
//Moltiplicatore del colore per il personaggio
    VAR SecondCharacterColorMultiplier = 3.0
    
//UP: coerenza.
//DOWN: incoerenza, cose random
    VAR secondPurple = 0.00
    VAR secondYellow = 0.00
    VAR secondBlue = 0.00
    VAR secondGreen = 0.00
    VAR secondRed = 0.00                   
                     
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
    
    ~ temp allColorsValue = secondRed + secondBlue + secondGreen + secondYellow + secondPurple
    ~ temp minimumPercentValue = ((allColorsValue/100.00)*goodPercentageForRelationship)
    
        {debug: La percentuale di risposte coerenti per una buona relazione è di {goodPercentageForRelationship}. Il {goodPercentageForRelationship}% di tutta la somma dei colori di Riccio (che è {allColorsValue}) è {minimumPercentValue}.}
        {debug: Il valore di viola è: {FLOAT(secondPurple)}, di verde è: {FLOAT(secondGreen)}, di rosso è: {FLOAT(secondRed)}, di blu è: {FLOAT(secondBlue)}, di giallo è: {FLOAT(secondYellow)}}
        
        {
            - secondPurple > minimumPercentValue:
                    ~ secondCharStateRelationship ++
            - secondGreen > minimumPercentValue:
                    ~ secondCharStateRelationship ++        
            - secondRed > minimumPercentValue:
                    ~ secondCharStateRelationship ++        
            - secondBlue > minimumPercentValue:
                    ~ secondCharStateRelationship ++
            - secondYellow > minimumPercentValue:
                    ~ secondCharStateRelationship ++
            {debug: Una risposta supera il 66 per cento delle scelte e quindi aumento l'inchiostro del secondo personaggio di un livello. Ora è a {secondCharStateRelationship}}
        }    

    
    
        {
            //Se vengo dalla preriscrittura:
            - rewriting_proposal_second_character.rewriting:
                {debug: ho cliccato rewriting e quindi faccio gli ultimi passaggi e attivo il feedback.} 
                //"Trasformo" la relazione in inchiostro
                    ~ fromRelationshipToInk(secondCharStateRelationship)
                // Mando ai feedback
                    -> secondAffinityFeedback ->
                //Arriva il commento della strega
                    ~ inkLevel(secondCharacterInkLevel)
                    ->-> 
            
            // altrimenti, mando avanti
            - else:
                ->->
        }
    
            ->->




//Abbiamo un feedback da parte della PNG sul suo stato prima di confessare (che brutta parola)        
=== secondAffinityFeedback
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
{debug: passo per secondAffinityFeedback. Lo stato di inchiostro è {secondCharacterInkLevel}.}

    Prima di cominciare: sto pensando tanto al nostro rapporto, sai? #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#portrait:riccio_neutral

        {
            -   are_two_entities_together(FirstCharacter, PG): E questo è il momento per me di levarmi da qui e lasciarvi in pace. Anche se sono stracuriosa.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_curious
                Non ditemi che questo non è un atto d'amore!
                        ~ change_entity_place(FirstCharacter)
        }
        
        {
            -   are_two_entities_together(Mentor, PG): Vi lascio la vostra privacy.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:mentor_neutral
                
                        ~ change_entity_place(Mentor)
        }
            
    
        {
            - secondCharacterInkLevel == Empty:
                 Secondo me mi tratti come un bambino.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_angry
                    Tutte le cose che dici cambiano, sono disordinate.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#portrait:riccio_neutral
                    Come i camaleonti che sono verdi sulle foglie e bianchi sul muro.
                    Non mi piace mica come cosa.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#portrait:riccio_melanchonic
                        <i>{charNameTwo} non si è sentito capito da {name}.</i>#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            
            
            - secondCharacterInkLevel == Low:
                Che non ho capito cosa pensi. Sei come quando guardo nel terrario e non capisco se c'è l'insetto stecco o sono solo rami.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#portrait:riccio_melanchonic
            
            - secondCharacterInkLevel == Normal:
                Si vede che sei grande. Che a volte non è male, a volte però mi agita.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#portrait:riccio_melanchonic
            
            
            - secondCharacterInkLevel == Medium:
                    Un po' mi fido#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
                    Secondo me non dici <i>sempre</i> le cose in modo preciso.
                    Sembri un po' un gatto.
                    Ma mi fido.
            
            - secondCharacterInkLevel == High:
                    Non sei male, per essere grande.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_emotional
                    Dici sempre le cose allo stesso modo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)}#portrait:riccio_neutral
                    Come un cane che scodinzola se è felice ma abbaia se arrabbiato.
                    E questo mi fa stare al sicuro.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_emotional
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
//        - secondRed >= secondBlue && secondRed >= secondYellow && secondRed >= secondGreen && secondRed >= //secondPurple && secondRed >= secondGreen:
                   // ~  secondRedMax = true
//        {debugChangeName: Il valore di secondRedMax è {secondRedMax}.}
        
 //       - secondBlue >= secondRed && secondBlue >= secondYellow && secondBlue >= secondGreen && secondBlue >= //secondPurple && secondBlue >= secondGreen:
   //                 ~  secondBlueMax = true
   //      {debugChangeName: Il valore di secondBlueMax è {secondBlueMax}.}
 //        
  //      - secondGreen >= secondBlue && secondGreen >= secondYellow && secondGreen >= secondGreen && secondGreen //>= secondPurple && secondGreen >= secondRed:
  //                  ~  secondGreenMax = true
  //          {debugChangeName: Il valore di secondGreenMax è {secondGreenMax}.}  
   //         
  //      - secondPurple >= secondBlue && secondPurple >= secondYellow && secondPurple >= secondGreen && //secondPurple >= secondRed && secondPurple >= secondGreen:
 //                   ~  secondPurpleMax = true
    //        {debugChangeName: Il valore di secondPurpleMax è {secondPurpleMax}.}  
    //        
//        - secondYellow >= secondBlue && secondYellow >= secondRed && secondYellow >= secondGreen && //secondYellow >= secondPurple && secondYellow >= secondGreen:
             //       ~  secondYellowMax = true 
    //    {debugChangeName: Il valore di secondGreenMax è {secondGreenMax}.}                  
  //  }
//        ->->
    


=== secondNaming ==
//Selezione nome prima della riscrittura
//Grizzly è il livello "più basso" per Riccio
//Riutilizziamo la stessa logica prodotta dall'affinity calculator, ma con impatti diversi: > 90, >70, >60, > 40
{debug: passo per secondNaming.}

    ~ temp allColorsValue = secondRed + secondBlue + secondGreen + secondYellow + secondPurple
    ~ temp minimumPercentValue = (allColorsValue/100.00)

{debug: la somma di tutti i colori è {allColorsValue}. Il valore di minimumPercentValue è {minimumPercentValue}.}

//Resetto il valore del nome di Riccio
    ~ secondCharacterState = ()
    
    {
        - secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (minimumPercentValue * crowPercentage):
            ~ secondCharacterState += Corvo
                ->->
        
        - secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (minimumPercentValue * capibaraPercentage):
            ~ secondCharacterState += Capibara   
                ->-> 
        
        - secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (minimumPercentValue * dolphinePercentage):
            ~ secondCharacterState += Delfino    
                ->->
        
        - secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (minimumPercentValue * wolfPercentage):
            ~ secondCharacterState += Lupo
                ->->
        
        - else:
            ~ secondCharacterState += Grizzly
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
//             - secondCharacterPossibleStates hasnt Corvo:
//                ~ secondCharacterPossibleStates ++
//                {debugChangeName: Aumento lo stato del secondo personaggio, che ora è {secondCharacterPossibleStates }}
//            }
//        
//        - else:
//            {
//             - secondCharacterPossibleStates hasnt Grizzly:
//                ~ secondCharacterPossibleStates --
//            {debugChangeName: Diminuisco lo stato del secondo personaggio, che ora è //{secondCharacterPossibleStates }}
//            }
//    	            
//    }        
    

