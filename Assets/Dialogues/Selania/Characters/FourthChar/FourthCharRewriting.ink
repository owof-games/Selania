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

            //Avvio aggiornamento relazione + commento PNG + commento strega
                -> fourthAffinityCalc ->
                
            //Vado a svuotare i contatori di colore, così son tranquilla.
                ~ storage_glyphs(FourthCharacter)
            
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
        
        //Affrontiamo gli adulti in generale
            {charTag(PG, "neutral")}:      Hai detto che da quando nonna è nella casa dei vecchi fa tutto schifo.

            + \ {charTag(PG, "neutral")}:         Fuoco
                -> glyph_choice_manager(false, fireC)->

            
            + \ {charTag(PG, "neutral")}:         Acqua
                -> glyph_choice_manager(false, waterC)->
 
                    
                    
            + \ {charTag(PG, "neutral")}:         Terra
                -> glyph_choice_manager(false, earthC)->
   
                                
            + \ {charTag(PG, "neutral")}:         Aria
                    -> glyph_choice_manager(false, airC)->
      
    
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
        

        {charTag(PG, "neutral")}:      A scuola le maestre dicono che sei cattivo, bugiardo, violento, e finisci sempre in punizione.

        + \ {charTag(PG, "neutral")}:         Terra
                -> glyph_choice_manager(false, earthC)->
  

        + \ {charTag(PG, "neutral")}:         Aria
                -> glyph_choice_manager(false, airC)->

                   
        + \ {charTag(PG, "neutral")}:         Fuoco
                -> glyph_choice_manager(false, fireC)->
  
                    
        + \ {charTag(PG, "neutral")}:         Acqua
                -> glyph_choice_manager(false, waterC)->

                   
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
    //Affrontiamo il mondo. Rabbia, bugie, fantasia, violenza etc.
            {charTag(PG, "neutral")}:      Tuo fratello dice che il mondo è orribile e che non si può più aggiustare.
            
    
        + \ {charTag(PG, "neutral")}:         Spirito
            -> glyph_choice_manager(false, aetherC)->
            

        + \ {charTag(PG, "neutral")}:         Acqua
            -> glyph_choice_manager(false, waterC)->
            
                   
        + \ {charTag(PG, "neutral")}:         Fuoco
            -> glyph_choice_manager(false, fireC)->
            
                    
        + \ {charTag(PG, "neutral")}:         Terra
            -> glyph_choice_manager(false, earthC)->
            

        + \ {charTag(PG, "neutral")}:         Aria
            -> glyph_choice_manager(false, airC)->
            
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
        

        {charTag(PG, "neutral")}:      Hai detto che i grandi fanno schifo, e che non vuoi diventare grande.
        
            + \ {charTag(PG, "neutral")}:         Fuoco
                -> glyph_choice_manager(false, fireC)->
        
            + \ {charTag(PG, "neutral")}:         Aria
                -> glyph_choice_manager(false, airC)->
            
            + \ {charTag(PG, "neutral")}:         Spirito
                -> glyph_choice_manager(false, aetherC)->
                
            + \ {charTag(PG, "neutral")}:         Acqua
                -> glyph_choice_manager(false, waterC)->
                
            + \ {charTag(PG, "neutral")}:         Terra
                -> glyph_choice_manager(false, earthC)->
                
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
     
        + (fire)\ {charTag(PG, "neutral")}:         Fuoco
            -> glyph_choice_manager(false, fireC)->
    
        + (aether)\ {charTag(PG, "neutral")}:        Spirito
            -> glyph_choice_manager(false, aetherC)->
        
        + (earth)\ {charTag(PG, "neutral")}:         Terra
            -> glyph_choice_manager(false, earthC)->
            
        + (water)\ {charTag(PG, "neutral")}:         Acqua
            -> glyph_choice_manager(false, waterC)->
                  
        + (air)\ {charTag(PG, "neutral")}:         Aria
            -> glyph_choice_manager(false, airC)->

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

            //Prima chiamo il moltiplicatore di colori, così che comunque le scelte fatte qui abbiano un impatto maggiore.
                ~ glyph_modifier(FourthCharacter, fourthChar_glyphVariation)
            
            //Poi aggiorniamo i colori, così il valore complessivo conta per la scelta del nome
                ~ update_glyphs(FourthCharacter)  
     
            //E infine genero il nome
                ~ newName(FourthCharacter)

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