=== rewriting_proposal_fifth_character
//Così se decido di uscire dalla conversazione, posso riprendere da dove eravamo rimaste.
    {
        - grimoire_fifthChar hasnt grimFifthCharProposal:
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
    

        {charTag(FifthCharacter, "neutral")}:           Frase.

        -> fifth_char_closing_storylet ->

            + \ {charTag(PG, "neutral")}:         Ti ho ascoltato, {charNameFive}, e posso aiutarti a riscrivere la tua storia.
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
                ~  rewriting_prep(FifthCharacter)
            
            //E poi a fiftha dello stato di inchiostro, mi sposto sulla domanda prevista      
                {
                    - fifthChar_InkLevel == ink_empty:
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
    


        {charTag(FifthCharacter, "neutral")}:           Frase.
        

            {charTag(PG, "neutral")}:      Frase

            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                -> glyph_choice_manager(false, fireC)->
                 {charTag(PG, "neutral")}:      Frase

            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                -> glyph_choice_manager(false, waterC)->
                 {charTag(PG, "neutral")}:      Frase
 
            + \ {charTag(PG, "neutral")}:         Terra
                -> glyph_choice_manager(false, earthC)->
                 {charTag(PG, "neutral")}:      Frase
                                
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                     {charTag(PG, "neutral")}:      Frase
    
            + \ {charTag(PG, "neutral")}:         Spirito
                -> glyph_choice_manager(false, aetherC)->
                 {charTag(PG, "neutral")}:      Frase
        
        -

            ~ numberQuestion ++    
        {charTag(FifthCharacter, "neutral")}:           Frase.

 

            {
            - fifthChar_InkLevel == ink_low:
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
        

        {charTag(FifthCharacter, "neutral")}:           Frase.
        

            {charTag(PG, "neutral")}:      Frase

            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                -> glyph_choice_manager(false, fireC)->
                 {charTag(PG, "neutral")}:      Frase

            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                -> glyph_choice_manager(false, waterC)->
                 {charTag(PG, "neutral")}:      Frase
 
            + \ {charTag(PG, "neutral")}:         Terra
                -> glyph_choice_manager(false, earthC)->
                 {charTag(PG, "neutral")}:      Frase
                                
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                     {charTag(PG, "neutral")}:      Frase
    
            + \ {charTag(PG, "neutral")}:         Spirito
                -> glyph_choice_manager(false, aetherC)->
                 {charTag(PG, "neutral")}:      Frase
        -
        ~ numberQuestion ++     
        {charTag(FifthCharacter, "neutral")}:           Frase.
        
            //Check per commento strega
            -> rewriting_witch_feedback(twoR) ->           
                 
        
            {
            - fifthChar_InkLevel == ink_normal:
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


            {charTag(FifthCharacter, "neutral")}:           Frase.
        

            {charTag(PG, "neutral")}:      Frase

            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                -> glyph_choice_manager(false, fireC)->
                 {charTag(PG, "neutral")}:      Frase

            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                -> glyph_choice_manager(false, waterC)->
                 {charTag(PG, "neutral")}:      Frase
 
            + \ {charTag(PG, "neutral")}:         Terra
                -> glyph_choice_manager(false, earthC)->
                 {charTag(PG, "neutral")}:      Frase
                                
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                     {charTag(PG, "neutral")}:      Frase
    
            + \ {charTag(PG, "neutral")}:         Spirito
                -> glyph_choice_manager(false, aetherC)->
                 {charTag(PG, "neutral")}:      Frase
            
        -

        ~ numberQuestion ++        
        {charTag(FifthCharacter, "neutral")}:           Frase.
        
            //Check per commento strega
            -> rewriting_witch_feedback(threeR) ->          
        
            {
            - fifthChar_InkLevel == ink_medium:
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
        

                {charTag(FifthCharacter, "neutral")}:           Frase.
        

            {charTag(PG, "neutral")}:      Frase

            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                -> glyph_choice_manager(false, fireC)->
                 {charTag(PG, "neutral")}:      Frase

            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                -> glyph_choice_manager(false, waterC)->
                 {charTag(PG, "neutral")}:      Frase
 
            + \ {charTag(PG, "neutral")}:         Terra
                -> glyph_choice_manager(false, earthC)->
                 {charTag(PG, "neutral")}:      Frase
                                
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
                     {charTag(PG, "neutral")}:      Frase
    
            + \ {charTag(PG, "neutral")}:         Spirito
                -> glyph_choice_manager(false, aetherC)->
                 {charTag(PG, "neutral")}:      Frase
                
        -
        ~ numberQuestion ++       
        {charTag(FifthCharacter, "neutral")}:           Frase.
        
            //Check per commento strega
            -> rewriting_witch_feedback(fourR) ->  
            
            -> ending

    
    = ending
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
        

        {charTag(FifthCharacter, "neutral")}:           Frase.
            
        //Check per commento strega
        -> rewriting_witch_feedback(endR) ->     
     
        + (fire)\ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
            -> glyph_choice_manager(false, fireC)->
            {charTag(FifthCharacter, "neutral")}:           Frase.
    
        + (aether)\ {charTag(PG, "neutral")}:        Spirito
            -> glyph_choice_manager(false, aetherC)->
            {charTag(FifthCharacter, "neutral")}:           Frase.
        
        + (earth)\ {charTag(PG, "neutral")}:         Terra
            -> glyph_choice_manager(false, earthC)->
            {charTag(FifthCharacter, "neutral")}:           Frase.
            
        + (water)\ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
            -> glyph_choice_manager(false, waterC)->
            {charTag(FifthCharacter, "neutral")}:           Frase.
                  
        + (air)\ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità dietro questa cosa? Cosa significa veramente?
            -> glyph_choice_manager(false, airC)->
            {charTag(FifthCharacter, "neutral")}:           Frase.

        -
    //Nota: la parte di accettazione del nome è prima dell'aggiornamento, così il nome nuovo compare solo quando viene dichiarato.
    {charTag(FifthCharacter, "neutral")}:       Sì.

            {
                - ending.fire:
                    {charTag(FifthCharacter, "neutral")}:           Frase.
                
                - ending.aether:
                    {charTag(FifthCharacter, "neutral")}:           Frase.
                    
                - ending.earth:
                    {charTag(FifthCharacter, "neutral")}:           Frase.

                - ending.water:
                    {charTag(FifthCharacter, "neutral")}:           Frase.

                - ending.air:
                    {charTag(FifthCharacter, "neutral")}:           Frase.
                    
            }

    {charTag(FifthCharacter, "neutral")}:           Frase.  

            //E andiamo a cambiare il nome
                ~ rewriting_end(FifthCharacter)

            ->naming
                
    
    
    = naming
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    
        {

            - fifthChar_ActualName has FifthE:
                    {
                        - ending.fire:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                Il mio vero nome è <b><i>{charNameFive}</b></i>.
                    ~  characterChangingObjects(FifthCharacter)
                {charTag(FifthCharacter, characterPortraitsManagement(FifthCharacter))}:    Frase    
            
            - fifthChar_ActualName has FifthC:
                    {
                        - ending.water:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                {charTag(FifthCharacter, "neutral")}:       Mi chiamerò <b><i>{charNameFive}</b></i>.
                    ~  characterChangingObjects(FifthCharacter)
                {charTag(FifthCharacter, characterPortraitsManagement(FifthCharacter))}:    Frase       
              
            - fifthChar_ActualName has FifthD:
                    {
                        - ending.earth:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                {charTag(FifthCharacter, "neutral")}:       E il mio nome è <b><i>{charNameFive}</b></i>.
                    ~  characterChangingObjects(FifthCharacter)
                {charTag(FifthCharacter, characterPortraitsManagement(FifthCharacter))}:    Frase        
                               
            
            - fifthChar_ActualName has FifthF:
                    {
                        - ending.aether:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                {charTag(FifthCharacter, "neutral")}:       Mi chiamerò <b><i>{charNameFive}</b></i>.
                    ~  characterChangingObjects(FifthCharacter)
                {charTag(FifthCharacter, characterPortraitsManagement(FifthCharacter))}:    Frase       
                    
            - fifthChar_ActualName has FifthB:
                    {
                        - ending.air:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                {charTag(FifthCharacter, "neutral")}:       Io sono <b><i>{charNameFive}</b></i>.
                    ~  characterChangingObjects(FifthCharacter)
                {charTag(FifthCharacter, characterPortraitsManagement(FifthCharacter))}:    Frase       
                    
        }
        

            {
            - fifthChar_specialEvent == true:
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
    

        {charTag(FifthCharacter, characterPortraitsManagement(FifthCharacter))}:    Frase.
        -> fifth_char_closing_storylet ->
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
        
        
        {charTag(FifthCharacter, characterPortraitsManagement(FifthCharacter))}:    Frase.
            {
                - fourthChar_storyStatus == story_storyStarted:
                    Salutami {charNameFour}.
            }

        

        -> fifth_char_closing_storylet ->
        -> endingPNGstory(FifthCharacter)