=== third_char_main_storylets

= one
    //Non mettere cose TW qui
    //Obiettivo: Presentare l’elemento delle bugie. Vengono dette cose sconfessate poi nella terza storia.
    //Contenuto: Compleanno, giochi
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
        
        Ma tu perché sei qui?#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
            
            + (capire) Questo luogo è insolito e voglio studiarlo, capirlo.
                    -> glyph_modifier_variation_management(ThirdCharacter, airC)->
                Anche a me mi piace capire le cose.
                
            + (buffe) Perché è pieno di cose buffe!
                    -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
                Uh.
                    
            + (tu)Aspetta, prima te: perché <b><i>tu</b></i> sei qui?
                    -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
                Boh, che ne so?
                
            + (difficoltà)Per aiutare chi è in difficoltà.
                    -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
                Come il veterinario?
                    
            + (me)Per capire meglio chi sono.
                    -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
                Non sai chi sei?
            -    
        
        Io sono qui perché è il mio compleanno.

            {
                - are_two_entities_together(Mentor, PG):
                    Oh povera anima!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
            }

        Ma lui mica ci può venire qui.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
            {
                - are_two_entities_together(FirstCharacter, PG):
                    Ho bisogno di bere. #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_annoyed
                    Troppe energie. 
                    Troppe.
            }

            + (twoAir) Il compleanno arriva sempre, a prescindere dalle caramelle.
                    -> glyph_modifier_variation_management(ThirdCharacter, airC)->
                Forse la data.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
                    
                
            + (twoEarth) Niente caramelle, ma c'è uno stagno dove nuotare!
                    -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
                WOOOOOOOOOOW!#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
    
            + (twoFire) E poi ti sei arrabbiato e hai ripreso i giocattoli, giusto?
                    -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
                Non sono mica giocattoli.
                    
                
            + (twoWater) Vuoi molto bene alla tua mamma?
                    -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
                Sì sì sì.
                    
  
            + (twoAether) Quindi, rubandoti i giochi, tuo papà ti ha fatto un favore.
                    -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
                Sì no boh.
            -
        Ma sai che io non mi ricordo mica il mio nome?#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
        - (nameThird)

            {
                - are_two_entities_together(FirstCharacter, PG): 
                        Ehm, non so se ti sei visto riflesso amore, ma, ehm.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
                    
            }
            {
                - are_two_entities_together(Mentor, PG): 
                        Perché come un riccio hai la faccina tenera ma spini come pochi, ragazzo.#speaker:{fifthChar_tag()}#inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                    
            }  
        Dove saranno i miei compagni di scuola?#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
        
            {
                - are_two_entities_together(Mentor, PG):
                    Altri bambini? Ma questo posto è pieno di pericoli!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
            }
        - 


        -> third_char_closing_storylet ->
        -> options_third_character
   
    = two
    //Non mettere cose TW qui
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        Non sai che cosa fighissima!#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
                {
                    - are_two_entities_together(Mentor, PG): 
                            Non ci sono rane in questo posto!
                }

        So tutto sulle rane.
                {
                    - are_two_entities_together(FirstCharacter, PG):
                            Ok, già adoro tua nonna, bimbo!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                
                }
        E so altre cose sulle rane.
            {
                - third_char_main_storylets.one.me:
                    Magari ti aiuta a capire chi sei come dicevi prima!#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                
            }
        Gliel'ho detto che è il mio compleanno e che quindi il dono deve essere per me.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
        
            + Una cosa mai accaduta è comunque ragionevolmente possibile.
                    -> glyph_modifier_variation_management(ThirdCharacter, airC)->
                Quindi mi credi?

            + Speriamo sia il nuovo Super Lario!
                    -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
                Posso giocarci anche io?
                    
            + E se lo senti e prudono le orecchie è una bugia, bimbo.
                    -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
                Non sono sto dicendo bugie!

            + Sembra una rana molto gentile.
                    -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
                A me mi sta simpatica

            + Deve essere una rana molto saggia.
                -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
                Non lo so, ha detto le cose in modo buffo.
                    {
                        - are_two_entities_together(Mentor, PG): 
                                Davanti a un bambino?!?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                    }
                Però mi ha anche detto che "tutto è dove deve stare".

            - (franco)
                         
            Su!
            - 
            -> third_char_closing_storylet ->
            -> options_third_character

    = three
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
        Mica mi hai detto come ti chiami.
  
            {
                - are_two_entities_together(Mentor, PG):
                    Solo io sono abbastanza vecchia da ricordare come va a finire questa storia?#speaker:{fifthChar_tag()}#inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_sad
            }
        
       
            
            + Bugia: hai detto di esser pieno di action figures.
                    -> glyph_modifier_variation_management(ThirdCharacter, airC)->
                "Pieno" è un modo di dire.

            + Non mi prendere in giro, hai detto che le action le ha rubate papà.
                    -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
                No.

            + Ci stai male, quando mamma dimentica il tuo compleanno?
                    -> glyph_modifier_variation_management(ThirdCharacter, waterC)->    
                Un po'.
                          
            + Però non mi hai detto il tuo nome. Sei una spia? Un gatto? Un gatto spia?
                    -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
                Sì no boh.
                    
            + Sembra che tua mamma sia piena di preoccupazioni.
                    -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
                Mamma è sempre preoccupata di tutto.
            -

            Forse dietro tutti quei fiori vicino allo stagno trovo qualche regalo!

            {
                - are_two_entities_together(Mentor, PG): 
                        Ma perché non sistemi con me i vialetti? #speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                        È molto meno pericoloso!
                        Poi muoio di noia!#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
            }

        - 

            
            -> third_char_closing_storylet ->
            -> options_third_character
            

    
    = four
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
        
        Cose.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
            
            + (disciplinato) Pensavo tu fossi più disciplinato, lucido. Che delusione.
                    -> glyph_modifier_variation_management(ThirdCharacter, airC)->
                Ehi! Mica mi chiedi perché lo formattazione
                    
            + (scherzo) Non era più divertente farle uno scherzo?
                    -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
                        {
                            - are_two_entities_together(Mentor, PG): Seriamente? 
                                #speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                        }
                Perché ero arrabbiato.
                    
            + (sfigati) Va bene difendersi, ma picchiare una così è stupido.
                    -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
                Mi aveva preso il braccio!

            + (male) C'è rimasta male, sai?
                    -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
                E a me che mi importa

            + (ottenuto) Hai ottenuto quello che volevi?
                    -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
                Ha smesso di dirmi che non devo stare qui.
            -

        Lui è superforte.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
                {
                    - are_two_entities_together(FirstCharacter, PG):
                        Io.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_neutral
                        Ma davvero {mentorName} ha.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_annoyed
                        Merda.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_sad
                        Mi ero dimenticata quanto fosse schifoso essere bambini.
                }

        - 

        
        -> third_char_closing_storylet ->
        -> options_third_character

    = five
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
        

        Sicuro le piace tantissimo questo posto.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
        
            + Non parli mai di tuo nonno. Deduco che non c'è più?
                    -> glyph_modifier_variation_management(ThirdCharacter, airC)->
                Se ne è andato quando papà era molto piccolo.
                    
            + Insegni a barare anche a me?
                    -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
                Ho una idea!
                    
            + Tua nonna sembra una tipa forte!
                    -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
                "Forte"?
                
            + Ti manca casa? Vorresti tornare?
                    -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
                Sì no boh.
                
                
            + Quando i grandi hanno paura, fanno cose cattive.
                    -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
                Papà dice che i grandi non hanno paura.
            -

        Mi spiace, {player_name}.

        - 

            
            -> third_char_closing_storylet ->
            -> options_third_character
    

    = six
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        Prima, con {mentorName}.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
       
            + È provato che anche i maschi piangono, e pure gli orsi e gli elefanti.
                    -> glyph_modifier_variation_management(ThirdCharacter, airC)->
                Gli orsi mi piacciono.
                    
            + La scuola è un posto senza fantasia!
                    -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
                Sì no boh.
                    
            + Stringi i denti, lotta, diventa più forte degli altri!
                    -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
                Lo dice anche papà.

            + A me spiace per te, sai?
                    -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
                Sì no boh.

            + Hai mai imparato davvero qualcosa dai castighi?
                    -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
                A non farmi scoprire.  
        - 

        Comunque qui non c'è la scuola e quindi è bello.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
                    
                  
        -> third_char_closing_storylet ->            
        -> options_third_character
    

    = seven
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        
        Franco prima mi ha detto che tu scrivi storie.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
            {
                - are_two_entities_together(Mentor, PG):
                        Qui ogni tanto passa un cane con la posta.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                        Forse potreste diventare amici!
                        Sarebbe fighissimooooooooooooooooooooooooooooooo!#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
            }
            
            + Obiettivamente conosci tutto degli animali.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
                    -> glyph_modifier_variation_management(ThirdCharacter, airC)->
                Tutto, sì!

            + Hai mai corretto una giornata mettendoci vampiri o zombie?
                    -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
                Sì!
                        
            + Se i grandi ti picchiano devi fare squadra con gli altri!
                    -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
                Una volta ci ho provato.

            + Grazie per la tua fiducia, per esserti confidato.
                    -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
                Sì no boh.

            + Come mai se qualcuno ti chiama non rispondi?
                    -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
                Perché se qualcuno mi chiama è arrabbiato con me.
                    
            -
            Da quando sono qui però non ho riscritto nulla.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
  

        - 

          
        -> third_char_closing_storylet ->        
        -> options_third_character     
            
            
    = eight
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        Sai che mio fratello è campione di Karate?#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental

            + Obiettivamente pescare è una cosa, nuotare un'altra.
                    -> glyph_modifier_variation_management(ThirdCharacter, airC)->
                Esatto!

            + Le statue di tuo fratello si muovono?
                    -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
                Forse quando non ci siamo?
                    
            +  \ {charNameTwo} mannaggia, non dare sempre ragione ai grandi!
                    -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
                Non è mica facile!
                
            + Hai chiesto all'amico di tuo fratello cosa prova per te?
                    -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
                Scherzi?!?

            + Correggere le tue bugie è stato un gesto maturo.
                    -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
                Sì no boh.
            -

            Forse nello stagno posso imparare a nuotare.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental

                
                -> third_char_closing_storylet ->        
                -> options_third_character 
    
    
    = nine
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        Tu hai sempre voluto fare {player_pronouns has him: il riscrittore|{player_pronouns has her: la riscrittora|lə riscrittorə}} come lavoro?#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental

            + Fino a poco fa non sapevo esistesse questo posto.
                    -> glyph_modifier_variation_management(ThirdCharacter, airC)->
                Figo!
                
                    
            + Questo non è il mio lavoro. I lavori sono noiosi.
                    -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
                Però ai grandi piace parlare di lavoro.

            + Guarda che non l'ho scelto. Manco mi pagano.
                    -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
                Che fregatura.
   
            + Mi è sempre piaciuto fare stare bene le persone.
                    -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
                Questa è una cosa bella.
                    
            + Voglio portare un grande cambiamento partendo dal piccolo.
                    -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
                E io sono piccolo.
            -

            
        I miei compagni fanno tantissime cose.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
            
            + Ma crescerai comunque, non è una scelta.
                    -> glyph_modifier_variation_management(ThirdCharacter, airC)->
                Sì no boh.
                    
            + E se invece rimanessi sia bambino che adulto?
                    -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
                Nonna dice che è il problema di mamma.

            + Puoi fare il ribelle e salvare gli animali!
                    -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
                Come Greta!

            + Non ti preoccupare: hai tanto tanto tanto tempo per decidere che fare.
                    -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
                Sarà.

            + Potresti diventare uno storico degli animali.
                    -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
                Sì sì sì!
            -
            
            {
                - are_two_entities_together(Mentor, PG):
                    Nemmeno io chiederei a un bambino di decidere cosa diventare da grande.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    A questa età dovreste solo giocare.
                    Ma non nello stagno.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                    Già, non nello stagno.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
            }  

        - 

            
            -> third_char_closing_storylet ->
            -> options_third_character
    
    = ten
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        Stavo ripensando a un bambino.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
            {
                - are_two_entities_together(FirstCharacter, PG):
                    Mai provato a suonare la batteria?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #portrait:chitarra_affectionate
                    Una delle ragazze della band potrebbe darti qualche lezione di sicuro!
                    Poi papà ha un altro motivo per arrabbiarsi.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
            }        

            + Solo gli animali non conoscono la disciplina.
                    -> glyph_modifier_variation_management(ThirdCharacter, airC)->
                Allora sono un lupo.

            + Immagina di picchiare i mostri invece dei compagni!
                    -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
                I mostri mi piacciono.
                    
            + Tuo padre ti picchia, e tu hai imparato a picchiare.
                    -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
                NO!

            + Nessuno merita di essere picchiato, né tu né quel bambino.
                    -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
                Però se papà mi picchia c'è un motivo.
                    
            + La rabbia della ragazzina ha protetto il fratello.
                    -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
                Ma chi protegge me?
            -

        Essere adulti è terribile.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
        - 

            
            -> third_char_closing_storylet ->
            -> options_third_character 
    
    = eleven
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        
        Quando vado da mio fratello e non c'è il suo amico, mi lascia sperimentare con le sue cose.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
            {
                - are_two_entities_together(FirstCharacter, PG):
                    Ti ci vedrei benissimo con mio padre, a fare casini in garage e far spaventare mia madre!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
            } 
        
            + Hai la mente da scienziato e vuoi verificare tutto.
                    -> glyph_modifier_variation_management(ThirdCharacter, airC)->
                Lo dice anche mio fratello.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental

            + Proviamo con la lampada della biblioteca!
                    -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
                Sì!#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
                
            + Sei tosto perché alla fine fai quello che ti va.
                    -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
                Sì no boh.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
                    
            + Mi prometti che non mangerai nulla di strano? Non voglio tu stia male.
                    -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
                Non sei mia mamma.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
         
                        
            + Tuo fratello ti lascia essere te stesso.
                    -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
                Sì!#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental
            -

        Comunque è una fortuna che qui c'è un bambino!
        - 
                
                
                -> third_char_closing_storylet ->
                -> options_third_character 
    
    = twelve
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        Mi piace molto passare il tempo in biblioteca.#speaker:{thirdChar_tag()} #inkA:{ink_tag_a(thirdChar_InkLevel)} #inkB:{ink_tag_b(thirdChar_InkLevel)}  #inkC:{ink_tag_c(thirdChar_InkLevel)}  #inkD:{ink_tag_d(thirdChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:boccale_judgmental

            + I libri ti insegnano tante cose.
                    -> glyph_modifier_variation_management(ThirdCharacter, airC)->
                Sì no boh.
                    
            + Dobbiamo capire la lingua dei pesci così ci possiamo giocare.
                    -> glyph_modifier_variation_management(ThirdCharacter, earthC)->
                Magari è come con le pecore che fanno tanti "bee" diversi.

            + Bimbo, tu devi cambiare casa. Stai al mare dalla nonna!
                    -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
                Mica è così facile!

            + Vorresti che venissero anche mamma e papà?
                    -> glyph_modifier_variation_management(ThirdCharacter, waterC)->
                Sì no boh.
                
            + Ti piace insegnare le cose all'altra nonna.
                    -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->
                Mi aiuta a capirle meglio.
            -

        - 

            
            -> third_char_closing_storylet ->
            -> options_third_character   