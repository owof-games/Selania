=== second_char_main_storylets

= one
    //Obiettivo: Presentare l’elemento delle bugie. Vengono dette cose sconfessate poi nella terza storia.
    //Contenuto: Compleanno, giochi
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
        
        {charTag(SecondCharacter, "energy")}:                   Ma tu perché sei qui?
            
            + (capire) \ {charTag(PG, "neutral")}:              Questo luogo è insolito e voglio studiarlo, capirlo.
                    -> glyph_modifier_variation_management(SecondCharacter, airC)->
            {charTag(SecondCharacter, "energy")}:               Anche a me mi piace capire le cose.
            {charTag(SecondCharacter, "melanchonic")}:          I grandi si arrabbiano se faccio troppe domande. 
            {charTag(SecondCharacter, "energy")}:               Perché c'è la neve ma non fa freddo? 
                                                                Perché c'è una stazione ma non passa nessun treno?
            {charTag(SecondCharacter, "angry")}:                Perché c'è una porta vicino alla stazione ma non ci posso entrare?

            + (rilassante)\ {charTag(PG, "neutral")}:           C'è qualcosa di rilassante, non trovi?
                    -> glyph_modifier_variation_management(SecondCharacter, earthC)->
            {charTag(SecondCharacter, "neutral")}:              Sì no boh.
                                                                Mi annoiano le cose rilassanti.
            {charTag(SecondCharacter, "energy")}:               Mentre ti aspettavo ho studiato la stazione.
                                                                E devo capire cos'è quella cosa sul tabellone.
            {charTag(SecondCharacter, "neutral")}:              E la porta nell'albero, non mi ci fa mica entrare!
     
            + (tu)\ {charTag(PG, "neutral")}:                   Bimbo, sta a me chiedertelo: perché sei qui?
                    -> glyph_modifier_variation_management(SecondCharacter, fireC)->
            {charTag(SecondCharacter, "angry")}:                Boh, che ne so? 
            {charTag(SecondCharacter, "neutral")}:              Ero a scuola, ed era l'ora di ginnastica.
                                                                Mi sono chiuso a leggere in bagno.
                                                                Non mi sarà mica addormentato?                                                
                
            + (difficoltà)\ {charTag(PG, "neutral")}:           Qui posso aiutare chi è in difficoltà.
                    -> glyph_modifier_variation_management(SecondCharacter, waterC)->
            {charTag(SecondCharacter, "emotional")}:            Come il veterinario?
            {charTag(SecondCharacter, "neutral")}:              O come la maestra di ginnastica che dice di aiutarmi.
            {charTag(SecondCharacter, "angry")}:                Ma poi mi sgrida se sbaglio?
                    
            + (me)\ {charTag(PG, "neutral")}:                   Per capire meglio chi sono.
                    -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
            {charTag(SecondCharacter, "energy")}:               Non sai chi sei?
            {charTag(SecondCharacter, "melanchonic")}:          A me mi piacerebbe essere un'altra persona a volte.
            {charTag(SecondCharacter, "neutral")}:              O un labrador, così se mi rotolo nel fango tutti ridono e non si arrabbiano.
            {charTag(SecondCharacter, "melanchonic")}:          Ma non un gatto: sapevi che i gatti non sentono mica il sapore dolce?
                                                                Che cosa triste!
            -    
        
        {charTag(SecondCharacter, "energy")}:                   Io sono qui perché è il mio compleanno.
        {charTag(SecondCharacter, "emotional")}:                Mamma mi ha promesso qualcosa di FI-GHIS-SI-MOOOOOOOOOOOOO!
                                                                L'anno scorso per Natale mi ha preso tutte tutte tutte le action figures dei miei videogiochi preferiti.
        {charTag(SecondCharacter, "angry")}:                    Ma poi papà me le ha rubate. 

            {
                - are_two_entities_together(Mentor, PG):
                    {charTag(Mentor, "sad")}:                   Oh povera anima!
            }

        {charTag(SecondCharacter, "energy")}:                   Ma lui mica ci può venire qui.
        {charTag(SecondCharacter, "emotional")}:                Perché mamma ha detto che mi dava qualcosa di bellissimo che papà non può rubare.
        {charTag(SecondCharacter, "energy")}:                   Ma dove trovo le caramelle?
        {charTag(SecondCharacter, "melanchonic")}:              Mamma dice sempre che non c'è compleanno senza caramelle!
            {
                - are_two_entities_together(FirstCharacter, PG):
                    {charTag(FirstCharacter, "annoyed")}:       Ho bisogno di bere. 
                                                                Troppe energie. 
                                                                Troppe.
            }

            + (twoAir) \ {charTag(PG, "neutral")}:              Però il compleanno arriva sempre, a prescindere dalle caramelle.
                    -> glyph_modifier_variation_management(SecondCharacter, airC)->
            {charTag(SecondCharacter, "neutral")}:              Forse la data. 
                                                                Quella sì.
            {charTag(SecondCharacter, "energy")}:               Ma il compleanno è un'altra cosa.
                                                                È il momento in cui tutti ti devono volere bene.
            {charTag(SecondCharacter, "energy")}:               E infatti lo puoi festeggiare in ritardo e comunque è il tuo compleanno!
                    
                
            + (twoEarth) \ {charTag(PG, "neutral")}:            Niente caramelle, ma c'è uno stagno dove nuotare!
                    -> glyph_modifier_variation_management(SecondCharacter, earthC)->
            {charTag(SecondCharacter, "energy")}:               WOOOOOOOOOOW!
            {charTag(SecondCharacter, "melanchonic")}:          Non avevo mai visto uno stagno!
            {charTag(SecondCharacter, "emotional")}:            Però questa estate ho visto un mare gigantesco.
                                                                Più grande anche del cielo!
            {charTag(SecondCharacter, "energy")}:               Quello qui non c'è di sicuro!
                                                                Ma era comunque freddo e mamma aveva paura che ci annegavo.    
    
            + (twoFire) \ {charTag(PG, "neutral")}:             E poi ti sei arrabbiato e hai ripreso i giocattoli, giusto?
                    -> glyph_modifier_variation_management(SecondCharacter, fireC)->
            {charTag(SecondCharacter, "angry")}:                Non sono mica giocattoli.
                                                                Sono AC-TION-FI-GU-RE-S!
            {charTag(SecondCharacter, "melanchonic")}:          E non me le sono riprese.
            {charTag(SecondCharacter, "neutral")}:              Papà è buono, fino a quando non si arrabbia.
            {charTag(SecondCharacter, "melanchonic")}:          E non voglio farlo arrabbiare.
                    
            + (twoWater) \ {charTag(PG, "neutral")}:            Vuoi molto bene alla tua mamma?
                    -> glyph_modifier_variation_management(SecondCharacter, waterC)->
            {charTag(SecondCharacter, "emotional")}:            Sì sì sì. 
            {charTag(SecondCharacter, "neutral")}:              Lei è la mamma migliore del pianeta.
                                                                Dell'universo.
                    
            + (twoAether) \ {charTag(PG, "neutral")}:           Quindi, rubandoti i giochi, tuo papà ti ha fatto un favore.
                    -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
            {charTag(SecondCharacter, "neutral")}:              Sì no boh.
            {charTag(SecondCharacter, "angry")}:                Non ha mica senso quello che dici.
                                                                Papà non mi deve prendere mica le mie cose.
            {charTag(SecondCharacter, "neutral")}:              Detesto quando fa così.
            -
        {charTag(SecondCharacter, "angry")}:                    Ma sai che io non mi ricordo mica il mio nome?
        {charTag(SecondCharacter, "neutral")}:                  Però non so come mai ma {not tutorial_mentorTalkingChoiceRelationship:il fiore parlante|{mentorName}} e {charNameOne} mi chiamano {charNameTwo}.
        - (nameSecond)

            {
                - are_two_entities_together(FirstCharacter, PG): 
                        {charTag(FirstCharacter, "annoyed")}:   Ehm, non so se ti sei visto riflesso ama, ma, ehm. 
            }
            {
                - are_two_entities_together(Mentor, PG): 
                        {charTag(Mentor, "sad")}:               Perché come un riccio hai la faccina tenera ma spini come pochi, ragazzo.
            }  
        {charTag(SecondCharacter, "energy")}:                   Dove saranno i miei compagni di scuola?
                                                                Devi assolutamente trovarli!
            {
                - are_two_entities_together(Mentor, PG):
                    {charTag(Mentor, "sad")}:                   Altri bambini? Ma questo posto è pieno di pericoli!
            }
               
        -> second_char_closing_storylet ->
        -> main
   
    = two
    //Non mettere cose TW qui
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        {charTag(SecondCharacter, "emotional")}:            Non sai che cosa fighissima!
                                                            Prima ho visto una rana allo stagno.
        {
            - are_two_entities_together(Mentor, PG): 
            {charTag(Mentor, "bored")}:                     Non ci sono rane in questo posto!
            {charTag(SecondCharacter, "angry")}:            Però io lo vista, e non dico mica bugie!
            {charTag(Mentor, "neutral")}:                   Ma come Mentore di dico che.
            {charTag(SecondCharacter, "angry")}:            Devi mentorare meno e andare a vedere!
                    ~ move_entity(Mentor, Pond)
        }

        {charTag(SecondCharacter, "energy")}:               So tuuuuuutto sulle rane!
                                                            Che mica chiudono gli occhi per dormire.
                                                            E che alcune sono velenose.
                                                            E velenoso e tossico non sono la stessa cosa.
        {charTag(SecondCharacter, "neutral")}:              Nonna dice che se lo lecchi e stai male, è tossico.
                                                            Se lo tocchi e stai male, è velenoso.
                                                            E se ti guarda e stai male, è mamma.
        {
            - are_two_entities_together(FirstCharacter, PG):
        {charTag(FirstCharacter, "affectionate")}:          ADORO!
        }
        {charTag(SecondCharacter, "energy")}:               E so altre cose sulle rane.
                                                            Ma non ho mai visto una rana parlare.
                                                            O promettere dei doni.
        {charTag(SecondCharacter, "emotional")}:            E quella dello stagno mi ha parlato.
        {charTag(SecondCharacter, "neutral")}:              Ma mi ha detto che il dono invece è per te.
        {
            - second_char_main_storylets.one.me:
            {charTag(SecondCharacter, "energy")}:           Magari ti aiuta a capire chi sei, come mi hai detto prima! 
        }
        {charTag(SecondCharacter, "angry")}:                Gliel'ho detto che è il mio compleanno e che quindi il dono deve essere per me.
        {charTag(SecondCharacter, "neutral")}:              Ma mi ha detto che non saprei che farci coi suoi doni.
        {charTag(SecondCharacter, "melanchonic")}:          Saranno broccoli?
        
            + \ {charTag(PG, "neutral")}:                   Una cosa mai accaduta è comunque ragionevolmente possibile.
                    -> glyph_modifier_variation_management(SecondCharacter, airC)->
            {charTag(SecondCharacter, "emotional")}:        Quindi mi credi?
                                                            Quindi tutto è possibile?
            {charTag(SecondCharacter, "energy")}:           Anche che salto e volo?
                                                            O che la serra diventa di cioccolato?
                                                            O che.
            {charTag(SecondCharacter, "neutral")}:          Ho finito le idee.
            
            + \ {charTag(PG, "neutral")}:                   Magari è qualcosa di buono da mangiare!
                    -> glyph_modifier_variation_management(SecondCharacter, earthC)->
            {charTag(SecondCharacter, "emotional")}:        Posso mangiarlo anche io?!?
            {charTag(SecondCharacter, "energy")}:           Magari è una torta di cioccolato.
            {charTag(SecondCharacter, "neutral")}:          Ma senza liquore!
            {charTag(SecondCharacter, "energy")}:           E con la panna e le fragole.
                                                            E le caramelle dentro!
            {
                - are_two_entities_together(FirstCharacter, PG): 
                {charTag(FirstCharacter, "neutral")}:       Il sogno di ogni dentista.
            }      

            + \ {charTag(PG, "neutral")}:                   E se lo senti e prudono le orecchie è una bugia.
                    -> glyph_modifier_variation_management(SecondCharacter, fireC)->
            {charTag(SecondCharacter, "angry")}:            Non sono sto dicendo bugie!
                                                            Mi piacciono gli animali.
                                                            Non mi serve inventare altri animali perché quelli che ci sono mi piacciono già.
            {charTag(SecondCharacter, "neutral")}:          E la rana c'è, vai a vedere!
                    
            + \ {charTag(PG, "neutral")}:                   Sembra una rana molto gentile.
                    -> glyph_modifier_variation_management(SecondCharacter, waterC)->
            {charTag(SecondCharacter, "emotional")}:        A me mi sta simpatica.
            {charTag(SecondCharacter, "neutral")}:          E non credo sia tossica o velenosa.
            {charTag(SecondCharacter, "melanchonic")}:      Però anche io vorrei un regalo.
            {charTag(SecondCharacter, "energy")}:           Se non ti piace mi dai quello che ti dà?
                                                            Spero tanto sia un cucciolo!

            + \ {charTag(PG, "neutral")}:                   Deve essere una rana molto saggia.
                -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
            {charTag(SecondCharacter, "neutral")}:          Non lo so, ha detto le cose in modo buffo.
            {charTag(SecondCharacter, "energy")}:           Ha anche usato una parolaccia.
            {
                - are_two_entities_together(Mentor, PG): 
                {charTag(Mentor, "bored")}:                 Davanti a un bambino?!?
            }
            {charTag(SecondCharacter, "neutral")}:          Però mi ha anche detto che "tutto è dove deve stare".
            {charTag(SecondCharacter, "melanchonic")}:      Che non mi ha aiutato molto perché gli ho chiesto le caramelle.
                                                            E dovrebbero stare nella mia pancia, ma non ci sono.   

            - (franco)
                         
            {charTag(SecondCharacter, "energy")}:           Su!
                                                            Vai a vederla, ora!
         

            -> second_char_closing_storylet ->
            -> options_second_character

    = three
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        {charTag(SecondCharacter, "energy")}:               Mica mi hai detto come ti chiami.
        {charTag(SecondCharacter, "neutral")}:              Cioè: io lo so perché me l'ha detto {charNameOne}.
        {charTag(SecondCharacter, "energy")}:               Ma me lo devi dire tu, no?
        {charTag(SecondCharacter, "neutral")}:              Sennò è maleducato.
  
        - (top)
            * Prima dimmi il tuo.
                {charTag(SecondCharacter, "angry")}:        Ti ho già detto che non me lo ricordo.
                    -> top
            + \ {charTag(PG, "neutral")}:                   {name_choice} Mi chiamo {player_name}.
    	    + \ {charTag(PG, "neutral")}:                   Il mio nome è...
    	        -> name_choice ->
    	        -> gender ->
            -

        {charTag(SecondCharacter, "energy")}:               Io mi faccio chiamare {charNameTwo} qui.
                                                            E i ricci mi piacciono.
        {charTag(SecondCharacter, "neutral")}:              Ma non so mica se voglio essere uno di loro.
    	        
            {
                - player_pronouns has him:
                    -> him_liar
                - player_pronouns has her:
                    -> her_liar
                - player_pronouns has they:
                    -> they_liar
            }       
                    
        = him_liar
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
            
        {charTag(SecondCharacter, "emotional")}:            Comunque sono contento che sei un maschio.
                                                            Le ragazze sono appiccicose.
        {
            - are_two_entities_together(FirstCharacter, PG):
            {charTag(FirstCharacter, "annoyed")}:           Dio che fatica gli uomini.
                                                            Anche quando hanno sei anni.
            {charTag(SecondCharacter, "angry")}:            Non sono <i>così</i> piccolo!
        }
        {
            -grimoire_appendices hasnt grimChoicesMentor:
            {charTag(SecondCharacter, "neutral")}:          il fiore parlante è appiccicoso.
            - else:
            {charTag(SecondCharacter, "neutral")}:          {mentorName} è appiccicosa.
        }
        {charTag(SecondCharacter, "angry")}:                Vuole fare amicizia a tutti i costi.
        {charTag(SecondCharacter, "neutral")}:              Che fatica.
        {
            - are_two_entities_together(Mentor, PG):
                ~ change_entity_place(Mentor)
            {charTag(SecondCharacter, "neutral")}:          Uh, se ne è andata.     
        }
        {charTag(SecondCharacter, "melanchonic")}:          La mamma si è dimenticata di nuovo il mio compleanno.
                                                            Ma non mi serve anche un'altra nonna.
        {charTag(SecondCharacter, "energy")}:               A te piacciono le action figures?
        {charTag(SecondCharacter, "melanchonic")}:          Tutti i miei compagni di classe ne hanno, ma io no.
        {charTag(SecondCharacter, "neutral")}:              Mamma fa sempre storie se le chiedo di comprarmi qualcosa.
                                                            Ne avevo una di Kratos.
                                                            Ma mamma voleva buttarla perché dice che è troppo violento per un bambino.
                                                            E che non devo diventare violento.
        {charTag(SecondCharacter, "emotional")}:            E così l'ho regalata a mio fratello.
                                                            E quando vado a trovarlo posso vederla.
        {charTag(SecondCharacter, "energy")}:               E posso giocare con la Switch.
            -> three_continue
        
        = her_liar
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        {charTag(SecondCharacter, "neutral")}:              Ah.
                                                            Sei una ragazza quindi.
                                                            Non ci parlo mica molto con le ragazze, siete strane.
        {
            - are_two_entities_together(FirstCharacter, PG):
            {charTag(FirstCharacter, "annoyed")}:           Disse quello che prima stava studiando le sue stesse caccole.
            {charTag(SecondCharacter, "neutral")}:          Per la scienza!
        }            	  
        {charTag(SecondCharacter, "energy")}:               Devo ancora capire se sei strana anche tu, {player_name}.
        {charTag(SecondCharacter, "neutral")}:              Anche mamma è strana.
                                                            Ma le voglio bene.
        {charTag(SecondCharacter, "melanchonic")}:          Anche se a volte si dimentica le cose.
        {charTag(SecondCharacter, "angry")}:                Però se lo faccio io si arrabbia.
        {charTag(SecondCharacter, "melanchonic")}:          Il mese scorso mi sono dimenticato dell'anniversario suo e di papà e non mi ha parlato tutto il giorno.
        {charTag(SecondCharacter, "neutral")}:              Pensava che non le voglio bene.
        {charTag(SecondCharacter, "melanchonic")}:          Ma poi lei oggi si è dimenticata il mio compleanno.
                                                            Non so nemmeno se sa che sono qui.
            -> three_continue
        
        = they_liar
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

        {charTag(SecondCharacter, "neutral")}:              Mmm.
                                                            Capito.
        {charTag(SecondCharacter, "emotional")}:            Anche io vorrei un pronome strano.
        {charTag(SecondCharacter, "melanchonic")}:          Ma poi mamma lo dice male, sicuro.
                                                            Già oggi si è dimenticata del mio compleanno.
                                                            E anche l'anno scorso.
        {charTag(SecondCharacter, "emotional")}:            Ma poi però mi ha regalato una action figure di Spider Man.
        {charTag(SecondCharacter, "melanchonic")}:          E mi ha chiesto scusa per due giorni.
                                                            Ma preferisco le Tartarughe Ninja.
                                                            Così poi vedo i coccodrilli delle fogne.
        {charTag(SecondCharacter, "energy")}:               Non ho mai visto un coccodrillo.
        {
            - are_two_entities_together(Mentor, PG):
            {charTag(Mentor, "sad")}:                       Solo io sono abbastanza vecchia da ricordare come va a finire questa storia?
        }
            -> three_continue
       
       
        = three_continue 
            ~ temp charNameOne = translator(firstChar_ActualName)
            ~ temp charNameTwo = translator(secondChar_ActualName)
            ~ temp charNameThree = translator(thirdChar_ActualName)
            ~ temp charNameFour = translator(fourthChar_ActualName)
            ~ temp charNameFive = translator(fifthChar_ActualName)
            ~ temp mentorName = translator(mentor_ActualName)
            //Definire meglio in base ai colori.
            
            + {him_liar} \ {charTag(PG, "neutral")}:        Prima hai detto di essere pieno di action figures.
                    -> glyph_modifier_variation_management(SecondCharacter, airC)->
            {charTag(SecondCharacter, "angry")}:            "Pieno" è un modo di dire.
            {charTag(SecondCharacter, "neutral")}:          Come "Furbo come una volpe".
                                                            O "Simpatico come {player_name}".
            
            + {him_liar} \ {charTag(PG, "neutral")}:        Non mi prendere in giro, hai detto che le action le ha rubate papà.
                    -> glyph_modifier_variation_management(SecondCharacter, fireC)->
            {charTag(SecondCharacter, "angry")}:            No.
                                                            Ricordi male.
                                                            Papà è bravo, non fa queste cose. 
            
            + {her_liar} \ {charTag(PG, "neutral")}:        Tua mamma è una che si arrabbia spesso?
                    -> glyph_modifier_variation_management(SecondCharacter, fireC)->
            {charTag(SecondCharacter, "melanchonic")}:      Un po'.
                                                            Non è cattiva, è che sono cattivo io.
            {charTag(SecondCharacter, "neutral")}:          E così perde la pazienza.
            {charTag(SecondCharacter, "melanchonic")}:      Ma è colpa mia.
            
            + {her_liar or they_liar} \ {charTag(PG, "neutral")}: Avevi detto che questo è il regalo di compleanno di tua mamma.
                    -> glyph_modifier_variation_management(SecondCharacter, airC)->
            {charTag(SecondCharacter, "neutral")}:          Sì no boh.
                                                            Anche.
            {charTag(SecondCharacter, "angry")}:            Uffi, che noia che fai!
                    
            
            + {they_liar} \ {charTag(PG, "neutral")}:       Ehi bimbo! Avevi detto che questo è il suo regalo di compleanno!
                    -> glyph_modifier_variation_management(SecondCharacter, fireC)->
            {charTag(SecondCharacter, "neutral")}:          Sì, certo che sì.
                                                            Si è dimenticata il compleanno, ma poi ha deciso di farmi questo.
                                                            Per scusarsi.
            {charTag(SecondCharacter, "emotional")}:        E poi mi prenderà un cane!
                   
                 
            + \ {charTag(PG, "neutral")}:                   Ci stai male quando mamma dimentica il tuo compleanno?
                    -> glyph_modifier_variation_management(SecondCharacter, waterC)->    
            {charTag(SecondCharacter, "melanchonic")}:      Un po'.
                                                            Ma solo perché fa tante promesse tutto l'anno.
                                                            E poi non succede mai niente.
            {charTag(SecondCharacter, "emotional")}:        Voglio festeggiarlo con mio fratello.
            {charTag(SecondCharacter, "melanchonic")}:      Ma poi papà si arrabbia.
                                                            E così non facciamo mai nulla.
            {charTag(SecondCharacter, "emotional")}:        E allora vado a letto prestissimo e correggo tutta la giornata.


            + \ {charTag(PG, "neutral")}:                   Però non mi hai detto il tuo nome. Sei una spia? Un gatto? Un gatto spia?
                    -> glyph_modifier_variation_management(SecondCharacter, earthC)->
            {charTag(SecondCharacter, "neutral")}:          Sì no boh.
            {charTag(SecondCharacter, "energy")}:           Una spia non direbbe mai che è una spia.
                                                            Oppure ti confonde, così non capisci cosa è vero o cosa no.
            {charTag(SecondCharacter, "angry")}:            Però tu non puoi mica farlo!
            
            + \ {charTag(PG, "neutral")}:                   Sembra che tua mamma ha tante preoccupazioni.
                    -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
            {charTag(SecondCharacter, "melanchonic")}:      Mamma è sempre preoccupata di tutto.
                                                            Mio fratello prova ad aiutarla, ma a volte si arrabbia perché lei non vuole.
                                                            Dice che ce la vuole fare da sola.
            {charTag(SecondCharacter, "neutral")}:          E anche io ci provo.
                                                            Lei dice che farsi aiutare è barare.
                                                            Nonna dice che a volte bisogna barare per andare avanti.
            -
            {charTag(SecondCharacter, "energy")}:           Forse dietro tutti quei fiori vicino allo stagno trovo qualche regalo!
                                                            Devo solo capire come andarci.
            {
                - are_two_entities_together(Mentor, PG): 
                {charTag(Mentor, "hurry")}:                 Ma perché non sistemi con me i vialetti?
                                                            È molto meno pericoloso!
                {charTag(SecondCharacter, "neutral")}:      Poi muoio di noia!
            }

            -> second_char_closing_storylet ->
            -> options_second_character
        
    
    = four
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        {charTag(SecondCharacter, "melanchonic")}:          Mi sono ricordato ora che non ho invitato nessun amico.
        {charTag(SecondCharacter, "melanchonic")}:          Mamma vuole che la festa sia solo per me.
        {charTag(SecondCharacter, "energy")}:               Ma non importa, perché questo posto è PIENO di animali!
        {charTag(SecondCharacter, "melanchonic")}:          Ma ho lasciato a casa il tablet.
        {charTag(SecondCharacter, "energy")}:               Come faccio a capire cosa fanno?
                                                            Sapevi che gli uccelli vedono dieci colori?
                                                            DIECI! Mica solo tre come noi!
                                                            E che l'acso, atso, axotolottoto.
        {
            - are_two_entities_together(Franco, PG):
            {charTag(Franco, "{portrait_Franco()}")}:       Botto!
                                                            Risotto!
                                                            Cucciolotto!
            {charTag(SecondCharacter, "energy")}:           Franco!
                                                            Così mi distraggo!
        }

        {charTag(SecondCharacter, "energy")}:               Sapevi che l'axolotl si fa ricrescere le braccia?

            + \ {charTag(PG, "neutral")}:                   Perché hai dato un calcio a {mentorName}?
                -> top
            + \ {charTag(PG, "neutral")}:                   <i>Lo lascio continuare.</i>
            -

        {
            - second_char_main_storylets.one.rilassante:
                {charTag(SecondCharacter, "neutral")}:      E tu prima hai detto che sei qui perché è un luogo rilassante.
                                                            Ma a me mi rilassano le cose buffe!
                {charTag(SecondCharacter, "energy")}:       Vuoi sapere una cosa buffissima?

        }    
        {charTag(SecondCharacter, "energy")}:               Le capre hanno dei loro accenti!
                                                            Non sono mica tutti dei beeeeeeeeee uguali!
                                                            Solo i colibrì sanno volare all'indietro!
        {charTag(SecondCharacter, "neutral")}:              Tu sai camminare indietro? Secondo me no.

            + \ {charTag(PG, "neutral")}:                   Perché hai dato un calcio a {mentorName}?
                -> top
            + \ {charTag(PG, "neutral")}:                   <i>Lo lascio continuare.</i>
            -
        {charTag(SecondCharacter, "energy")}:               I nasi dei cani sotto tutti diversi, non ci sono due cani con lo stesso naso.
                                                            E...
        {charTag(SecondCharacter, "melanchonic")}:          Ma mi sa che non mi stai mica ascoltando.
                                                            Come a scuola.
                                                            A scuola mi prendono in giro perché parlo solo di animali.
        {charTag(SecondCharacter, "neutral")}:              Ma sono comunque il più bravo!
            -> top

    - (top)
        {charTag(PG, "neutral")}:                           {mentorName} dice che prima le hai dato un calcio.
            
            + (razionale) \ {charTag(PG, "neutral")}:     Pensavo che uno scienziato come te fosse più razionale.
                    -> glyph_modifier_variation_management(SecondCharacter, airC)->
            {charTag(SecondCharacter, "angry")}:            Ehi! Mica mi chiedi perché lo fatto!
                                                            Vi odio.
                                                            Tu e lei.
                                                            Mi ha tirato il braccio.
                                                            E continuava a dire che i bambini qui
                                                            non
                                                            ci
                                                            devono
                                                            stare!
            {
                - are_two_entities_together(Mentor, PG):
                    ~ change_entity_place(Mentor)
            }                                               
                                                            Mi ha fatto arrabbiare.


            + (scherzo) \ {charTag(PG, "neutral")}:         Non c'erano modi più solidi per far valere le tue ragioni?
                    -> glyph_modifier_variation_management(SecondCharacter, earthC)->

            {charTag(SecondCharacter, "neutral")}:          Sì no boh.
                                                            Non ho pensato molto.
            {charTag(SecondCharacter, "neutral")}:          Perché ero arrabbiato.
            {charTag(SecondCharacter, "angry")}:            E lei continuava a dire che i bambini qui non ci possono stare.
            {charTag(SecondCharacter, "melanchonic")}:      Che non potevo saltare nello stagno.
            {charTag(SecondCharacter, "neutral")}:          E mi ha messo una mano sulla spalla.
            {charTag(SecondCharacter, "angry")}:            E a me
                                                            non
                                                            piace
                                                            quando
                                                            i grandi
                                                            mi toccano.
            {
                - are_two_entities_together(Mentor, PG):
                    ~ change_entity_place(Mentor)  
                {charTag(SecondCharacter, "neutral")}:      Se ne è andata.                                    
            }                                            
            
            + (stupido) \ {charTag(PG, "neutral")}:         Va bene difendersi, ma picchiare una vecchia è da stupidi.
                    -> glyph_modifier_variation_management(SecondCharacter, fireC)->
            {
                -are_two_entities_together(FirstCharacter, PG):
            {charTag(FirstCharacter, "annoyed")}:           Quindi se menava me andava bene?    
            }        
            {charTag(SecondCharacter, "angry")}:            Mi aveva preso il braccio!
                                                            E continuava a dire che sono un bambino e che i bambini qui non ci devono stare.
                                                            E che devo tornare a casa e io NON ci voglio tornare a casa.
            {
            - are_two_entities_together(Mentor, PG):
                ~ change_entity_place(Mentor)  
            {charTag(SecondCharacter, "neutral")}:          Se ne è andata.                                    
            }                                            
        
            {charTag(SecondCharacter, "melanchonic")}:      Non volevo picchiarla.
                                                            Volevo solo spingerla via.
                                                            Ma mi sono arrabbiato troppo.

            + (male) \ {charTag(PG, "neutral")}:            Si è sentita ferita, lo sai?
                    -> glyph_modifier_variation_management(SecondCharacter, waterC)->

                {charTag(SecondCharacter, "angry")}:        E a me che mi importa?
                                                            Mi ha sgridato perché facevo i salti nello stagno.
                                                            E poi mi ha detto che i bambini qui non ci devono stare.
                                                            E mi ha preso per la spalla.
                                                            Non mi piace quando mi toccano.
            {
                - are_two_entities_together(Mentor, PG):
                    ~ change_entity_place(Mentor)  
                {charTag(SecondCharacter, "neutral")}:      Se ne è andata.                                    
            }                                            
        

            + (ottenuto) \ {charTag(PG, "neutral")}:        Hai ottenuto quello che volevi?
                    -> glyph_modifier_variation_management(SecondCharacter, aetherC)->

            {charTag(SecondCharacter, "neutral")}:          Ha smesso di dirmi che non devo stare qui.
                                                            Che devo tornare a casa.
                                                            E ha smesso di stringermi la mia spalla.
            {
                - are_two_entities_together(Mentor, PG):
                    ~ change_entity_place(Mentor)  
                {charTag(SecondCharacter, "neutral")}:      Se ne è andata.                                    
            }                                            
                                                            Non le volevo fare mica male.
            {charTag(SecondCharacter, "angry")}:            Ma non mi piace quando i grandi mi toccano.
            -
        {charTag(SecondCharacter, "melanchonic")}:          {mentorName} è stata prepotente con me.
        {charTag(SecondCharacter, "angry")}:                Non mi piacciono gli adulti prepotenti.
        {
            - second_char_main_storylets.one.difficoltà:
                {charTag(SecondCharacter, "neutral")}:      Prima hai detto che sei qui per aiutare chi è in difficoltà.
                                                            Io ora sto male.
                                                            Aiutami.
        }
        {charTag(SecondCharacter, "angry")}:                Se {mentorName} non mi lascia in pace chiamo mio fratello.
        {charTag(SecondCharacter, "emotional")}:            Lui è superforte.
        {
            - are_two_entities_together(FirstCharacter, PG):
            {charTag(FirstCharacter, "neutral")}:           Io.
            {charTag(FirstCharacter, "annoyed")}:           Ma davvero {mentorName} ha.
            {charTag(FirstCharacter, "sad")}:               Merda.
                                                            Mi ero dimenticata quanto fosse schifoso essere bambini.
        }

        -> second_char_closing_storylet ->
        -> options_second_character

    = five
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
        {
            - are_two_entities_together(Mentor, PG):
                ~ change_entity_place(Mentor)                                    
        }                                            
            
        {charTag(SecondCharacter, "angry")}:                {mentorName} si vuole comportare come la mia nonna.
        {charTag(SecondCharacter, "emotional")}:            Ma la mia nonna non mi tratta mai come un bambino.
        {
            - second_char_main_storylets.one.tu:
        {charTag(SecondCharacter, "angry")}:                Mica come hai fatto tu prima quando non mi hai risposto e mi hai chiesto cosa facevo qui.
        }
        {charTag(SecondCharacter, "energy")}:               Mi ha anche insegnato come barare a carte.
                                                            E come aprire il cassetto dei dolci di mamma.
                                                            E a sputare nel caffè di chi ti fa male.
        {
            - second_char_main_storylets.four.razionale:
            {charTag(SecondCharacter, "angry")}:            E non mi dire di nuovo che devo essere più razionale, come prima!
            
            - second_char_main_storylets.four.scherzo:
            {charTag(SecondCharacter, "energy")}:           Forse è questo lo scherzo da fare a {mentorName}!
                                                            Devo solo trovare il caffè.
        }
        {charTag(SecondCharacter, "neutral")}:              Quando mamma e papà ci lasciavano a casa da soli mangiavamo sempre cose buone.
                                                            E guardavamo assieme la tele.
        {charTag(SecondCharacter, "energy")}:               E potevo scegliere cosa guardare.
        {charTag(SecondCharacter, "neutral")}:              Quando papà è andato via nonna ha aiutato mamma a stare bene.
        {charTag(SecondCharacter, "melanchonic")}:          Anche se a mamma mica piace la nonna.
        {charTag(SecondCharacter, "angry")}:                E quando papà è tornato ha ripreso a trattarla male.
                                                            Che rabbia.
        {charTag(SecondCharacter, "neutral")}:              Ma nonna dice che succede.
                                                            Che i grandi fanno cose cattive senza saperlo.
                                                            Mi spiace essere scappato di casa.
        {
            - are_two_entities_together(FirstCharacter, PG):
            {charTag(FirstCharacter, "sad")}:               Se solo potessi ti porterei alla Rifugia, piccoletto.
                                                            Quello che racconti mi spezza il cuore.
            {charTag(SecondCharacter, "energy")}:           Al rifugio si mangia?
            {charTag(FirstCharacter, "affectionate")}:      C'è sempre un piatto di pasta per qualcuno.
        }        
        {charTag(SecondCharacter, "emotional")}:            Sai {player_name}, vorrei nonna qui. 
                                                            Sicuro le piace tantissimo questo posto.
        
            + \ {charTag(PG, "neutral")}:                   Non parli mai di tuo nonno. Deduco che non c'è più?
                    -> glyph_modifier_variation_management(SecondCharacter, airC)->
            {charTag(SecondCharacter, "neutral")}:          Se ne è andato quando papà era molto piccolo.
                                                            Più di me.
            {charTag(SecondCharacter, "melanchonic")}:      Ogni tanto scriveva delle lettere che facevano arrabbiare mamma.
                                                            Poi ha smesso.
            {charTag(SecondCharacter, "neutral")}:          Mamma dice che spera sia annegato in mare.
                                                            Ma papà tiene tutte le sue lettere nascoste nel garage.
                    
            + \ {charTag(PG, "neutral")}:                   Insegni a barare anche a me?
                    -> glyph_modifier_variation_management(SecondCharacter, earthC)->
            {charTag(SecondCharacter, "energy")}:           Ho una idea!
                                                            Troviamo delle carte.
                                                            Ti insegno come si bara.
                                                            E poi stracciamo {mentorName}.
            {charTag(SecondCharacter, "angry")}:            Così la smette di dirmi cosa non devo fare.
                    
            + \ {charTag(PG, "neutral")}:                   Tua nonna sembra una tipa forte!
                    -> glyph_modifier_variation_management(SecondCharacter, fireC)->
            {charTag(SecondCharacter, "neutral")}:          "Forte"?
            {charTag(SecondCharacter, "energy")}:           Quanto sei {player_pronouns has him:vecchio|{player_pronouns has her:vecchia|vecchiə}}?
            {charTag(SecondCharacter, "emotional")}:        Però sì, lei spacca proprio.
                                                            Una volta ha lanciato una ciabatta in faccia a papà perché l'ha chiamata strega.
                                                            E poi gli ha sputato di nascosto nel caffè.
                                                            E lui si è arrabbiato perché io ridevo mentre lo beveva.
            {charTag(SecondCharacter, "energy")}:           Abbiamo tantissimi segreti lei e io!
                    
                
            + \ {charTag(PG, "neutral")}:                   Ti manca casa? Vorresti tornarci?
                    -> glyph_modifier_variation_management(SecondCharacter, waterC)->
            {charTag(SecondCharacter, "neutral")}:          Sì no boh.
                                                            Voglio tornare.
            {charTag(SecondCharacter, "melanchonic")}:      Ma se poi mamma si arrabbia?
                                                            O papà?
            {charTag(SecondCharacter, "emotional")}:        Voglio andare da mio fratello.
                                                            Lì mi piace.
            {charTag(SecondCharacter, "melanchonic")}:      Ma non piaccio al suo amico.
                
            + \ {charTag(PG, "neutral")}:                   Quando i grandi hanno paura, fanno cose cattive.
                    -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
            {charTag(SecondCharacter, "neutral")}:          Papà dice che i grandi non hanno paura.
                                                            Ma non gli credo.
            {charTag(SecondCharacter, "emotional")}:        Mio fratello a volte ha paura che l'amico lo lascia.
            {charTag(SecondCharacter, "neutral")}:          Mamma delle bollette.
            {charTag(SecondCharacter, "energy")}:           Nonna non ha paura di nulla.
                                                            Però si arrabbia tanto quando gioca a briscola.
            -

        {charTag(SecondCharacter, "melanchonic")}:          Mi spiace, {player_name}. 
        {
            - second_char_main_storylets.four.stupido:
                {charTag(SecondCharacter, "angry")}:        Anche se mi hai chiamato stupido.
        }
        {charTag(SecondCharacter, "melanchonic")}:          Prima ho detto delle bugie.
                                                            Non è vero che mamma mi ha mandato qui.
                                                            Ma volevo così tanto avere un bel compleanno.
                                                            Uff.
                                                            Ora capisco perché mi chiamate {charNameTwo}
        {charTag(SecondCharacter, "emotional")}:            Però adoro stare qui!
                                                            Questo posto è pieno di animali!
        {charTag(SecondCharacter, "neutral")}:              E nessuno si arrabbia con me.
        {charTag(SecondCharacter, "angry")}:                A parte {mentorName}.
        {
            - second_char_main_storylets.four.male:
        {charTag(SecondCharacter, "melanchonic")}:          Ma mi spiace che c'è rimasta male prima per la spinta.
        }
        {charTag(SecondCharacter, "neutral")}:              Ti prometto che non dirò più bugie.
                                                            Ora però lasciami solo.
            -> second_char_closing_storylet ->
            -> options_second_character
    

    = six
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
        {charTag(SecondCharacter, "neutral")}:              Prima, con {mentorName}.
                                                            Mi ha fatto male perché mi ha fatto pensare a scuola.
        {
            - are_two_entities_together(Mentor, PG):
                    ~ change_entity_place(Mentor)
                                                            Ma è andata via!
        } 
        {charTag(SecondCharacter, "melanchonic")}:          Anche a scuola danno sempre la colpa a me. 
        {charTag(SecondCharacter, "neutral")}:              Non mi piace mica tanto la scuola.
        {charTag(SecondCharacter, "melanchonic")}:          I ragazzi più grandi mi fanno male.
        {charTag(SecondCharacter, "neutral")}:              Ma io non piango.
        {charTag(SecondCharacter, "angry")}:                Non sono una femmina.
        {charTag(SecondCharacter, "neutral")}:              E sono più forte di loro.
        {charTag(SecondCharacter, "melanchonic")}:          Ma non coi pugni.
        {charTag(SecondCharacter, "neutral")}:              E le ragazze della mia età sono strane.
        {charTag(SecondCharacter, "melanchonic")}:          E mi dicono che. 
        {charTag(SecondCharacter, "neutral")}:              No, non te lo dico mica.
        {
            - are_two_entities_together(FirstCharacter, PG):
            {charTag(FirstCharacter, "annoyed")}:           Strane, non lo so. 
                                                            Ma anche le bimbe possono essere crudeli, quello sì.
        } 
        {charTag(SecondCharacter, "angry")}:                Le maestre mi mettono sempre in castigo.
                                                            Se mi nascondo nell'armadio perché ho sonno.
                                                            Se spingo gli altri per terra.
        {charTag(SecondCharacter, "melanchonic")}:          Se mi distraggo.
        {charTag(SecondCharacter, "emotional")}:            Una volta nonna, quando stava bene, è venuta e ha urlato a tutte le maestre.
        {charTag(SecondCharacter, "neutral")}:              Ora sono un po' più gentili.
                                                            Ma quella di matematica dice sempre che le dispiace per me.
        {charTag(SecondCharacter, "angry")}:                E non mi piace quando fa così.

            + \ {charTag(PG, "neutral")}:                   È provato che anche i maschi piangono, e pure gli orsi e gli elefanti.
                    -> glyph_modifier_variation_management(SecondCharacter, airC)->
            {charTag(SecondCharacter, "neutral")}:          Gli orsi mi piacciono.
                                                            Sono forti.
                                                            Ma comunque piangono.
            {charTag(SecondCharacter, "energy")}:           Questa è una cosa nuova.
            {charTag(SecondCharacter, "neutral")}:          E mi piace.
                                                            Ma non so se mi piace piangere.
    
            + \ {charTag(PG, "neutral")}:                   Un posto in cui star seduti tutte quelle ore è una tortura.
                    -> glyph_modifier_variation_management(SecondCharacter, earthC)->
            {charTag(SecondCharacter, "energy")}:           ESATTO!
            {charTag(SecondCharacter, "melanchonic")}:      Io muoio lì dentro.
                                                            Fermo e in silenzio ad ascoltare cose noiose.                                                
            {charTag(SecondCharacter, "energy")}:           A me mi piace tanto raccontare le storie.
                                                            Inventare cose nuove.
                                                            Fare gli esperimenti.
            {charTag(SecondCharacter, "emotional")}:        Parlare di animali.
            {charTag(SecondCharacter, "neutral")}:          Se non faccio cose mi annoio.
                                                            E se mi annoio comunque finisco in castigo.
                    
            + \ {charTag(PG, "neutral")}:                   Per sopravvivere devi stringere i denti e lottare!
                    -> glyph_modifier_variation_management(SecondCharacter, fireC)->
            {charTag(SecondCharacter, "neutral")}:          Lo dice anche papà.
                                                            Ma a me non mi interessa mica tanto.
            {charTag(SecondCharacter, "energy")}:           Voglio solo studiare gli animali.
            {charTag(SecondCharacter, "angry")}:            E che mi lascino in pace.

            + \ {charTag(PG, "neutral")}:                   Mi spiace {charNameTwo}, sembra tutto molto duro.
                    -> glyph_modifier_variation_management(SecondCharacter, waterC)->
            {charTag(SecondCharacter, "neutral")}:          Sì no boh.
            {charTag(SecondCharacter, "angry")}:            Non dirlo.
                                                            Mi viene da piangere se dici che ti dispiace.
            {charTag(SecondCharacter, "melanchonic")}:      Ma non voglio piangere.
            {charTag(SecondCharacter, "neutral")}:          Quindi non dirlo più.

            + \ {charTag(PG, "neutral")}:                   Hai mai imparato davvero qualcosa dai castighi?
                    -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
            {charTag(SecondCharacter, "energy")}:           A non farmi scoprire.
            {charTag(SecondCharacter, "neutral")}:          I castighi sono proprio brutti.
                                                            Sentire tutti che giocano e si divertono.
                                                            E tu non puoi fare nulla.
            {charTag(SecondCharacter, "angry")}:            Ti viene solo più rabbia.
            {charTag(SecondCharacter, "melanchonic")}:      Sono ingiusti.     
            -
            
        {charTag(SecondCharacter, "energy")}:               Comunque qui non c'è la scuola e quindi è bello.
                    
        -> second_char_closing_storylet ->            
        -> options_second_character
    

    = seven
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    {
        - grimoire_fifthChar hasnt grimSecondCharMentorPeace && are_two_entities_together(Mentor, PG):
            ~ change_entity_place(Mentor)
    }     
 
        {charTag(SecondCharacter, "energy")}:               Franco prima mi ha detto che tu scrivi storie.
        {
            - are_two_entities_together(Franco, PG):
            {charTag(Franco, "{portrait_Franco()}")}:       Anche Franco scrive storie.
                                                            Storie in cui Franco sa nuotare!
        }
        {charTag(SecondCharacter, "neutral")}:              A me mi piacciono le storie.
                                                            C'è una cosa che non dico mai a nessuno.
                                                            Mamma è felice perché vado a letto presto.
        {charTag(SecondCharacter, "emotional")}:            Ma è perché mi piace stare al buio da solo.
                                                            Così posso pensare alle cose che ho fatto durante il giorno.
        {charTag(SecondCharacter, "neutral")}:              E correggere quelle che non mi piacciono.
        {charTag(SecondCharacter, "energy")}:               Quando uno di quinta mi ha picchiato, la sera ho corretto tutto e l'ho picchiato io.
        {charTag(SecondCharacter, "emotional")}:            E i miei compagni poi erano miei amici così.
        {
            - are_two_entities_together(FirstCharacter, PG): 
            {charTag(FirstCharacter, "sad")}:              Mi si è appena rotto il cuore.
        } 
        {charTag(SecondCharacter, "neutral")}:              Una volta ho preso un brutto voto e papà e mamma hanno litigato perché si davano la colpa.
                                                            Ma allora ho corretto tutto e io non prendevo un brutto voto.
        {charTag(SecondCharacter, "energy")}:               E andavamo a prendere un gelato.
        {charTag(SecondCharacter, "emotional")}:            E la nonna non era nella casa dei vecchi.
        {charTag(SecondCharacter, "neutral")}:              E quando papà è tornato dopo essere andato via ed era arrabbiato, invece è tornato con un cane.
        {charTag(SecondCharacter, "melanchonic")}:          Non ho mai avuto un cane.
        {charTag(SecondCharacter, "energy")}:               Sai che i cani sentono suoni fino a duecento metri?
                                                            Se li chiami e non vengono è perché non vogliono.
        {charTag(SecondCharacter, "neutral")}:              Anche io faccio così.
        {
            - are_two_entities_together(Mentor, PG):
                    {charTag(Mentor, "neutral")}:           Qui ogni tanto passa un cane con la posta.
                                                            Forse potreste diventare amici!
                    {charTag(SecondCharacter, "energy")}:   Sarebbe fighissimooooooooooooooooooooooooooooooo!
        }
            
            + \ {charTag(PG, "neutral")}:                   Obiettivamente conosci tutto degli animali.
                    -> glyph_modifier_variation_management(SecondCharacter, airC)->
            {charTag(SecondCharacter, "energy")}:           Tutto, sì!
            {charTag(SecondCharacter, "neutral")}:          No, non <i>tutto tutto tutto</i>.
                                                            Ma solo perché sono piccolo.
            {charTag(SecondCharacter, "energy")}:           Un giorno sapro davvero tutte le cose possibili! 

            + \ {charTag(PG, "neutral")}:                   Hai mai provato a fare le cose che correggi nel mondo reale?
                    -> glyph_modifier_variation_management(SecondCharacter, earthC)->
            {charTag(SecondCharacter, "energy")}:           Sì!
            {charTag(SecondCharacter, "neutral")}:          Ma non è finita benissimo.
                                                            Ho detto delle cose a un bullo.
                                                            Delle cose molto precise nella mia testa.
            {charTag(SecondCharacter, "melanchonic")}:      Ma gli altri non le hanno capite.
                                                            E mi hanno preso in giro.
                                                            Eravamo a vedere i camuni.
                                                            Ho cercato per tutta la gita di nascondermi nelle grotte.
                        
            + \ {charTag(PG, "neutral")}:                   I bulli si battono facendo squadra, non coi sogni.
                    -> glyph_modifier_variation_management(SecondCharacter, fireC)->
            {charTag(SecondCharacter, "neutral")}:          Una volta ci ho provato.
            {charTag(SecondCharacter, "melanchonic")}:      Ma io non piaccio molto agli altri.
                                                            E non vogliono fare squadra con me.
            {charTag(SecondCharacter, "angry")}:            Mi dicono che sono scemo, per via degli animali.
            {charTag(SecondCharacter, "melanchonic")}:      O mi dicono che sono strano.
            {charTag(SecondCharacter, "neutral")}:          Che non capiscono la mia faccia.
                                                            E che non gli piace quando mi arrabbio.
            
            + \ {charTag(PG, "neutral")}:                   Grazie per la tua fiducia, per esserti confidato.
                    -> glyph_modifier_variation_management(SecondCharacter, waterC)->
            {charTag(SecondCharacter, "neutral")}:          Sì no boh.
            {charTag(SecondCharacter, "neutral")}:          Non è mica una cosa così grossa comunque.
            {charTag(SecondCharacter, "emotional")}:        Però mi piace.
                                                            Non è poi che lo faccio proprio sempre.
            {charTag(SecondCharacter, "neutral")}:          Solo con le cose brutte.
                                                            O quando non succede niente, che è peggio.
            {charTag(SecondCharacter, "melanchonic")}:      Non mi piace annoiarmi.

            + \ {charTag(PG, "neutral")}:                   E quando correggi le cose, come sono i tuoi sogni?
                    -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
            {charTag(SecondCharacter, "energy")}:           Suuuuperincasinati!
                                                            Una volta ho sognato che venivo inseguito da me stesso dentro una scuola.
                                                            E la scuola era infinita.
                                                            E poi è arrivato un gelato gigante.
                                                            E voleva mangiarmi.
                                                            E mi sono svegliato che ero quasi vicino all'uscita, ma quella continuava a spostarsi.
            -
            {charTag(SecondCharacter, "neutral")}:          Da quando sono qui però non ho riscritto nulla.
                                                            Però so che devo riscrivere il mio nome con uno nuovo.
            {charTag(SecondCharacter, "energy")}:           E lo inizio a sentire!
            {charTag(SecondCharacter, "neutral")}:          Forse perché prima ho leccato Franco.
                                                            Ma mi ha chiesto di non farlo ma più, perché poi sto male.
            {
                - are_two_entities_together(Franco, PG):
            {charTag(Franco, "{portrait_Franco()}")}:       Ho un superpotere: se mi lecchi viaggi senza spostarti.
                                                            Sono molto apprezzato alle feste!
                                                            Ma non mi piace tanto tutta la bava che mi arriva addosso.
                                                            Però c'è il cibo gratis!
            {charTag(FirstCharacter, "affectionate")}:      Franco, sai che sei appena diventato il mio migliore amico?
            }

        -> second_char_closing_storylet ->        
        -> options_second_character     
            
    = eight
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
        {
            - grimoire_fifthChar hasnt grimSecondCharMentorPeace && are_two_entities_together(Mentor, PG):
                ~ change_entity_place(Mentor)
            {charTag(SecondCharacter, "neutral")}:          Ogni volta che sto per parlare, {mentorName}  se ne va.
        }     
        
        {charTag(SecondCharacter, "energy")}:               Sai che mio fratello è campione di Karate?
                                                            E ha una macchina enorme gialla che fa arrabbiare papà.
                                                            E hai i muscoli che...
        {charTag(SecondCharacter, "neutral")}:              Bugia.
        {charTag(SecondCharacter, "melanchonic")}:          Scusa.
        {charTag(SecondCharacter, "neutral")}:              Non è proprio campione in realtà.
        {charTag(SecondCharacter, "energy")}:               Però per me è bravissimo.
        {charTag(SecondCharacter, "neutral")}:              E la macchina è di papà.
        {charTag(SecondCharacter, "melanchonic")}:          Che si arrabbia perché prima era nera, e lui l'ha colorata di giallo.
        {charTag(SecondCharacter, "emotional")}:            Mio fratello è super però.
        {charTag(SecondCharacter, "neutral")}:              Lavora in una officina e nel tempo libero fa delle statue col saldatore e i pezzi rotti delle macchine.
                                                            E vive in una casa piccola piccola assieme al suo amico.
        {charTag(SecondCharacter, "melanchonic")}:          Viene a trovarci quando non c'è papà perché non si piacciono.
        {charTag(SecondCharacter, "neutral")}:              Ma se papà mi fa male allora lo cerca e gli urla addosso tantissime cose.
        {charTag(SecondCharacter, "emotional")}:            Mi ha promesso che mi porta a pescare una volta.
        {charTag(SecondCharacter, "neutral")}:              Senza dirlo a mamma perché lei ha paura perché non so nuotare.
                                                            Ma lui sa fare tutto.
        {
            - are_two_entities_together(FirstCharacter, PG): 
            {charTag(FirstCharacter, "affectionate")}:      Tuo fratello mi ricorda un po' Talco.
            {charTag(FirstCharacter, "sad")}:               Mi manca sempre di più.
            {charTag(FirstCharacter, "neutral")}:           Talco, non tuo fratello.
            {charTag(FirstCharacter, "annoyed")}:           Sto iniziando a ragionare come Franco?
            {
            - are_two_entities_together(Franco, PG):
            {charTag(Franco, "{portrait_Franco()}")}:       Sono una rana, non un ragioniere, quindi no.
            }                                              
        } 
        {charTag(SecondCharacter, "emotional")}:            Il suo amico invece fa dei dolci buonissimi.
                                                            E anche lui non sa nuotare.
        {charTag(SecondCharacter, "neutral")}:              Ma non mi sembra felice quando vado da loro e quindi ci vado poco.
        {
            - are_two_entities_together(Mentor, PG): 
            {charTag(Mentor, "hurry")}:                     Potrebbe essere carino se provaste a imparare assieme, no?
            {charTag(SecondCharacter, "neutral")}:          E se poi mi vuole annegare?
            {charTag(SecondCharacter, "neutral")}:          Poi la mamma mi risuscita solo per ammazzarmi di nuovo.
        }
            
            + \ {charTag(PG, "neutral")}:                   Oggettivamente pescare è una cosa, nuotare un'altra.
                    -> glyph_modifier_variation_management(SecondCharacter, airC)->
            {charTag(SecondCharacter, "energy")}:           Esatto!
            {charTag(SecondCharacter, "melanchonic")}:      Ma lei non lo vuole capire.
            {charTag(SecondCharacter, "neutral")}:          "E se cadi in acqua?"
                                                            "E se un'onda ti investe?"
                                                            "E se tuo fratello si distrae?"
            {charTag(SecondCharacter, "angry")}:            Mamma è davvero pesante.

            + \ {charTag(PG, "neutral")}:                   Le statue di tuo fratello si muovono?
                    -> glyph_modifier_variation_management(SecondCharacter, earthC)->
            {charTag(SecondCharacter, "energy")}:           Forse quando non ci siamo?
            {charTag(SecondCharacter, "neutral")}:          Mio fratello è superdisordinato.
                                                            Quindi se si spostano non è che lo capisci con facilità.
                                                            Però gli serve l'elettricità.
            {charTag(SecondCharacter, "energy")}:           Voglio costruirne una anche io.
                                                            Forse in biblioteca c'è una guida!
                    
            + \ {charTag(PG, "neutral")}:                   {charNameTwo} mannaggia, non dare sempre ragione ai grandi!
                    -> glyph_modifier_variation_management(SecondCharacter, fireC)->
            {charTag(SecondCharacter, "neutral")}:          Non è mica facile!
            {charTag(SecondCharacter, "angry")}:            Papà se si arrabbia mi picchia.
            {charTag(SecondCharacter, "neutral")}:          E se invece parli dell'amico di mio fratello...
            {charTag(SecondCharacter, "emotional")}:        Credo che lui sia buono.
            {charTag(SecondCharacter, "melanchonic")}:      Ma se poi si arrabbia con me e non mi vuole più lì?
                                                            Poi non ci posso più stare con mio fratello!
                
            + \ {charTag(PG, "neutral")}:                   Hai chiesto all'amico di tuo fratello cosa prova per te?
                    -> glyph_modifier_variation_management(SecondCharacter, waterC)->
            {charTag(SecondCharacter, "neutral")}:          Scherzi?!?
            {charTag(SecondCharacter, "angry")}:            Non sono mica <b><i>così</b></i> strano.
            {charTag(SecondCharacter, "neutral")}:          Però una volta ho chiesto a mio fratello se gli sto simpatico.
                                                            E mi ha detto che gli piaccio molto, ma che non sa mica come comportarsi coi bambini.
            {charTag(SecondCharacter, "angry")}:            Non siamo mica animali, no?
            {charTag(SecondCharacter, "melanchonic")}:      E poi a quello non gli piacciono proprio i bambini.
            {charTag(SecondCharacter, "neutral")}:          Una volta hanno litigato per questo.
            {charTag(SecondCharacter, "melanchonic")}:      Perché è una cosa che rende molto triste mio fratello.
                
            + \ {charTag(PG, "neutral")}:                   Correggere le tue bugie è stato un gesto maturo.
                    -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
            {charTag(SecondCharacter, "neutral")}:          Sì no boh.
                                                            Non so ancora se mi piaci.
                                                            Ma non voglio dire le bugie se riesco.
            {charTag(SecondCharacter, "emotional")}:        Le cose qui sono belle.
            {charTag(SecondCharacter, "neutral")}:          Le bugie sono meno interessanti.
            -

            {charTag(SecondCharacter, "energy")}:           Forse nello stagno posso imparare a nuotare.
            {charTag(SecondCharacter, "neutral")}:          La rana sembra abbastanza forte da salvarmi nel caso.

                -> second_char_closing_storylet ->        
                -> options_second_character 
    
    
    = nine
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
        {
            - grimoire_fifthChar hasnt grimSecondCharMentorPeace && are_two_entities_together(Mentor, PG):
                ~ change_entity_place(Mentor)
        }      
        
        {charTag(SecondCharacter, "energy")}:               Tu hai sempre voluto fare {player_pronouns has him: il riscrittore|{player_pronouns has her: la riscrittora|lə riscrittorə}} come lavoro?
        
            + \ {charTag(PG, "neutral")}:                   Fino a poco fa non sapevo nemmeno dell'esistenza di questo posto.
                    -> glyph_modifier_variation_management(SecondCharacter, airC)->
            {charTag(SecondCharacter, "energy")}:           Figo!
                                                            Quindi non sono l'unico.
            {charTag(SecondCharacter, "neutral")}:          Quando chiedo le cose a {mentorName} mi fa sentire stupido.
            {
                - are_two_entities_together(Mentor, PG): 
                {charTag(Mentor, "hurry")}:                 Cerco solo di spiegartele per bene.
                {charTag(SecondCharacter, "neutral")}:      Prima mi hai spiegato le cose separando tutte le parole.
                                                            Mica sono un bambino!
                {charTag(SecondCharacter, "angry")}:        So fare le frazioni!
                
                - else:
                                                            "Bimbo, te le spiego lentamente le cose ora, vieni."
                                                            Non mi deve spiegare lentamente le cose.
                {charTag(SecondCharacter, "angry")}:        Io so fare le frazioni!
            }
                    
            + \ {charTag(PG, "neutral")}:                    Mi piace tenermi impegnat{player_pronouns has him:o|{player_pronouns has her:a|ə}}, non mi importa molto il come.
                    -> glyph_modifier_variation_management(SecondCharacter, earthC)->
            {charTag(SecondCharacter, "neutral")}:          Ah.        
                                                            Ai grandi piace parlare di lavoro.
            {charTag(SecondCharacter, "angry")}:            E le maestre parlano sempre del futuro.
                                                            E dicono che ci devo lavorare con le cose in cui sono bravo.
            {charTag(SecondCharacter, "energy")}:           Ma io voglio solo imparare cose nuove!

            + \ {charTag(PG, "neutral")}:                   Guarda che non l'ho scelto. Manco mi pagano.
                    -> glyph_modifier_variation_management(SecondCharacter, fireC)->
            {charTag(SecondCharacter, "neutral")}:          Che fregatura.
            {charTag(SecondCharacter, "angry")}:            Nemmeno mamma mi paga per i lavoretti a casa.
            {charTag(SecondCharacter, "neutral")}:          Dice che è una cosa che devono fare tutti, grandi e piccoli, maschi e femmine.
            {
            - are_two_entities_together(FirstCharacter, PG): 
            {charTag(FirstCharacter, "affectionate")}:      Donna saggia.
            }          
            {charTag(SecondCharacter, "angry")}:            Ma papà non fa mai niente in casa.

            + \ {charTag(PG, "neutral")}:                   Mi è sempre piaciuto fare stare bene le persone.
                    -> glyph_modifier_variation_management(SecondCharacter, waterC)->
            {charTag(SecondCharacter, "emotional")}:        Questa è una cosa bella.
            {charTag(SecondCharacter, "melanchonic")}:      Ma difficile.
            {charTag(SecondCharacter, "neutral")}:          I grandi pensano sempre di sapere cosa fare.
                                                            Cosa vogliono gli altri.
                                                            Ma poi sbagliano.
            {charTag(SecondCharacter, "angry")}:            E se la prendono con la persona che volevano aiutare.
            {charTag(SecondCharacter, "neutral")}:          Per questo si fa prima a fare da soli.
                                                            Mica puoi litigare con te stesso, no?
                    
            + \ {charTag(PG, "neutral")}:                    Voglio portare un grande cambiamento partendo dal piccolo.
                    -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
            {charTag(SecondCharacter, "neutral")}:          E io sono piccolo.
                                                            Mi sembra una cosa faticosa.
            {charTag(SecondCharacter, "emotional")}:        Però la capisco.
            {charTag(SecondCharacter, "energy")}:           È come l'elettricità.
                                                            È così piccola che non la vedi.
            {charTag(SecondCharacter, "energy")}:           Ma fa muovere le cose grandi!
            {charTag(SecondCharacter, "melanchonic")}:      O bruciare i muri.
            -
        {
            - cooking_with_second_char.third_theme.bugie_innocenti:
            {charTag(SecondCharacter, "neutral")}:          Chissà se mi hai risposto sinceramente.
            {charTag(SecondCharacter, "angry")}:            O se è una bugia innocente, visto quello che hai detto in cucina.

            - cooking_with_second_char.third_theme.bugie_difensive:
            {charTag(SecondCharacter, "neutral")}:          Chissà se mi hai risposto sinceramente.
            {charTag(SecondCharacter, "angry")}:            O se è una bugia difensiva, visto quello che hai detto in cucina.

            - cooking_with_second_char.third_theme.bugie_autoinganno:
            {charTag(SecondCharacter, "neutral")}:          Chissà se mi hai risposto sinceramente.
            {charTag(SecondCharacter, "angry")}:            O se è una bugia che ti stai dicendo, visto quello che hai detto in cucina.

            - cooking_with_second_char.third_theme.bugie_nessuna:
            {charTag(SecondCharacter, "neutral")}:          Chissà se mi hai risposto sinceramente.
                                                            Anche se prima in cucina hai detto che non dici mai bugie.

            - cooking_with_second_char.third_theme.bugie_omesse:
            {charTag(SecondCharacter, "neutral")}:          Chissà se mi hai risposto sinceramente.
            {charTag(SecondCharacter, "angry")}:            O se è c'è una omissione, visto quello che hai detto in cucina.

        }    
            
        {charTag(SecondCharacter, "neutral")}:              I miei compagni fanno tantissime cose.
                                                            Calcio. Basket. Pallavolo.
                                                            Suonano il pianoforte o la chitarra o la batteria.
                                                            Oppure imparano il cinese e l'inglese.
                                                            O provano a vendere cose su Roblox.
        {
            - are_two_entities_together(FirstCharacter, PG):
            {charTag(FirstCharacter, "annoyed")}:           Sono già stanca solo a sentire tutta questa roba.
                                                            Non dovrebbero, che ne so, fare l3 bambin3 e bona?
        }  
        {charTag(SecondCharacter, "neutral")}:              Loro sanno già cosa vogliono fare come lavoro.
                                                            A me mi piacciono solo gli animali.
        {charTag(SecondCharacter, "melanchonic")}:          Ma so anche le cose brutte degli animali.
                                                            Che molti stanno sparendo per colpa degli uomini.
                                                            Che gli oceani sono sempre più vuoti.
                                                            Che gli incendi uccidono un sacco di animali ogni anno.
        {charTag(SecondCharacter, "angry")}:                E che il futuro sarà sempre peggiore.
        {charTag(SecondCharacter, "neutral")}:              E quindi non so cosa fare da grande.
                                                            Non so se ci saranno ancora gli animali quando sarò grande.
        {charTag(SecondCharacter, "angry")}:                E questa cosa mi fa arrabbiare.
        {charTag(SecondCharacter, "neutral")}:              Non voglio essere un bambino per sempre.
                                                            Ma non voglio essere grande.
            
            + \ {charTag(PG, "neutral")}:                   Ma crescerai comunque, non è una scelta.
                    -> glyph_modifier_variation_management(SecondCharacter, airC)->
            {charTag(SecondCharacter, "neutral")}:          Sì no boh.
                                                            Non è detto.
                                                            Magari resto qui e magari qui il tempo non passa mica.
            {charTag(SecondCharacter, "emotional")}:        E magari riesco a fare venire qui anche mio fratello.
                                                            E la nonna.
                                                            Così siamo tutti felici.
 
            + \ {charTag(PG, "neutral")}:                   E se invece fai come l'axolotl e diventi grande, ma fai anche il bambino se serve?
                    -> glyph_modifier_variation_management(SecondCharacter, earthC)->
            {charTag(SecondCharacter, "neutral")}:          Nonna dice che è il problema di mamma.
                                                            Che non si prende le sue responsabilità.
                                                            A me mica mi dispiacciono le responsabilità.
            {charTag(SecondCharacter, "melanchonic")}:      Ma tutto il resto mi spaventa.
                                                            Tutti i litigi.
                                                            La rabbia.
                                                            A me non mi piace la mia rabbia.

            + \ {charTag(PG, "neutral")}:                   Puoi fare il ribelle e salvare gli animali!
                    -> glyph_modifier_variation_management(SecondCharacter, fireC)->
            {charTag(SecondCharacter, "emotional")}:        Come Greta!
                                                            A mio fratello piace tanto.
            {charTag(SecondCharacter, "neutral")}:          Però mio fratello dice che bisogna picchiare "quelli". Farli fuori.
            {charTag(SecondCharacter, "energy")}:           Non ho capito chi sono "quelli".
            {charTag(SecondCharacter, "emotional")}:        Magari posso programmare le statue di mio fratello.
                                                            E ci pensano loro a far fuori "quelli".
                                                            Non ho capito mica nemmeno cosa sia "fare fuori".

            + \ {charTag(PG, "neutral")}:                   Non ti preoccupare: hai tanto tanto tanto tempo per decidere che fare.
                    -> glyph_modifier_variation_management(SecondCharacter, waterC)->
            {charTag(SecondCharacter, "neutral")}:          Sarà.
            {charTag(SecondCharacter, "melanchonic")}:      Ma Lara sa già parlare due lingue.
                                                            E Jin è appena entrato nella giovanile della Fiorentina.
                                                            Tommaso legge così tanto che sicuro sicuro diventa un genio.
            {charTag(SecondCharacter, "angry")}:            Io l'unica cosa che so fare è dire cose stupide sugli animali.
                                                            E trovare nascondigli in ogni posto.
            {charTag(SecondCharacter, "melanchonic")}:      E dire bugie.

            + \ {charTag(PG, "neutral")}:                   Potresti diventare uno storico degli animali.
                    -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
            {charTag(SecondCharacter, "emotional")}:        Sì sì sì!
                                                            Qualcuno che racconta le loro storie?
            {charTag(SecondCharacter, "energy")}:           Come un gioco forse.
                                                            E anche gli animali giocano.
                                                            Anche gli insetti!
            {charTag(SecondCharacter, "emotional")}:        Lo fanno perché gli va.
            {charTag(SecondCharacter, "neutral")}:          E io vorrei sempre fare quello che mi va.
            {charTag(SecondCharacter, "angry")}:            Il resto è una rottura.
            -
            {
                - are_two_entities_together(Mentor, PG):
                {charTag(Mentor, "neutral")}:               Nemmeno io chiederei a un bambino di decidere cosa diventare da grande.
                                                            A questa età dovreste solo giocare.
                {charTag(SecondCharacter, "energy")}:       Ma non nello stagno.
                {charTag(Mentor, "bored")}:                 Già, non nello stagno.
            }  
        
        {charTag(SecondCharacter, "neutral")}:              La maestra di matematica dice che ci sono tante associazioni che aiutano gli animali.
        {charTag(SecondCharacter, "emotional")}:            E che magari può fare venire una volontaria del canile.
        {charTag(SecondCharacter, "neutral")}:              Così vedo che ci sono cose anche buone.
                                                            Ma io non so se bastano.
                                                            Però una cosa è sicura.
        {charTag(SecondCharacter, "energy")}:               Mi piacerebbe tanto fare il veterinario.

            -> second_char_closing_storylet ->
            -> options_second_character
    
    = ten
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
        {
            - grimoire_fifthChar hasnt grimSecondCharMentorPeace && are_two_entities_together(Mentor, PG):
                ~ change_entity_place(Mentor)
            {charTag(SecondCharacter, "melanchonic")}:      {mentorName} se ne è andata.
                                                            Non mi vuole mica conoscere mi sa.
        }     
        
        {charTag(SecondCharacter, "melanchonic")}:          Stavo ripensando a un bambino.
                                                            Uno di seconda.
                                                            L'ho picchiato perché mi andava.
        {charTag(SecondCharacter, "angry")}:                Ero <b>DAVVERO</b> arrabbiato quel giorno.
        {charTag(SecondCharacter, "melanchonic")}:          E lui ha pianto e mi sono arrabbiato ancora di più.
        {charTag(SecondCharacter, "neutral")}:              La maestra di matematica mi ha messo in castigo.
        {charTag(SecondCharacter, "melanchonic")}:          Ora quando vedo il bambino mi sento in colpa.
                                                            Ho provato a chiedergli scusa ma lui scappa.
                                                            E sua sorella una volta mi ha lanciato una scarpa in faccia.
        {charTag(SecondCharacter, "neutral")}:              Mio fratello dice che succede.
                                                            Che tra bambini ci si picchia.
                                                            E anche tra grandi.
        {charTag(SecondCharacter, "angry")}:                Penso che i grandi facciano schifo.
        {charTag(SecondCharacter, "melanchonic")}:          Quando papà mi picchia dice che è colpa mia.
                                                            Ma a me non piace farmi picchiare.
                                                            O picchiare.
                                                            Ma se sono arrabbiato non so cosa fare.
    {
        - are_two_entities_together(FirstCharacter, PG):
            {charTag(FirstCharacter, "affectionate")}:      Mai provato a suonare la batteria?
                                                            Una delle ragazze della band potrebbe darti qualche lezione di sicuro!
            {charTag(SecondCharacter, "angry")}:            Poi papà ha un altro motivo per arrabbiarsi.
    }        

            + \ {charTag(PG, "neutral")}:                   Potresti studiare la tua rabbia, come se fosse un animale.
                    -> glyph_modifier_variation_management(SecondCharacter, airC)->
            {charTag(SecondCharacter, "angry")}:            Mi agito quando provo a capirla.
            {charTag(SecondCharacter, "melanchonic")}:      Ma voglio capirla.
            {charTag(SecondCharacter, "energy")}:           Mi piace che sia un animale.
            {charTag(SecondCharacter, "energy")}:           Un coccodrillo.
                                                            Un serpente.
            {charTag(SecondCharacter, "melanchonic")}:      Un riccio.     

            + \ {charTag(PG, "neutral")}:                   Hai pensato a qualcosa da fare per sfogare la rabbia?
                    -> glyph_modifier_variation_management(SecondCharacter, earthC)->
            {charTag(SecondCharacter, "melanchonic")}:      Non ci riesco.
                                                            Quando arriva è fortissima.
            {charTag(SecondCharacter, "neutral")}:          Papà aveva provato a mandarmi a calcio.
                                                            "Per farmi le ossa con gli altri maschi."
                                                            Ma ero ancora più arrabbiato di prima.
            {charTag(SecondCharacter, "melanchonic")}:      Papà si arrabbiava perché ero sempre in panchina.
                                                            E allora mamma gli ha ordinato di lasciarmi in pace.
                                                            E ho smesso.
                  
            + \ {charTag(PG, "neutral")}:                   Non sembre fare a pugni è sbagliato. Fallo coi bulli.
                    -> glyph_modifier_variation_management(SecondCharacter, fireC)->
            {charTag(SecondCharacter, "angry")}:            Così le prendo ancora di più?
                                                            No.
            {charTag(SecondCharacter, "melanchonic")}:      Non lo so.
            {charTag(SecondCharacter, "neutral")}:          No.                                                
                    
            + \ {charTag(PG, "neutral")}:                   Nessuno merita di essere picchiato, né tu né quel bambino.
                    -> glyph_modifier_variation_management(SecondCharacter, waterC)->
            {charTag(SecondCharacter, "neutral")}:          Però se papà mi picchia c'è un motivo.
                                                            Mamma dice che papà non lascia mai nulla al caso.
                                                            E per questo è il più bravo a lavoro.
            {charTag(SecondCharacter, "angry")}:            E quel bambino è davvero fastidioso.
                    
            + \ {charTag(PG, "neutral")}:                   La rabbia della ragazzina ha protetto il fratello.
                    -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
            {charTag(SecondCharacter, "angry")}:            Ma chi protegge me?
            {charTag(SecondCharacter, "melanchonic")}:      Uh, bugia, scusa.
                                                            Qui sono stato io a fare il cattivo.
            {charTag(SecondCharacter, "energy")}:           Forse potrei chiedere a lei come fa?
            {charTag(SecondCharacter, "melanchonic")}:      Ma sarebbe stupido.
            -

        {charTag(SecondCharacter, "melanchonic")}:          Essere adulti è terribile. 
        {
            - are_two_entities_together(Mentor, PG): 
                    {charTag(Mentor, "hurry")}:             Non sai quanto, ragazzino.
        }
        {charTag(SecondCharacter, "angry")}:                Però non è bello nemmeno essere bambini.

            -> second_char_closing_storylet ->
            -> options_second_character 
    
    = eleven
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
            {
                - grimoire_fifthChar hasnt grimSecondCharMentorPeace && are_two_entities_together(Mentor, PG):
                ~ change_entity_place(Mentor)
            }     
        
        {charTag(SecondCharacter, "energy")}:               Quando vado da mio fratello e non c'è il suo amico, mi lascia sperimentare con le sue cose.
        {charTag(SecondCharacter, "neutral")}:              Il suo amico fa il pasticciere.
                                                            E ha tantissime cose strane in cucina.
                                                            Mi piace provare le cose, capire.
        {charTag(SecondCharacter, "angry")}:                Non mi piacciono le cose che non capisco.
        {charTag(SecondCharacter, "melanchonic")}:          Ma a volte faccio dei casini.
        {charTag(SecondCharacter, "energy")}:               Una volta ho mischiato le cose per pulire casa e ho vomitato tutto il pomeriggio.
                                                            Un giorno ho riempito il letto di mamma di sabbia e si è grattata per una settimana.
                                                            E poi ho provato ad attaccare un mio robot al frullatore dell'amico di mio fratello.
        {charTag(SecondCharacter, "emotional")}:            E ha fatto una fiammata gigante e un pezzo di muro è diventato nero.
        {
            - are_two_entities_together(Mentor, PG): 
            {charTag(Mentor, "hurry")}:                     Sarei già morta d'infarto.
            {charTag(SecondCharacter, "energy")}:           Anche mio fratello!
        }
        {charTag(SecondCharacter, "energy")}:               Lui si è spaventato tantissimo.
                                                            Ma io ero contento perché non sapevo che ci sono dei fili nel muro.
                                                            E ora so cosa è l'elettricità.
        {charTag(SecondCharacter, "neutral")}:              Ma qui non c'è.
                                                            Chissà se è la rana che fa accadere le cose.
                                                            O la signora che ti parla in testa.
        {
            - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "annoyed")}:       Ti ci vedrei benissimo con mio padre, a fare casini in garage e far spaventare mia madre! 
        } 
        
            + \ {charTag(PG, "neutral")}:                   Hai la mente da scienziato e vuoi verificare tutto.
                    -> glyph_modifier_variation_management(SecondCharacter, airC)->
            {charTag(SecondCharacter, "neutral")}:          Lo dice anche mio fratello.
                                                            Per questo mi lascia fare gli esperimenti.
            {charTag(SecondCharacter, "melanchonic")}:      Ma senza elettricità, dopo l'incidente.
            {charTag(SecondCharacter, "energy")}:           Però posso usare le batterie.
            {charTag(SecondCharacter, "emotional")}:        Voglio fargli un regalo con le cose della serra, sai?


            + \ {charTag(PG, "neutral")}:                   C'è un momento in cui ti riposi, {charNameTwo}?
                    -> glyph_modifier_variation_management(SecondCharacter, earthC)->
            {charTag(SecondCharacter, "neutral")}:          Mi annoio.
                                                            No!
            {charTag(SecondCharacter, "emotional")}:        Però quando leggo mi riposo.
                                                            La testa va in un solo posto invece che ovunque.
                                                            Mi piace.                                                
                
            + \ {charTag(PG, "neutral")}:                   Sei tosto perché alla fine fai quello che ti va.
                    -> glyph_modifier_variation_management(SecondCharacter, fireC)->
            {charTag(SecondCharacter, "neutral")}:          Sì no boh.
            {charTag(SecondCharacter, "melanchonic")}:      Questa cosa agli adulti non piace molto.
            {charTag(SecondCharacter, "angry")}:            Ma se non posso capire le cose, mi rimangono in testa.
                                                            Mi danno davvero fastidio.
            {charTag(SecondCharacter, "energy")}:           A volte mi sveglio presto e faccio tutte le cose che non dovrei fare.
                                                            Come provare gli attrezzi di papà.
                                                            O il vecchio respiratore di nonna.
                                                            Solo per capire.
            {charTag(SecondCharacter, "neutral")}:          Poi li rimetto a posto prima che si svegliano tutti.
                    
            + \ {charTag(PG, "neutral")}:                   Prometti che non mangerai nulla di strano? Non voglio tu stia male.
                    -> glyph_modifier_variation_management(SecondCharacter, waterC)->
            {charTag(SecondCharacter, "neutral")}:          Non sei mia mamma.
            {charTag(SecondCharacter, "emotional")}:        E poi è troppo tardi.
            {charTag(SecondCharacter, "neutral")}:          Ho assaggiato un po' di cose della serra.
                                                            Ma hanno tutte un sapore fastidioso.
            {charTag(SecondCharacter, "energy")}:           Però per un attimo una delle piante mi ha fatto vedere le cose con colori strani.
            {charTag(SecondCharacter, "neutral")}:          Ma è durato pochissimo e poi avevo solo tanta sete.
            {
                - are_two_entities_together(FirstCharacter, PG):
            {charTag(FirstCharacter, "affectionate")}:      Il tuo primo trip!
            {charTag(FirstCharacter, "annoyed")}:           Aiuto, il tuo primo trip, dio mio, sei troppo piccolo!
            }
                        
            + \ {charTag(PG, "neutral")}:                   Tuo fratello ti lascia essere te stesso.
                    -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
            {charTag(SecondCharacter, "emotional")}:        Sì!
            {charTag(SecondCharacter, "neutral")}:          Lui non mi sgrida mai.
                                                            E se si arrabbia con me, mi spiega il perché.
                                                            E se non sono d'accordo e glielo dico, mi ascolta.
            {charTag(SecondCharacter, "emotional")}:        Per questo mi piace stare con lui.
            {charTag(SecondCharacter, "angry")}:            Non mi fa sentire stupido.
            -

        {charTag(SecondCharacter, "energy")}:               Comunque è una fortuna che qui c'è un bambino!
        {charTag(SecondCharacter, "neutral")}:              Questo posto è pieno di cose e voi non vi fate le domande.
        {
            - second_char_main_storylets.one.capire:
                {charTag(SecondCharacter, "angry")}:        Prima avevi anche detto che sei qui per capire questo posto, ma non mi sembra mica.
        }
        {charTag(SecondCharacter, "energy")}:               Tocca a me trovare le risposte!
                
                -> second_char_closing_storylet ->
                -> options_second_character 
    
    = twelve
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    {
        - grimoire_fifthChar hasnt grimSecondCharMentorPeace && are_two_entities_together(Mentor, PG):
        ~ change_entity_place(Mentor)
        {charTag(SecondCharacter, "neutral")}:              Ti ho quasi detto tutto di me, ma {mentorName} continua a evitarmi.
    }     
        {charTag(SecondCharacter, "emotional")}:            Mi piace molto passare il tempo in biblioteca.
        {charTag(SecondCharacter, "neutral")}:              Le biblioteche mi ricordano sempre la casa della nonna.
                                                            L'altra nonna, quella che sta al mare.
        {charTag(SecondCharacter, "emotional")}:            Ci vado d'estate e mi diverto tantissimo e ci sono tantissimi libri.
                                                            Lei mi prepara tutte le cose buone.
                                                            E io le insegno tutte le cose più strane sugli animali.
        {charTag(SecondCharacter, "neutral")}:              Mamma e papà non vengono mai.
        {charTag(SecondCharacter, "emotional")}:            Ma mio fratello e il suo amico sì.
        {charTag(SecondCharacter, "neutral")}:              Una volta mi hanno portato a una festa sulla spiaggia.
                                                            E mi hanno fatto cantare nel microfono.
        {charTag(SecondCharacter, "energy")}:               E hanno riso tutti quando ho ruttato fortissimo.
        {
            - are_two_entities_together(Franco, PG):
            {charTag(Franco, "{portrait_Franco()}")}:       Come alle serate karaoke di cugina Sputt!!
            {charTag(SecondCharacter, "melanchonic")}:      Ancora non mi ci hai portato, Franco!
            {charTag(Franco, "{portrait_Franco()}")}:       La organizziamo presto, promesso!
        }
        {charTag(SecondCharacter, "neutral")}:              Da nonna mi addormento subito.
                                                            Non devo correggere le giornate.
        {
            - are_two_entities_together(FirstCharacter, PG):
            {charTag(FirstCharacter, "sad")}:               Vedi tu se mi devo commuovere per questo piccoletto, mannaggia a me!
        }
        {charTag(SecondCharacter, "melanchonic")}:          Quando finiscono le vacanze però mi sento triste.
        {charTag(SecondCharacter, "angry")}:                E arrabbiato.
        {charTag(SecondCharacter, "neutral")}:              Ora che nonna è nella casa dei vecchi, vorrei vivere sempre con l'altra nonna.
                                                            Tanto so studiare da solo.
        {charTag(SecondCharacter, "emotional")}:            Magari studio come si curano i pesci.
        {charTag(SecondCharacter, "melanchonic")}:          Anche se non ci puoi mica giocare con loro.
            
            + \ {charTag(PG, "neutral")}:                   I libri ti insegnano tante cose.
                    -> glyph_modifier_variation_management(SecondCharacter, airC)->
            {charTag(SecondCharacter, "neutral")}:          Sì no boh.
                                                            Anche guardare le cose.
                                                            E toccarle.
            {charTag(SecondCharacter, "energy")}:           Ho imparato tantissime cose da quando sono qui.
                                                            Senza usare un libro.
            {charTag(SecondCharacter, "emotional")}:        A parte quando ne ho impilati alcuni per raggiungere l'alveare in serra.
            {charTag(SecondCharacter, "melanchonic")}:      Ma le api si sono arrabbiate.
                                         
            + \ {charTag(PG, "neutral")}:                    Facciamo una gara di rutti?!
                    -> glyph_modifier_variation_management(SecondCharacter, earthC)->
            {charTag(SecondCharacter, "energy")}:           Ci sto!
                                                            Però mi serve della roba frizzante sennò non mi vengono bene.
            {charTag(SecondCharacter, "melanchonic")}:      Ma poi mi scappa tanta pipì.
                                                            E non ho ancora capito dove sia il bagno qui.

            + \ {charTag(PG, "neutral")}:                   Bimbo, tu devi cambiare casa. Stai al mare dalla nonna!
                    -> glyph_modifier_variation_management(SecondCharacter, fireC)->
            {charTag(SecondCharacter, "melanchonic")}:      Mica è così facile!
            {charTag(SecondCharacter, "neutral")}:          Una volta però gliel'ho chiesto.
                                                            E lei mi ha detto "Finisci le elementari, poi ne parliamo".
            {charTag(SecondCharacter, "emotional")}:        A volte quando sono triste ci penso a questa cosa.

            + \ {charTag(PG, "neutral")}:                   Vorresti che venissero anche mamma e papà?
                    -> glyph_modifier_variation_management(SecondCharacter, waterC)->
            {charTag(SecondCharacter, "neutral")}:          Sì no boh.
            {charTag(SecondCharacter, "melanchonic")}:      Sono cattivo se dico di no?
            {charTag(SecondCharacter, "neutral")}:          Mi piace un posto dove nessuno litiga.
                                                            O si arrabbia con me.
            {charTag(SecondCharacter, "emotional")}:        L'altra nonna, quella del mare, non si arrabbia mai con me.
                                                            Nemmeno quando ho versato tutto il caffè sul divano.
            {charTag(SecondCharacter, "energy")}:           O quando le ho rubato la grappa.
            {charTag(SecondCharacter, "melanchonic")}:      Che brutto essere ubriaco!
                
            + \ {charTag(PG, "neutral")}:                   Ti piace insegnare le cose all'altra nonna.
                    -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
            {charTag(SecondCharacter, "neutral")}:          Mi aiuta a capirle meglio.
                                                            Tante cose ce le ho solo in testa e stanno assieme tutte contemporaneamente.
            {charTag(SecondCharacter, "energy")}:           E per me hanno senso.
                                                            Ma quando dico le cose ad alta voce, allora devo metterle in ordine.
            {charTag(SecondCharacter, "melanchonic")}:      Ed è difficile.
                                                            Anche per questo a volte dico bugie.
            {charTag(SecondCharacter, "neutral")}:          Perché le parole sono sbagliate, ma il contenuto è quello che so o sento.
                                                            Non so se mi sono spiegato.
            -
            {charTag(SecondCharacter, "energy")}:           Da grande comunque avrò una biblioteca con tutti i libri, tutti.
            {charTag(SecondCharacter, "emotional")}:        E poi mi verrai a trovare e leggeremo assieme!
            {
                - are_two_entities_together(Mentor, PG): 
                {charTag(Mentor, "hurry")}:                 Ci sarà un posticino anche per me?
                                                            Sì!
                {charTag(SecondCharacter, "emotional")}:    E poi sono sicuro che tu e nonna Paola vi piacete proprio subito subito!
            }
        
            -> second_char_closing_storylet ->
            -> options_second_character   