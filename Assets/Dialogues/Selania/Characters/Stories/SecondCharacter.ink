=== second_character ===
~ temp charNameTwo = translator(secondCharacterState)

//SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
        //Chiacchiera normale
        + {are_two_entities_together(SecondCharacter, PG) && secondStory == Active}[SecondCharacter]
            -> talk_with_second_character
        
        //Chiacchiera a fine storia
        + {are_two_entities_together(SecondCharacter, PG) && secondStory == Ended} [SecondCharacter]
            -> second_char_story_ended
        + ->
    
        -> DONE
    

=== talk_with_second_character ===
~ temp charNameTwo = translator(secondCharacterState)
-> common_storylets ->

   {//Se prima chiacchierata
        - not knowing_second_character.one:
            -> knowing_second_character.one
    //Se prima chiacchierata fatta e passato abbastanza tempo dalla pausa prevista        
        - secondPauseTalking == 0:
            -> hub
    //Altre opzioni        
        - else:
            {
                - second_story_gift.ink_outcome: {~ Mi sento triste, ti spiace tornare dopo?|Scusa {name} ma voglio stare solo.|In questo momento sono giù.} #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
                
                - else: {~ Torna dopo.|Ora ho voglia di stare da solo.|Lasciami in pace.|Non ho voglia di parlare.}#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
            }
            
        -> main
    }

= hub
~ temp charNameTwo = translator(secondCharacterState)

    {~ Ciao {name}!|Ciao.|...}#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
    
            + [Ti va di raccontarmi qualcosa di te?]
                -> knowing_second_character
                
    
            //Se non ho ancora fatto e ho parlato abbastanza con lui
            + {secondStoryQuestCount > minStoryQuesTCountSecondChar && not second_story_gift.ink_outcome} [Voglio regalarti una cosa.]
                    -> second_story_gift
        
            //Dono fatto ma non ho avviato la main story
            + {second_story_gift.ink_outcome && not main_story_second_character} [{charNameTwo}, ti va di guardare assieme le cose in modo diverso?]
                    -> second_story_chech_trigger
    
            //SE ESCO DALLA MAIN STORY E VOGLIO TORNARCI CLICCO QUI. POI Lì DENTRO IN BASE AGLI STEP IN CUI SIAMO, MI MANDERà AL POSTO GIUSTO            
            + {second_story_gift.ink_outcome && main_story_second_character} [Riprendiamo quella storia?]
                -> main_story_second_character
            
            + [Lascio il dialogo.]
                -> main
            -
                -> talk_with_second_character




