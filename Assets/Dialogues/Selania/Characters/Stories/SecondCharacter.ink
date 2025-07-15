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
                - second_story_gift.ink_outcome: {charNameTwo}: {~ Mi sento triste, ti spiace tornare dopo?|Scusa {name} ma voglio stare solo.|In questo momento sono giù.}
                
                - else: {knowing_second_character.two:{charNameTwo}|???}: {~ Torna dopo.|Ora ho voglia di stare da solo.|Lasciami in pace.|Non ho voglia di parlare.}
            }
            
        -> main
    }

= hub
~ temp charNameTwo = translator(secondCharacterState)

    {knowing_second_character.two:{charNameTwo}|???}: {~ Ciao {name}!|Ciao.|...}
    
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
                        {charNameTwo}: {~ C'è una cosa che voglio dirti, ma te la dico quando non sarò allo stagno.}
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
        
        ???: Perché sei qui?
            
            + [Questo luogo è assurdo e voglio capirlo.]
                ???: Anche a me mi piace capire le cose.
                ???: I grandi si arrabbiano se faccio troppe domande.
                ???: Tipo: perché c'è la neve ma non fa freddo?
                ???: Perché c'è una stazione ma non passa nessun treno?
                ???: Perché c'è vicino alla stazione ma non ci posso entrare?
                    ~ secondBlue ++
                
            + [Perché è pieno di cose buffe!]
                ???: Uh.
                ???: Per ora ho esplorato solo la stazione.
                ???: Però il tabellone con le lettere è strano.
                ???: Le lettere non si danno al postino?
                ???: E il postino non le porta alle persone?
                ???: Mica le appende così!
                    ~ secondYellow ++
                
            + [Perché <b>tu</b> sei qui?]
                ???: Boh, che ne so? 
                ???: Era solo una domanda!
                    ~ secondRed ++

                
            + [Per aiutare chi è in difficoltà.]
                ???: Come il veterinario?
                ???: O come la maestra di ginnastica, che dice di aiutarmi.
                ???: Ma poi mi sgrida se sbaglio?
                    ~ secondGreen ++
                
            + [Per capire meglio chi sono.]
                ???: Non sai chi sei?
                ???: A me mi piacerebbe essere un'altra persona a volte.
                ???: O un labrador, così se mi rotolo nel fango tutti ridono e non si arrabbiano.
                ???: Ma non un gatto: sapevi che i gatti non sentono mica il sapore dolce?
                ???: Che cosa triste!
                    ~ secondPurple ++
            -    
        
        ???: Io sono qui perché è il mio compleanno.
        ???: Mamma mi ha promesso qualcosa di FIGHISSIMO!
        ???: L'anno scorso per Natale mi ha preso tutte le action figures dei miei videogiochi preferiti.
        ???: Ma poi papà me le ha rubate tutte.
        {are_two_entities_together(SecondCharacter, PG): {charNameFive}: Povera anima!}
        ???: Ma lui mica ci può venire qui.
        ???: Perché mamma ha detto che avrebbe dato solo a me qualcosa di bellissimo che papà non può rubare.
        ???: Ma dove trovo le caramelle?
        ???: Mamma dice sempre che non c'è compleanno senza caramelle!
        {are_two_entities_together(FirstCharacter, PG): {charNameOne}: O senza vinello.}
        
        
            + (twoBlue) [Il compleanno arriva a prescindere dalle caramelle.]
                ???: Forse la data.
                ???: Quella sì.
                ???: Ma il compleanno è un'altra cosa.
                ???: È un momento tutto tuo.
                ???: E infatti lo puoi festeggiare in ritardo e comunque è il tuo compleanno!
                    ~ secondBlue ++
                
            + (twoYellow) [Niente caramelle, ma c'è uno stagno dove nuotare!]
                ???: FIGO!
                ???: Non ho mai visto uno stagno!
                ???: Però questa estate ho visto un mare gigantesco.
                ???: Più grande anche del cielo!
                ???: Quello qui non c'è di sicuro!
                    ~ secondYellow ++
                
            + (twoRed) [E come ti sei ripreso i giocattoli?]
                ???: Non sono mica giocattoli.
                ???: E non me li sono ripresi.
                ???: Papà è buono, fino a quando non si arrabbia.
                ???: E non voglio farlo arrabbiare.
                    ~ secondRed ++

                
            + (twoGreen) [Vuoi molto bene alla tua mamma?]
                ???: Sì sì sì.
                ???: Lei è la mamma migliore del pianeta.
                ???: Dell'universo.
                    ~ secondGreen ++
  
                
            + (twoPurple) [Quindi, rubandoti i giochi, tuo papà ti ha fatto un favore.]
                ???: Sì no boh.
                ???: Non ha senso quello che dici.
                ???: Papà non mi deve prendere mica le mie cose.
                ???: Detesto quando fa così.
                    ~ secondPurple ++
            -
            
        ???: Ma dove saranno i miei compagni di scuola?
        ???: Cercali!
        ???: A dopo!
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
      
        
        {charNameTwo}: Questo posto è PIENO di animali!
        {charNameTwo}: Ma ho lasciato a casa il tablet.
        {charNameTwo}: Come faccio a capire cosa fanno?
        {charNameTwo}: Sapevi che gli uccelli vedono dieci colori?
        {charNameTwo}: DIECI! Mica solo tre come noi!
        {charNameTwo}: E che l'acso, atso, axotolot si fa ricrescere le braccia?
            + [Gli chiedo perché ha dato un calcio a {charNameFive}.]
                -> top
            + [Lo lascio continuare.]
            -
            
        {charNameTwo}: E le capre hanno dei loro accenti!
        {charNameTwo}: Non sono mica tutti dei beeeeeeeeee uguali!
        {charNameTwo}: Solo i colibrì sanno volare all'indietro!
        {charNameTwo}: Tu sai camminare indietro? Secondo me no.
            + [Gli chiedo perché ha dato un calcio a {charNameFive}.]
                -> top
            + [Lo lascio continuare.]
            -
        {charNameTwo}: I nasi dei cani sotto tutti diversi, non ci sono due cani con lo stesso naso.
        {charNameTwo}: E...
        {charNameTwo}: Ma mi sa che non mi stai mica ascoltando.
        {charNameTwo}: Come a scuola.
        {charNameTwo}: A scuola mi prendono in giro perché parlo solo di animali.
        {charNameTwo}: Ma sono comunque il più bravo!
            -> top
        
        //Opzioni, varianti sulla violenza alla mentore, risposte diverse?
     
        - (top)
        {name}: {charNameFive} dice che le hai dato un calcio.
            
            + (twoBlue) [Credevo tu fossi disciplinato. Che delusione.]
                {charNameTwo}: Ehi! Mica mi chiedi perché lo fatto!
                {charNameTwo}: Vi odio.
                {charNameTwo}: Tu e lei.
                {charNameTwo}: Mi ha tirato il braccio.
                {charNameTwo}: E continuava a dire che i bambini qui
                {charNameTwo}: non
                {charNameTwo}: ci
                {charNameTwo}: devono
                {charNameTwo}: stare!
                {charNameTwo}: Mi ha fatto arrabbiare.
                    ~ secondBlue ++
                
            + (twoYellow) [Perché non le hai fatto uno scherzo?]
                {charNameTwo}: Perché ero arrabbiato.
                {charNameTwo}: E lei continuava a dire che i bambini qui non ci possono stare.
                {charNameTwo}: Che non potevo saltare nel fiume.
                {charNameTwo}: E mi ha messo una mano sulla spalla.
                {charNameTwo}: E a me
                {charNameTwo}: non
                {charNameTwo}: piace
                {charNameTwo}: quando
                {charNameTwo}: i grandi
                {charNameTwo}: mi toccano.
                    ~ secondYellow ++
                
            + (twoRed) [Picchiare una così è un po' da sfigati.]
                {charNameTwo}: Mi aveva preso il braccio!
                {charNameTwo}: E continuava a dire che sono un bambino e che i bambini qui non ci devono stare.
                {charNameTwo}: E che devo tornare a casa e io NON ci voglio tornare a casa.
                {charNameTwo}: Non volevo picchiarla.
                {charNameTwo}: Volevo solo spingerla via.
                {charNameTwo}: Ma mi sono arrabbiato troppo.
                    ~ secondRed ++

                
            + (twoGreen) [C'è rimasta male, sai?]
                {charNameTwo}: E a me che mi importa?
                {charNameTwo}: Mi ha sgridato perché saltavo nel fiume.
                {charNameTwo}: E poi mi ha detto che i bambini qui non ci devono stare.
                {charNameTwo}: E mi ha preso per la spalla.
                {charNameTwo}: Non mi piace quando mi toccano.
                    ~ secondGreen ++
  
                
            + (twoPurple) [Hai ottenuto quello che volevi?]
                {charNameTwo}: Ha smesso di dirmi che non devo stare qui.
                {charNameTwo}: Che devo tornare a casa.
                {charNameTwo}: E ha mollato la mia spalla.
                {charNameTwo}: Non le volevo fare mica male.
                {charNameTwo}: Ma non mi piace quando i grandi mi toccano.
                    ~ secondPurple ++

            -
        {charNameTwo}: Se {charNameFive} non mi lascia in pace chiamo mio fratello.
        {charNameTwo}: Lui è superforte.
        {charNameTwo}: Ora lasciami in pace.
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

        
        {charNameTwo}: Mica mi hai detto come ti chiami.
            
        - (top)
            * [Prima dimmi il tuo.]
                {charNameTwo}: Sì no boh.
                {charNameTwo}: No, prima mi dici il tuo.
                    -> top
            + {name_choice} [Mi chiamo {name}.]
    	    + [Il mio nome è...]
    	        -> name_choice ->
    	    -
    	    {name}: E i miei pronomi sono:
    	        -> gender ->
    	        
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
            	  
            	  {charNameTwo}: Sono contento che sei un maschio.
            	  {charNameTwo}: {charNameFive} è così noiosa.
            	  {charNameTwo}: Vuole cacciarmi.
            	  {charNameTwo}: Ma io sto qui.
            	  {charNameTwo}: Mamma si è dimenticata di nuovo il mio compleanno.
            	  {charNameTwo}: E da qui non me ne vado!
            	  {charNameTwo}: Ma a te piacciono le action figures?
            	  {charNameTwo}: Tutti i miei compagni di classe ne hanno, ma io no.
            	  {charNameTwo}: Mamma fa sempre storie se le chiedo di comprarmi qualcosa.
            	  {charNameTwo}: Ne avevo una di Kratos.
            	  {charNameTwo}: Ma mamma voleva buttarla perché dice che è troppo violento per un bambino.
            	  {charNameTwo}: E che non devo diventare violento.
            	  {charNameTwo}: E così l'ho regalata a mio fratello.
            	  {charNameTwo}: E quando vado a trovarlo posso vederla.
            	  {charNameTwo}: E posso giocare con la Switch.
        	    -> three_continue
        	  
        	  = her_liar
        	  ~ temp charNameTwo = translator(secondCharacterState)
        	  ~ temp charNameOne = translator(firstCharacterState)
        	  
            	  {charNameTwo}: Ah.
            	  {charNameTwo}: Sei una ragazza quindi.
            	  {charNameTwo}: Non ci parlo mica molto con le ragazze, siete strane.
                {are_two_entities_together(FirstCharacter, PG): {charNameOne}: Disse quello che passa le ore a studiarsi le caccole.}
            	  {charNameTwo}: Devo ancora capire se sei strana anche tu.
            	  {charNameTwo}: Anche mamma è strana.
            	  {charNameTwo}: Ma le voglio bene.
            	  {charNameTwo}: Anche se a volte si dimentica le cose.
            	  {charNameTwo}: Però se lo faccio io si arrabbia.
            	  {charNameTwo}: Il mese scorso mi sono dimenticato dell'anniversario suo e di papà e non mi ha parlato tutto il giorno.
            	  {charNameTwo}: Pensava che non le voglio bene.
            	  {charNameTwo}: Ma poi lei oggi si è dimenticata il mio compleanno.
            	  {charNameTwo}: Non so nemmeno se sa che sono qui.
        	    -> three_continue
        	  
        	  = they_liar
        	  ~ temp charNameTwo = translator(secondCharacterState)
        	        {charNameTwo}: Mmm.
        	        {charNameTwo}: Capito.
        	        {charNameTwo}: Anche io vorrei un pronome strano.
        	        {charNameTwo}: Ma poi mamma lo dice male, sicuro.
        	        {charNameTwo}: Già oggi si è dimenticata del mio compleanno.
        	        {charNameTwo}: E anche l'anno scorso.
        	        {charNameTwo}: Ma poi però mi ha regalato una action figure di Spiderman.
        	        {charNameTwo}: E mi ha chiesto scusa per due giorni.
        	        {charNameTwo}: Ma preferisco le tartarughe ninja.
        	        {charNameTwo}: Così poi vedo i coccodrilli delle fogne.
                    {charNameTwo}: Non ho mai visto un coccodrillo.
                -> three_continue
       
       
        = three_continue 
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameOne = translator(firstCharacterState)
            //Definire meglio in base ai colori.
            
            + {him_liar} [Bugia: hai detto di esser pieno di action figures.]
                    ~ secondBlue ++
                {charNameTwo}: "Pieno" è un modo di dire.
                {charNameTwo}: Come "Furbo come una volpe".
                {charNameTwo}: O "Simpatico come {name}".
            
            + {him_liar} [Prima hai detto che tutte le action te le ha rubate tuo padre.]
                    ~ secondRed ++
                {charNameTwo}: No.
                {charNameTwo}: Ricordi male.
                {charNameTwo}: Papà è bravo, non fa queste cose. 
               
            
            + {her_liar} [Tua mamma si arrabbia spesso?]
                    ~ secondRed ++
                {charNameTwo}: Un po'.
                {charNameTwo}: Non è cattiva, è che sono cattivo io.
                {charNameTwo}: E così perde la pazienza.
                {charNameTwo}: Ma è colpa mia.
            
            + {her_liar or they_liar} [Avevi detto che questo è il regalo di compleanno di tua mamma.]
                {charNameTwo}: Sì no boh.
                {charNameTwo}: Anche.
                {charNameTwo}: Uffi, che noia che fai!
                    ~ secondBlue ++
            
                  
            + {they_liar} [Ma non era il suo regalo di compleanno questo?]
                    ~ secondRed ++
                {charNameTwo}: Sì, certo che sì.
                {charNameTwo}: Si è dimenticata il compleanno, ma poi ha deciso di farmi questo.
                {charNameTwo}: Per scusarsi.
                {charNameTwo}: E poi mi prenderà un cane!
                   
                 
            + [Ci stai male, quando mamma dimentica il tuo compleanno?]
                {charNameTwo}: Un po'.
                {charNameTwo}: Ma solo perché fa tante promesse tutto l'anno.
                {charNameTwo}: E poi non succede mai niente.
                {charNameTwo}: Voglio festeggiarlo con mio fratello.
                {charNameTwo}: Ma poi papà si arrabbia.
                {charNameTwo}: E così non facciamo mai nulla.
                {charNameTwo}: E allora vado a letto prestissimo e correggo tutta la giornata.
                    ~ secondGreen ++          
            

            + [Però non mi hai detto il tuo nome. Sei una spia?]
                {charNameTwo}: Sì no boh.
                {charNameTwo}: Una spia non direbbe mai che è una spia.
                {charNameTwo}: Oppure ti confonde, così non capisci cosa è vero o cosa no.
                {charNameTwo}: Però tu non puoi mica farlo!
                    ~ secondYellow ++
                
                
            + [Sembra che tua mamma sia piena di preoccupazioni.]
                {charNameTwo}: Mamma è sempre preoccupata di tutto.
                {charNameTwo}: Mio fratello prova ad aiutarla, ma a volte si arrabbia perché lei non vuole.
                {charNameTwo}: Dice che ce la vuole fare da sola.
                {charNameTwo}: E anche io ci provo.
                {charNameTwo}: Lei dice che farsi aiutare è barare.
                {charNameTwo}: Nonna dice che a volte bisogna barare per andare avanti.
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
        
        {charNameTwo}: Nonna non mi tratta mai come un bambino.
        {charNameTwo}: Mi ha anche insegnato come barare a carte.
        {charNameTwo}: E come aprire il cassetto dei dolci di mamma.
        {charNameTwo}: Quando mamma e papà ci lasciavano a casa da soli mangiavamo sempre cose buone.
        {charNameTwo}: E guardavamo assieme la tele.
        {charNameTwo}: E potevo scegliere cosa guardare.
        {charNameTwo}: Quando papà è andato via nonna ha aiutato mamma a stare bene.
        {charNameTwo}: Anche se a mamma mica piace la nonna.
        {charNameTwo}: E quando papà è tornato ha ripreso a trattarla male.
        {charNameTwo}: Che rabbia.
        {charNameTwo}: Ma nonna dice che succede.
        {charNameTwo}: Che i grandi fanno cose cattive senza saperlo.
        {charNameTwo}: Mi spiace essere scappato di casa.
        {are_two_entities_together(FirstCharacter, PG): {charNameOne}: Se Talco fosse qui, ti avrebbe già adottato.}        
        
            + [Non parli mai di tuo nonno. Non c'è più?]
                {charNameTwo}: Se ne è andato quando papà era molto piccolo.
                {charNameTwo}: Più di me.
                {charNameTwo}: Ogni tanto scriveva delle lettere che facevano arrabbiare mamma.
                {charNameTwo}: Poi ha smesso.
                {charNameTwo}: Mamma dice che spera sia anneggato in mare.
                {charNameTwo}: Papà invece ha ancora tutte le sue lettere nascoste nel garage.
                    ~ secondBlue ++
                
            + [Insegni a barare anche a me?]
                {charNameTwo}: Ho una idea!
                {charNameTwo}: Troviamo delle carte.
                {charNameTwo}: Ti insegno come si bara.
                {charNameTwo}: E poi stracciamo {charNameFive}.
                {charNameTwo}: Così la smette di dirmi cosa non devo fare.
                    ~ secondYellow ++
                
            + [Tua nonna sembra una tipa forte!]
                {charNameTwo}: "Forte"?
                {charNameTwo}: Quanto sei {pronouns has him: vecchio|{pronouns has her: vecchia|vecchiə}}?
                {charNameTwo}: Però sì, lei spacca proprio.
                {charNameTwo}: Una volta ha lanciato una ciabatta in faccia a papà perché l'ha chiamata strega.
                {charNameTwo}: E poi gli ha sputato di nascosto nel caffé.
                {charNameTwo}: E lui si è arrabbiato perché io ridevo mentre lo beveva.
                {charNameTwo}: Abbiamo tantissimi segreti lei e io!
                    ~ secondRed ++

                
            + [Ti manca casa? Vorresti tornare?]
                {charNameTwo}: Sì no boh.
                {charNameTwo}: Voglio tornare.
                {charNameTwo}: Ma se poi mamma si arrabbia?
                {charNameTwo}: O papà?
                {charNameTwo}: Voglio andare da mio fratello.
                {charNameTwo}: Lì mi piace.
                {charNameTwo}: Ma non piaccio al suo amico.
                    ~ secondGreen ++
  
                
            + [Quando i grandi hanno paura, fanno cose cattive.]
                {charNameTwo}: Papà dice che i grandi non hanno paura.
                {charNameTwo}: Ma non gli credo.
                {charNameTwo}: Mio fratello a volte ha paura che l'amico lo lascia.
                {charNameTwo}: Mamma delle bollette.
                {charNameTwo}: Nonna però non ha paura di nulla.
                {charNameTwo}: Però si arrabbia tanto quando gioca a briscola.
                    ~ secondPurple ++
 
            -
        {charNameTwo}: Mi spiace, {name}.    
        {charNameTwo}: Prima ho detto delle bugie.
        {charNameTwo}: Non è vero che mamma mi ha mandato qui.
        {charNameTwo}: Ma volevo così tanto avere un bel compleanno.
        {charNameTwo}: Questo posto è pieno di animali!
        {charNameTwo}: E nessuno si arrabbia con me.
        {charNameTwo}: A parte {charNameFive}.
        {charNameTwo}: Ti prometto che non dirò più bugie.
        {charNameTwo}: Ora però lasciami solo.
        
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
        
        {name}: Dalla serra è scomparso l'innaffiatoio.
            + [Secondo {charNameFive} sei stato tu a prenderlo.]
                {charNameTwo}: Perché lei mi odia.
            
            + [Secondo me sei stato tu a prenderlo.]
                {charNameTwo}: Ti odio!
                {charNameTwo}: Perché date tutti sempre la colpa a me?
            
            + [Hai idea di dove sia?]
                {charNameTwo}: Pensi che è colpa mia?
            -
     
        {charNameTwo}: Anche a scuola danno sempre la colpa a me.
        {charNameTwo}: Non mi piace mica tanto la scuola.
        {charNameTwo}: I ragazzi più grandi mi fanno male.
        {charNameTwo}: Ma io non piango.
        {charNameTwo}: Non sono una femmina.
        {charNameTwo}: E sono più forte di loro.
        {charNameTwo}: Ma non coi pugni.
        {charNameTwo}: E le ragazze della mia età sono strane.
        {charNameTwo}: E mi dicono che.
        {charNameTwo}: No, non te lo dico mica.
        {charNameTwo}: E le maestre mi mettono sempre in castigo.
        {charNameTwo}: Se mi nascondo nell'armadio perché ho sonno.
        {charNameTwo}: Se spingo gli altri per terra.
        {charNameTwo}: Se mi distraggo.
        {charNameTwo}: Una volta nonna, quando stava bene, è venuta e ha sgridato tutte le maestre.
        {charNameTwo}: Ora sono un po' più gentili.
        {charNameTwo}: Ma quella di matematica dice sempre che le dispiace per me.
        {charNameTwo}: E non mi piace quando fa così.
            
        
            + [Anche i maschi piangono, e anche gli orsi e gli elefanti.]
                {charNameTwo}: Gli orsi mi piacciono.
                {charNameTwo}: Sono forti.
                {charNameTwo}: Ma comunque piangono.
                {charNameTwo}: Questa è una cosa nuova.
                {charNameTwo}: E mi piace.
                {charNameTwo}: Ma non so se mi piace piangere.
                    ~ secondBlue ++
                
            + [La scuola è un posto senza fantasia!]
                {charNameTwo}: Sì no boh.
                {charNameTwo}: A me mi piace tanto raccontare le storie.
                {charNameTwo}: Inventare cose nuove.
                {charNameTwo}: Fare gli esperimenti.
                {charNameTwo}: Parlare di animali.
                {charNameTwo}: Ma ogni cosa che faccio fa arrabbiare qualcuno.
                {charNameTwo}: Ma se non faccio cose mi annoio.
                {charNameTwo}: E se mi annoio comunque finisco in castigo.
                    ~ secondYellow ++
                
            + [Stringi i denti, lotta, diventa più forte degli altri!]
                {charNameTwo}: Lo dice anche papà.
                {charNameTwo}: Ma a me non mi interessa mica tanto.
                {charNameTwo}: Voglio solo studiare gli animali.
                {charNameTwo}: E che mi lascino in pace.
                    ~ secondRed ++

                
            + [A me spiace per te, sai?]
                {charNameTwo}: Sì no boh.
                {charNameTwo}: Non dirlo.
                {charNameTwo}: Non so cosa provo se lo dici.
                {charNameTwo}: Mi viene da piangere.
                {charNameTwo}: Ma non voglio piangere.
                {charNameTwo}: Quindi non dirlo più.
                    ~ secondGreen ++
  
                
            + [I castighi sono inutili. Hai mai imparato qualcosa dai castighi?]
                {charNameTwo}: A non farmi scoprire.
                {charNameTwo}: I castighi sono proprio brutti.
                {charNameTwo}: Sentire tutti che giocano e si divertono.
                {charNameTwo}: E tu non puoi fare nulla.
                {charNameTwo}: Ti viene solo più rabbia.
                {charNameTwo}: Sono ingiusti.
                    ~ secondPurple ++
 
            -
            //Se fiducia bassa.
            {
                - secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 1):
                    {charNameTwo}: Comunque l'innaffiatoio non l'ho mica visto.
                    {charNameTwo}: Ma.
                    {charNameTwo}: Sono sicuro che se cerchi bene lo trovi dove l'avete lasciato.
                - else:
                    {charNameTwo}: Non ho mai visto nessun innaffiacoso.
                    {charNameTwo}: Non bagno mica le piante, io.
                    {charNameTwo}: Cerca bene e vedi che lo trovi.
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
        
        {charNameTwo}: Prima ho visto una rana allo stagno.
        {charNameTwo}: E so tutto sulle rane.
        {charNameTwo}: Che mica chiudono gli occhi per dormire.
        {charNameTwo}: E che alcune sono velenose.
        {charNameTwo}: E velenoso e tossico non sono la stessa cosa.
        {charNameTwo}: Nonna dice che se lo lecchi e stai male, è tossico.
        {charNameTwo}: Se lo tocchi e stai male, è velenoso.
        {charNameTwo}: E se ti guarda e stai male, è mamma.
        {are_two_entities_together(FirstCharacter, PG): {charNameOne}: Questo shade sicuro che me lo riciclo.}        
        {charNameTwo}: E so altre cose sulle rane.
        {charNameTwo}: Ma non ho mai visto una rana parlare.
        {charNameTwo}: O fare dei regali.
        {charNameTwo}: E quella dello stagno mi ha parlato.
        {charNameTwo}: Ma mi ha detto che il regalo è per te invece.
        
            + [Se qualcosa non è mai accaduta, non è per forza impossibile.]
                {charNameTwo}: Quindi mi credi?
                {charNameTwo}: Quindi tutto è possibile?
                {charNameTwo}: Anche che salto e volo?
                {charNameTwo}: O che la serra diventa di cioccolato?
                {charNameTwo}: O che la mentore faccia una battuta carina?
                    ~ secondBlue ++
                
            + [Speriamo sia il nuovo Super Wario!]
                {charNameTwo}: Posso giocarci anche io?
                {charNameTwo}: Ma dove lo attacchiamo?
                {charNameTwo}: Qui non ci sono TV.
                {charNameTwo}: Però lo stagno sbrilluccica.
                {charNameTwo}: Forse la rana lo trasforma in uno schermo!
                    ~ secondYellow ++
                
            + [{charNameTwo}, se continui con le balle non mi fido più di te!]
                {charNameTwo}: Non sono balle!
                {charNameTwo}: Mi piacciono gli animali.
                {charNameTwo}: Non mi serve inventare altri animali perché quelli che ci sono mi piacciono già.
                {charNameTwo}: La rana c'è, vai a vedere!
                    ~ secondRed ++

                
            + [Sembra una rana molto gentile.]
                {charNameTwo}: A me mi sta simpatica.
                {charNameTwo}: E non credo sia tossica o velenosa.
                {charNameTwo}: Però anche io vorrei un regalo.
                {charNameTwo}: Se non ti piace mi dai quello che ti dà?
                {charNameTwo}: Spero tanto sia un cucciolo.
                {charNameTwo}: O la Play!
                    ~ secondGreen ++
  
                
            + [E se lo senti e prudono le orecchie è una bugia.]
                {charNameTwo}: Non è una bugia!
                {charNameTwo}: Perché non mi credi?
                {charNameTwo}: Non siamo amici?
                {charNameTwo}: Ti giuro che c'è una rana nello stagno!
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
        
        {charNameTwo}: La rana prima mi ha detto che tu scrivi storie.
        {charNameTwo}: A me mi piacciono le storie.
        {charNameTwo}: C'è una cosa che non dico mai a nessuno.
        {charNameTwo}: Mamma è felice perché vado a letto presto.
        {charNameTwo}: Ma è perché mi piace stare al buio da solo.
        {charNameTwo}: Così posso pensare alle cose che ho fatto durante il giorno.
        {charNameTwo}: E correggere quelle che non mi piacciono.
        {charNameTwo}: Quando uno di quinta mi ha picchiato, la sera ho corretto tutto e l'ho picchiato io.
        {charNameTwo}: E i miei compagni poi erano miei amici così.
        {charNameTwo}: Una volta ho preso un brutto voto e papà e mamma hanno litigato perché si davano la colpa.
        {charNameTwo}: Ma allora ho corretto tutto e io non prendevo un brutto voto.
        {charNameTwo}: E andavamo a prendere un gelato.
        {charNameTwo}: E la nonna non era nella casa dei vecchi.
        {charNameTwo}: E quando papà è tornato dopo essere andato via ed era arrabbiato, invece è tornato con un cane.
        {charNameTwo}: Non ho mai avuto un cane.
        {charNameTwo}: Sai che i cani sentono suoni fino a duecento metri?
        {charNameTwo}: Se li chiami e non vengono è perché non vogliono.
        {charNameTwo}: Anche io faccio così.
        
            + [Con questa fantasia potresti fare cose più pratiche.]
                {charNameTwo}: Ma non mi servono le cose pratiche.
                {charNameTwo}: Mi serve immaginare cose più belle.
                {charNameTwo}: Così le giornate sono più facili.
                    ~ secondBlue ++
                
            + [Hai mai corretto una giornata mettendoci vampiri o zombie?]
                {charNameTwo}: Sì!
                {charNameTwo}: Una volta siamo andati in gita a vedere i Camuni.
                {charNameTwo}: E la guida diceva tutte queste cose noiose.
                {charNameTwo}: E a casa ho corretto tutto perché ero un camuno.
                {charNameTwo}: E i disegni sul muro li avevo fatti io.
                {charNameTwo}: E lottavamo contro i cervombie.
                {charNameTwo}: Cervi zombie.
                {charNameTwo}: Ho riso tantissimo quella sera!
                        ~ secondYellow ++
                        
            + [Se i grandi ti picchiano, devi fare squadra con gli altri!]
                {charNameTwo}: Una volta ci ho provato.
                {charNameTwo}: Ma io non piaccio molto agli altri.
                {charNameTwo}: Mi dicono che sono scemo, per via degli animali.
                {charNameTwo}: O mi dicono che sono strano.
                {charNameTwo}: E che non gli piace quando mi arrabbio.
                    ~ secondRed ++

                
            + [Grazie per avermi raccontato questa cosa.]
                {charNameTwo}: Sì no boh.
                {charNameTwo}: Non è mica una cosa così grossa comunque.
                {charNameTwo}: Però mi piace.
                {charNameTwo}: Non è poi che lo faccio proprio sempre.
                {charNameTwo}: Solo con le cose brutte.
                {charNameTwo}: O quando non succede niente.
                {charNameTwo}: A volte è peggio.
                {charNameTwo}: Non mi piace annoiarmi.
                    ~ secondGreen ++
  
                
            + [Come mai se qualcuno ti chiama non rispondi?]
                {charNameTwo}: Perché se qualcuno mi chiama è arrabbiato con me.
                {charNameTwo}: O mi chiede di fare qualcosa.
                {charNameTwo}: Non succede mai che è per una bella sorpresa.
                {charNameTwo}: O per guardare i cartoni assieme.
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
        
        {charNameTwo}: Sai che mio fratello è campione di Karate?
        {charNameTwo}: E ha una macchina enorme gialla che fa arrabbiare papà.
        {charNameTwo}: E hai i muscoli che...
        {charNameTwo}: Bugia.
        {charNameTwo}: Scusa.
        {charNameTwo}: Non è proprio campione in realtà.
        {charNameTwo}: Però per me è bravissimo.
        {charNameTwo}: E la macchina è di papà.
        {charNameTwo}: Che si arrabbia perché prima era nera, e lui l'ha colorata di giallo.
        {charNameTwo}: Mio fratello è super però.
        {charNameTwo}: Lavora in una officina e nel tempo libero fa delle statue col saldatore e i pezzi rotti delle macchine.
        {charNameTwo}: E vive in una casa piccola piccola assieme al suo amico.
        {charNameTwo}: Viene a trovarci quando non c'è papà perché non si piacciono.
        {charNameTwo}: Ma se papà mi fa male allora lo cerca e gli urla addosso tantissime cose.
        {charNameTwo}: Mi ha promesso che mi porta a pescare una volta.
        {charNameTwo}: Senza dirlo a mamma perché lei ha paura perché non so nuotare.
        {charNameTwo}: Ma lui sa fare tutto.
        {charNameTwo}: E il suo amico fa dei dolci buonissimi.
        {charNameTwo}: E anche lui non sa nuotare.
        {charNameTwo}: Ma non mi sembra felice quando vado da loro e quindi ci vado poco.
            
            + [Non devi sapere nuotare per pescare.]
                {charNameTwo}: Esatto!
                {charNameTwo}: Ma lei non lo vuole capire.
                {charNameTwo}: "E se cadi in acqua?"
                {charNameTwo}: "E se un'onda ti investe?"
                {charNameTwo}: "E se tuo fratello si distrae?"
                {charNameTwo}: Mamma è davvero pesante.
                    ~ secondBlue ++
                
            + [Le statue di tuo fratello si muovono?]
                {charNameTwo}: Forse quando non ci siamo?
                {charNameTwo}: Mio fratello è superdisordinato.
                {charNameTwo}: Quindi se si spostano non è che lo capisci con facilità.
                {charNameTwo}: Però gli serve l'elettricità.
                {charNameTwo}: Voglio costruirne una anche io.
                {charNameTwo}: Forse in biblioteca c'è una guida!
                    ~ secondYellow ++
                
            + [{charNameTwo}, non devi sempre dare ragione agli adulti.]
                {charNameTwo}: Non è mica facile!
                {charNameTwo}: Papà se si arrabbia mi picchia.
                {charNameTwo}: E se invece parli dell'amico di mio fratello...
                {charNameTwo}: Credo che lui sia buono.
                {charNameTwo}: Ma se poi si arrabbia con me e non mi vuole più lì?
                {charNameTwo}: Poi non ci posso più stare con mio fratello!
                    ~ secondRed ++

                
            + [Hai chiesto all'amico di tuo fratello cosa pensa di te?]
                {charNameTwo}: Scherzi?!?
                {charNameTwo}: Non sono mica così strano.
                {charNameTwo}: Però una volta l'ho chiesto a mio fratello.
                {charNameTwo}: E mi ha detto che gli piaccio molto.
                {charNameTwo}: Ma non ci credo.
                {charNameTwo}: Anche perché a quello non gli piacciono i bambini proprio.
                {charNameTwo}: Ed è una cosa che rende molto triste mio fratello.
                    ~ secondGreen ++
  
                
            + [Grazie per aver corretto le tue bugie.]
                {charNameTwo}: Sì no boh.
                {charNameTwo}: Non so ancora se mi piaci.
                {charNameTwo}: Ma sei l'unica persona qui.
                {charNameTwo}: A parte {charNameFive}, ma lei di sicuro non mi piace mica.
                {charNameTwo}: Poi le cose qui sono belle.
                {charNameTwo}: Le bugie sono meno interessanti.
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
        
        {charNameTwo}: Tu hai sempre voluto fare {pronouns has him: il riscrittore|{pronouns has her: la riscrittora|lə riscrittorə}} come lavoro?
        
            + [Fino a poco fa nemmeno sapevo esistesse questo posto.]
                {charNameTwo}: Figo!
                {charNameTwo}: Quindi non sono l'unico.
                {charNameTwo}: Se chiedo qualcosa a {charNameFive} mi fa sentire stupido.
                {charNameTwo}: "Bimbo, te le spiego lentamente le cose ora, vieni."
                {charNameTwo}: Non mi deve spiegare lentamente le cose.
                {charNameTwo}: Io so fare le frazioni!
                    ~ secondBlue ++
                
            + [Questo non è il mio lavoro. I lavori sono noiosi.]
                {charNameTwo}: Però ai grandi piace parlare di lavoro.
                {charNameTwo}: E le maestre parlano sempre del futuro.
                {charNameTwo}: E dicono che ci devo lavorare con le cose in cui sono bravo.
                {charNameTwo}: Ma io voglio solo imparare cose nuove!
                    ~ secondYellow ++
                
            + [In realtà non l'ho scelto. Manco mi pagano.]
                {charNameTwo}: Che fregatura.
                {charNameTwo}: Nemmeno mamma mi paga per i lavoretti a casa.
                {charNameTwo}: Dice che è una cosa che devono fare tutti, grandi e piccoli, maschi e femmine.
                {charNameTwo}: Forse {charNameFive} è come mia mamma.
                    ~ secondRed ++
                
            + [Mi è sempre piaciuto far stare bene le persone.]
                {charNameTwo}: Questa è una cosa bella.
                {charNameTwo}: Ma difficile.
                {charNameTwo}: I grandi pensano sempre di sapere cosa fare.
                {charNameTwo}: Cosa vogliono gli altri.
                {charNameTwo}: Ma poi sbagliano.
                {charNameTwo}: E se la prendono con la persona che volevano aiutare.
                {charNameTwo}: Per questo si fa prima a fare da soli.
                {charNameTwo}: Mica puoi litigare con te stesso, no?
                    ~ secondGreen ++
  
                
            + [Voglio portare un grande cambiamento partendo dal piccolo.]
            
                {charNameTwo}: E io sono piccolo.
                {charNameTwo}: Mi sembra una cosa faticosa.
                {charNameTwo}: Però la capisco.
                {charNameTwo}: È come l'elettricità.
                {charNameTwo}: È così piccola che non la vedi.
                {charNameTwo}: Ma fa muovere le cose grandi!
                {charNameTwo}: O bruciare i muri.
                    ~ secondPurple ++
 
            -
            
        {charNameTwo}: I miei compagni fanno tantissime cose.
        {charNameTwo}: Calcio. Basket. Pallavolo.
        {charNameTwo}: Suonano il pianoforte o la chitarra o la batteria.
        {charNameTwo}: Oppure imparano il cinese e l'inglese.
        {charNameTwo}: Sanno già cosa vogliono fare come lavoro.
        {charNameTwo}: A me mi piacciono solo gli animali.
        {charNameTwo}: Ma so anche le cose brutte degli animali.
        {charNameTwo}: Che molti stanno sparendo per colpa degli uomini.
        {charNameTwo}: Che gli oceani sono sempre più vuoti.
        {charNameTwo}: Che gli incendi uccidono un sacco di animali ogni anno.
        {charNameTwo}: E che il futuro sarà sempre peggiore.
        {charNameTwo}: E quindi non so cosa fare da grande.
        {charNameTwo}: Non so se ci saranno ancora gli animali quando sarò grande.
        {charNameTwo}: E questa cosa mi fa arrabbiare.
        {charNameTwo}: Non voglio essere un bambino per sempre.
        {charNameTwo}: Ma non voglio essere grande.
        {are_two_entities_together(FirstCharacter, PG): {charNameOne}: Bimbo, mi stai facendo sentire una piagnona egoista così.}        
            
            + [Sai che crescerai anche se non lo vuoi, vero?]
                {charNameTwo}: Sì no boh.
                {charNameTwo}: Non è detto.
                {charNameTwo}: Magari resto qui e magari qui il tempo non passa mica.
                {charNameTwo}: E magari riesco a fare venire qui anche mio fratello.
                {charNameTwo}: E la nonna.
                {charNameTwo}: Così siamo tutti felici.
                    ~ secondBlue ++
                
            + [E se invece rimanessi sia bambino che adulto?]
                {charNameTwo}: Nonna dice che è il problema di mamma.
                {charNameTwo}: Che non si prende le sue responsabilità.
                {charNameTwo}: A me mica mi dispiacciono le responsabilità.
                {charNameTwo}: Ma tutto il resto mi spaventa.
                {charNameTwo}: Tutti i litigi.
                {charNameTwo}: La rabbia.
                {charNameTwo}: A me non mi piace la mia rabbia.
                    ~ secondYellow ++
                
            + [Puoi fare il ribelle e salvare gli animali!]
                {charNameTwo}: Tipo Greta!
                {charNameTwo}: A mio fratello piace tanto.
                {charNameTwo}: Però mio fratello dice che bisogna picchiare "quelli". Farli fuori.
                {charNameTwo}: Non ho capito chi sono "quelli".
                {charNameTwo}: Magari posso programmare le statue di mio fratello.
                {charNameTwo}: E ci pensano loro a far fuori "quelli".
                {charNameTwo}: Non ho capito mica nemmeno cosa sia "fare fuori".
                    ~ secondRed ++

                
            + [Non ti preoccupare: hai moltissimo tempo per decidere che fare.]
                {charNameTwo}: Sarà.
                {charNameTwo}: Ma Lara sa già parlare due lingue.
                {charNameTwo}: E Jin è appena entrato nella giovanile della Fiorentina.
                {charNameTwo}: Tommaso legge così tanto che sicuro sicuro diventa un genio.
                {charNameTwo}: Io l'unica cosa che so fare è dire cose stupide sugli animali.
                {charNameTwo}: E trovare nascondigli in ogni posto.
                {charNameTwo}: E dire bugie.
                    ~ secondGreen ++
  
                
            + [Potresti diventare uno storico degli animali.]
                {charNameTwo}: Sì sì sì!
                {charNameTwo}: Qualcuno che racconta le loro storie?
                {charNameTwo}: Come un gioco forse.
                {charNameTwo}: E anche gli animali giocano.
                {charNameTwo}: Anche gli insetti!
                {charNameTwo}: Lo fanno perché gli va.
                {charNameTwo}: E io vorrei sempre fare quello che mi va.
                {charNameTwo}: Il resto è una rottura.
                    ~ secondPurple ++
 
            -
        {charNameTwo}: Però mi piacerebbe fare il veterinario.
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
        
        {charNameTwo}: Stavo ripensando a un bambino.
        {charNameTwo}: Uno di seconda.
        {charNameTwo}: L'ho picchiato perché mi andava.
        {charNameTwo}: Ero DAVVERO arrabbiato quel giorno.
        {charNameTwo}: E lui ha pianto e mi sono arrabbiato ancora di più.
        {charNameTwo}: La maestra di matematica mi ha messo in castigo.
        {charNameTwo}: Ora quando vedo il bambino mi sento in colpa.
        {charNameTwo}: Ho provato a chiedergli scusa ma lui scappa.
        {charNameTwo}: E sua sorella una volta mi ha lanciato una scarpa in faccia.
        {charNameTwo}: Mio fratello dice che succede.
        {charNameTwo}: Che tra bambini ci si picchia.
        {charNameTwo}: E anche tra grandi.
        {charNameTwo}: Penso che i grandi facciano schifo.
        {charNameTwo}: Quando papà mi picchia dice che è colpa mia.
        {charNameTwo}: Ma a me non piace farmi picchiare.
        {charNameTwo}: O picchiare.
        {charNameTwo}: Ma se sono arrabbiato non so cosa fare.
        {are_two_entities_together(FirstCharacter, PG): {charNameOne}: Mai provato a suonare la batteria?}
        {are_two_entities_together(FirstCharacter, PG): {charNameTwo}: Poi papà ha un altro motivo per arrabbiarsi.}
        
            + [Solo gli animali non sanno controllarsi.]
                {charNameTwo}: Allora sono un lupo.
                {charNameTwo}: Una giraffa.
                {charNameTwo}: Un coccodrillo.
                {charNameTwo}: Un serpente.
                {charNameTwo}: Un riccio.
                {charNameTwo}: E ora ti spino!
                    ~ secondBlue ++
                
            + [Immagina di picchiare i mostri invece dei compagni!]
                {charNameTwo}: I mostri mi piacciono.
                {charNameTwo}: Ma anche i miei compagni.
                {charNameTwo}: Però non faccio male a qualcosa che non esiste, no?
                {charNameTwo}: Ma anche questo posto non doveva esistere, credo.
                {charNameTwo}: E invece è qui.
                {charNameTwo}: Chi lo dice che non faccio male ai mostri?
                    ~ secondYellow ++
                
            + [Tuo padre ti picchia, e tu hai imparato da lui a picchiare.]
                {charNameTwo}: NO!
                {charNameTwo}: No.
                {charNameTwo}: Non lo so.
                {charNameTwo}: Mi sembra una cosa difficile.
                {charNameTwo}: Ma voglio tanto che non mi picchi più.
                {charNameTwo}: Non mi piace avere paura di lui.
                    ~ secondRed ++

                
            + [Nessuno merita di essere picchiato, né tu né quel bambino.]
                {charNameTwo}: Però se papà mi picchia c'è un motivo.
                {charNameTwo}: Mamma dice che papà non lascia mai nulla al caso.
                {charNameTwo}: E per questo è il più bravo a lavoro.
                {charNameTwo}: E quel bambino è davvero fastidioso.
                    ~ secondGreen ++
  
                
            + [La rabbia della ragazzina ha protetto il fratello.]
                {charNameTwo}: Ma chi protegge me?
                {charNameTwo}: Uh, bugia, scusa.
                {charNameTwo}: Qui sono stato io a fare il cattivo.
                {charNameTwo}: Forse potrei chiedere a lei come fa?
                {charNameTwo}: Ma sarebbe stupido.
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
        
        {charNameTwo}: Quando vado da mio fratello e non c'è il suo amico, mi lascia sperimentare con le sue cose.
        {charNameTwo}: Il suo amico fa il pasticciere.
        {charNameTwo}: E ha tantissime cose strane in cucina.
        {charNameTwo}: Mi piace provare le cose, capire.
        {charNameTwo}: Non mi piacciono le cose che non capisco.
        {charNameTwo}: Ma a volte faccio dei casini.
        {charNameTwo}: Una volta ho mischiato le cose per pulire casa e ho vomitato tutto il pomeriggio.
        {charNameTwo}: Un giorno ho riempito il letto di mamma di sabbia e si è grattata per una settimana.
        {charNameTwo}: E poi ho provato ad attaccare un mio robot al frullatore dell'amico di mio fratello.
        {charNameTwo}: E ha fatto una fiammata gigante e un pezzo di muro è diventato nero.
        {charNameTwo}: Mio fratello si è spaventato tantissimo.
        {charNameTwo}: Ma io ero contento perché non sapevo che ci sono dei fili nel muro.
        {charNameTwo}: E ora so cosa è l'elettricità.
        {charNameTwo}: Ma qui non c'è.
        {charNameTwo}: Chissà se è la rana che fa accadere le cose.
        
            + [Hai la mente da scienziato, e vuoi verificare tutto.]
                {charNameTwo}: Lo dice anche mio fratello.
                {charNameTwo}: Per questo mi lascia fare gli esperimenti.
                {charNameTwo}: Ma senza elettricità, dopo l'incidente.
                {charNameTwo}: Però posso usare le batterie.
                {charNameTwo}: Voglio fargli un regalo con le cose della serra, sai?
                    ~ secondBlue ++
                
            + [Proviamo con la lampada della biblioteca!]
                {charNameTwo}: Sì!
                {charNameTwo}: Ci possiamo attaccare la stazione.
                {charNameTwo}: Così le persone sanno come arrivare qui.
                {charNameTwo}: Secondo me tantissime persone si perdono per venire qui.
                {charNameTwo}: Oppure ci mettiamo un faro!
                {charNameTwo}: Ma ci serve qualcosa di alto.
                {charNameTwo}: Forse se prendo tutti i rami del bosco...
                    ~ secondYellow ++
                
            + [Sei tosto perché alla fine fai quello che ti va.]
                {charNameTwo}: Sì no boh.
                {charNameTwo}: Questa cosa agli adulti non piace molto.
                {charNameTwo}: Ma se non posso capire le cose, mi rimangono in testa.
                {charNameTwo}: Mi danno davvero fastidio.
                {charNameTwo}: A volte mi sveglio presto e faccio tutte le cose che non dovrei fare.
                {charNameTwo}: Come provare gli attrezzi di papà.
                {charNameTwo}: O il vecchio respiratore di nonna.
                {charNameTwo}: Solo per capire.
                {charNameTwo}: Poi li rimetto a posto prima che si svegliano tutti.
                    ~ secondRed ++

                
            + [Promettimi che non mangerai nulla di strano, qui.]
                {charNameTwo}: Non sei mia mamma.
                {charNameTwo}: E poi è troppo tardi.
                {charNameTwo}: Ho assaggiato un po' di cose della serra.
                {charNameTwo}: Ma hanno tutte un sapore fastidioso.
                {charNameTwo}: Però per un attimo una delle piante mi ha fatto vedere le cose con colori strani.
                {charNameTwo}: Ma è durato pochissimo e poi avevo solo tanta sete.
                        ~ secondGreen ++
  
                
            + [Tuo fratello ti lascia essere te stesso.]
                {charNameTwo}: Sì!
                {charNameTwo}: Lui non mi sgrida mai.
                {charNameTwo}: E se si arrabbia con me, mi spiega il perché.
                {charNameTwo}: E se non sono d'accordo e glielo dico, mi ascolta.
                {charNameTwo}: Per questo mi piace stare con lui.
                {charNameTwo}: Non mi fa sentire stupido.
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
        
        {charNameTwo}: Mi piace la biblioteca.
        {charNameTwo}: Mi ricorda la casa della nonna.
        {charNameTwo}: L'altra nonna, quella che sta al mare.
        {charNameTwo}: Ci vado d'estate e mi diverto tantissimo e ci sono tantissimi libri.
        {charNameTwo}: Lei mi prepara tutte le cose buone.
        {charNameTwo}: E io le insegno tutte le cose più strane sugli animali.
        {charNameTwo}: Mamma e papà non vengono mai.
        {charNameTwo}: Ma mio fratello e il suo amico sì.
        {charNameTwo}: Una volta mi hanno portato a una festa sulla spiaggia.
        {charNameTwo}: E mi hanno fatto cantare nel microfono.
        {charNameTwo}: E hanno riso tutti quando ho ruttato fortissimo.
        {charNameTwo}: Da nonna mi addormento subito.
        {charNameTwo}: Non devo correggere le giornate.
        {are_two_entities_together(FirstCharacter, PG): {charNameTwo}: Vedi tu se dovevo iniziare a provare affetto per un bimbo, mannaggia.}
        {charNameTwo}: Quando finiscono le vacanze però mi sento triste.
        {charNameTwo}: E arrabbiato.
        {charNameTwo}: Ora che nonna è nella casa dei vecchi, vorrei vivere sempre con l'altra nonna.
        {charNameTwo}: Tanto so studiare da solo.
        {charNameTwo}: Magari studio come si curano i pesci.
        {charNameTwo}: Anche se non ci puoi mica giocare con loro.
            
            + [I libri ti insegnano tante cose.]
                {charNameTwo}: Sì no boh.
                {charNameTwo}: Anche guardare le cose.
                {charNameTwo}: E toccarle.
                {charNameTwo}: Ho imparato tantissime cose da quando sono qui.
                {charNameTwo}: Senza usare un libro.
                {charNameTwo}: A parte quando ne ho impilati alcuni per raggiungere i vasi alti della serra.
                {charNameTwo}: Non dirlo a {charNameFive}, ti prego!
                    ~ secondBlue ++
                
            + [Dobbiamo capire la lingua dei pesci così ci possiamo giocare.]
                {charNameTwo}: Magari è come con le pecore che fanno tanti "bee" diversi.
                {charNameTwo}: Magari hanno tutti i loro dialetti.
                {charNameTwo}: Per me la sogliola parla come i milanesi.
                {charNameTwo}: Ma la carpa ha la faccia da toscana.
                {charNameTwo}: E il pesce spada sicuro che è romano!
                {charNameTwo}: Posso creare un traduttore pescese/umano!
                    ~ secondYellow ++
                
            + [Andiamo a ruttare da {charNameFive} e la facciamo arrabbiare?]
                {charNameTwo}: Ci sto!
                {charNameTwo}: Però mi serve della roba frizzante sennò non mi vengono bene.
                {charNameTwo}: Che poi ora ho capito che {charNameFive} non ce l'ha mica con me.
                {charNameTwo}: Forse mi inizia anche a piacere.
                {charNameTwo}: Ma sì, un rutto se lo merita.
                    ~ secondRed ++

                
            + [Vorresti che venissero anche mamma e papà?]
                {charNameTwo}: Sì no boh.
                {charNameTwo}: Sono cattivo se dico di no?
                {charNameTwo}: Mi piace un posto dove nessuno litiga.
                {charNameTwo}: O si arrabbia con me.
                {charNameTwo}: L'altra nonna, quella del mare, non si arrabbia mai con me.
                {charNameTwo}: Nemmeno quando ho versato tutto il caffè sul divano.
                {charNameTwo}: O quando le ho rubato la grappa.
                {charNameTwo}: Che brutto essere ubriaco!
                    ~ secondGreen ++
  
                
            + [Ti piace insegnare le cose all'altra nonna.]
                {charNameTwo}: Mi aiuta a capirle meglio.
                {charNameTwo}: Tante cose ce le ho solo in testa e stanno assieme tutte contemporaneamente.
                {charNameTwo}: E per me hanno senso.
                {charNameTwo}: Ma quando dico le cose ad alta voce, allora devo metterle in ordine.
                {charNameTwo}: Ed è difficile.
                {charNameTwo}: Anche per questo a volte dico bugie.
                {charNameTwo}: Perché le parole sono sbagliate, ma il contenuto è quello che so o sento.
                {charNameTwo}: Non so se mi sono spiegato.
                    ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDuration
            -> main            
            
            

    = not_talk
    ???: Non ci parlo con chi parla con quella là!
    ???: Mi ha fatto male!
        -> main
                        
    = she_hates_me
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    {charNameTwo}: {charNameFive} ce l'ha con me!
    {charNameTwo}: Fa qualcosa!
    {are_two_entities_together(Mentor, PG): {charNameFive}: Non dire altre bugie, {charNameTwo}!}
    -> main
        


=== second_story_gift ===
~ temp charNameTwo = translator(secondCharacterState)
<i> Stai per donare qualcosa a {charNameTwo}.</i>
        + {findedGifts != ()} [Scelgo il dono.]
            ~ currentReceiver += SecondCharacter
            -> inventory_management
        + {findedGifts == ()} <i> Il tuo inventario è vuoto.</i>
            ->main
        
    
        = ink_outcome
            <i>Dopo il tuo dono {inkTranslator(secondCharacterInkLevel)}.
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
        {charNameTwo}: Abbiamo parlato tantissimo.
        {charNameTwo}: Ma davvero TANTISSSSSSIMO!
        {charNameTwo}: Sai cosa penso di te?
    {
        -   are_two_entities_together(FirstCharacter, PG):{charNameOne}: E questo è il momento per me di levarmi da qui e lasciarvi in pace.
                ~ change_entity_place(FirstCharacter)
    }          
            -> secondAffinityCalc ->
        {
        
        //Migliore outcome
        - secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 1): {charNameTwo}: Non sei male, per essere grande.
            {charNameTwo}: Dici sempre le cose allo stesso modo.
            {charNameTwo}: Come un cane che scodinzola se è felice ma abbaia se arrabbiato.
            {charNameTwo}: E questo mi fa stare al sicuro.
            {charNameTwo}: C'è una cosa che devo dire a qualcuno, e voglio dirla a te.
        <i>{charNameTwo} vede {name} come una persona amica e fidata.</i>
        
        //Secondo migliore outcome
        -secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 2): {charNameTwo}: Un po' mi fido.
            {charNameTwo}: Secondo me non dici <i>sempre</i> le cose in modo preciso.
            {charNameTwo}: Sembri un po' un gatto.
            {charNameTwo}: Ma mi fido.
            {charNameTwo}: C'è una cosa che devo dire a qualcuno, e voglio dirla a te.
        <i>{charNameTwo} si trova bene con {name}.</i>
        
        //Outcome peggiore
        - secondPurple or secondGreen or secondRed or secondBlue or secondYellow < (secondStoryQuestCount/2):  {charNameTwo}: Secondo me mi tratti come un bambino.
            {charNameTwo}: Tutte le cose che dici cambiano, sono disordinate.
            {charNameTwo}: Come i camaleonti che sono verdi sulle foglie e bianchi sul muro.
            {charNameTwo}: Non mi piace mica come cosa.
            {charNameTwo}: C'è una cosa che devo dire a qualcuno.
            {charNameTwo}: E posso dirla solo a te.
            {charNameTwo}: Purtroppo.
        <i>{charNameTwo} non si è sentito capito da {name}.</i>
        
        //Outcome neutro
        - else: {charNameTwo}: Che non ho capito cosa pensi. Sei come quando guardo nel terrario e non capisco se c'è l'insetto stecco o sono solo rami.
            {charNameTwo}: C'è una cosa che devo dire a qualcuno.
            {charNameTwo}: E posso dirla solo a te.
            {charNameTwo}: Purtroppo.
        <i>{charNameTwo} non riesce a capire che rapporto sta costruendo con {name}.</i>
        
        }
       
        {charNameTwo}: Da quando nonna è nella casa dei vecchi fa tutto schifo.
        {charNameTwo}: Papà è tornato ma litiga sempre con mamma.
        {charNameTwo}: E quando papà non c'è mamma si arrabbia con me.
        {charNameTwo}: E l'unica cosa che mi dice è che devo smetterla di piangere e fare il grande.
        {charNameTwo}: Che anche se piango nonna non torna.
        {charNameTwo}: E a scuola le maestre sono fastidiose.
        {charNameTwo}: <b>Stronze</b>.
        {charNameTwo}: Scusa.
        {charNameTwo}: Mio fratello dice che il mondo è un posto orribile e che non si può più aggiustare.
        {charNameTwo}: Gli animali spariranno tutti ed è colpa nostra.
        {charNameTwo}: Papà dice che devo crescere, non pensare agli animali perché ora sono grande.
        {charNameTwo}: Ma i grandi fanno schifo.
        {charNameTwo}: E non voglio fare schifo.
        {charNameTwo}: E non voglio diventare grande.
        {charNameTwo}: Per questo sono venuto qui.
        {charNameTwo}: Per stare con gli animali.
        {charNameTwo}: Non è il mio compleanno.
        {charNameTwo}: Scusa per la bugia.
        {charNameTwo}: Ma se non mi invento un motivo per le cose nessuno mi ascolta.
        ~ growing ++
        
            + [Forse so come farti vedere le cose in modo diverso.]
                -> statement
            + [Capisco il tuo dolore, ma ho bisogno di riflettere un attimo.]
                -> main


    = statement
    ~ temp charNameTwo = translator(secondCharacterState)
        <i>A seguito del rapporto che {name} ha creato con {charNameTwo} {secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 1): l'inchiostro è aumentato di due unità|{secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 2): l'inchiostro è aumentato di una unità|l'inchiostro non ha subito variazioni}}.</i>
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
        -   are_two_entities_together(FirstCharacter, PG):{charNameOne}: Qui le cose si fanno serie, e io me ne vado.
                ~ change_entity_place(FirstCharacter)
    }        
      //Affrontiamo gli adulti in generale
    {name}: Hai detto che i grandi fanno schifo e che non ti fidi di loro. //Nonna, fratello, grandi come grossi bambini
    
        
        + [Però tua nonna e tuo fratello spaccano.]
            {name}: Tua nonna ti ha insegnato a barare!
            {name}: Tuo fratello crea cose e ti protegge.
            {name}: Anche loro sono adulti.
                   ~ secondRed ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(red)
        
        + [I tuoi genitori sono infelici, essere adulti è difficile.]
            {name}: Tutti i litigi, la fuga di tuo padre.
            {name}: Diventiamo grandi, abbiamo un sacco di doveri, e non sappiamo cosa fare.
            {name}: Per questo i grandi fanno cose brutte.
            {name}: Ma questo non li rende schifosi.
                   ~ secondGreen ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(green)  
        
        + [Il problema è che agli adulti non è permesso giocare.]
            {name}: Tua nonna gioca, bara, e infatti è super.
            {name}: I tuoi genitori lavorano e litigano e sono infelici.
            {name}: Tu puoi essere un grande che gioca.
            {name}: E che gioca con gli animali per vivere.
            {name}: Ed essere felice.
                   ~ secondYellow ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(yellow)          
     
            
        + [Però gli adulti hanno anche scoperto le cose che ti piacciono.]
            {name}: L'elettricità.
            {name}: Gli studi sugli animali.
            {name}: Le caramelle.
            {name}: Le action figures.
                   ~ secondBlue ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(blue)    
        
        + [Hai ragione. Ma tu puoi essere un altro tipo di adulto.]
            {name}: Un adulto che sa correggere le giornate.
            {name}: Anche per le altre persone.
            {name}: Che può tornare a fidarsi delle altre persone.
                   ~ secondPurple ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(purple)    
            
        -
 
        {
        - secondCharacterInkLevel == Empty:
            -> ending
        - else: 
            -> two
        }        
        
    
    = two
    ~ temp charNameTwo = translator(secondCharacterState)
    {name}: Hai paura che il mondo stia finendo e che spariranno tutti gli animali.
  
        + [Non puoi prevedere il futuro. Goditi quello che c'è senza rimpianti.]
            {name}: Se le cose sono incerte, prenditi le certezze.
            {name}: E la cosa certa è che gli animali ci sono ancora.
            {name}: Che tuo fratello ti vuole bene.
            {name}: E le caramelle sono buone.
                   ~ secondYellow ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(yellow)            
  
                    
        + [Sei giovane ma sai già un sacco di cose. Studia e salvali.]
            {name}: Si ha paura solo se non si conosce una cosa.
            {name}: Impara a conoscere quello di cui hai paura.
            {name}: E a quel punto saprai anche come cambiare le cose.
                   ~ secondBlue ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(blue)    
    
            
        + [E allora lotta. Unisciti ad altri e protesta!]
            {name}: Sei abituato a stare in castigo, di cosa hai paura?
            {name}: A scuola fai quello che vuoi.
            {name}: Fallo anche fuori.
            {name}: Per salvare il mondo.
                    ~ secondRed ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(red)            
            
        + [Inventa storie, bugie che creino compassione, che cambino le persone.]
            {name}: Un po' come la bugia del compleanno.
            {name}: Ma per far sì che ogni bosco abbia migliaia di compleanni.
            {name}: Usa il tuo dono per convincere le persone a cambiare.
                   ~ secondGreen ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(green)  
                
        + [La paura blocca, la paura è una scusa comoda.]
            {name}: La paura è un rifugio.
            {name}: Se hai paura, non agisci.
            {name}: Se agisci non cambi nulla.
            {name}: Davvero vuoi restare per sempre bloccato dalla paura?
                   ~ secondPurple ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(purple)    
            
                    
        -
        {
        - secondCharacterInkLevel == Low:
            -> ending
        - else: 
            -> three
        }
        
    = three
    ~ temp charNameTwo = translator(secondCharacterState)
    //Affrontiamo il mondo. Rabbia, bugie, fantasia, violenza etc.
    {name}: Tuo fratello dice che il mondo è orribile e che non si può più aggiustare.
    
        + [Eppure crea arte.]
            {name}: E l'arte è respiro, futuro, è cambiamento.
            {name}: L'arte è credere che le cose possano migliorare.
            {name}: Definisce un presente, per lanciarci altrove.
            {name}: E rende il mondo un posto meno orribile.
                   ~ secondPurple ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(purple)    
            
        
        + [Eppure ama il suo ragazzo.]
            {name}: E ama te.
            {name}: E fa in modo che possiate passare tanto tempo assieme.
            {name}: Che tu possa avere uno spazio felice.
            {name}: E così rende il mondo un po' meno orribile.
                   ~ secondGreen ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(green)  
                
        + [Eppure lotta contro tuo padre perché tu stia meglio.]
            {name}: Si è creato una nuova casa.
            {name}: Non si è fatto mettere i piedi in testa da nessuno.
            {name}: E questo lo fai se pensi ci sia un futuro dove andare.
                    ~ secondRed ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(red)
            
        
        + [Eppure gioca con te.]
            {name}: Si diverte, lascia che le cose belle accadano.
            {name}: In un mondo orribile, esisterebbe davvero il piacere?
                   ~ secondYellow ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(yellow)            

                
        + [Eppure per lavoro aggiusta le cose.]
            {name}: Vede le cose rotte e le ripara.
            {name}: Quindi ci sono cose che si possono aggiustare.
            {name}: Serve solo un meccanico per le cose che lo spaventano.
                   ~ secondBlue ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(blue)         
        -
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
    {name}: {charNameFive} ti ha chiamato {charNameTwo}.
    
        + [Vuoi davvero dargliela vinta?]
            {name}: Non ti piace da quando sei arrivato qui.
            {name}: Ti ha fatto arrabbiare dal primo momento.
            {name}: Vuoi davvero che sia lei a decidere come ti chiami?
                    ~ secondRed ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(red)
        
        + [I ricci resistono a tantissimi veleni.]
            {name}: Ogni animale ha la sua dote, il suo modo di superare le paure.
            {name}: Puoi studiare e diventare un superanimale.
            {name}: O divertirti a cambiare quando vuoi.
            {name}: E tornare riccio, quando le cose si fanno velenose.
                   ~ secondBlue ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(blue)    
        
        + [A volte ci raggomitoliamo per superare il peggio.]
            {name}: Quello che conta è: cosa facciamo, dopo?
            {name}: Quando le cose sono superate?
            {name}: Restiamo ancora nel nostro posto sicuro?
            {name}: O decidiamo di guardare le cose da una prospettiva diversa, e cambiarle?
                   ~ secondPurple ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(purple)    
             
            
        + [Anche se la schiena ha le spine, la loro pancia è tenera e gentile.]
            {name}: E tu sei stato tenero molte volte da quando sei qui.
            {name}: Con me, con la rana.
            {name}: E con le cose che hai raccontato.
            {name}: Ti servono ancora quelle spine?
                   ~ secondGreen ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(green)          
        
        + [I ricci hanno un olfatto super, possono trovare tutte le caramelle del mondo.]
            {name}: E dopo che hai trovato le caramelle, cambia animale.
            {name}: Diventa qualcosa che vede fino alla luna, e insegui le stelle.
            {name}: Oppure impara a nuotare fino all'altra parte del mondo.
            {name}: Continua a cambiare.
                    ~ secondYellow ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(yellow)    
            
        -
        
        -> ending

    = ending
    ~ temp charNameTwo = translator(secondCharacterState)
     Per questo ti dico:
     
        + {secondRed > 0} [Diventa il più forte, il più coraggioso.]
            {name}: Sei un testardo, bugiardo, dispettoso.
            {name}: Queste cose unite possono renderti indistruttibile.
            {name}: E di cosa avrà mai paura un ragazzo indistruttibile?
                    ~ secondRed ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(red)        
        
        + {secondPurple > 0} [Tutti abbiamo paura. Condividi questa paura con le altre persone.]
            {name}: Falle sentire meno sole.
            {name}: Meno sbagliate.
            {name}: A quel punto saranno pronte a fare il passo.
            {name}: A cambiare le cose a loro volta.
            {name}: Assieme.
                   ~ secondPurple ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(purple)    
                    
        
        + {secondYellow > 0} [L'opposto della paura è la curiosità.]
            {name}: E tu sei il ritratto della curiosità.
            {name}: Guarda le cose che arriveranno chiedendoti "Chissà se..." o "E se invece..." o "Perché accade questo?".
            {name}: E a quel punto ogni paura diventerà solo un problema da risolvere.
                   ~ secondYellow ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(yellow)            
                
        + {secondGreen > 0} [I tuoi genitori sono spaventati, aiutatevi a vicenda.]
            {name}: Nessuna persona può cambiare il mondo da sola.
            {name}: Ma possiamo partire dal cambiare le cose che ci circondano, un pezzo alla volta.
                   ~ secondGreen ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(green)          
                
        + {secondBlue > 0} [Con la tua intelligenza puoi rendere il mondo migliore.]
            {name}: Puoi aiutare gli adulti a essere meno tristi.
            {name}: E gli animali a non morire.
            {name}: E tua nonna a uscire dalla casa dei vecchi.
                   ~ secondBlue ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(blue)            
                
        
                
        -     
    {charNameTwo}: Sì.
    {charNameTwo}: No.
    {charNameTwo}: Boh.
    {charNameTwo}: {name}.
    {charNameTwo}: Tu mi dici queste cose e io mi dico che c'è un animale.
    {charNameTwo}: Un animale che mi piace.
    {charNameTwo}: Un animale che un po' è me.
    {charNameTwo}: E lo voglio come mio nuovo nome.

        {
            - secondCharacterPossibleStates has Riccio:
                {charNameTwo}: Quell'animale è il <b>Riccio</b>.
                {charNameTwo}: Perché l'unico modo per sopravvivere è difendersi da tutto.
            
            - secondCharacterPossibleStates has Grizzly:
                {charNameTwo}: Il mio vero nome è <b>Grizzly</b>.
                {charNameTwo}: Combatterò la mia paura e diventerò il più forte di tutti, imbattibile!
                    ~ secondCharacterState = ()
                    ~ secondCharacterState += Grizzly
            
            - secondCharacterPossibleStates has Lupo:
                {charNameTwo}: Mi chiamerò <b>Lupo</b>.
                {charNameTwo}: E proteggerò il mio branco.
                {charNameTwo}: Mamma, papà, nonna e mio fratello.
                {charNameTwo}: Nessuna delle persone a cui voglio bene deve più stare male.
                    ~ secondCharacterState = ()
                    ~ secondCharacterState += Lupo
            
            - secondCharacterPossibleStates has Delfino:
                {charNameTwo}: E il mio nome è <b>Delfino</b>.
                {charNameTwo}: Se lo guardi bene tutto è un gioco.
                {charNameTwo}: La mia fantasia e le mie bugie aiuteranno le altre persone ad avere meno paura.
                    ~ secondCharacterState = ()
                    ~ secondCharacterState += Delfino                
            
            - secondCharacterPossibleStates has Capibara:
                {charNameTwo}: Mi chiamerò <b>Capibara</b>.
                {charNameTwo}: E imparerò ad avere tantissimi amici.
                {charNameTwo}: Ci sentiremo meno soli!
                {charNameTwo}: E così avremo meno paura.
                    ~ secondCharacterState = ()
                    ~ secondCharacterState += Capibara
            
            - secondCharacterPossibleStates has Corvo:
                {charNameTwo}: Io sono <b>Corvo</b>.
                {charNameTwo}: Sono sveglio e posso capire ciò che mi circonda!
                {charNameTwo}: E posso cambiare le cose che mi fanno paura.
                {charNameTwo}: Aiutare gli altri.
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
        {charNameTwo}: Voglio dirti una cosa {name}.
        {charNameTwo}: Su {charNameFive}.
        {charNameTwo}: A me non mi sembra mica felice.
        {charNameTwo}: Mi ricorda mamma quando gira per casa dando consigli e dicendo cose e sorridendo.
        {charNameTwo}: E poi si rinchiude in camera e resta in silenzio per ore.
        {charNameTwo}: Per me non sta mica bene.
            ~ secondStory = Ended
            ~ movementsCounter = 0
            ~ PG_advace_management(secondStoryPG)
                -> main
            
    = exit
    ~ temp charNameTwo = translator(secondCharacterState)
        {charNameTwo}: Voglio stare ancora un po' qui prima di prendere il treno.
        {charNameTwo}: Mi mancherà la rana!
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
        {charNameTwo}: {~ Stavo pensando che se divento grande posso andare via di casa.|Magari da grande posso anche portare nonna via dalla casa dei vecchi.|Quando torno a casa chiedo a mio fratello se mi prende un cane.|Mi piace l'idea di tornare a casa ora, ma non di non potere mica tornare qui.|Se vieni a trovarmi ti faccio vedere tutte le statue di mio fratello.|Sarà difficile spiegare questa cosa a papà.}
                ~ secondCharEndingDialogue ++
        -> main
        
        = goodbye
        ~ temp charNameTwo = translator(secondCharacterState)
        {charNameTwo}: {name}, mi sa che torno a casa.
        {secondCharacterPossibleStates hasnt Riccio: {charNameTwo}: Sì no boh.}       
        {secondCharacterPossibleStates hasnt Riccio: {charNameTwo}: Sai che mi è piaciuta alla fine tutta questa cosa?}
        {secondCharacterPossibleStates hasnt Riccio: {charNameTwo}: Mi hai regalato il migliore compleanno del mondo.}
        {secondCharacterPossibleStates hasnt Riccio: {charNameTwo}: Anche se non era mica davvero il mio compleanno.}
        {secondCharacterPossibleStates hasnt Riccio: {charNameTwo}: Vieni a trovarmi una volta.}
        {secondCharacterPossibleStates hasnt Riccio: {charNameTwo}: Mi mancherai.}  
        {secondCharacterPossibleStates has Riccio: {charNameTwo}: Spero papà non sarà arrabbiato.}        
    
        ~ move_entity(SecondCharacter, Safekeeping)
        -> main


=== second_character_opinions
~ temp charNameTwo = translator(secondCharacterState)
~ temp charNameFive = translator(fifthCharacterState)
~ change_entity_place(Mentor)

    //Le sue opinioni comunque ci fanno capire meglio il modo in cui vede il mondo e parte della sua vita fuori da qui.
    {charNameTwo}: {~ Nonna dice che non si scappa dalla periferia. Che papà ce l'ha dentro e se l'è portata anche quando siamo andati a vivere in centro.|Non mi piacciono i cartoni per quelli della mia età. Dicono tutte cose che so già.|Se ci pensi bene dire una bugia o scrivere una storia sono la stessa cosa.|Ogni persona ha un animale dentro secondo me. Prendi{charNameFive}: sembra un gufo. Anzi anzi: un avvoltoio! No, dai. Un fagiano, quelli femmina, tutti grigi grigi.|Mio fratello dice che devo fidarmi di più degli adulti, ma secondo me lo dice perché è adulto.|Per me il veterinario è come il druido dei videogiochi, solo non deve tirare dei dadi per salvare gli animali.|Un po' mi piacerebbe dormire e basta, senza pensieri.|Forse non mi dispiace mica che sei qui.|Se vado via di qui vorrei tanto portare la rana con me.}
            -> main















    
