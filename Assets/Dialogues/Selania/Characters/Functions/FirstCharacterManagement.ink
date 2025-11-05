                    /* ---------------------------------
                    
                      Gestione timing e valori della storia
                    
                     ----------------------------------*/

//Ordine degli stati: 0, Blue, Rosso, Verde, Giallo, Viola.
    LIST firstCharacterPossibleStates = Chitarra, Triangolo, RagazzaOrchestra, FlautoDolce, Ocarina, Violino
    VAR firstCharacterState = Chitarra
    
    VAR minStoryQuesTCountFirstChar = 7
    
    
    VAR firstStory = StoryNotStarted
    VAR charOneEnding = ()


//Tracciamento della relazione
    VAR firstCharStateRelationship = 0

//Tracciamento cucina
    //Autonoma
        VAR firstIsCooking = false
        VAR firstCookingTime = 0
        //Tempo che ci impiega a fare la sua ricetta
        VAR firstCookingMaxTime = 8
    //Nostro invito
        VAR FirstKitchenInvite = false
    //Valore quarto ingrediente
        VAR fourthIngredientNameFirstCharacter = ()
        VAR fourthIngredientReactionFirstCharacter = notReaction
    

//Tracciamento del dono
    VAR firstGift = ()

//Tengo conto delle interazioni avute per aprire la possibilità di dare un dono
    VAR firstStoryQuestCount = 0
    VAR firstCharacterSpecialEvent = false
    
//Variabili per mettere in pausa la conversazione
    VAR firstPauseTalking = 0
    VAR firstCharPauseDuration = 1
    VAR justTalkedFirstChar = false
    
//Variabile per il countdown per la sua uscita di scena
    VAR firstCharEndingDialogue = 0
    
//Variabile per il tempo di attesa tra una lettera e l'altra
    VAR firstWritingPause = 0
    VAR firstWritingPauseDuration = 5
    
//Moltiplicatore del colore per il personaggio
    VAR FirstCharacterColorMultiplier = 3.0    
    
//STATI UP: Viola e Giallo.
//STATI DOWN: Blu.
    VAR firstPurple = 0
    VAR firstYellow = 0
    VAR firstBlue = 0
    VAR firstGreen = 0
    VAR firstRed = 0





                    /* ---------------------------------
                    
                       Gestione relazione e nomi
                    
                     ----------------------------------*/

=== firstAffinityCalc ===
//Questo mi serve per aggiornare il valore di affinità.
//Ad ora è chiamata solo in cucina e prima della riscrittura, e solo in riscrittura stampa una informazione.
//Per la prima personaggia l'importante è che il blu sia bassissimo

    //In questa prima fase di testing, punterò su una soluzione di difficoltà media: basta che o giallo o viola siano maggiori del blu.
    {
        - firstPurple or firstYellow > firstBlue:
            ~ firstCharStateRelationship ++
            {debug: aumento l'inchiostro della prima personaggia di un livello. Ora è a {~ firstCharStateRelationship}}  
    }
    
    {
    
            //Se vengo dalla preriscrittura:
            - rewriting_proposal_first_character.rewriting:
                {debug: ho cliccato rewriting e quindi faccio gli ultimi passaggi e attivo il feedback.} 
                //"Trasformo" la relazione in inchiostro
                    ~ fromRelationshipToInk(firstCharStateRelationship)
                // Mando ai feedback
                    -> firstAffinityFeedback ->
                //Arriva il commento della strega
                    ~ inkLevel(firstCharacterInkLevel)
                        ->-> 
            
            // altrimenti, mando avanti
            - else:
                ->->    
    
    }
    

    
    //La soluzione più tosta potrebbe essere questa invece.
    
    //{
    //    - firstPurple && firstYellow > firstBlue:
    //        ~ firstCharStateRelationship ++
    //            ->->
    //}

            ->->
    




=== firstAffinityFeedback
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
{debug: passo per firstAffinityFeedback. Lo stato di inchiostro è {firstCharacterInkLevel}.}

    Prima di cominciare, ci tengo a dirti cosa penso del rapporto tra di noi.
        {
            -   are_two_entities_together(Mentor, PG):Sicuro è il caso che vi lasci il vostro spazio.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)}#inkB:{ink_tag_b(fifthCharacterInkLevel)} #inkC:{ink_tag_c(fifthCharacterInkLevel)} #inkD:{ink_tag_d(fifthCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                    ~ change_entity_place(Mentor)
        }
        {
            -   are_two_entities_together(SecondCharacter, PG):Nanetto, ci lasceresti un po' da sole?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                    ~ change_entity_place(SecondCharacter)
        }  
    
        {
            - firstCharacterInkLevel == Empty:  Non è che possa dirmi di esser capita da te, sai?
            #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
            
            
            - firstCharacterInkLevel == Low: Non è che ci capiamo molto noi due, sai? È come se io suonassi Chopin e tu la lambada. Una lambada noiosa. Una lamboring.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
            
            - firstCharacterInkLevel == Normal: Siamo un po' in modalità random, vero? A volte ci avviciniamo, a volte ciaone proprio, tutta una musica diversa.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
            
            
            - firstCharacterInkLevel == Medium: Non pensavo avrei trovato una persona amica, qui. Grazie, {name}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
            
            
            - firstCharacterInkLevel == High: Talco continua a mancarmi, ma con te mi sento come se fossimo parte da sempre della stessa band.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
        }


