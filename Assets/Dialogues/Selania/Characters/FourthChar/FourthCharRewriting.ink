=== rewriting_proposal_fourth_character
//Così se decido di uscire dalla conversazione, posso riprendere da dove eravamo rimaste.
    {
        - grimoire_fourthChar hasnt grimFourthCharProposal:
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
    

        {charTag(FourthCharacter, "neutral")}:           Frase.

        -> fourth_char_closing_storylet ->

            + \ {charTag(PG, "neutral")}:         Ti ho ascoltato, {charNameFour}, e posso aiutarti a riscrivere la tua storia.
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
                ~  rewriting_prep(FourthCharacter)
            
            //E poi a seconda dello stato di inchiostro, mi sposto sulla domanda prevista      
                {
                    - fourthChar_InkLevel == ink_empty:
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
    


        {charTag(FourthCharacter, "neutral")}:           Frase.
        

            {charTag(PG, "neutral")}:               Frase    

            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                -> glyph_choice_manager(false, fireC)->
            {charTag(PG, "neutral")}:               Commento    
            
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                -> glyph_choice_manager(false, waterC)->
            {charTag(PG, "neutral")}:               Commento    
                    
            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                -> glyph_choice_manager(false, earthC)->
            {charTag(PG, "neutral")}:               Commento    
                                
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
            {charTag(PG, "neutral")}:               Commento    
    
            + \ {charTag(PG, "neutral")}:         Spirito
                -> glyph_choice_manager(false, aetherC)->
        
        -

            ~ numberQuestion ++    
        {charTag(FourthCharacter, "neutral")}:           Frase.

 

            {
            - fourthChar_InkLevel == ink_low:
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
        

            {charTag(PG, "neutral")}:               Frase    

            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                -> glyph_choice_manager(false, fireC)->
            {charTag(PG, "neutral")}:               Commento    
            
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                -> glyph_choice_manager(false, waterC)->
            {charTag(PG, "neutral")}:               Commento    
                    
            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                -> glyph_choice_manager(false, earthC)->
            {charTag(PG, "neutral")}:               Commento    
                                
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
            {charTag(PG, "neutral")}:               Commento    
    
            + \ {charTag(PG, "neutral")}:         Spirito
                -> glyph_choice_manager(false, aetherC)->
  
        -
        ~ numberQuestion ++     
        {charTag(FourthCharacter, "neutral")}:           Frase.
        
            //Check per commento strega
            -> rewriting_witch_feedback(twoR) ->           
                 
        
            {
            - fourthChar_InkLevel == ink_normal:
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


            {charTag(PG, "neutral")}:               Frase    

            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                -> glyph_choice_manager(false, fireC)->
            {charTag(PG, "neutral")}:               Commento    
            
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                -> glyph_choice_manager(false, waterC)->
            {charTag(PG, "neutral")}:               Commento    
                    
            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                -> glyph_choice_manager(false, earthC)->
            {charTag(PG, "neutral")}:               Commento    
                                
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
            {charTag(PG, "neutral")}:               Commento    
    
            + \ {charTag(PG, "neutral")}:         Spirito
                -> glyph_choice_manager(false, aetherC)->
            
        -

        ~ numberQuestion ++        
        {charTag(FourthCharacter, "neutral")}:           Frase.
        
            //Check per commento strega
            -> rewriting_witch_feedback(threeR) ->          
        
            {
            - fourthChar_InkLevel == ink_medium:
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
        

            {charTag(PG, "neutral")}:               Frase    

            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                -> glyph_choice_manager(false, fireC)->
            {charTag(PG, "neutral")}:               Commento    
            
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                -> glyph_choice_manager(false, waterC)->
            {charTag(PG, "neutral")}:               Commento    
                    
            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                -> glyph_choice_manager(false, earthC)->
            {charTag(PG, "neutral")}:               Commento    
                                
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
            {charTag(PG, "neutral")}:               Commento    
    
            + \ {charTag(PG, "neutral")}:         Spirito
                -> glyph_choice_manager(false, aetherC)->
                
        -
        ~ numberQuestion ++       
        {charTag(FourthCharacter, "neutral")}:           Frase.
        
            //Check per commento strega
            -> rewriting_witch_feedback(fourR) ->  
            
            -> ending

    
    = ending
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
        

        {charTag(PG, "neutral")}:      credo di aver compreso quale sia il tuo blocco, perché sei qui.
            
        //Check per commento strega
        -> rewriting_witch_feedback(endR) ->     
     
        + (fire)\ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
            -> glyph_choice_manager(false, fireC)->
        {charTag(PG, "neutral")}:               Commento    

        + (aether)\ {charTag(PG, "neutral")}:        Spirito
            -> glyph_choice_manager(false, aetherC)->
        {charTag(PG, "neutral")}:               Commento    

        + (earth)\ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
            -> glyph_choice_manager(false, earthC)->
        {charTag(PG, "neutral")}:               Commento    

        + (water)\ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
            -> glyph_choice_manager(false, waterC)->
        {charTag(PG, "neutral")}:               Commento    

        + (air)\ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità dietro questa cosa? Cosa significa veramente?
            -> glyph_choice_manager(false, airC)->
        {charTag(PG, "neutral")}:               Commento    
        
        -
    //Nota: la parte di accettazione del nome è prima dell'aggiornamento, così il nome nuovo compare solo quando viene dichiarato.
    {charTag(FourthCharacter, "neutral")}:       Sì.

            {
                - ending.fire:
                    {charTag(FourthCharacter, "neutral")}:           Frase.
                
                - ending.aether:
                    {charTag(FourthCharacter, "neutral")}:           Frase.
                    
                - ending.earth:
                    {charTag(FourthCharacter, "neutral")}:           Frase.

                - ending.water:
                    {charTag(FourthCharacter, "neutral")}:           Frase.

                - ending.air:
                    {charTag(FourthCharacter, "neutral")}:           Frase.
                    
            }

    {charTag(FourthCharacter, "neutral")}:           Frase.  

            //E andiamo a cambiare il nome
                ~ rewriting_end(FourthCharacter)

            ->naming
                
    
    
    = naming
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    
        {

            - fourthChar_ActualName has FourthE:
                    {
                        - ending.fire:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                Il mio vero nome è <b><i>{charNameFour}</b></i>.
                    ~  characterChangingObjects(FourthCharacter)
                {charTag(FourthCharacter, characterPortraitsManagement(FourthCharacter))}:    Frase    
            
            - fourthChar_ActualName has FourthC:
                    {
                        - ending.water:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                {charTag(FourthCharacter, "neutral")}:       Mi chiamerò <b><i>{charNameFour}</b></i>.
                    ~  characterChangingObjects(FourthCharacter)
                {charTag(FourthCharacter, characterPortraitsManagement(FourthCharacter))}:    Frase        
              
            - fourthChar_ActualName has FourthD:
                    {
                        - ending.earth:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                {charTag(FourthCharacter, "neutral")}:       E il mio nome è <b><i>{charNameFour}</b></i>.
                    ~  characterChangingObjects(FourthCharacter)
                {charTag(FourthCharacter, characterPortraitsManagement(FourthCharacter))}:    Frase        
                               
            
            - fourthChar_ActualName has FourthF:
                    {
                        - ending.aether:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                {charTag(FourthCharacter, "neutral")}:       Mi chiamerò <b><i>{charNameFour}</b></i>.
                    ~  characterChangingObjects(FourthCharacter)
                {charTag(FourthCharacter, characterPortraitsManagement(FourthCharacter))}:    Frase        
                    
            - fourthChar_ActualName has FourthB:
                    {
                        - ending.air:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                {charTag(FourthCharacter, "neutral")}:       Io sono <b><i>{charNameFour}</b></i>.
                    ~  characterChangingObjects(FourthCharacter)
                {charTag(FourthCharacter, characterPortraitsManagement(FourthCharacter))}:    Frase        
                    
        }
        

            {
            - fourthChar_specialEvent == true:
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
    

        {charTag(FourthCharacter, characterPortraitsManagement(FourthCharacter))}:    Frase.
        -> fourth_char_closing_storylet ->
        -> close
            
     = exit
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


            
    -> close



    = close
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
        
        
        {charTag(FourthCharacter, characterPortraitsManagement(FourthCharacter))}:    Frase.

            {
                - fifthChar_storyStatus == story_storyStarted:
                    Salutami {charNameFour}.

            }

        

        -> fourth_char_closing_storylet ->
        -> endingPNGstory(FourthCharacter)