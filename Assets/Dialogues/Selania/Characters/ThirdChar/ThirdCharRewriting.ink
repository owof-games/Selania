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
    

        {charTag(ThirdCharacter, "neutral")}:                   La zia diceva che questo è il momento in cui dovrei fare una confessione strappalacrime e stracciamaroni in cui ti dico che la mia vita è terribile.
        {charTag(ThirdCharacter, "melanchonic")}:               E che non so come andare avanti senza i tuoi consigli.
        {charTag(ThirdCharacter, "jester")}:                    Ma non è così.
        {charTag(ThirdCharacter, "neutral")}:                   Forse qui ci dovevo venire dopo il Covid.
                                                                Anche se poi alla fine me ne sono venuto fuori.
                                                                Alla fine ora ho il mio lavoretto.
                                                                La mia tipa.
                                                                Il mio giro di amici.
        {charTag(ThirdCharacter, "jester")}:                    E anche qui alla fine mi sono trovato bene con tutti.
        {charTag(ThirdCharacter, "neutral")}:                   La zia mi adora.
            {
            - are_two_entities_together(FifthCharacter, PG):
            {charTag(Mentor, "hurry")}:                         Sei sfacciato, {charNameThree}!                        
            }   
        {charTag(ThirdCharacter, "neutral")}:                   Per {secondChar_storyStatus == story_storyStarted: Ricciolino|{charNameTwo}} sono come un secondo fratello.
            {
            - are_two_entities_together(SecondCharacter, PG):
            {charTag(SecondCharacter, "neutral")}:              Uh.                          
            }                                                          
        {charTag(ThirdCharacter, "neutral")}:                   E per quanto riguarda {charNameOne}...
        {
        - thirdChar_firstCharRage == true or grimoire_thirdChar has grimFirstThirdChar:
        {charTag(ThirdCharacter, "bored")}:                     Quella è pazza in culo.
                                                                Palesemente ce l'ha con tutti gli uomini.
        {charTag(ThirdCharacter, "jester")}:                    Quindi il problema è lei, non io.
            {
            - are_two_entities_together(FirstCharacter, PG):
            {charTag(FirstCharacter, "annoyed")}:               Prendersi mezza responsabilità: abilità sconosciuta.                         
            }
        - else:
        {charTag(ThirdCharacter, "neutral")}:                   Non credo di essergli stato tanto simpatico, ma va bene così.
                                                                Secondo me è una brava ragazza.
                                                                Si fa una botta di seghe mentali.
        {charTag(ThirdCharacter, "jester")}:                    Se la smettesse di stare su internet e pensare cose sceme sicuro che è più felice.
            {
            - are_two_entities_together(FirstCharacter, PG):
            {charTag(FirstCharacter, "annoyed")}:               Questa te la do come buona.                        
            }                                                        
        }
        {
        - are_two_entities_together(Franco, PG):
        {charTag(Franco, "question")}:                          E Franco? Franco cosa pensa?
        {charTag(ThirdCharacter, "jester")}:                    Zio, tu devi pensare meno.
                                                                E farti trovare pronto con la squadra del fantacalcio quando abbiamo finito questa robaccia!

        }
        {charTag(ThirdCharacter, "neutral")}:                   E con te, {player_name}?
                                                                Come sono andate le cose con te?                                                                                                        

        //Funzione di preparazione alla riscrittura
                ~  rewriting_prep(ThirdCharacter)

        -> third_char_closing_storylet ->

        + \ {charTag(PG, "neutral")}:                           Ti ho ascoltato, {charNameThree}, e posso aiutarti a riscrivere la tua storia.
            -> first_rewriting
        
        + \ {charTag(PG, "neutral")}:                           Mi prendo un attimo prima di affrontare la riscrittura.
        {charTag(ThirdCharacter, "bored")}:                     Che sia un attimo davvero, {player_name}!  
            -> main


=== first_rewriting
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    {charTag(ThirdCharacter, "jester")}:                        Spara tutte le tue cartucce!

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
    {charTag(ThirdCharacter, "neutral")}:       Ehi {player_name}!
                                                Spero mi riconosci!
                                                Sono, ero Boccale.
                                                Ho riflettuto a lungo sulle cose che mi hai detto, sai, e in particolare <>

            {
                - second_rewriting.ending.fire:
                    {charTag(ThirdCharacter, "neutral")}:           Alla cosa fuoco.
                
                - second_rewriting.ending.aether:
                    {charTag(ThirdCharacter, "neutral")}:           Alla cosa spirito.
                    
                - second_rewriting.ending.earth:
                    {charTag(ThirdCharacter, "neutral")}:           Alla cosa terra.

                - second_rewriting.ending.water:
                    {charTag(ThirdCharacter, "neutral")}:           Alla cosa acqua.

                - second_rewriting.ending.air:
                    {charTag(ThirdCharacter, "neutral")}:           Alla cosa aria.
                    
            }

            -> naming
                
    
    
    = naming
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    //non taggare il nome fino a quando non è stato dichiarato, sennò viene cambiato prima
        {

            - thirdChar_ActualName has Guantone:
                    {
                        - second_rewriting.ending.fire:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                                                                        Il mio vero nome è...
                 {charTag(ThirdCharacter, "neutral")}:     <b><i>{charNameThree}</b></i>.
            
            - thirdChar_ActualName has Canovaccio:
                    {
                        - second_rewriting.ending.water:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                                                            Mi chiamerò...
                    {charTag(ThirdCharacter, "neutral")}:     <b><i>{charNameThree}</b></i>.

            - thirdChar_ActualName has Sigaro:
                    {
                        - second_rewriting.ending.earth:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                                                        E il mio nome è...
            {charTag(ThirdCharacter, "neutral")}:     <b><i>{charNameThree}</b></i>.
                               
            
            - thirdChar_ActualName has Pallone:
                    {
                        - second_rewriting.ending.aether:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                                                                                Mi chiamerò...
                {charTag(ThirdCharacter, "neutral")}:     <b><i>{charNameThree}</b></i>.    
                    
            - thirdChar_ActualName has Forum:
                    {
                        - second_rewriting.ending.air:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                                                                Io sono...
                {charTag(ThirdCharacter, "neutral")}:     <b><i>{charNameThree}</b></i>.    
                    
        }
        
            {
            - thirdChar_specialEvent == true:
                -> secret_ending
            - else:
                -> close
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


    = close
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
        
        
        {charTag(ThirdCharacter, "neutral")}:       Che viaggione, vero?
                                                    Ora mi sa che faccio due chiacchiere con le altre!
                                                                    
        -> third_char_closing_storylet ->
        -> endingPNGstory(ThirdCharacter)        