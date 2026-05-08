=== rewriting_proposal_third_character
//Così se decido di uscire dalla conversazione, posso riprendere da dove eravamo rimaste.
    {
        - grimoire_thirdChar hasnt grimThirdCharProposal:
            -> confession
            
        - else:
            -> rewriting

    }
    
    = confession
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(ThirdCharacter, "neutral")}:           Frase.

        -> third_char_closing_storylet ->

            + \ {charTag(PG, "neutral")}:         Ti ho ascoltato, {charNameThree}, e posso aiutarti a riscrivere la tua storia.
                -> rewriting
            
            + \ {charTag(PG, "neutral")}:         Capisco il tuo dolore, ma ho bisogno di riflettere un attimo.
                -> main


    = rewriting
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

            Va bene.

            //Funzione di preparazione alla riscrittura
                ~  rewriting_prep(ThirdCharacter)
            
            //E poi a seconda dello stato di inchiostro, mi sposto sulla domanda prevista      
                {
                    - thirdChar_InkLevel == ink_empty:
                        -> ending
                    - else: 
                        -> one
                } 


    = one
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    


        {charTag(ThirdCharacter, "neutral")}:           Frase.
        
            {charTag(PG, "neutral")}:      Frase

            + \ {charTag(PG, "neutral")}:         Come posso cambiare questa situazione?
                -> glyph_choice_manager(false, fireC)->
            {charTag(PG, "neutral")}:               Commento
            
            + \ {charTag(PG, "neutral")}:         Acqua
                -> glyph_choice_manager(false, waterC)->
            {charTag(PG, "neutral")}:               Commento    
                    
            + \ {charTag(PG, "neutral")}:         Terra
                -> glyph_choice_manager(false, earthC)->
            {charTag(PG, "neutral")}:               Commento   
                                
            + \ {charTag(PG, "neutral")}:         Aria
                    -> glyph_choice_manager(false, airC)->
            {charTag(PG, "neutral")}:               Commento      
    
            + \ {charTag(PG, "neutral")}:         Spirito
                -> glyph_choice_manager(false, aetherC)->
            {charTag(PG, "neutral")}:               Commento        
        -

            ~ numberQuestion ++    
        {charTag(ThirdCharacter, "neutral")}:           Frase.

            //Check per commento strega
            -> rewriting_witch_feedback(oneR) ->       

            {
            - thirdChar_InkLevel == ink_low:
                -> ending
            - else: 
                -> two
            }        
        
    
    = two
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
        

        {charTag(PG, "neutral")}:      Frase

            + \ {charTag(PG, "neutral")}:         Come posso cambiare questa situazione?
                -> glyph_choice_manager(false, fireC)->
            {charTag(PG, "neutral")}:               Commento
            
            + \ {charTag(PG, "neutral")}:         Acqua
                -> glyph_choice_manager(false, waterC)->
            {charTag(PG, "neutral")}:               Commento    
                    
            + \ {charTag(PG, "neutral")}:         Terra
                -> glyph_choice_manager(false, earthC)->
            {charTag(PG, "neutral")}:               Commento   
                                
            + \ {charTag(PG, "neutral")}:         Aria
                    -> glyph_choice_manager(false, airC)->
            {charTag(PG, "neutral")}:               Commento      
    
            + \ {charTag(PG, "neutral")}:         Spirito
                -> glyph_choice_manager(false, aetherC)->
            {charTag(PG, "neutral")}:               Commento        
        -
        ~ numberQuestion ++     
        {charTag(ThirdCharacter, "neutral")}:           Frase.
        
            //Check per commento strega
            -> rewriting_witch_feedback(twoR) ->           
                 
        
            {
            - thirdChar_InkLevel == ink_normal:
                -> ending
            - else: 
                -> three
            }
        
    = three
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    //Affrontiamo il mondo. Rabbia, bugie, fantasia, violenza etc.
         {charTag(PG, "neutral")}:      Frase

            + \ {charTag(PG, "neutral")}:         Come posso cambiare questa situazione?
                -> glyph_choice_manager(false, fireC)->
            {charTag(PG, "neutral")}:               Commento
            
            + \ {charTag(PG, "neutral")}:         Acqua
                -> glyph_choice_manager(false, waterC)->
            {charTag(PG, "neutral")}:               Commento    
                    
            + \ {charTag(PG, "neutral")}:         Terra
                -> glyph_choice_manager(false, earthC)->
            {charTag(PG, "neutral")}:               Commento   
                                
            + \ {charTag(PG, "neutral")}:         Aria
                    -> glyph_choice_manager(false, airC)->
            {charTag(PG, "neutral")}:               Commento      
    
            + \ {charTag(PG, "neutral")}:         Spirito
                -> glyph_choice_manager(false, aetherC)->
            {charTag(PG, "neutral")}:               Commento        
        -

        ~ numberQuestion ++        
        {charTag(ThirdCharacter, "neutral")}:           Frase.
        
            //Check per commento strega
            -> rewriting_witch_feedback(threeR) ->          
        
            {
            - thirdChar_InkLevel == ink_medium:
                -> ending
            - else: 
                -> four
            }
    
    = four
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
        

         {charTag(PG, "neutral")}:      Frase

            + \ {charTag(PG, "neutral")}:         Come posso cambiare questa situazione?
                -> glyph_choice_manager(false, fireC)->
            {charTag(PG, "neutral")}:               Commento
            
            + \ {charTag(PG, "neutral")}:         Acqua
                -> glyph_choice_manager(false, waterC)->
            {charTag(PG, "neutral")}:               Commento    
                    
            + \ {charTag(PG, "neutral")}:         Terra
                -> glyph_choice_manager(false, earthC)->
            {charTag(PG, "neutral")}:               Commento   
                                
            + \ {charTag(PG, "neutral")}:         Aria
                    -> glyph_choice_manager(false, airC)->
            {charTag(PG, "neutral")}:               Commento      
    
            + \ {charTag(PG, "neutral")}:         Spirito
                -> glyph_choice_manager(false, aetherC)->
            {charTag(PG, "neutral")}:               Commento        
                
        -
        ~ numberQuestion ++       
        {charTag(ThirdCharacter, "neutral")}:           Frase.
        
            //Check per commento strega
            -> rewriting_witch_feedback(fourR) ->  
            
            -> ending

    
    = ending
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
        

        {charTag(PG, "neutral")}:      Credo di aver compreso quale sia il tuo blocco, perché sei qui.
            
        //Check per commento strega
        -> rewriting_witch_feedback(endR) ->     
     
        + (fire)\ {charTag(PG, "neutral")}:         Come posso cambiare questa situazione?
            -> glyph_choice_manager(false, fireC)->
        {charTag(PG, "neutral")}:               Commento    

        + (aether)\ {charTag(PG, "neutral")}:        Spirito
            -> glyph_choice_manager(false, aetherC)->
        {charTag(PG, "neutral")}:               Commento    

        + (earth)\ {charTag(PG, "neutral")}:         Terra
            -> glyph_choice_manager(false, earthC)->
        {charTag(PG, "neutral")}:               Commento       

        + (water)\ {charTag(PG, "neutral")}:         Acqua
            -> glyph_choice_manager(false, waterC)->
        {charTag(PG, "neutral")}:               Commento    

        + (air)\ {charTag(PG, "neutral")}:         Aria
            -> glyph_choice_manager(false, airC)->
        {charTag(PG, "neutral")}:               Commento    
        -
    //Nota: la parte di accettazione del nome è prima dell'aggiornamento, così il nome nuovo compare solo quando viene dichiarato.
    {charTag(ThirdCharacter, "neutral")}:       Sì.

            {
                - ending.fire:
                    {charTag(ThirdCharacter, "neutral")}:           Frase.
                
                - ending.aether:
                    {charTag(ThirdCharacter, "neutral")}:           Frase.
                    
                - ending.earth:
                    {charTag(ThirdCharacter, "neutral")}:           Frase.

                - ending.water:
                    {charTag(ThirdCharacter, "neutral")}:           Frase.

                - ending.air:
                    {charTag(ThirdCharacter, "neutral")}:           Frase.
                    
            }

    {charTag(ThirdCharacter, "neutral")}:           Frase.  

            //E andiamo a cambiare il nome
                ~ rewriting_end(ThirdCharacter)

            -> naming
                
    
    
    = naming
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    
        {

            - thirdChar_ActualName has ThirdE:
                    {
                        - ending.fire:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                Il mio vero nome è <b><i>{charNameThree}</b></i>.
                    ~  characterChangingObjects(ThirdCharacter)
                 {charTag(ThirdCharacter, characterPortraitsManagement(ThirdCharacter))}:    Frase
            
            - thirdChar_ActualName has ThirdC:
                    {
                        - ending.water:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                {charTag(ThirdCharacter, "neutral")}:       Mi chiamerò <b><i>{charNameThree}</b></i>.
                    ~  characterChangingObjects(ThirdCharacter)
                    {charTag(ThirdCharacter, characterPortraitsManagement(ThirdCharacter))}:    Frase

            - thirdChar_ActualName has ThirdD:
                    {
                        - ending.earth:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                {charTag(ThirdCharacter, "neutral")}:       E il mio nome è <b><i>{charNameThree}</b></i>.
                    ~  characterChangingObjects(ThirdCharacter)
            {charTag(ThirdCharacter, characterPortraitsManagement(ThirdCharacter))}:    Frase
                               
            
            - thirdChar_ActualName has ThirdF:
                    {
                        - ending.aether:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                {charTag(ThirdCharacter, "neutral")}:       Mi chiamerò <b><i>{charNameThree}</b></i>.
                    ~  characterChangingObjects(ThirdCharacter)
                {charTag(ThirdCharacter, characterPortraitsManagement(ThirdCharacter))}:    Frase    
                    
            - thirdChar_ActualName has ThirdB:
                    {
                        - ending.air:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                {charTag(ThirdCharacter, "neutral")}:       Io sono <b><i>{charNameThree}</b></i>.
                    ~  characterChangingObjects(ThirdCharacter)
                {charTag(ThirdCharacter, characterPortraitsManagement(ThirdCharacter))}:    Frase    
                    
        }
        

            {
            - thirdChar_specialEvent == true:
                -> secret_ending
            - else:
                -> exit
            }
    
    
    = secret_ending
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

            {
                - grimoire_fifthChar hasnt grimMentorSecondSecretEnding && grimoire_fifthChar hasnt grimMentorFirstSecretEnding:
                    {charTag(TheWitch, witch_state())}:   <i>{charNameTwo} ripone piena fiducia in {player_name}, ed è pronto a condividere con {player_pronouns has him:lui|{player_pronouns has her:lei|ləi}} una informazione importante.
            }

        {charTag(ThirdCharacter, characterPortraitsManagement(ThirdCharacter))}:    Frase.
        -> third_char_closing_storylet ->
        -> close
            
     = exit
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
        {
            - contentsNest hasnt fireGlyph:
            {charTag(ThirdCharacter, characterPortraitsManagement(ThirdCharacter))}:    Ah {player_name}, prima ho trovato una cosa in giro.
            ~ move_entity(fireGlyph, Nest)

        }
            
    -> close



    = close
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
        
        
        {charTag(ThirdCharacter, characterPortraitsManagement(ThirdCharacter))}:    Frase.
                                                                                    Salutami
            {
                - secondChar_storyStatus == story_storyStarted:
                    E {charNameTwo}.

            }
            {
                - firstChar_storyStatus == story_storyStarted:
                    E anche {charNameOne}.

            }
        

        -> third_char_closing_storylet ->
        -> endingPNGstory(ThirdCharacter)