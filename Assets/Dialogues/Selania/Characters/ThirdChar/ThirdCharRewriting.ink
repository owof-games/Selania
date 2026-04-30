=== rewriting_proposal_third_character
~ temp charNameTwo = translator(thirdChar_ActualName)
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
    ~ temp charNameTwo = translator(secondChar_ActualName)

            Va bene.

            //Avvio aggiornamento relazione + commento PNG + commento strega
                -> thirdAffinityCalc ->
                
            //Vado a svuotare i contatori di colore, così son tranquilla.
                -> storage_glyphs(ThirdCharacter) ->
            
            //E poi a thirda dello stato di inchiostro, mi sposto sulla domanda prevista      
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
        
        //Affrontiamo gli adulti in generale
            {charTag(PG, "neutral")}:      Hai detto che da quando nonna è nella casa dei vecchi fa tutto schifo.

            + \ {charTag(PG, "neutral")}:         Fuoco
                -> glyph_modifier_variation_management(ThirdCharacter, fireC)->

            
            + \ {charTag(PG, "neutral")}:         Acqua
                -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
 
                    
                    
            + \ {charTag(PG, "neutral")}:         Terra
                -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
   
                                
            + \ {charTag(PG, "neutral")}:         Aria
                    -> glyph_modifier_variation_management(ThirdCharacter, airC)->
      
    
            + \ {charTag(PG, "neutral")}:         Spirito
                -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
        
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
        

        {charTag(PG, "neutral")}:      A scuola le maestre dicono che sei cattivo, bugiardo, violento, e finisci sempre in punizione.

        + \ {charTag(PG, "neutral")}:         Terra
                -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
  

        + \ {charTag(PG, "neutral")}:         Aria
                -> glyph_modifier_variation_management(ThirdCharacter, airC)->

                   
        + \ {charTag(PG, "neutral")}:         Fuoco
                -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
  
                    
        + \ {charTag(PG, "neutral")}:         Acqua
                -> glyph_modifier_variation_management(ThirdCharacter, waterC)->

                   
        + \ {charTag(PG, "neutral")}:         Spirito
                -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
  
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
    ~ temp charNameTwo = translator(secondChar_ActualName)
    //Affrontiamo il mondo. Rabbia, bugie, fantasia, violenza etc.
            {charTag(PG, "neutral")}:      Tuo fratello dice che il mondo è orribile e che non si può più aggiustare.
            
    
        + \ {charTag(PG, "neutral")}:         Spirito
            -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
            

        + \ {charTag(PG, "neutral")}:         Acqua
            -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
            
                   
        + \ {charTag(PG, "neutral")}:         Fuoco
            -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
            
                    
        + \ {charTag(PG, "neutral")}:         Terra
            -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
            

        + \ {charTag(PG, "neutral")}:         Aria
            -> glyph_modifier_variation_management(ThirdCharacter, airC)->
            
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
        

        {charTag(PG, "neutral")}:      Hai detto che i grandi fanno schifo, e che non vuoi diventare grande.
        
            + \ {charTag(PG, "neutral")}:         Fuoco
                -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
        
            + \ {charTag(PG, "neutral")}:         Aria
                -> glyph_modifier_variation_management(ThirdCharacter, airC)->
            
            + \ {charTag(PG, "neutral")}:         Spirito
                -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
                
            + \ {charTag(PG, "neutral")}:         Acqua
                -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
                
            + \ {charTag(PG, "neutral")}:         Terra
                -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
                
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
        

        {charTag(PG, "neutral")}:      credo di aver compreso quale sia il tuo blocco, perché sei qui.
            
        //Check per commento strega
        -> rewriting_witch_feedback(endR) ->     
     
        + (fire)\ {charTag(PG, "neutral")}:         Fuoco
            -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
    
        + (aether)\ {charTag(PG, "neutral")}:        Spirito
            -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
        
        + (earth)\ {charTag(PG, "neutral")}:         Terra
            -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
            
        + (water)\ {charTag(PG, "neutral")}:         Acqua
            -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
                  
        + (air)\ {charTag(PG, "neutral")}:         Aria
            -> glyph_modifier_variation_management(ThirdCharacter, airC)->

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

            //Prima chiamo il moltiplicatore di colori, così che comunque le scelte fatte qui abbiano un impatto maggiore.
                -> glyph_modifier(ThirdCharacter, thirdChar_glyphVariation) ->
            
            //Poi aggiorniamo i colori, così il valore complessivo conta per la scelta del nome
                -> update_glyphs(ThirdCharacter) ->     
     
            //E infine genero il nome
                -> thirdNaming ->naming
                
    
    
    = naming
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    
        {

            - thirdChar_ActualName has Grizzly:
                    {
                        - ending.fire:
                            {charTag(ThirdCharacter, "neutral")}:       E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            {charTag(ThirdCharacter, "neutral")}:       Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                Il mio vero nome è <b><i>{charNameThree}</b></i>.
            
            - thirdChar_ActualName has Lupo:
                    {
                        - ending.water:
                            {charTag(ThirdCharacter, "neutral")}:       E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            {charTag(ThirdCharacter, "neutral")}:       Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                {charTag(ThirdCharacter, "neutral")}:       Mi chiamerò <b><i>{charNameThree}</b></i>.
              
            - thirdChar_ActualName has Delfino:
                    {
                        - ending.earth:
                            {charTag(ThirdCharacter, "neutral")}:       E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            {charTag(ThirdCharacter, "neutral")}:       Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                {charTag(ThirdCharacter, "neutral")}:       E il mio nome è <b><i>{charNameThree}</b></i>.
                               
            
            - thirdChar_ActualName has Capibara:
                    {
                        - ending.aether:
                            {charTag(ThirdCharacter, "neutral")}:       E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            {charTag(ThirdCharacter, "neutral")}:       Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                {charTag(ThirdCharacter, "neutral")}:       Mi chiamerò <b><i>{charNameThree}</b></i>.  
                    
            - thirdChar_ActualName has Corvo:
                    {
                        - ending.air:
                            {charTag(ThirdCharacter, "neutral")}:       E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            {charTag(ThirdCharacter, "neutral")}:       Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                {charTag(ThirdCharacter, "neutral")}:       Io sono <b><i>{charNameThree}</b></i>.
                    
        }
        

            {
            - thirdChar_specialEvent == true:
                -> secret_ending
            - else:
                -> exit
            }
    
    
    = secret_ending
    ~ temp charNameTwo = translator(secondChar_ActualName)
    

            {
                - grimoire_fifthChar hasnt grimMentorSecondSecretEnding && grimoire_fifthChar hasnt grimMentorFirstSecretEnding:
                    {charTag(TheWitch, witch_state())}:   <i>{charNameTwo} ripone piena fiducia in {player_name}, ed è pronto a condividere con {player_pronouns has him:lui|{player_pronouns has her:lei|ləi}} una informazione importante.
            }

        {charTag(ThirdCharacter, "neutral")}:           Frase.
        -> third_char_closing_storylet ->
        -> close
            
     = exit
     ~ temp charNameTwo = translator(secondChar_ActualName)
        {
            - contentsNest hasnt fireGlyph:
            {charTag(ThirdCharacter, "neutral")}:       Ah {player_name}, prima ho trovato una cosa in giro.
            ~ move_entity(fireGlyph, Nest)

        }
            
    -> close



    = close
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
        
        
        {charTag(ThirdCharacter, "neutral")}:           Frase.
        {charTag(ThirdCharacter, "neutral")}:       Salutami
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