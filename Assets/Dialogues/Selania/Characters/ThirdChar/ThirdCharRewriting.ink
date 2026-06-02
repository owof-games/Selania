=== rewriting_proposal_third_character
//Così se decido di uscire dalla conversazione, posso riprendere da dove eravamo rimaste.
    {
        - grimoire_thirdChar hasnt grimThirdCharFirstProposal:
            -> confession
            
        - else:
            -> third_char_first_rewriting

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
                                                                Ma poi me ne sono venuto fuori.
                                                                Alla fine ora ho il mio lavoretto.
                                                                La mia tipa.
                                                                Il mio giro di amici.
        {charTag(ThirdCharacter, "jester")}:                    E anche qui mi sono trovato bene con tutti.
        {charTag(ThirdCharacter, "neutral")}:                   La zia mi adora.
            {
            - are_two_entities_together(FifthCharacter, PG):
            {charTag(Mentor, "hurry")}:                         Sei sfacciato, {charNameThree}!                        
            }   
        {charTag(ThirdCharacter, "neutral")}:                   Per {secondChar_storyStatus == story_storyStarted: fratellino|{charNameTwo}} sono come un secondo fratello.
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
        -> third_char_first_rewriting
        


=== third_char_first_rewriting
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

        {charTag(ThirdCharacter, "neutral")}:                   Ho una buona vita, non c'hai molto su cui lavorare, {player_name}.
        {charTag(ThirdCharacter, "jester")}:                    Quindi: spara tutte le tue cartucce e facciamola finita.
        
        + \ {charTag(PG, "neutral")}:                           Ti ho ascoltato, {charNameThree}, e posso aiutarti a riscrivere la tua storia.
        
        + \ {charTag(PG, "neutral")}:                           Mi prendo un attimo prima di affrontare la riscrittura.
        {charTag(ThirdCharacter, "bored")}:                     Non esiste.
        {charTag(ThirdCharacter, "neutral")}:                   Mi sono fatto tutta la sbatta di raccontarti le mie cazzate, di ascoltare i tuoi commenti e quelli degli altri.
                                                                Ora mi fai il favore di prenderti due minuti, dirmi due stronzate, e lasciarmi libero.                                                                                                                     
        -
            {
            - are_two_entities_together(FirstCharacter, PG):
            {charTag(FirstCharacter, "annoyed")}:               {player_name}, in bocca al lupo.
                ~  change_entity_place(FirstCharacter)                          
            }
            {
            - are_two_entities_together(SecondCharacter, PG):
            {charTag(SecondCharacter, "energy")}:               Intanto vado a fare una cosa segretissima con le api!
                ~  change_entity_place(SecondCharacter)                          
            }
            {
            - are_two_entities_together(FifthCharacter, PG):
            {charTag(Mentor, "sad")}:                           {charNameThree}, sono sicura che {player_name} abbia compreso ciò di cui hai davvero bisogno.
                ~  change_entity_place(FifthCharacter)                          
            }
            {
            - are_two_entities_together(Franco, PG):
            {charTag(Franco, "reading")}:                       Ignoratemi pure.
                                                                Finisco questo capitolo della bolletta del gas.
                                                                Non ho ancora capito se l'assassino è il maggiordomo.
                                                                E chi è questo PDR?                          
            }

            //A prescindere dallo stato d'inchiostro, qui si va solo verso un gruppo di scelte.   
            -> ending
    

    = ending
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

        //Blocco unico di scelte, ma con un check sullo stato inchiostro per far sì che alcune frasi dell'epilogo (come "E per questo ti dico") siano presenti dove necessario.
        {
            - thirdChar_InkLevel == ink_empty:
            {charTag(PG, "neutral")}:                           Credo di aver compreso quale sia il tuo blocco, perché sei qui.
        }    

        {charTag(PG, "neutral")}:                               Dal tuo arrivo hai detto che la tua vita va bene.
                                                                Che hai il tuo giro di amici, che hai Ava, il tuo lavoro.

        {
            - thirdChar_InkLevel == ink_empty:
            {charTag(PG, "neutral")}:                           E per questo ti dico {charNameThree}:
        }    

                                                                
        
        + \ {charTag(PG, "neutral")}:                           Per me ti sei arreso. L'unica cosa che ti appassiona è l'Inter.
            -> glyph_choice_manager(false, fireC)->
        {
        - grimoire_thirdChar has grimThirdCharFranco:
        {charTag(PG, "neutral")}:                               E spiegare il fantacalcio a Franco.
        }    
        {charTag(PG, "neutral")}:                               A lavoro ti sfruttano e non dici niente.
                                                                Il tuo gruppo di calcetto ti dice cose terribili e non dici niente.
                                                                Il tuo migliore amico ti ignora e non gli dici niente.
                                                                Detesti il tuo coinquilino e non gli dici niente.
                                                                E mi hai parlato molto più della tua ex che di Ava.




        + \ {charTag(PG, "neutral")}:                           Ho la sensazione che tu non sia per nulla in pace con la fine della storia con Donatella.
            -> glyph_choice_manager(false, waterC)->
        {charTag(PG, "neutral")}:                               Sicuramente sei innamorato di Ava.
                                                                Ma nel frattempo mi hai parlato di più di Donatella che non di lei.
        {
        - third_char_main_storylets.six.earth:              
                                                                Quando abbiamo parlato del Poggi, hai detto che se lei non ti avesse lasciato a quest'ora tu e lui stareste giocando assieme ai vostri figli.
        }                                                        
                                                                Sei ancora arrabbiato, forse ti manca, forse c'è qualcosa da chiarire, ma il rancore è vivo.
        {
        - grimoire_thirdChar has grimFirstThirdChar:
                                                                Basta vedere la violenza che è esplosa nella conversazione con {charNameOne}.    
        }                                                        

        {
        - third_char_main_storylets.two.aether:
                                                                E la soluzione non è portarsi a letto delle turiste ubriache.
        }         





        + \ {charTag(PG, "neutral")}:                           A lavoro ti fai il mazzo, eppure non hai niente.
            -> glyph_choice_manager(false, earthC)->
        {charTag(PG, "neutral")}:                               Quando hai parlato del tuo capo l'hai descritto come un idiota incapace.
                                                                E per questo finisce che fai il suo lavoro, che i fornitori ti chiamano mentre non sei in turno, così come i colleghi.
        {
        - third_char_main_storylets.one.aether2:
                                                                Lavori quasi tutte le sere, torni che sei distrutto, che non hai tempo per te.
        }                                                       
                                                                Hai fatto un lavoro che ti faceva sentire figo, ma ora?
                                                                I tuoi compagni di calcetto pensano che fai un lavoro da ragazzino.
                                                                E nel mentre vivi con un coinquilino che detesti.
                                                                




        + \ {charTag(PG, "neutral")}:                           Sono curios{player_pronoun has him:o|{player_pronoun has her:a|ə}}: perché sei in competizione con tutto, inclusi gli affetti?
                -> glyph_choice_manager(false, airC)->
        {
        - grimoire_thirdChar has grimThirdCharFranco:
        {charTag(PG, "neutral")}:                               Parlando con Franco di fantacalcio hai dimostrato la tua passione per la competitività.
                                                                Ma serve anche nelle relazioni?
        }          
        {charTag(PG, "neutral")}:                               Quando mi hai parlato dei tuoi compagni di calcetto hai messo in evidenza tutto quello che loro non hanno, e tu sì: chi una compagna, chi dei figli, chi denaro o successo.
                                                                Idem col Poggi.
                                                                Mentre quando mi hai parlato di Dona, sembra quasi che l'amore sia il premio che si riceve se si fanno le cose giuste, come non urlare contro chi ami, o non tradirla.
                                                                Mi hai sempre parlato di cose che accadono, di cose che fanno gli altri.
                                                                E c'è sempre un sottotono di paragone.




        + \ {charTag(PG, "neutral")}:                           C'è una grossa differenza tra un gruppo di conoscenti e uno di confidenti, e tu hai solo i primi.
            -> glyph_choice_manager(false, aetherC)->
        {charTag(PG, "neutral")}:                               Hai descritto Merlo come uno che se la sente e sei felice che non parli quando giocate.
                                                                Giova sembra solo uno stupido che si è sposato con una donna che non ama.
                                                                Dario è nel gruppo solo perché esce con la cugina di Giova.
                                                                E con Rocco, sembra che ci sia la possibilità di dirvi qualcosa di più, ma comunque non accade.
        {
        - grimoire_thirdChar has grimThirdCharMentor:
        {charTag(PG, "neutral")}:                               Discutendo con {charNameFive} hai detto che cerchi un'amicizia del fare.
                                                                Ma.
        }                                                        
                                                                Hai perso il tuo principale confidente, il Poggi, e l'unica cosa che fai è aspettare, non tirare fuori il problema.
                                                                Ma è evidente che ti manca.         
        -

                                                                Davvero è una buona vita questa {charNameThree}?
        {
        - grimoire_thirdChar has grimThirdCharMentor:
        {charTag(PG, "neutral")}:                               Come ti ha detto {charNameFive} quando avete discusso: le cose che proviamo sono vere.
                                                                E in qualche modo cercheranno di uscire, rischiando di fare e farci del male.
        }
        {
        - grimoire_thirdChar has grimWitchThirdChar:
        {charTag(PG, "neutral")}:                               E {witch_actualName} ti ha già detto che ci sono altre strade, altre possibilità.
                                                                E che ognuna può portarti nella vita di qualcuno capace di apprezzarti per come sei.        
        }                

            //Riduco di uno il livello di inchiostro nel caso in cui non fosse vuoto.
            {
                - thirdChar_InkLevel != ink_empty:
                    ~ thirdChar_InkLevel --
            }
            
            -> close

    
    
    = close
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
        {
            - thirdChar_InkLevel != ink_empty:
            {charTag(PG, "neutral")}:                           E per questo ti dico {charNameThree}:
        } 
        

        {charTag(ThirdCharacter, "neutral")}:                   Wow.
                                                                Wow.
                                                                Io.
        {charTag(ThirdCharacter, "angry")}:                     Non credo di mai essere stato così incazzato in vita mia.
                                                                Chi ti credi di essere per venirmi a dire cosa va o non va nella mia vita?
                                                                Ma chi cazzo ti conosce a te?
                                                                CHI
                                                                CAZZO
                                                                TI
                                                                CONOSCE?!?
        {charTag(ThirdCharacter, "neutral")}:                   Deve essere bella la tua vita, se hai così tanto tempo per sputare sentenze sugli altri.
        {charTag(ThirdCharacter, "jester")}:                    O deve fare davvero cagare, se l'unica cosa che ti viene da fare quando incontri qualcuno che sta bene, è provare a buttarlo a terra.
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "neutral")}:           Che uomo piccolo che sei, {player_name}.
                                                                Piccolo, meschino, schifoso.
                                                                Infido.
                                                                Scommetto che non hai amici, vero?
                                                                Che tristezza che mi fai.
                                                                Che tristezza.

                - thirdChar_recordedPlayerPronoun == her:
                {charTag(ThirdCharacter, "neutral")}:           Sicuro che sei frigida.
                                                                Insoddisfatta.
                                                                Magari c'hai anche un gatto vero?
                                                                E la sera ti scofani di patatine guardando reality di merda.
                                                                Sperando che qualcuno ti ami a te che sei acida.
                                                                Nevrotica.
                                                                Inchiavabile.
                                                                Poveraccia.

                - else:
                {charTag(ThirdCharacter, "neutral")}:           State lì a rompere coi vostri pronomi di merda voi.
                                                                Per poi sminchiare il cazzo a un povero cristiano che si fa i cazzi suoi.
                                                                Che è qui e nemmeno ci voleva venire, qui.
                                                                Ma invece di farlo tornare a casa.
                                                                Alla sua birra.
                                                                Al suo fantacalcio.
                                                                No.
                                                                Tu te lo sei tenuto qui, l'hai torturato con le tue cazzate.
                                                                E poi l'hai insultato per bene.
                {charTag(ThirdCharacter, "angry")}:             E ci scommetto che se ti dico quello che ho davvero in mente ora ci provi pure a cancellarmi, vero?
                                                                Che merda frustrata che sei.                                                
                }                                                                                                                                                                              
        {charTag(ThirdCharacter, "neutral")}:                   Bene.
                                                                Ho fatto quello che la zia mi ha chiesto di fare, per cui ora me ne posso andare.
                                                                Fanculo te.
                                                                Fanculo lei.
                                                                Fanculo questo posto.
        {charTag(ThirdCharacter, "jester")}:                    Spero di leggere presto da qualche parte che questa ciofeca è bruciata, così non vi mettete a torturare qualcun altro di nuovo.
                                                                E ti saluto col dito medio più grosso che tu abbia mai visto.
                                                                
        -> third_char_closing_storylet ->
        -> endingPNGstory(ThirdCharacter)



