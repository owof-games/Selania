=== rewriting_proposal_third_character
//Così se decido di uscire dalla conversazione, posso riprendere da dove eravamo rimaste.
    {
        - grimoire_thirdChar hasnt grimThirdCharFirstProposal:
            -> confession
            
        - else:
            -> first_rewriting

    }
    
    = confession
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(ThirdCharacter, "neutral")}:           Non ho niente da dire, levami da questa situazione.

        -> third_char_closing_storylet ->

            + \ {charTag(PG, "neutral")}:               Ti ho ascoltato, {charNameThree}, e posso aiutarti a riscrivere la tua storia.
                -> first_rewriting
            
            + \ {charTag(PG, "neutral")}:               Capisco il tuo dolore, ma ho bisogno di riflettere un attimo.
                -> main


=== first_rewriting
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

            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                -> glyph_choice_manager(false, fireC)->
            {charTag(PG, "neutral")}:               Commento
            
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                -> glyph_choice_manager(false, waterC)->
            {charTag(PG, "neutral")}:               Commento    
                    
            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                -> glyph_choice_manager(false, earthC)->
            {charTag(PG, "neutral")}:               Commento   
                                
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
            {charTag(PG, "neutral")}:               Commento      
    
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                -> glyph_choice_manager(false, aetherC)->
            {charTag(PG, "neutral")}:               Commento        
        -

              
        {charTag(ThirdCharacter, "neutral")}:           Frase.

            //Riduco di uno il livello di inchiostro
                ~ thirdChar_InkLevel --

            //Check per commento strega
            -> rewriting_witch_feedback(oneR) ->       

            {
                - thirdChar_InkLevel == ink_empty:
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

            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                -> glyph_choice_manager(false, fireC)->
            {charTag(PG, "neutral")}:               Commento
            
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                -> glyph_choice_manager(false, waterC)->
            {charTag(PG, "neutral")}:               Commento    
                    
            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                -> glyph_choice_manager(false, earthC)->
            {charTag(PG, "neutral")}:               Commento   
                                
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
            {charTag(PG, "neutral")}:               Commento      
    
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                -> glyph_choice_manager(false, aetherC)->
            {charTag(PG, "neutral")}:               Commento        
        -
           
        {charTag(ThirdCharacter, "neutral")}:           Frase.

            //Riduco di uno il livello di inchiostro
                ~ thirdChar_InkLevel --
        
            //Check per commento strega
            -> rewriting_witch_feedback(twoR) ->           
                 
            //Andiamo al finale
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

        {charTag(ThirdCharacter, "neutral")}:     No mi spiace non mi faccio riscrivere, fine.


            
        -> close
        
    
    


    = close
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
        
        
        -> third_char_closing_storylet ->
        -> endingPNGstory(ThirdCharacter)





=== second_rewriting
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


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

            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                -> glyph_choice_manager(false, fireC)->
            {charTag(PG, "neutral")}:               Commento
            
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                -> glyph_choice_manager(false, waterC)->
            {charTag(PG, "neutral")}:               Commento    
                    
            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                -> glyph_choice_manager(false, earthC)->
            {charTag(PG, "neutral")}:               Commento   
                                
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
            {charTag(PG, "neutral")}:               Commento      
    
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                -> glyph_choice_manager(false, aetherC)->
            {charTag(PG, "neutral")}:               Commento        
        -

              
            //Riduco di uno il livello di inchiostro
                ~ thirdChar_InkLevel --

            //Check per commento strega
            -> rewriting_witch_feedback(oneR) ->       

            {
                - thirdChar_InkLevel == ink_empty:
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

            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                -> glyph_choice_manager(false, fireC)->
            {charTag(PG, "neutral")}:               Commento
            
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                -> glyph_choice_manager(false, waterC)->
            {charTag(PG, "neutral")}:               Commento    
                    
            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                -> glyph_choice_manager(false, earthC)->
            {charTag(PG, "neutral")}:               Commento   
                                
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
            {charTag(PG, "neutral")}:               Commento      
    
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                -> glyph_choice_manager(false, aetherC)->
            {charTag(PG, "neutral")}:               Commento        
        -


            //Riduco di uno il livello di inchiostro
                ~ thirdChar_InkLevel --
        
            //Check per commento strega
            -> rewriting_witch_feedback(twoR) ->           
                 
        
            {
                - thirdChar_InkLevel == ink_empty:
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

            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                -> glyph_choice_manager(false, fireC)->
            {charTag(PG, "neutral")}:               Commento
            
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                -> glyph_choice_manager(false, waterC)->
            {charTag(PG, "neutral")}:               Commento    
                    
            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                -> glyph_choice_manager(false, earthC)->
            {charTag(PG, "neutral")}:               Commento   
                                
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
            {charTag(PG, "neutral")}:               Commento      
    
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                -> glyph_choice_manager(false, aetherC)->
            {charTag(PG, "neutral")}:               Commento        
        -



            //Riduco di uno il livello di inchiostro
                ~ thirdChar_InkLevel --
        
            //Check per commento strega
            -> rewriting_witch_feedback(threeR) ->          
        
            {
                - thirdChar_InkLevel == ink_empty:
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

            + \ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
                -> glyph_choice_manager(false, fireC)->
            {charTag(PG, "neutral")}:               Commento
            
            + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                -> glyph_choice_manager(false, waterC)->
            {charTag(PG, "neutral")}:               Commento    
                    
            + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                -> glyph_choice_manager(false, earthC)->
            {charTag(PG, "neutral")}:               Commento   
                                
            + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                    -> glyph_choice_manager(false, airC)->
            {charTag(PG, "neutral")}:               Commento      
    
            + \ {charTag(PG, "neutral")}:         Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
                -> glyph_choice_manager(false, aetherC)->
            {charTag(PG, "neutral")}:               Commento        
                
        -
             

            //Riduco di uno il livello di inchiostro
                ~ thirdChar_InkLevel --
        
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
     
        + (fire)\ {charTag(PG, "neutral")}:         Cosa vuoi? Come puoi cambiare questa situazione?
            -> glyph_choice_manager(false, fireC)->
        {charTag(PG, "neutral")}:               Commento    

        + (aether)\ {charTag(PG, "neutral")}:        Qual è la verità? Come sta/starà la comunità per via di questo evento/scelta?
            -> glyph_choice_manager(false, aetherC)->
        {charTag(PG, "neutral")}:               Commento    

        + (earth)\ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
            -> glyph_choice_manager(false, earthC)->
        {charTag(PG, "neutral")}:               Commento       

        + (water)\ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
            -> glyph_choice_manager(false, waterC)->
        {charTag(PG, "neutral")}:               Commento    

        + (air)\ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
            -> glyph_choice_manager(false, airC)->
        {charTag(PG, "neutral")}:               Commento    
        -

    {charTag(TheWitch, witch_state())}: Come vuole chiudere la lettera {player_name}?

        + (fire2)\ {charTag(PG, "neutral")}:         Saluto fuoco
            -> glyph_choice_manager(false, fireC)->
        {charTag(PG, "neutral")}:               Commento    

        + (aether2)\ {charTag(PG, "neutral")}:       Saluto spirito
            -> glyph_choice_manager(false, aetherC)->
        {charTag(PG, "neutral")}:               Commento    

        + (earth2)\ {charTag(PG, "neutral")}:        Saluto terra
            -> glyph_choice_manager(false, earthC)->
        {charTag(PG, "neutral")}:               Commento       

        + (water2)\ {charTag(PG, "neutral")}:         Saluto acqua
            -> glyph_choice_manager(false, waterC)->
        {charTag(PG, "neutral")}:               Commento    

        + (air2)\ {charTag(PG, "neutral")}:        Saluto aria
            -> glyph_choice_manager(false, airC)->
        {charTag(PG, "neutral")}:               Commento    
    -
    ->->




=== third_char_post_rewriting


    //Nota: la parte di accettazione del nome è prima dell'aggiornamento, così il nome nuovo compare solo quando viene dichiarato.
    {charTag(ThirdCharacter, "neutral")}:       Saluto.

            {
                - second_rewriting.ending.fire:
                    {charTag(ThirdCharacter, "neutral")}:           Frase.
                
                - second_rewriting.ending.aether:
                    {charTag(ThirdCharacter, "neutral")}:           Frase.
                    
                - second_rewriting.ending.earth:
                    {charTag(ThirdCharacter, "neutral")}:           Frase.

                - second_rewriting.ending.water:
                    {charTag(ThirdCharacter, "neutral")}:           Frase.

                - second_rewriting.ending.air:
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
                        - second_rewriting.ending.fire:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                                                                        Il mio vero nome è...
                    ~  characterChangingObjects(ThirdCharacter)
                 {charTag(ThirdCharacter, "neutral")}:     <b><i>{charNameThree}</b></i>.
            
            - thirdChar_ActualName has ThirdC:
                    {
                        - second_rewriting.ending.water:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                                                            Mi chiamerò...
                    ~  characterChangingObjects(ThirdCharacter)
                    {charTag(ThirdCharacter, "neutral")}:     <b><i>{charNameThree}</b></i>.

            - thirdChar_ActualName has ThirdD:
                    {
                        - second_rewriting.ending.earth:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                                                        E il mio nome è...
                    ~  characterChangingObjects(ThirdCharacter)
            {charTag(ThirdCharacter, "neutral")}:     <b><i>{charNameThree}</b></i>.
                               
            
            - thirdChar_ActualName has ThirdF:
                    {
                        - second_rewriting.ending.aether:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                                                                                Mi chiamerò...
                    ~  characterChangingObjects(ThirdCharacter)
                {charTag(ThirdCharacter, "neutral")}:     <b><i>{charNameThree}</b></i>.    
                    
            - thirdChar_ActualName has ThirdB:
                    {
                        - second_rewriting.ending.air:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                                                                Io sono...
                    ~  characterChangingObjects(ThirdCharacter)
                {charTag(ThirdCharacter, "neutral")}:     <b><i>{charNameThree}</b></i>.    
                    
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
                    {charTag(TheWitch, witch_state())}:   <i>{charNameTwo} ripone piena fiducia in {player_name}, ed è pronto a condividere con {player_pronoun has him:lui|{player_pronoun has her:lei|ləi}} una informazione importante.
            }

        {charTag(ThirdCharacter, "neutral")}:     Frase.
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
            {charTag(ThirdCharacter, "neutral")}:     Ah {player_name}, prima ho trovato una cosa in giro.
            ~ move_entity(fireGlyph, Nest)

        }
            
    -> close



    = close
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
        
        
        {charTag(ThirdCharacter, "neutral")}:     Frase.
                                                                                    Salutami
            {
                - secondChar_storyStatus == story_storyStarted:
                    E {charNameTwo}.

            }
            {
                - firstChar_storyStatus == story_storyStarted:
                    E anche {charNameOne}.

            }
        
        E mentore o altro.

        -> third_char_closing_storylet ->
        -> endingPNGstory(ThirdCharacter)        