=== knowing_second_character
~ temp charNameTwo = translator(secondCharacterState)
~ temp charNameFive = translator(fifthCharacterState)
    //Qui man mano faccio avanzare i temi toccati dalla personaggia
        {
            - not one:
                -> one
            - not two:
                {   //Se passo dallo storylet dedicato della mentore
                    - that_little_liar_storylet:
                        -> two
                    //Altrimenti    
                    - else:
                        -> not_talk
                }
                
            - not three:
                -> three
            - not four:
                -> four
            - not five:
                {   //Se passo dallo storylet dedicato della mentore
                    - watering_can_storylet:
                        -> five
                    //Altrimenti
                    - else:
                        -> she_hates_me
                }
                
            - not six:
                //Lo storylet non parte se siamo allo stagno.
                {
                    - entity_location(PG) == GreenhouseMiddlePath:
                        {~ C'è una cosa che voglio dirti, ma te la dico quando non sarò allo stagno.}
                        -> main
                    - else: 
                        -> six
                }

            - not seven:
                -> seven
            - not eight:
                -> eight
            - not nine:
                -> nine
            - not ten:
                -> ten
            - not eleven:
                -> eleven
            - not twelve:
                -> twelve
            - else:
                -> second_character_opinions
        }

    = one
    //Obiettivo: Presentare l’elemento delle bugie. Vengono dette cose sconfessate poi nella terza storia.
    //Contenuto: Compleanno, giochi
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        ~ secondStoryQuestCount ++
        
        Perché sei qui? #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
            
            + [Questo luogo è assurdo e voglio capirlo.]
                Anche a me mi piace capire le cose.
                I grandi si arrabbiano se faccio troppe domande.
                Tipo: perché c'è la neve ma non fa freddo?
                Perché c'è una stazione ma non passa nessun treno?
                Perché c'è vicino alla stazione ma non ci posso entrare?
                    ~ secondBlue ++
                
            + [Perché è pieno di cose buffe!]
                Uh.
                Per ora ho esplorato solo la stazione.
                Però il tabellone con le lettere è strano.
                Le lettere non si danno al postino?
                E il postino non le porta alle persone?
                Mica le appende così!
                    ~ secondYellow ++
                
            + [Perché <b>tu</b> sei qui?]
                Boh, che ne so? 
                Era solo una domanda!
                    ~ secondRed ++

                
            + [Per aiutare chi è in difficoltà.]
                Come il veterinario?
                O come la maestra di ginnastica, che dice di aiutarmi.
                Ma poi mi sgrida se sbaglio?
                    ~ secondGreen ++
                
            + [Per capire meglio chi sono.]
                Non sai chi sei?
                A me mi piacerebbe essere un'altra persona a volte.
                O un labrador, così se mi rotolo nel fango tutti ridono e non si arrabbiano.
                Ma non un gatto: sapevi che i gatti non sentono mica il sapore dolce?
                Che cosa triste!
                    ~ secondPurple ++
            -    
        
        Io sono qui perché è il mio compleanno.
        Mamma mi ha promesso qualcosa di FIGHISSIMO!
        L'anno scorso per Natale mi ha preso tutte le action figures dei miei videogiochi preferiti.
        Ma poi papà me le ha rubate tutte.
        {are_two_entities_together(SecondCharacter, PG): {charNameFive}: Povera anima!} #speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        Ma lui mica ci può venire qui.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
        Perché mamma ha detto che avrebbe dato solo a me qualcosa di bellissimo che papà non può rubare.
        Ma dove trovo le caramelle?
        Mamma dice sempre che non c'è compleanno senza caramelle!
        {are_two_entities_together(FirstCharacter, PG): {charNameOne}: O senza vinello.} #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_neutral
        Cose per pareggiare #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
        
            + (twoBlue) [Il compleanno arriva a prescindere dalle caramelle.]
                Forse la data.
                Quella sì.
                Ma il compleanno è un'altra cosa.
                È un momento tutto tuo.
                E infatti lo puoi festeggiare in ritardo e comunque è il tuo compleanno!
                    ~ secondBlue ++
                
            + (twoYellow) [Niente caramelle, ma c'è uno stagno dove nuotare!]
                FIGO!
                Non ho mai visto uno stagno!
                Però questa estate ho visto un mare gigantesco.
                Più grande anche del cielo!
                Quello qui non c'è di sicuro!
                    ~ secondYellow ++
                
            + (twoRed) [E come ti sei ripreso i giocattoli?]
                Non sono mica giocattoli.
                E non me li sono ripresi.
                Papà è buono, fino a quando non si arrabbia.
                E non voglio farlo arrabbiare.
                    ~ secondRed ++

                
            + (twoGreen) [Vuoi molto bene alla tua mamma?]
                Sì sì sì.
                Lei è la mamma migliore del pianeta.
                Dell'universo.
                    ~ secondGreen ++
  
                
            + (twoPurple) [Quindi, rubandoti i giochi, tuo papà ti ha fatto un favore.]
                Sì no boh.
                Non ha senso quello che dici.
                Papà non mi deve prendere mica le mie cose.
                Detesto quando fa così.
                    ~ secondPurple ++
            -
            
        Ma dove saranno i miei compagni di scuola?
        Cercali!
        A dopo!
            - (nameSecond)
            ~ secondPauseTalking = secondCharPauseDuration
            -> main
   
    = two
    //Obiettivo: Messa in evidenza della rabbia, ma anche della sua curiosità (finale rosso o finale viola: vede la bellezza nelle cose brutte.)
    //Contenuto: Prima gioia per gli insetti, ecc, poi domande sulla sua violenza alla mentore.
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    ~ temp charNameOne = translator(firstCharacterState)
    ~ change_entity_place(Mentor)
    ~ secondStoryQuestCount ++
      
        
        Questo posto è PIENO di animali! #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
        Ma ho lasciato a casa il tablet.
        Come faccio a capire cosa fanno?
        Sapevi che gli uccelli vedono dieci colori?
        DIECI! Mica solo tre come noi!
        E che l'acso, atso, axotolot si fa ricrescere le braccia?
            + [Gli chiedo perché ha dato un calcio a {charNameFive}.]
                -> top
            + [Lo lascio continuare.]
            -
            
        E le capre hanno dei loro accenti!
        Non sono mica tutti dei beeeeeeeeee uguali!
        Solo i colibrì sanno volare all'indietro!
        Tu sai camminare indietro? Secondo me no.
            + [Gli chiedo perché ha dato un calcio a {charNameFive}.]
                -> top
            + [Lo lascio continuare.]
            -
        I nasi dei cani sotto tutti diversi, non ci sono due cani con lo stesso naso.
        E...
        Ma mi sa che non mi stai mica ascoltando.
        Come a scuola.
        A scuola mi prendono in giro perché parlo solo di animali.
        Ma sono comunque il più bravo!
            -> top
        
        //Opzioni, varianti sulla violenza alla mentore, risposte diverse?
     
        - (top)
        {charNameFive} dice che le hai dato un calcio.  #speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:PG_neutral
        Qualcosa per pareggiare i tag#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
            
            + (twoBlue) [Credevo tu fossi disciplinato. Che delusione.]
                Ehi! Mica mi chiedi perché lo fatto!
                Vi odio.
                Tu e lei.
                Mi ha tirato il braccio.
                E continuava a dire che i bambini qui
                non
                ci
                devono
                stare!
                Mi ha fatto arrabbiare.
                    ~ secondBlue ++
                
            + (twoYellow) [Perché non le hai fatto uno scherzo?]
                Perché ero arrabbiato.
                E lei continuava a dire che i bambini qui non ci possono stare.
                Che non potevo saltare nel fiume.
                E mi ha messo una mano sulla spalla.
                E a me
                non
                piace
                quando
                i grandi
                mi toccano.
                    ~ secondYellow ++
                
            + (twoRed) [Picchiare una così è un po' da sfigati.]
                Mi aveva preso il braccio!
                E continuava a dire che sono un bambino e che i bambini qui non ci devono stare.
                E che devo tornare a casa e io NON ci voglio tornare a casa.
                Non volevo picchiarla.
                Volevo solo spingerla via.
                Ma mi sono arrabbiato troppo.
                    ~ secondRed ++

                
            + (twoGreen) [C'è rimasta male, sai?]
                E a me che mi importa?
                Mi ha sgridato perché saltavo nel fiume.
                E poi mi ha detto che i bambini qui non ci devono stare.
                E mi ha preso per la spalla.
                Non mi piace quando mi toccano.
                    ~ secondGreen ++
  
                
            + (twoPurple) [Hai ottenuto quello che volevi?]
                Ha smesso di dirmi che non devo stare qui.
                Che devo tornare a casa.
                E ha mollato la mia spalla.
                Non le volevo fare mica male.
                Ma non mi piace quando i grandi mi toccano.
                    ~ secondPurple ++

            -
        Se {charNameFive} non mi lascia in pace chiamo mio fratello.
        Lui è superforte.
        Ora lasciami in pace.
        {are_two_entities_together(FirstCharacter, PG): {charNameOne}: Che merda essere bambini.}        
             ~ secondPauseTalking = secondCharPauseDuration
            -> main


    
    = three
    //Obiettivo: mostrare che ha mentito all'inizio
    //Contenuto: Ci chiede come ci chiamiamo, emerge una bugia diversa a seconda del genere -> Qui però scopriamo che ci mente, possiamo decidere di mettere in evidenza o meno questa bugia, solitudine.
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    ~ temp charNameOne = translator(firstCharacterState)
    ~ change_entity_place(Mentor)
    ~ secondStoryQuestCount ++

        
        Mica mi hai detto come ti chiami.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
            
        - (top)
            * [Prima dimmi il tuo.]
                Sì no boh.
                No, prima mi dici il tuo.
                    -> top
            + {name_choice} [Mi chiamo {name}.]
    	    + [Il mio nome è...]
    	        -> name_choice ->
    	    -
    	    E i miei pronomi sono:
    	        -> gender ->
    	   Utile.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral     
    	        
    	 {
    	    - pronouns has him:
    	        -> him_liar
    	    - pronouns has her:
    	        -> her_liar
    	    - pronouns has they:
    	        -> they_liar
    	 }       
    	        
    	        
        	  = him_liar
            	  ~ temp charNameTwo = translator(secondCharacterState)
            	  ~ temp charNameFive = translator(fifthCharacterState)
            	  
            	  Sono contento che sei un maschio.
            	  {charNameFive} è così noiosa.
            	  Vuole cacciarmi.
            	  Ma io sto qui.
            	  Mamma si è dimenticata di nuovo il mio compleanno.
            	  E da qui non me ne vado!
            	  Ma a te piacciono le action figures?
            	  Tutti i miei compagni di classe ne hanno, ma io no.
            	  Mamma fa sempre storie se le chiedo di comprarmi qualcosa.
            	  Ne avevo una di Kratos.
            	  Ma mamma voleva buttarla perché dice che è troppo violento per un bambino.
            	  E che non devo diventare violento.
            	  E così l'ho regalata a mio fratello.
            	  E quando vado a trovarlo posso vederla.
            	  E posso giocare con la Switch.
        	    -> three_continue
        	  
        	  = her_liar
        	  ~ temp charNameTwo = translator(secondCharacterState)
        	  ~ temp charNameOne = translator(firstCharacterState)
        	  
            	  Ah.
            	  Sei una ragazza quindi.
            	  Non ci parlo mica molto con le ragazze, siete strane.
                {are_two_entities_together(FirstCharacter, PG): {charNameOne}: Disse quello che passa le ore a studiarsi le caccole.} #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_neutral
            	  Devo ancora capire se sei strana anche tu. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
            	  Anche mamma è strana.
            	  Ma le voglio bene.
            	  Anche se a volte si dimentica le cose.
            	  Però se lo faccio io si arrabbia.
            	  Il mese scorso mi sono dimenticato dell'anniversario suo e di papà e non mi ha parlato tutto il giorno.
            	  Pensava che non le voglio bene.
            	  Ma poi lei oggi si è dimenticata il mio compleanno.
            	  Non so nemmeno se sa che sono qui.
        	    -> three_continue
        	  
        	  = they_liar
        	  ~ temp charNameTwo = translator(secondCharacterState)
        	        Mmm.
        	        Capito.
        	        Anche io vorrei un pronome strano.
        	        Ma poi mamma lo dice male, sicuro.
        	        Già oggi si è dimenticata del mio compleanno.
        	        E anche l'anno scorso.
        	        Ma poi però mi ha regalato una action figure di Spiderman.
        	        E mi ha chiesto scusa per due giorni.
        	        Ma preferisco le tartarughe ninja.
        	        Così poi vedo i coccodrilli delle fogne.
                    Non ho mai visto un coccodrillo.
                -> three_continue
       
       
        = three_continue 
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameOne = translator(firstCharacterState)
            //Definire meglio in base ai colori.
            
            + {him_liar} [Bugia: hai detto di esser pieno di action figures.]
                    ~ secondBlue ++
                "Pieno" è un modo di dire.
                Come "Furbo come una volpe".
                O "Simpatico come {name}".
            
            + {him_liar} [Prima hai detto che tutte le action te le ha rubate tuo padre.]
                    ~ secondRed ++
                No.
                Ricordi male.
                Papà è bravo, non fa queste cose. 
               
            
            + {her_liar} [Tua mamma si arrabbia spesso?]
                    ~ secondRed ++
                Un po'.
                Non è cattiva, è che sono cattivo io.
                E così perde la pazienza.
                Ma è colpa mia.
            
            + {her_liar or they_liar} [Avevi detto che questo è il regalo di compleanno di tua mamma.]
                Sì no boh.
                Anche.
                Uffi, che noia che fai!
                    ~ secondBlue ++
            
                  
            + {they_liar} [Ma non era il suo regalo di compleanno questo?]
                    ~ secondRed ++
                Sì, certo che sì.
                Si è dimenticata il compleanno, ma poi ha deciso di farmi questo.
                Per scusarsi.
                E poi mi prenderà un cane!
                   
                 
            + [Ci stai male, quando mamma dimentica il tuo compleanno?]
                Un po'.
                Ma solo perché fa tante promesse tutto l'anno.
                E poi non succede mai niente.
                Voglio festeggiarlo con mio fratello.
                Ma poi papà si arrabbia.
                E così non facciamo mai nulla.
                E allora vado a letto prestissimo e correggo tutta la giornata.
                    ~ secondGreen ++          
            

            + [Però non mi hai detto il tuo nome. Sei una spia?]
                Sì no boh.
                Una spia non direbbe mai che è una spia.
                Oppure ti confonde, così non capisci cosa è vero o cosa no.
                Però tu non puoi mica farlo!
                    ~ secondYellow ++
                
                
            + [Sembra che tua mamma sia piena di preoccupazioni.]
                Mamma è sempre preoccupata di tutto.
                Mio fratello prova ad aiutarla, ma a volte si arrabbia perché lei non vuole.
                Dice che ce la vuole fare da sola.
                E anche io ci provo.
                Lei dice che farsi aiutare è barare.
                Nonna dice che a volte bisogna barare per andare avanti.
                    ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDuration
            -> main
    
    
    
    
    = four
    //Obiettivo: Far vedere che c'è qualcosa che non va a casa.
    //Contenuto: Momento di vulnerabilità, ci parla della nonna (ma non ci dice che è morta) e ci dice che è fuggito da casa.
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    ~ temp charNameOne = translator(firstCharacterState)
    ~ change_entity_place(Mentor)
    
    ~ secondStoryQuestCount ++
        -> secondAffinityCheckCalc ->
        
        Nonna non mi tratta mai come un bambino.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
        Mi ha anche insegnato come barare a carte.
        E come aprire il cassetto dei dolci di mamma.
        Quando mamma e papà ci lasciavano a casa da soli mangiavamo sempre cose buone.
        E guardavamo assieme la tele.
        E potevo scegliere cosa guardare.
        Quando papà è andato via nonna ha aiutato mamma a stare bene.
        Anche se a mamma mica piace la nonna.
        E quando papà è tornato ha ripreso a trattarla male.
        Che rabbia.
        Ma nonna dice che succede.
        Che i grandi fanno cose cattive senza saperlo.
        Mi spiace essere scappato di casa.
        {are_two_entities_together(FirstCharacter, PG): {charNameOne}: Se Talco fosse qui, ti avrebbe già adottato.} #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_neutral
        Commentino per i tag. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
        
            + [Non parli mai di tuo nonno. Non c'è più?]
                Se ne è andato quando papà era molto piccolo.
                Più di me.
                Ogni tanto scriveva delle lettere che facevano arrabbiare mamma.
                Poi ha smesso.
                Mamma dice che spera sia anneggato in mare.
                Papà invece ha ancora tutte le sue lettere nascoste nel garage.
                    ~ secondBlue ++
                
            + [Insegni a barare anche a me?]
                Ho una idea!
                Troviamo delle carte.
                Ti insegno come si bara.
                E poi stracciamo {charNameFive}.
                Così la smette di dirmi cosa non devo fare.
                    ~ secondYellow ++
                
            + [Tua nonna sembra una tipa forte!]
                "Forte"?
                Quanto sei {pronouns has him: vecchio|{pronouns has her: vecchia|vecchiə}}?
                Però sì, lei spacca proprio.
                Una volta ha lanciato una ciabatta in faccia a papà perché l'ha chiamata strega.
                E poi gli ha sputato di nascosto nel caffé.
                E lui si è arrabbiato perché io ridevo mentre lo beveva.
                Abbiamo tantissimi segreti lei e io!
                    ~ secondRed ++

                
            + [Ti manca casa? Vorresti tornare?]
                Sì no boh.
                Voglio tornare.
                Ma se poi mamma si arrabbia?
                O papà?
                Voglio andare da mio fratello.
                Lì mi piace.
                Ma non piaccio al suo amico.
                    ~ secondGreen ++
  
                
            + [Quando i grandi hanno paura, fanno cose cattive.]
                Papà dice che i grandi non hanno paura.
                Ma non gli credo.
                Mio fratello a volte ha paura che l'amico lo lascia.
                Mamma delle bollette.
                Nonna però non ha paura di nulla.
                Però si arrabbia tanto quando gioca a briscola.
                    ~ secondPurple ++
 
            -
        Mi spiace, {name}. 
        Prima ho detto delle bugie.
        Non è vero che mamma mi ha mandato qui.
        Ma volevo così tanto avere un bel compleanno.
        Questo posto è pieno di animali!
        E nessuno si arrabbia con me.
        A parte {charNameFive}.
        Ti prometto che non dirò più bugie.
        Ora però lasciami solo.
        
            //Leviamo l'innaffiatoio
            ~ move_entity(WateringCan, Safekeeping)
            ~ secondPauseTalking = secondCharPauseDuration
            -> main
    
    = five
    //Obiettivo: Mostrare sempre il carattere complicato ma anche la posizione complicata socialmente. La scuola è un posto in cui non è al sicuro.
    //Contenuto: Lo accusiamo del furto, da lì emergono alcune cose sulla scuola. A seconda del rapporto, mente per evitare le punizioni, o è sincero. Il discorso dei compagni parte a prescindere.
  
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    ~ temp charNameOne = translator(firstCharacterState)
    ~ change_entity_place(Mentor)
    
    ~ secondStoryQuestCount ++
        
        Dalla serra è scomparso l'innaffiatoio. #speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:PG_neutral
        ... #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral

            + [Secondo {charNameFive} sei stato tu a prenderlo.]
                Perché lei mi odia.

            
            + [Secondo me sei stato tu a prenderlo.]
                Ti odio!
                Perché date tutti sempre la colpa a me?
            
            + [Hai idea di dove sia?]
                Pensi che è colpa mia?

            -
     
        Anche a scuola danno sempre la colpa a me. 

        Non mi piace mica tanto la scuola.
        I ragazzi più grandi mi fanno male.
        Ma io non piango.
        Non sono una femmina.
        E sono più forte di loro.
        Ma non coi pugni.
        E le ragazze della mia età sono strane.
        E mi dicono che.
        No, non te lo dico mica.
        E le maestre mi mettono sempre in castigo.
        Se mi nascondo nell'armadio perché ho sonno.
        Se spingo gli altri per terra.
        Se mi distraggo.
        Una volta nonna, quando stava bene, è venuta e ha sgridato tutte le maestre.
        Ora sono un po' più gentili.
        Ma quella di matematica dice sempre che le dispiace per me.
        E non mi piace quando fa così.
            
        
            + [Anche i maschi piangono, e anche gli orsi e gli elefanti.]
                Gli orsi mi piacciono.
                Sono forti.
                Ma comunque piangono.
                Questa è una cosa nuova.
                E mi piace.
                Ma non so se mi piace piangere.
                    ~ secondBlue ++
                
            + [La scuola è un posto senza fantasia!]
                Sì no boh.
                A me mi piace tanto raccontare le storie.
                Inventare cose nuove.
                Fare gli esperimenti.
                Parlare di animali.
                Ma ogni cosa che faccio fa arrabbiare qualcuno.
                Ma se non faccio cose mi annoio.
                E se mi annoio comunque finisco in castigo.
                    ~ secondYellow ++
                
            + [Stringi i denti, lotta, diventa più forte degli altri!]
                Lo dice anche papà.
                Ma a me non mi interessa mica tanto.
                Voglio solo studiare gli animali.
                E che mi lascino in pace.
                    ~ secondRed ++

                
            + [A me spiace per te, sai?]
                Sì no boh.
                Non dirlo.
                Non so cosa provo se lo dici.
                Mi viene da piangere.
                Ma non voglio piangere.
                Quindi non dirlo più.
                    ~ secondGreen ++
  
                
            + [I castighi sono inutili. Hai mai imparato qualcosa dai castighi?]
                A non farmi scoprire.
                I castighi sono proprio brutti.
                Sentire tutti che giocano e si divertono.
                E tu non puoi fare nulla.
                Ti viene solo più rabbia.
                Sono ingiusti.
                    ~ secondPurple ++
 
            -
            //Se fiducia bassa.
            {
                - secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 1):
                    Comunque l'innaffiatoio non l'ho mica visto.
                    Ma.
                    Sono sicuro che se cerchi bene lo trovi dove l'avete lasciato.
                - else:
                    Non ho mai visto nessun innaffiacoso.
                    Non bagno mica le piante, io.
                    Cerca bene e vedi che lo trovi.
            }
            
            //Se fiducia alta.

            
            //Ricompare l'innaffiatoio
            ~ move_entity(WateringCan, Greenhouse)
            ~ secondPauseTalking = secondCharPauseDuration
                -> main
    
    
    = six
    //Obiettivo: Mostrare che sta iniziando a non mentire.
    //Contenuto: Ci racconta della rana, possiamo decidere di non credergli o meno.
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        ~ change_entity_place(Mentor)
        
        ~ secondStoryQuestCount ++
        
        Prima ho visto una rana allo stagno. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
        E so tutto sulle rane.
        Che mica chiudono gli occhi per dormire.
        E che alcune sono velenose.
        E velenoso e tossico non sono la stessa cosa.
        Nonna dice che se lo lecchi e stai male, è tossico.
        Se lo tocchi e stai male, è velenoso.
        E se ti guarda e stai male, è mamma.
        {are_two_entities_together(FirstCharacter, PG): Questo shade sicuro che me lo riciclo.} #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_neutral
        E so altre cose sulle rane. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
        Ma non ho mai visto una rana parlare.
        O fare dei regali.
        E quella dello stagno mi ha parlato.
        Ma mi ha detto che il regalo è per te invece.
        
            + [Se qualcosa non è mai accaduta, non è per forza impossibile.]
                Quindi mi credi?
                Quindi tutto è possibile?
                Anche che salto e volo?
                O che la serra diventa di cioccolato?
                O che la mentore faccia una battuta carina?
                    ~ secondBlue ++
                
            + [Speriamo sia il nuovo Super Wario!]
                Posso giocarci anche io?
                Ma dove lo attacchiamo?
                Qui non ci sono TV.
                Però lo stagno sbrilluccica.
                Forse la rana lo trasforma in uno schermo!
                    ~ secondYellow ++
                
            + [{charNameTwo}, se continui con le balle non mi fido più di te!]
                Non sono balle!
                Mi piacciono gli animali.
                Non mi serve inventare altri animali perché quelli che ci sono mi piacciono già.
                La rana c'è, vai a vedere!
                    ~ secondRed ++

                
            + [Sembra una rana molto gentile.]
                A me mi sta simpatica.
                E non credo sia tossica o velenosa.
                Però anche io vorrei un regalo.
                Se non ti piace mi dai quello che ti dà?
                Spero tanto sia un cucciolo.
                O la Play!
                    ~ secondGreen ++
  
                
            + [E se lo senti e prudono le orecchie è una bugia.]
                Non è una bugia!
                Perché non mi credi?
                Non siamo amici?
                Ti giuro che c'è una rana nello stagno!
                    ~ secondPurple ++
 
            - (theFrog)
             ~ secondPauseTalking = secondCharPauseDuration
             
                -> main
    
    = seven
    //Obiettivo: raccontare il suo rapporto con la fantasia e le tensioni in famiglia (finale verde e finale viola)
    //Contenuto: Parla della fantasia, e del fatto che la sera si riscrive la giornata, capiamo che la famiglia litiga spesso. Tensione in casa anche per la morte della nonna
    
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        ~ change_entity_place(Mentor)
        
        ~ secondStoryQuestCount ++
        
        La rana prima mi ha detto che tu scrivi storie. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
        A me mi piacciono le storie.
        C'è una cosa che non dico mai a nessuno.
        Mamma è felice perché vado a letto presto.
        Ma è perché mi piace stare al buio da solo.
        Così posso pensare alle cose che ho fatto durante il giorno.
        E correggere quelle che non mi piacciono.
        Quando uno di quinta mi ha picchiato, la sera ho corretto tutto e l'ho picchiato io.
        E i miei compagni poi erano miei amici così.
        Una volta ho preso un brutto voto e papà e mamma hanno litigato perché si davano la colpa.
        Ma allora ho corretto tutto e io non prendevo un brutto voto.
        E andavamo a prendere un gelato.
        E la nonna non era nella casa dei vecchi.
        E quando papà è tornato dopo essere andato via ed era arrabbiato, invece è tornato con un cane.
        Non ho mai avuto un cane.
        Sai che i cani sentono suoni fino a duecento metri?
        Se li chiami e non vengono è perché non vogliono.
        Anche io faccio così.
        
            + [Con questa fantasia potresti fare cose più pratiche.]
                Ma non mi servono le cose pratiche.
                Mi serve immaginare cose più belle.
                Così le giornate sono più facili.
                    ~ secondBlue ++
                
            + [Hai mai corretto una giornata mettendoci vampiri o zombie?]
                Sì!
                Una volta siamo andati in gita a vedere i Camuni.
                E la guida diceva tutte queste cose noiose.
                E a casa ho corretto tutto perché ero un camuno.
                E i disegni sul muro li avevo fatti io.
                E lottavamo contro i cervombie.
                Cervi zombie.
                Ho riso tantissimo quella sera!
                        ~ secondYellow ++
                        
            + [Se i grandi ti picchiano, devi fare squadra con gli altri!]
                Una volta ci ho provato.
                Ma io non piaccio molto agli altri.
                Mi dicono che sono scemo, per via degli animali.
                O mi dicono che sono strano.
                E che non gli piace quando mi arrabbio.
                    ~ secondRed ++

                
            + [Grazie per avermi raccontato questa cosa.]
                Sì no boh.
                Non è mica una cosa così grossa comunque.
                Però mi piace.
                Non è poi che lo faccio proprio sempre.
                Solo con le cose brutte.
                O quando non succede niente.
                A volte è peggio.
                Non mi piace annoiarmi.
                    ~ secondGreen ++
  
                
            + [Come mai se qualcuno ti chiama non rispondi?]
                Perché se qualcuno mi chiama è arrabbiato con me.
                O mi chiede di fare qualcosa.
                Non succede mai che è per una bella sorpresa.
                O per guardare i cartoni assieme.
                    ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDuration
            -> main        
            
            
    = eight
    //Obiettivo: presentare la relazione col fratello maggiore, che è una persona molto pragmatica (finale blu, finale giallo)
    //Contenuti: ci parla del fratello come mito, riferimento, modello. All'inizio mente, ma poi si ridimensiona da solo (sta iniziano a fidarsi).
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    ~ temp charNameOne = translator(firstCharacterState)
    ~ change_entity_place(Mentor)
    
    ~ secondStoryQuestCount ++
        
        Sai che mio fratello è campione di Karate? #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
        E ha una macchina enorme gialla che fa arrabbiare papà.
        E hai i muscoli che...
        Bugia.
        Scusa.
        Non è proprio campione in realtà.
        Però per me è bravissimo.
        E la macchina è di papà.
        Che si arrabbia perché prima era nera, e lui l'ha colorata di giallo.
        Mio fratello è super però.
        Lavora in una officina e nel tempo libero fa delle statue col saldatore e i pezzi rotti delle macchine.
        E vive in una casa piccola piccola assieme al suo amico.
        Viene a trovarci quando non c'è papà perché non si piacciono.
        Ma se papà mi fa male allora lo cerca e gli urla addosso tantissime cose.
        Mi ha promesso che mi porta a pescare una volta.
        Senza dirlo a mamma perché lei ha paura perché non so nuotare.
        Ma lui sa fare tutto.
        E il suo amico fa dei dolci buonissimi.
        E anche lui non sa nuotare.
        Ma non mi sembra felice quando vado da loro e quindi ci vado poco.
            
            + [Non devi sapere nuotare per pescare.]
                Esatto!
                Ma lei non lo vuole capire.
                "E se cadi in acqua?"
                "E se un'onda ti investe?"
                "E se tuo fratello si distrae?"
                Mamma è davvero pesante.
                    ~ secondBlue ++
                
            + [Le statue di tuo fratello si muovono?]
                Forse quando non ci siamo?
                Mio fratello è superdisordinato.
                Quindi se si spostano non è che lo capisci con facilità.
                Però gli serve l'elettricità.
                Voglio costruirne una anche io.
                Forse in biblioteca c'è una guida!
                    ~ secondYellow ++
                
            + [{charNameTwo}, non devi sempre dare ragione agli adulti.]
                Non è mica facile!
                Papà se si arrabbia mi picchia.
                E se invece parli dell'amico di mio fratello...
                Credo che lui sia buono.
                Ma se poi si arrabbia con me e non mi vuole più lì?
                Poi non ci posso più stare con mio fratello!
                    ~ secondRed ++

                
            + [Hai chiesto all'amico di tuo fratello cosa pensa di te?]
                Scherzi?!?
                Non sono mica così strano.
                Però una volta l'ho chiesto a mio fratello.
                E mi ha detto che gli piaccio molto.
                Ma non ci credo.
                Anche perché a quello non gli piacciono i bambini proprio.
                Ed è una cosa che rende molto triste mio fratello.
                    ~ secondGreen ++
  
                
            + [Grazie per aver corretto le tue bugie.]
                Sì no boh.
                Non so ancora se mi piaci.
                Ma sei l'unica persona qui.
                A parte {charNameFive}, ma lei di sicuro non mi piace mica.
                Poi le cose qui sono belle.
                Le bugie sono meno interessanti.
                    ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDuration
            -> main    
    
    
    = nine
    //Obiettivo: mostrare tra le righe la paura per il futuro, anche dimostrazione di rabbia verso di sè? (finale rosso sicuro, finale blu?
    //Contenuti: tutti sanno cosa diventare da grandi, io voglio fare il veterinaio ma?
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        ~ temp charNameOne = translator(firstCharacterState)
        ~ change_entity_place(Mentor)
        
        ~ secondStoryQuestCount ++
        
        Tu hai sempre voluto fare {pronouns has him: il riscrittore|{pronouns has her: la riscrittora|lə riscrittorə}} come lavoro? #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
        
            + [Fino a poco fa nemmeno sapevo esistesse questo posto.]
                Figo!
                Quindi non sono l'unico.
                Se chiedo qualcosa a {charNameFive} mi fa sentire stupido.
                "Bimbo, te le spiego lentamente le cose ora, vieni."
                Non mi deve spiegare lentamente le cose.
                Io so fare le frazioni!
                    ~ secondBlue ++
                
            + [Questo non è il mio lavoro. I lavori sono noiosi.]
                Però ai grandi piace parlare di lavoro.
                E le maestre parlano sempre del futuro.
                E dicono che ci devo lavorare con le cose in cui sono bravo.
                Ma io voglio solo imparare cose nuove!
                    ~ secondYellow ++
                
            + [In realtà non l'ho scelto. Manco mi pagano.]
                Che fregatura.
                Nemmeno mamma mi paga per i lavoretti a casa.
                Dice che è una cosa che devono fare tutti, grandi e piccoli, maschi e femmine.
                Forse {charNameFive} è come mia mamma.
                    ~ secondRed ++
                
            + [Mi è sempre piaciuto far stare bene le persone.]
                Questa è una cosa bella.
                Ma difficile.
                I grandi pensano sempre di sapere cosa fare.
                Cosa vogliono gli altri.
                Ma poi sbagliano.
                E se la prendono con la persona che volevano aiutare.
                Per questo si fa prima a fare da soli.
                Mica puoi litigare con te stesso, no?
                    ~ secondGreen ++
  
                
            + [Voglio portare un grande cambiamento partendo dal piccolo.]
            
                E io sono piccolo.
                Mi sembra una cosa faticosa.
                Però la capisco.
                È come l'elettricità.
                È così piccola che non la vedi.
                Ma fa muovere le cose grandi!
                O bruciare i muri.
                    ~ secondPurple ++
 
            -
            
        I miei compagni fanno tantissime cose.
        Calcio. Basket. Pallavolo.
        Suonano il pianoforte o la chitarra o la batteria.
        Oppure imparano il cinese e l'inglese.
        Sanno già cosa vogliono fare come lavoro.
        A me mi piacciono solo gli animali.
        Ma so anche le cose brutte degli animali.
        Che molti stanno sparendo per colpa degli uomini.
        Che gli oceani sono sempre più vuoti.
        Che gli incendi uccidono un sacco di animali ogni anno.
        E che il futuro sarà sempre peggiore.
        E quindi non so cosa fare da grande.
        Non so se ci saranno ancora gli animali quando sarò grande.
        E questa cosa mi fa arrabbiare.
        Non voglio essere un bambino per sempre.
        Ma non voglio essere grande.
        {are_two_entities_together(FirstCharacter, PG): {charNameOne}: Bimbo, mi stai facendo sentire una piagnona egoista così.} #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_neutral
        Commento per i tag. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
            
            + [Sai che crescerai anche se non lo vuoi, vero?]
                Sì no boh.
                Non è detto.
                Magari resto qui e magari qui il tempo non passa mica.
                E magari riesco a fare venire qui anche mio fratello.
                E la nonna.
                Così siamo tutti felici.
                    ~ secondBlue ++
                
            + [E se invece rimanessi sia bambino che adulto?]
                Nonna dice che è il problema di mamma.
                Che non si prende le sue responsabilità.
                A me mica mi dispiacciono le responsabilità.
                Ma tutto il resto mi spaventa.
                Tutti i litigi.
                La rabbia.
                A me non mi piace la mia rabbia.
                    ~ secondYellow ++
                
            + [Puoi fare il ribelle e salvare gli animali!]
                Tipo Greta!
                A mio fratello piace tanto.
                Però mio fratello dice che bisogna picchiare "quelli". Farli fuori.
                Non ho capito chi sono "quelli".
                Magari posso programmare le statue di mio fratello.
                E ci pensano loro a far fuori "quelli".
                Non ho capito mica nemmeno cosa sia "fare fuori".
                    ~ secondRed ++

                
            + [Non ti preoccupare: hai moltissimo tempo per decidere che fare.]
                Sarà.
                Ma Lara sa già parlare due lingue.
                E Jin è appena entrato nella giovanile della Fiorentina.
                Tommaso legge così tanto che sicuro sicuro diventa un genio.
                Io l'unica cosa che so fare è dire cose stupide sugli animali.
                E trovare nascondigli in ogni posto.
                E dire bugie.
                    ~ secondGreen ++
  
                
            + [Potresti diventare uno storico degli animali.]
                Sì sì sì!
                Qualcuno che racconta le loro storie?
                Come un gioco forse.
                E anche gli animali giocano.
                Anche gli insetti!
                Lo fanno perché gli va.
                E io vorrei sempre fare quello che mi va.
                Il resto è una rottura.
                    ~ secondPurple ++
 
            -
        Però mi piacerebbe fare il veterinario.
             ~ secondPauseTalking = secondCharPauseDuration
            -> main    
    
    = ten
    //Obiettivo: si fida di noi, mostriamo il suo rapporto con la violenza. Finale rosso, finale viola (aiutare gli altri).
    //Contenuti: capiamo che a scuola è un bullo, ma ci sono persone che protegge.
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        ~ change_entity_place(Mentor)
        
        ~ secondStoryQuestCount ++
        
        Stavo ripensando a un bambino.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
        Uno di seconda.
        L'ho picchiato perché mi andava.
        Ero DAVVERO arrabbiato quel giorno.
        E lui ha pianto e mi sono arrabbiato ancora di più.
        La maestra di matematica mi ha messo in castigo.
        Ora quando vedo il bambino mi sento in colpa.
        Ho provato a chiedergli scusa ma lui scappa.
        E sua sorella una volta mi ha lanciato una scarpa in faccia.
        Mio fratello dice che succede.
        Che tra bambini ci si picchia.
        E anche tra grandi.
        Penso che i grandi facciano schifo.
        Quando papà mi picchia dice che è colpa mia.
        Ma a me non piace farmi picchiare.
        O picchiare.
        Ma se sono arrabbiato non so cosa fare.
        {are_two_entities_together(FirstCharacter, PG): Mai provato a suonare la batteria?} #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_neutral
        {are_two_entities_together(FirstCharacter, PG): Poi papà ha un altro motivo per arrabbiarsi.} #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral

        
            + [Solo gli animali non sanno controllarsi.]
                Allora sono un lupo.
                Una giraffa.
                Un coccodrillo.
                Un serpente.
                Un riccio.
                E ora ti spino!
                    ~ secondBlue ++
                
            + [Immagina di picchiare i mostri invece dei compagni!]
                I mostri mi piacciono.
                Ma anche i miei compagni.
                Però non faccio male a qualcosa che non esiste, no?
                Ma anche questo posto non doveva esistere, credo.
                E invece è qui.
                Chi lo dice che non faccio male ai mostri?
                    ~ secondYellow ++
                
            + [Tuo padre ti picchia, e tu hai imparato da lui a picchiare.]
                NO!
                No.
                Non lo so.
                Mi sembra una cosa difficile.
                Ma voglio tanto che non mi picchi più.
                Non mi piace avere paura di lui.
                    ~ secondRed ++

                
            + [Nessuno merita di essere picchiato, né tu né quel bambino.]
                Però se papà mi picchia c'è un motivo.
                Mamma dice che papà non lascia mai nulla al caso.
                E per questo è il più bravo a lavoro.
                E quel bambino è davvero fastidioso.
                    ~ secondGreen ++
  
                
            + [La rabbia della ragazzina ha protetto il fratello.]
                Ma chi protegge me?
                Uh, bugia, scusa.
                Qui sono stato io a fare il cattivo.
                Forse potrei chiedere a lei come fa?
                Ma sarebbe stupido.
                    ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDuration
            -> main    
    
    = eleven
    //Obiettivo: curiosità, sperimentazione. finale giallo, finale viola
    //Contenuti: esperimenti in casa (microscopio, muro bruciato col Meccano
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        ~ change_entity_place(Mentor)
        
        ~ secondStoryQuestCount ++
        
        Quando vado da mio fratello e non c'è il suo amico, mi lascia sperimentare con le sue cose. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
        Il suo amico fa il pasticciere.
        E ha tantissime cose strane in cucina.
        Mi piace provare le cose, capire.
        Non mi piacciono le cose che non capisco.
        Ma a volte faccio dei casini.
        Una volta ho mischiato le cose per pulire casa e ho vomitato tutto il pomeriggio.
        Un giorno ho riempito il letto di mamma di sabbia e si è grattata per una settimana.
        E poi ho provato ad attaccare un mio robot al frullatore dell'amico di mio fratello.
        E ha fatto una fiammata gigante e un pezzo di muro è diventato nero.
        Mio fratello si è spaventato tantissimo.
        Ma io ero contento perché non sapevo che ci sono dei fili nel muro.
        E ora so cosa è l'elettricità.
        Ma qui non c'è.
        Chissà se è la rana che fa accadere le cose.
        
            + [Hai la mente da scienziato, e vuoi verificare tutto.]
                Lo dice anche mio fratello.
                Per questo mi lascia fare gli esperimenti.
                Ma senza elettricità, dopo l'incidente.
                Però posso usare le batterie.
                Voglio fargli un regalo con le cose della serra, sai?
                    ~ secondBlue ++
                
            + [Proviamo con la lampada della biblioteca!]
                Sì!
                Ci possiamo attaccare la stazione.
                Così le persone sanno come arrivare qui.
                Secondo me tantissime persone si perdono per venire qui.
                Oppure ci mettiamo un faro!
                Ma ci serve qualcosa di alto.
                Forse se prendo tutti i rami del bosco...
                    ~ secondYellow ++
                
            + [Sei tosto perché alla fine fai quello che ti va.]
                Sì no boh.
                Questa cosa agli adulti non piace molto.
                Ma se non posso capire le cose, mi rimangono in testa.
                Mi danno davvero fastidio.
                A volte mi sveglio presto e faccio tutte le cose che non dovrei fare.
                Come provare gli attrezzi di papà.
                O il vecchio respiratore di nonna.
                Solo per capire.
                Poi li rimetto a posto prima che si svegliano tutti.
                    ~ secondRed ++

                
            + [Promettimi che non mangerai nulla di strano, qui.]
                Non sei mia mamma.
                E poi è troppo tardi.
                Ho assaggiato un po' di cose della serra.
                Ma hanno tutte un sapore fastidioso.
                Però per un attimo una delle piante mi ha fatto vedere le cose con colori strani.
                Ma è durato pochissimo e poi avevo solo tanta sete.
                        ~ secondGreen ++
  
                
            + [Tuo fratello ti lascia essere te stesso.]
                Sì!
                Lui non mi sgrida mai.
                E se si arrabbia con me, mi spiega il perché.
                E se non sono d'accordo e glielo dico, mi ascolta.
                Per questo mi piace stare con lui.
                Non mi fa sentire stupido.
                    ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDuration
            -> main    
    
    = twelve
    //Obiettivo: narrativamente, lasciarcelo con una immagine positiva. Far vedere il peso dei genitori. Finale verde, finale giallo.
    //Contenuti. Momento tenero. L'altra nonna, la casa al mare, momenti di pace. I genitori non ci sono in queste occasioni
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        ~ temp charNameOne = translator(firstCharacterState)
        ~ change_entity_place(Mentor)
        
        ~ secondStoryQuestCount ++
        
        Mi piace la biblioteca.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
        Mi ricorda la casa della nonna.
        L'altra nonna, quella che sta al mare.
        Ci vado d'estate e mi diverto tantissimo e ci sono tantissimi libri.
        Lei mi prepara tutte le cose buone.
        E io le insegno tutte le cose più strane sugli animali.
        Mamma e papà non vengono mai.
        Ma mio fratello e il suo amico sì.
        Una volta mi hanno portato a una festa sulla spiaggia.
        E mi hanno fatto cantare nel microfono.
        E hanno riso tutti quando ho ruttato fortissimo.
        Da nonna mi addormento subito.
        Non devo correggere le giornate.
        {are_two_entities_together(FirstCharacter, PG): Vedi tu se dovevo iniziare a provare affetto per un bimbo, mannaggia.} #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_neutral
        Quando finiscono le vacanze però mi sento triste.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
        E arrabbiato.
        Ora che nonna è nella casa dei vecchi, vorrei vivere sempre con l'altra nonna.
        Tanto so studiare da solo.
        Magari studio come si curano i pesci.
        Anche se non ci puoi mica giocare con loro.
            
            + [I libri ti insegnano tante cose.]
                Sì no boh.
                Anche guardare le cose.
                E toccarle.
                Ho imparato tantissime cose da quando sono qui.
                Senza usare un libro.
                A parte quando ne ho impilati alcuni per raggiungere i vasi alti della serra.
                Non dirlo a {charNameFive}, ti prego!
                    ~ secondBlue ++
                
            + [Dobbiamo capire la lingua dei pesci così ci possiamo giocare.]
                Magari è come con le pecore che fanno tanti "bee" diversi.
                Magari hanno tutti i loro dialetti.
                Per me la sogliola parla come i milanesi.
                Ma la carpa ha la faccia da toscana.
                E il pesce spada sicuro che è romano!
                Posso creare un traduttore pescese/umano!
                    ~ secondYellow ++
                
            + [Andiamo a ruttare da {charNameFive} e la facciamo arrabbiare?]
                Ci sto!
                Però mi serve della roba frizzante sennò non mi vengono bene.
                Che poi ora ho capito che {charNameFive} non ce l'ha mica con me.
                Forse mi inizia anche a piacere.
                Ma sì, un rutto se lo merita.
                    ~ secondRed ++

                
            + [Vorresti che venissero anche mamma e papà?]
                Sì no boh.
                Sono cattivo se dico di no?
                Mi piace un posto dove nessuno litiga.
                O si arrabbia con me.
                L'altra nonna, quella del mare, non si arrabbia mai con me.
                Nemmeno quando ho versato tutto il caffè sul divano.
                O quando le ho rubato la grappa.
                Che brutto essere ubriaco!
                    ~ secondGreen ++
  
                
            + [Ti piace insegnare le cose all'altra nonna.]
                Mi aiuta a capirle meglio.
                Tante cose ce le ho solo in testa e stanno assieme tutte contemporaneamente.
                E per me hanno senso.
                Ma quando dico le cose ad alta voce, allora devo metterle in ordine.
                Ed è difficile.
                Anche per questo a volte dico bugie.
                Perché le parole sono sbagliate, ma il contenuto è quello che so o sento.
                Non so se mi sono spiegato.
                    ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDuration
            -> main            
            
            

    = not_talk
    Non ci parlo con chi parla con quella là! #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral

    Mi ha fatto male!
        -> main
                        
    = she_hates_me
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    {charNameFive} ce l'ha con me! #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
    Fa qualcosa!
    {are_two_entities_together(Mentor, PG):Non dire altre bugie, {charNameTwo}!} #speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral


    -> main
        


=== second_story_gift ===
~ temp charNameTwo = translator(secondCharacterState)
<i> Stai per donare qualcosa a {charNameTwo}.</i> #speaker:{fungus_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait:fungus_neutral
        + {findedGifts != ()} [Scelgo il dono.]
            ~ currentReceiver += SecondCharacter
            -> inventory_management
        + {findedGifts == ()} <i> Il tuo inventario è vuoto.</i> #speaker:{fungus_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait:fungus_neutral
            ->main
        
    
        = ink_outcome
            <i>Dopo il tuo dono {inkTranslator(secondCharacterInkLevel)}. #speaker:{fungus_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait:fungus_neutral
                 -> talk_with_second_character
            //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco

=== second_story_chech_trigger
      ~ temp charNameTwo = translator(secondCharacterState)
      //In questa storia non ci sono trigger, lascio la struttura perché non si sa mai.
      
        //{
        //- loneliness == false:
        //    -> loneliness_trigger
        //- else:
        //    -> main_story_first_character
        //}
            -> main_story_second_character
        
        = loneliness_trigger
        Info
            + [Voglio comunque approfondire la storia di questa personaggia.]
                -> main_story_second_character
            + [Salto.]
            //FUTURA SOLUZIONE A QUESTA SITUAZIONE
                -> main
        -
        -> END

=== main_story_second_character
~ temp charNameTwo = translator(secondCharacterState)
//Così se decido di uscire dalla conversazione, posso riprendere da dove eravamo rimaste.
    {
        - not confession:
            -> confession
        - not one:
            -> statement
        - else:
            -> one
    }
    = confession
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    ~ temp charNameOne = translator(firstCharacterState)
    ~ change_entity_place(Mentor)
    
    //Parole chiave legate alla fiducia.
        Abbiamo parlato tantissimo #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral

        Ma davvero TANTISSSSSSIMO!
        Sai cosa penso di te?
    {
        -   are_two_entities_together(FirstCharacter, PG): E questo è il momento per me di levarmi da qui e lasciarvi in pace. #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_neutral

                ~ change_entity_place(FirstCharacter)
    }          
            -> secondAffinityCalc ->
        {
        
        //Migliore outcome
        - secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 1): Non sei male, per essere grande. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
            Dici sempre le cose allo stesso modo.
            Come un cane che scodinzola se è felice ma abbaia se arrabbiato.
            E questo mi fa stare al sicuro.
            C'è una cosa che devo dire a qualcuno, e voglio dirla a te.
        <i>{charNameTwo} vede {name} come una persona amica e fidata.</i>#speaker:{fungus_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait:fungus_neutral
        
        //Secondo migliore outcome
        -secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 2): Un po' mi fido #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
            Secondo me non dici <i>sempre</i> le cose in modo preciso.
            Sembri un po' un gatto.
            Ma mi fido.
            C'è una cosa che devo dire a qualcuno, e voglio dirla a te.
        <i>{charNameTwo} si trova bene con {name}.</i> #speaker:{fungus_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait:fungus_neutral
        //Outcome peggiore
        - secondPurple or secondGreen or secondRed or secondBlue or secondYellow < (secondStoryQuestCount/2):  Secondo me mi tratti come un bambino. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
            Tutte le cose che dici cambiano, sono disordinate.
            Come i camaleonti che sono verdi sulle foglie e bianchi sul muro.
            Non mi piace mica come cosa.
            C'è una cosa che devo dire a qualcuno.
            E posso dirla solo a te.
            Purtroppo.
        <i>{charNameTwo} non si è sentito capito da {name}.</i>#speaker:{fungus_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait:fungus_neutral
        
        //Outcome neutro
        - else: Che non ho capito cosa pensi. Sei come quando guardo nel terrario e non capisco se c'è l'insetto stecco o sono solo rami. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
            C'è una cosa che devo dire a qualcuno.
            E posso dirla solo a te.
            Purtroppo.
        <i>{charNameTwo} non riesce a capire che rapporto sta costruendo con {name}.</i>#speaker:{fungus_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait:fungus_neutral
        
        }
       
        Da quando nonna è nella casa dei vecchi fa tutto schifo. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
        Papà è tornato ma litiga sempre con mamma.
        E quando papà non c'è mamma si arrabbia con me.
        E l'unica cosa che mi dice è che devo smetterla di piangere e fare il grande.
        Che anche se piango nonna non torna.
        E a scuola le maestre sono fastidiose.
        <b>Stronze</b>.
        Scusa.
        Mio fratello dice che il mondo è un posto orribile e che non si può più aggiustare.
        Gli animali spariranno tutti ed è colpa nostra.
        Papà dice che devo crescere, non pensare agli animali perché ora sono grande.
        Ma i grandi fanno schifo.
        E non voglio fare schifo.
        E non voglio diventare grande.
        Per questo sono venuto qui.
        Per stare con gli animali.
        Non è il mio compleanno.
        Scusa per la bugia.
        Ma se non mi invento un motivo per le cose nessuno mi ascolta.
        ~ growing ++
        
            + [Forse so come farti vedere le cose in modo diverso.]
                -> statement
            + [Capisco il tuo dolore, ma ho bisogno di riflettere un attimo.]
                -> main


    = statement
    ~ temp charNameTwo = translator(secondCharacterState)
        <i>A seguito del rapporto che {name} ha creato con {charNameTwo} {secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 1): l'inchiostro è aumentato di due unità|{secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 2): l'inchiostro è aumentato di una unità|l'inchiostro non ha subito variazioni}}.</i> #speaker:{fungus_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait:fungus_neutral
        //Sopra ho già aggiornato il livello di inchiostro e quindi di affinità.
            ~ inkLevel(secondCharacterInkLevel)
        + [Voglio cominciare la riscrittura.]
            -> secondNaming -> 
            -> one
        + [Preferisco prendermi del tempo.]
            -> main

    = one
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameOne = translator(firstCharacterState)
    ~ change_entity_place(Mentor)
    {
        -   are_two_entities_together(FirstCharacter, PG):{charNameOne}: Qui le cose si fanno serie, e io me ne vado. #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_neutral
                ~ change_entity_place(FirstCharacter)
    }        
      //Affrontiamo gli adulti in generale
    Hai detto che i grandi fanno schifo e che non ti fidi di loro.  #speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:PG_neutral


        + [Però tua nonna e tuo fratello spaccano.]
            Tua nonna ti ha insegnato a barare!
            Tuo fratello crea cose e ti protegge.
            Anche loro sono adulti.
                   ~ secondRed ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(red)
        
        + [I tuoi genitori sono infelici, essere adulti è difficile.]
            Tutti i litigi, la fuga di tuo padre.
            Diventiamo grandi, abbiamo un sacco di doveri, e non sappiamo cosa fare.
            Per questo i grandi fanno cose brutte.
            Ma questo non li rende schifosi.
                   ~ secondGreen ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(green)  
        
        + [Il problema è che agli adulti non è permesso giocare.]
            Tua nonna gioca, bara, e infatti è super.
            I tuoi genitori lavorano e litigano e sono infelici.
            Tu puoi essere un grande che gioca.
            E che gioca con gli animali per vivere.
            Ed essere felice.
                   ~ secondYellow ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(yellow)          
     
            
        + [Però gli adulti hanno anche scoperto le cose che ti piacciono.]
            L'elettricità.
            Gli studi sugli animali.
            Le caramelle.
            Le action figures.
                   ~ secondBlue ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(blue)    
        
        + [Hai ragione. Ma tu puoi essere un altro tipo di adulto.]
            Un adulto che sa correggere le giornate.
            Anche per le altre persone.
            Che può tornare a fidarsi delle altre persone.
                   ~ secondPurple ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(purple)    
            
        -
        ~ numberQuestion ++  
    Dico cose #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral

        {
        - secondCharacterInkLevel == Empty:
            -> ending
        - else: 
            -> two
        }        
        
    
    = two
    ~ temp charNameTwo = translator(secondCharacterState)
    Hai paura che il mondo stia finendo e che spariranno tutti gli animali.  #speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:PG_neutral
  
        + [Non puoi prevedere il futuro. Goditi quello che c'è senza rimpianti.]
            Se le cose sono incerte, prenditi le certezze.
            E la cosa certa è che gli animali ci sono ancora.
            Che tuo fratello ti vuole bene.
            E le caramelle sono buone.
                   ~ secondYellow ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(yellow)            
  
                    
        + [Sei giovane ma sai già un sacco di cose. Studia e salvali.]
            Si ha paura solo se non si conosce una cosa.
            Impara a conoscere quello di cui hai paura.
            E a quel punto saprai anche come cambiare le cose.
                   ~ secondBlue ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(blue)    
    
            
        + [E allora lotta. Unisciti ad altri e protesta!]
            Sei abituato a stare in castigo, di cosa hai paura?
            A scuola fai quello che vuoi.
            Fallo anche fuori.
            Per salvare il mondo.
                    ~ secondRed ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(red)            
            
        + [Inventa storie, bugie che creino compassione, che cambino le persone.]
            Un po' come la bugia del compleanno.
            Ma per far sì che ogni bosco abbia migliaia di compleanni.
            Usa il tuo dono per convincere le persone a cambiare.
                   ~ secondGreen ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(green)  
                
        + [La paura blocca, la paura è una scusa comoda.]
            La paura è un rifugio.
            Se hai paura, non agisci.
            Se agisci non cambi nulla.
            Davvero vuoi restare per sempre bloccato dalla paura?
                   ~ secondPurple ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(purple)    
            
                    
        -
        ~ numberQuestion ++  
    Dico cose #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
    
        {
        - secondCharacterInkLevel == Low:
            -> ending
        - else: 
            -> three
        }
        
    = three
    ~ temp charNameTwo = translator(secondCharacterState)
    //Affrontiamo il mondo. Rabbia, bugie, fantasia, violenza etc.
    Tuo fratello dice che il mondo è orribile e che non si può più aggiustare.  #speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:PG_neutral
    
        + [Eppure crea arte.]
            E l'arte è respiro, futuro, è cambiamento.
            L'arte è credere che le cose possano migliorare.
            Definisce un presente, per lanciarci altrove.
            E rende il mondo un posto meno orribile.
                   ~ secondPurple ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(purple)    
            
        
        + [Eppure ama il suo ragazzo.]
            E ama te.
            E fa in modo che possiate passare tanto tempo assieme.
            Che tu possa avere uno spazio felice.
            E così rende il mondo un po' meno orribile.
                   ~ secondGreen ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(green)  
                
        + [Eppure lotta contro tuo padre perché tu stia meglio.]
            Si è creato una nuova casa.
            Non si è fatto mettere i piedi in testa da nessuno.
            E questo lo fai se pensi ci sia un futuro dove andare.
                    ~ secondRed ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(red)
            
        
        + [Eppure gioca con te.]
            Si diverte, lascia che le cose belle accadano.
            In un mondo orribile, esisterebbe davvero il piacere?
                   ~ secondYellow ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(yellow)            

                
        + [Eppure per lavoro aggiusta le cose.]
            Vede le cose rotte e le ripara.
            Quindi ci sono cose che si possono aggiustare.
            Serve solo un meccanico per le cose che lo spaventano.
                   ~ secondBlue ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(blue)         
        -
        ~ numberQuestion ++  
    Dico cose #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral       
        {
        - secondCharacterInkLevel == Normal:
            -> ending
        - else: 
            -> four
        }
    
    = four
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)    
    
    //Commento più personale
    {charNameFive} ti ha chiamato {charNameTwo}.  #speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:PG_neutral
    
        + [Vuoi davvero dargliela vinta?]
            Non ti piace da quando sei arrivato qui.
            Ti ha fatto arrabbiare dal primo momento.
            Vuoi davvero che sia lei a decidere come ti chiami?
                    ~ secondRed ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(red)
        
        + [I ricci resistono a tantissimi veleni.]
            Ogni animale ha la sua dote, il suo modo di superare le paure.
            Puoi studiare e diventare un superanimale.
            O divertirti a cambiare quando vuoi.
            E tornare riccio, quando le cose si fanno velenose.
                   ~ secondBlue ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(blue)    
        
        + [A volte ci raggomitoliamo per superare il peggio.]
            Quello che conta è: cosa facciamo, dopo?
            Quando le cose sono superate?
            Restiamo ancora nel nostro posto sicuro?
            O decidiamo di guardare le cose da una prospettiva diversa, e cambiarle?
                   ~ secondPurple ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(purple)    
             
            
        + [Anche se la schiena ha le spine, la loro pancia è tenera e gentile.]
            E tu sei stato tenero molte volte da quando sei qui.
            Con me, con la rana.
            E con le cose che hai raccontato.
            Ti servono ancora quelle spine?
                   ~ secondGreen ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(green)          
        
        + [I ricci hanno un olfatto super, possono trovare tutte le caramelle del mondo.]
            E dopo che hai trovato le caramelle, cambia animale.
            Diventa qualcosa che vede fino alla luna, e insegui le stelle.
            Oppure impara a nuotare fino all'altra parte del mondo.
            Continua a cambiare.
                    ~ secondYellow ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(yellow)    
            
        -
        ~ numberQuestion ++  
    Dico cose #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral       
        -> ending

    = ending
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ numberQuestion = 0
     Per questo ti dico:  #speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:PG_neutral
     
        + {secondRed > 0} [Diventa il più forte, il più coraggioso.]
            Sei un testardo, bugiardo, dispettoso.
            Queste cose unite possono renderti indistruttibile.
            E di cosa avrà mai paura un ragazzo indistruttibile?
                    ~ secondRed ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(red)        
        
        + {secondPurple > 0} [Tutti abbiamo paura. Condividi questa paura con le altre persone.]
            Falle sentire meno sole.
            Meno sbagliate.
            A quel punto saranno pronte a fare il passo.
            A cambiare le cose a loro volta.
            Assieme.
                   ~ secondPurple ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(purple)    
                    
        
        + {secondYellow > 0} [L'opposto della paura è la curiosità.]
            E tu sei il ritratto della curiosità.
            Guarda le cose che arriveranno chiedendoti "Chissà se..." o "E se invece..." o "Perché accade questo?".
            E a quel punto ogni paura diventerà solo un problema da risolvere.
                   ~ secondYellow ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(yellow)            
                
        + {secondGreen > 0} [I tuoi genitori sono spaventati, aiutatevi a vicenda.]
            Nessuna persona può cambiare il mondo da sola.
            Ma possiamo partire dal cambiare le cose che ci circondano, un pezzo alla volta.
                   ~ secondGreen ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(green)          
                
        + {secondBlue > 0} [Con la tua intelligenza puoi rendere il mondo migliore.]
            Puoi aiutare gli adulti a essere meno tristi.
            E gli animali a non morire.
            E tua nonna a uscire dalla casa dei vecchi.
                   ~ secondBlue ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(blue)            
                
        
                
        -     
    Sì. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
    No.
    Boh.
    {name}.
    Tu mi dici queste cose e io mi dico che c'è un animale.
    Un animale che mi piace.
    Un animale che un po' è me.
    E lo voglio come mio nuovo nome.

        {
            - secondCharacterPossibleStates has Riccio:
                Quell'animale è il <b>Riccio</b>.
                Perché l'unico modo per sopravvivere è difendersi da tutto.
            
            - secondCharacterPossibleStates has Grizzly:
                Il mio vero nome è <b>Grizzly</b>.
                Combatterò la mia paura e diventerò il più forte di tutti, imbattibile!
                    ~ secondCharacterState = ()
                    ~ secondCharacterState += Grizzly
            
            - secondCharacterPossibleStates has Lupo:
                Mi chiamerò <b>Lupo</b>.
                E proteggerò il mio branco.
                Mamma, papà, nonna e mio fratello.
                Nessuna delle persone a cui voglio bene deve più stare male.
                    ~ secondCharacterState = ()
                    ~ secondCharacterState += Lupo
            
            - secondCharacterPossibleStates has Delfino:
                E il mio nome è <b>Delfino</b>.
                Se lo guardi bene tutto è un gioco.
                La mia fantasia e le mie bugie aiuteranno le altre persone ad avere meno paura.
                    ~ secondCharacterState = ()
                    ~ secondCharacterState += Delfino                
            
            - secondCharacterPossibleStates has Capibara:
                Mi chiamerò <b>Capibara</b>.
                E imparerò ad avere tantissimi amici.
                Ci sentiremo meno soli!
                E così avremo meno paura.
                    ~ secondCharacterState = ()
                    ~ secondCharacterState += Capibara
            
            - secondCharacterPossibleStates has Corvo:
                Io sono <b>Corvo</b>.
                Sono sveglio e posso capire ciò che mi circonda!
                E posso cambiare le cose che mi fanno paura.
                Aiutare gli altri.
                    ~ secondCharacterState = ()
                    ~ secondCharacterState += Corvo
        }
        
         ~ growing ++   
        
        {
        - secondCharacterSpecialEvent == true:
            -> secret_ending
        - else:
            -> exit
        }
    
    
    = secret_ending
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
        Voglio dirti una cosa {name}. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
        Su {charNameFive}.
        A me non mi sembra mica felice.
        Mi ricorda mamma quando gira per casa dando consigli e dicendo cose e sorridendo.
        E poi si rinchiude in camera e resta in silenzio per ore.
        Per me non sta mica bene.
            ~ secondStory = Ended
            ~ movementsCounter = 0
            ~ PG_advace_management(secondStoryPG)
                -> main
            
    = exit
    ~ temp charNameTwo = translator(secondCharacterState)
        Voglio stare ancora un po' qui prima di prendere il treno. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
        Mi mancherà la rana!
            ~ secondStory = Ended
            ~ movementsCounter = 0
            ~ PG_advace_management(secondStoryPG)
        -> main  
    
=== second_char_story_ended
~ temp charNameTwo = translator(secondCharacterState)
//Con questa formula dopo un tot di scambi la personaggia se ne va salutandoci.
//In alcune situazioni questa cosa non c'è, in altre c'è solo se ho determinati status (es: socievole). In altri non c'è la possibilità che la personaggia se ne vada senza averci salutate (e quindi non c'è l'opzione in story_start)

    {
        - secondCharEndingDialogue < 4:
            -> top
        - else:
            -> goodbye
    }
    
        - (top)
        {~ Stavo pensando che se divento grande posso andare via di casa.|Magari da grande posso anche portare nonna via dalla casa dei vecchi.|Quando torno a casa chiedo a mio fratello se mi prende un cane.|Mi piace l'idea di tornare a casa ora, ma non di non potere mica tornare qui.|Se vieni a trovarmi ti faccio vedere tutte le statue di mio fratello.|Sarà difficile spiegare questa cosa a papà.} #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
                ~ secondCharEndingDialogue ++
        -> main
        
        = goodbye
        ~ temp charNameTwo = translator(secondCharacterState)
        {name}, mi sa che torno a casa. #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
        {secondCharacterPossibleStates hasnt Riccio: Sì no boh.}       
        {secondCharacterPossibleStates hasnt Riccio: Sai che mi è piaciuta alla fine tutta questa cosa?}
        {secondCharacterPossibleStates hasnt Riccio: Mi hai regalato il migliore compleanno del mondo.}
        {secondCharacterPossibleStates hasnt Riccio: Anche se non era mica davvero il mio compleanno.}
        {secondCharacterPossibleStates hasnt Riccio: Vieni a trovarmi una volta.}
        {secondCharacterPossibleStates hasnt Riccio: Mi mancherai.}  
        {secondCharacterPossibleStates has Riccio: Spero papà non sarà arrabbiato.}        
    
        ~ move_entity(SecondCharacter, Safekeeping)
        -> main


=== second_character_opinions
~ temp charNameTwo = translator(secondCharacterState)
~ temp charNameFive = translator(fifthCharacterState)
~ change_entity_place(Mentor)

    //Le sue opinioni comunque ci fanno capire meglio il modo in cui vede il mondo e parte della sua vita fuori da qui.
    {~ Nonna dice che non si scappa dalla periferia. Che papà ce l'ha dentro e se l'è portata anche quando siamo andati a vivere in centro.|Non mi piacciono i cartoni per quelli della mia età. Dicono tutte cose che so già.|Se ci pensi bene dire una bugia o scrivere una storia sono la stessa cosa.|Ogni persona ha un animale dentro secondo me. Prendi {charNameFive}: sembra un gufo. Anzi anzi: un avvoltoio! No, dai. Un fagiano, quelli femmina, tutti grigi grigi.|Mio fratello dice che devo fidarmi di più degli adulti, ma secondo me lo dice perché è adulto.|Per me il veterinario è come il druido dei videogiochi, solo non deve tirare dei dadi per salvare gli animali.|Un po' mi piacerebbe dormire e basta, senza pensieri.|Forse non mi dispiace mica che sei qui.|Se vado via di qui vorrei tanto portare la rana con me.} #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
            -> main















    
