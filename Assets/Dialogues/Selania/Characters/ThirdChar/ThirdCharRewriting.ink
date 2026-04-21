

=== rewriting_proposal_third_character
~ temp charNameTwo = translator(thirdChar_ActualName)
//Così se decido di uscire dalla conversazione, posso riprendere da dove eravamo rimaste.
    {
        - not confession:
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
    ~ temp mentorName = translator(mentor_ActualName)

        Da quando nonna è nella casa dei vecchi fa tutto schifo.
        @animation:RewriterBook
        Io voglio solo fare il bambino.
        -> third_char_closing_storylet ->

            + \ {charTag(PG, "neutral")}:         Ti ho ascoltato, {charNameThree}, e posso aiutarti a riscrivere la tua storia.
                -> rewriting
            
            + \ {charTag(PG, "neutral")}:         Capisco il tuo dolore, ma ho bisogno di riflettere un attimo.
                -> main


    = rewriting
    ~ temp charNameTwo = translator(secondChar_ActualName)

            Va bene.

            //Avvio aggiornamento relazione + \ {charTag(PG, "neutral")}:         commento PNG + \ {charTag(PG, "neutral")}:         commento strega
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
    ~ temp mentorName = translator(mentor_ActualName)


        {charTag(SecondCharacter, "judgmental")}:       Comunque possiamo cominciare quando vuoi.
        
        //Affrontiamo gli adulti in generale
            {charTag(PG, "neutral")}:      Hai detto che da quando nonna è nella casa dei vecchi fa tutto schifo.

            + \ {charTag(PG, "neutral")}:         Tua nonna ti ha insegnato a lottare: lotta anche tu!
                -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
                E ti ha insegnato a barare!
                E a sputare nel caffè di chi ti fa male.
                {
                    - about_violence_and_peace:
                        Pensa a prima, a quando hai convinto {mentorName} a chiederti scusa.
                        Sapevi di avere ragione, e per questo hai ottenuto quello di cui avevi bisogno.
                }
                    
            
            + \ {charTag(PG, "neutral")}:         I tuoi genitori sono infelici, {charNameTwo}, prova a comprenderli.
                -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
                Tutti i litigi, la fuga di tuo padre.
                Il modo in cui si arrabbia per tutto.
                Le paure di tua mamma.
                Sono cose che puoi capire, che vivi anche tu.
                    
                    
            + \ {charTag(PG, "neutral")}:         Tuo fratello però ha trovato la gioia anche in questo casino.
                -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
                Ci sono le sue statue, c'è il suo amico.
                {
                    -third_char_main_storylets.eleven:
                        E quando sei a casa sua, ti lascia sperimentare con le cose di casa.
                }

                                
            + \ {charTag(PG, "neutral")}:         E la casa dei vecchi è un posto attrezzato, organizzato.
                    -> glyph_modifier_variation_management(ThirdCharacter, airC)->
                Una persona anziana ha bisogno di cure, {charNameTwo}.
                Di persone che le diano quello di cui ha bisogno.
                È giusto che tu senta la sua mancanza.
                Ma sarebbe la cosa giusta per lei, riportarla a casa?
                    
    
            + \ {charTag(PG, "neutral")}:         Ma è grazie al pianto che puoi essere diverso da loro.
                -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
                Tu tieni agli animali.
                A tuo fratello.
                Alla nonna.
                E anche a loro.
                Puoi imparare a fidarti.
                    
            
        -
            ~ numberQuestion ++    
        {charTag(SecondCharacter, "judgmental")}:       Sì no boh.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral
        Continua.
        
            {
                - story_endedStories == ():
                    {charTag(TheWitch, witch_state())}:   <i>{player_name} ha utilizzato la sua prima goccia di inchiostro per compiere una riscrittura.
            }        

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
        ~ temp mentorName = translator(mentor_ActualName)

        {charTag(PG, "neutral")}:      A scuola le maestre dicono che sei cattivo, bugiardo, violento, e finisci sempre in punizione.

        + \ {charTag(PG, "neutral")}:         Le bugie alla fine sono solo storie. Usale per divertirti.
                -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
  

        + \ {charTag(PG, "neutral")}:         Tutto a questo mondo cambia. Anche un bambino cocciuto e bugiardo.
                -> glyph_modifier_variation_management(ThirdCharacter, airC)->

                   
        + \ {charTag(PG, "neutral")}:         La rabbia è parte della tua vita, della tua famiglia: trasformala.
                -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
  
                    
        + \ {charTag(PG, "neutral")}:         Ma non sei solo questo: sei gentile, sei curioso, sei divertente.
                -> glyph_modifier_variation_management(ThirdCharacter, waterC)->

                   
        + \ {charTag(PG, "neutral")}:         Eppure hai trovato il modo di fare pace con {mentorName}.
                -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
  
                   

        -
        ~ numberQuestion ++     
        {charTag(ThirdCharacter, "neutral")}:       Non ci avevo pensato, pensato davvero.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #portrait:riccio_neutral
        Che posso fare qualcosa per gli animali.
        
            {
                - story_endedStories == ():
                    {charTag(TheWitch, witch_state())}:   <i>{player_name} ha utilizzato la sua thirda goccia di inchiostro per procedere con la riscrittura.
            }         
        
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
            
    
        + \ {charTag(PG, "neutral")}:         Eppure ci sono le associazioni che proteggono gli animali.
            -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
            

        + \ {charTag(PG, "neutral")}:         Eppure tuo fratello ama il suo ragazzo.
            -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
            
                   
        + \ {charTag(PG, "neutral")}:         Eppure tuo fratello lotta contro tuo padre perché tu stia meglio.
            -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
            
                    
        + \ {charTag(PG, "neutral")}:         Ma sai anche trovare la fantasia e la giocosità nel mondo.
            -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
            

        + \ {charTag(PG, "neutral")}:         Eppure sistematicamente tuo fratello per lavoro aggiusta le cose.
            -> glyph_modifier_variation_management(ThirdCharacter, airC)->
            
                   
        -

        ~ numberQuestion ++        
        {charTag(ThirdCharacter, "neutral")}:       Si no boh.
        
            {
                - story_endedStories == ():
                    {charTag(TheWitch, witch_state())}:   <i>{player_name} ha utilizzato la terza goccia di inchiostro, proponendo una riscrittura.
            }         
        
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
        ~ temp mentorName = translator(mentor_ActualName)

        {charTag(PG, "neutral")}:      Hai detto che i grandi fanno schifo, e che non vuoi diventare grande.
        
            + \ {charTag(PG, "neutral")}:         Ma puoi essere un adulto combattente, come tua nonna.
                -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
                
                        
        
            + \ {charTag(PG, "neutral")}:         Ma puoi essere un adulto curioso e studioso, come un po' già sei.
                -> glyph_modifier_variation_management(ThirdCharacter, airC)->

                

            
            + \ {charTag(PG, "neutral")}:         Ma puoi essere un adulto in cerca di uno scopo più grande, come {charNameOne}.
                -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
                
                    
            + \ {charTag(PG, "neutral")}:         Ma puoi essere un adulto che si prende cura delle persone, come {mentorName}.
                -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
                E rendere più facile la vita all3 altr3.
                

            + \ {charTag(PG, "neutral")}:         Ma puoi essere un adulto creativo, come tuo fratello.
                -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
                
                        

        -
        ~ numberQuestion ++       
        {charTag(ThirdCharacter, "neutral")}:       Posso essere un adulto buono.
        
            {
                - story_endedStories == ():
                    {charTag(TheWitch, witch_state())}:   <i>{player_name} ha utilizzato la quarta e ultima unità di inchiostro, compiendo il massimo di riscritture possibili.
            }  
            
            -> ending

    
    = ending
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

        {charTag(PG, "neutral")}:      credo di aver compreso quale sia il tuo blocco, perché sei qui.
            
            {
                - story_endedStories == ():
                    {charTag(TheWitch, witch_state())}:   <i>{player_name} sta per utilizzare il potere dell'<b><i>epilogo</b></i>.
                
                - else:
                    {charTag(TheWitch, witch_state())}:   <i>Quale <b><i>epilogo</b></i> proporrà {player_name}?   
            }     
     
        + (fire)\ {charTag(PG, "neutral")}:         Diventa il più forte, il più coraggioso.
            -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
            
                    
    
        + (aether)\ {charTag(PG, "neutral")}:         Tutti abbiamo paura. Condividi questa paura con le altre persone.
            -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
            
                   

        + (earth)\ {charTag(PG, "neutral")}:         L'opposto della paura è la curiosità.
            -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
            
                   
                
        + (water)\ {charTag(PG, "neutral")}:         I tuoi genitori sono spaventati, aiutatevi a vicenda.
            -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
            
                   
      
        + (air)\ {charTag(PG, "neutral")}:         Con la tua intelligenza puoi rendere il mondo migliore.
            -> glyph_modifier_variation_management(ThirdCharacter, airC)->
            
                   
    
        -
    //Nota: la parte di accettazione del nome è prima dell'aggiornamento, così il nome nuovo compare solo quando viene dichiarato.
    {charTag(ThirdCharacter, "neutral")}:       Sì.

            {
                - ending.fire:
                    {charTag(ThirdCharacter, "neutral")}:       Non ci avevo mai pensato, che il fatto che sono bugiardo e dispettoso può rendermi indistruttibile.
                
                - ending.aether:
                    {charTag(ThirdCharacter, "neutral")}:       Non è che vedo sempre che anche le altre persone hanno paura.
                    

                - ending.earth:
                    {charTag(ThirdCharacter, "neutral")}:       Mi piace quella cosa che hai detto sulla curiosità perché è vera.
                    Curioso sempre, curioso forte!

                - ending.water:
                    {charTag(ThirdCharacter, "neutral")}:       Io non ci avevo mica pensato che anche i miei genitori hanno paura.

                - ending.air:
                    {charTag(ThirdCharacter, "neutral")}:       Hai detto che la mia intelligenza può fare felici le altre persone.
                    
                    
            }
    {charTag(ThirdCharacter, "neutral")}:       Cavoli, quante parole che ho in testa!     

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
    ~ temp mentorName = translator(mentor_ActualName)
    
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
    ~ temp mentorName = translator(mentor_ActualName)

            {
                - not rewriting_proposal_second_character.secret_ending or not rewriting_proposal_first_character.secret_ending:
                    {charTag(TheWitch, witch_state())}:   <i>{charNameTwo} ripone piena fiducia in {player_name}, ed è pronto a condividere con {player_pronouns has him:lui|{player_pronouns has her:lei|ləi}} una informazione importante.
            }

        {charTag(ThirdCharacter, "neutral")}:       Voglio dirti una cosa {player_name}.
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
        ~ temp mentorName = translator(mentor_ActualName)
        
        {charTag(ThirdCharacter, "neutral")}:       Me ne vado.
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