->->


//Settaggio nome quando partiamo con la discussione (non finale quindi)

=== firstNaming ===
{debug: passo per firstNaming.}
{debug: prima di operare,il valore del nome è: {firstCharacterState}.}
 //Svuoto il valore per sicurezza
 ~ firstCharacterState = ()
 {debug: svuoto firstCharacterState : {firstCharacterState}.}
 
    {
        //Blu colore più usato
        - (firstBlue > firstGreen) && (firstBlue > firstRed) && (firstBlue > firstYellow) && (firstBlue > firstPurple):
            ~ firstCharacterState += Triangolo
            {debug: passo per Triangolo e il nome è : {firstCharacterState}.}
                ->->
        //Rosso colore più usato        
        - (firstRed > firstGreen) && (firstRed > firstBlue) && (firstRed > firstYellow) && (firstRed > firstPurple):
            ~ firstCharacterState += RagazzaOrchestra
            {debug: passo per Orchestra e il nome è : {firstCharacterState}.}
                ->->
        
        //Verde colore più usato        
        - (firstGreen > firstBlue) && (firstGreen > firstRed) && (firstGreen > firstYellow) && (firstGreen > firstPurple):
            ~ firstCharacterState += FlautoDolce
            {debug: passo per FlautoDolce e il nome è : {firstCharacterState}.}
                ->->
        
        //Giallo colore più usato        
        - (firstYellow > firstGreen) && (firstYellow > firstRed) && (firstYellow > firstBlue) && (firstYellow > firstPurple):
            ~ firstCharacterState += Ocarina
            {debug: passo per Ocarina e il nome è : {firstCharacterState}.}
                ->->
        
        //Viola colore più usato        
        - (firstPurple > firstGreen) && (firstPurple > firstRed) && (firstPurple > firstYellow) && (firstPurple > firstBlue):
        {debug: passo per Violino e il nome è : {firstCharacterState}.}
            ~ firstCharacterState += Violino    
                ->->
                
        - else:
            {
                - (firstPurple < firstBlue) && (firstYellow < firstBlue):
                        ~ firstCharacterState += Triangolo
                        {debug: passo per Triangolo e il nome è : {firstCharacterState}.}
                        ->->
                - firstPurple && firstYellow > firstBlue:
                        ~ firstCharacterState += Ocarina   
                            {debug: passo per Ocarina e il nome è : {firstCharacterState}.}
                        ->->
                - (firstYellow > firstBlue) && (not firstPurple > firstBlue):
                        ~ firstCharacterState += RagazzaOrchestra
                        {debug: passo per Orchestra e il nome è : {firstCharacterState}.}
                            ->->
                - (firstPurple > firstBlue) && (not firstYellow > firstBlue):
                    {debug: passo per FlautoDolce e il nome è : {firstCharacterState}.}
                        ~ firstCharacterState += FlautoDolce 
                            ->->
                - else:
                        ~ firstCharacterState += RagazzaOrchestra
                            {debug: passo per Orchestra e il nome è : {firstCharacterState}.}
                            ->->
            }
        }
        ->->    