=== third_char_second_rewriting
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
                - third_char_second_rewriting.ending.fire:
                    {charTag(ThirdCharacter, "neutral")}:           Alla cosa fuoco.
                
                - third_char_second_rewriting.ending.aether:
                    {charTag(ThirdCharacter, "neutral")}:           Alla cosa spirito.
                    
                - third_char_second_rewriting.ending.earth:
                    {charTag(ThirdCharacter, "neutral")}:           Alla cosa terra.

                - third_char_second_rewriting.ending.water:
                    {charTag(ThirdCharacter, "neutral")}:           Alla cosa acqua.

                - third_char_second_rewriting.ending.air:
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
                        - third_char_second_rewriting.ending.fire:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                                                                        Il mio vero nome è...
                 {charTag(ThirdCharacter, "neutral")}:     <b><i>{charNameThree}</b></i>.
            
            - thirdChar_ActualName has Canovaccio:
                    {
                        - third_char_second_rewriting.ending.water:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                                                            Mi chiamerò...
                    {charTag(ThirdCharacter, "neutral")}:     <b><i>{charNameThree}</b></i>.

            - thirdChar_ActualName has Sigaro:
                    {
                        - third_char_second_rewriting.ending.earth:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                                                        E il mio nome è...
            {charTag(ThirdCharacter, "neutral")}:     <b><i>{charNameThree}</b></i>.
                               
            
            - thirdChar_ActualName has Cerchio:
                    {
                        - third_char_second_rewriting.ending.aether:
                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
                        - else:
                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
                    }
                                                                                Mi chiamerò...
                {charTag(ThirdCharacter, "neutral")}:     <b><i>{charNameThree}</b></i>.    
                    
            - thirdChar_ActualName has Forum:
                    {
                        - third_char_second_rewriting.ending.air:
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