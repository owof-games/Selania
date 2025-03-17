=== second_character ===
~ temp charNameTwo = uppercaseTranslator(secondCharacterState)

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
~ temp charNameTwo = uppercaseTranslator(secondCharacterState)

   {//Se prima chiacchierata
        - not knowing_second_character.one:
            -> knowing_second_character.one
    //Se prima chiacchierata fatta e passato abbastanza tempo dalla pausa prevista        
        - secondPauseTalking == 0:
            -> hub
    //Altre opzioni        
        - else:
            {
                - second_story_gift.ink_outcome: {charNameTwo}: {~ Mi sento triste, ti spiace tornare dopo?|Scusa {name} ma voglio stare solo.|In questo momento sono giù, torneresti dopo?}
                
                - else: {knowing_second_character.two:{charNameTwo}|???}: {~ Torna dopo.|Ora ho voglia di stare da solo.|Lasciami in pace.}
            }
            
        -> main
    }

= hub
~ temp charNameTwo = uppercaseTranslator(secondCharacterState)

    {knowing_second_character.two:{charNameTwo}|???}: {~ Ciao.|...}
    
            + [Ti va di raccontarmi qualcosa di te?]
                -> knowing_second_character
                
    
            //Se non ho ancora fatto e ho parlato abbastanza con lui
            + {secondStoryQuestCount > minStoryQuesTCount && not second_story_gift.ink_outcome} [Voglio regalarti una cosa.]
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
~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
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
                        {charNameTwo}: {charNameFive} ce l'ha con me!
                        {charNameTwo}: Fa qualcosa!
                        -> main
                }
                
            - not six:
                //Lo storylet non parte se siamo allo stagno.
                {
                    - not entity_location(PG) == GreenhouseMiddlePath:
                        -> six
                    - else: {knowing_second_character.two:{charNameTwo}|???}: {~ Torna dopo.|Ora ho voglia di stare da solo.|Lasciami in pace.}
                        -> main
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
        ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
        ~ secondStoryQuestCount ++
        
        ???: Perché sei qui?
            
            + [Perché è un luogo strano, e voglio capirlo.]
                ~ secondBlue ++
                
            + [Perché è pieno di cose strane!]
                ???: Uh.
                ???: Per ora ho esplorato solo la stazione.
                ???: Però il tabellone con le lettere è strano.
                ???: Le lettere non si danno al postino?
                ???: E il postino non le porta alle persone?
                ???: Mica le appende così!
                    ~ secondYellow ++
                
            + [Perché <b>tu</b> sei qui?]
                ???: Ehi, era solo una domanda!
                    ~ secondRed ++

                
            + [Per aiutare chi è in difficoltà.]
                ???: Come il veterinario?
                ???: O come la maestra di ginnastica, che dice di aiutarmi.
                ???: Ma poi mi sgrida se sbaglio?
                    ~ secondGreen ++
                
            + [Per capire meglio chi sono.]
                ???: Non sai chi sei?
                ???: A me piacerebbe essere un'altra persona a volte.
                ???: O un labrador, così se mi rotolo nel fango tutti ridono e non si arrabbiano.
                ???: Ma non un gatto: sapevi che i gatti non sentono mica il sapore dolce?
                ???: Che cosa triste!
                    ~ secondPurple ++
            -    
        
        ???: Io sono qui perché è il mio compleanno.
        ???: Mamma mi ha promesso qualcosa di FIGHISSIMO!
        ???: L'anno scorso per Natale mi ha preso tutte le action figures dei miei videogiochi preferiti.
        ???: Ma poi papà me le ha rubate tutte.
        ???: Ma lui qui mica ci può venire.
        ???: Perché mamma ha detto che avrebbe dato solo a me qualcosa di bellissimo che papà non può rubare.
        ???: Ma dove trovo le caramelle?
        ???: Mamma dice sempre che non c'è compleanno senza caramelle!
        
            + (twoBlue) [t]
                    ~ secondBlue ++
                
            + (twoYellow) [Non ho trovato le caramelle, ma c'è uno stagno dove nuotare!]
                ???: FIGO!
                ???: Non ho mai visto uno stagno!
                ???: Però questa estate ho visto un mare gigantesco.
                ???: Più grande anche del cielo!
                ???: Questo qui non c'è di sicuro!
                    ~ secondYellow ++
                
            + (twoRed) [E come ti sei ripreso i giocattoli?]
                ???: Non sono giocattoli.
                ???: E non me li sono ripresi.
                ???: Papà è buono, fino a quando non si arrabbia.
                ???: E non voglio farlo arrabbiare.
                    ~ secondRed ++

                
            + (twoGreen) [Vuoi molto bene alla tua mamma?]
                ???: Lei è la mamma migliore del pianeta.
                ???: Dell'universo.
                ???: Più della tua!
                    ~ secondGreen ++
  
                
            + (twoPurple) [Quindi, rubandoti i giochi, tuo papà ti ha fatto un favore.]
                ???: In che senso?
                ???: Perché mamma mi ha dato questo?
                ???: Non funziona così, sai?
                ???: Mi ha dato questo perché sono bravo.
                ???: E le action figures anche.
                ???: Papà non c'entra nulla!
                    ~ secondPurple ++
            -
            
        ???: Ma dove saranno i miei compagni di scuola?
        ???: Cercali!
        ???: A dopo!
            -
             ~ secondPauseTalking = secondCharPauseDurantion
            -> main
   
    = two
    //Obiettivo: Messa in evidenza della rabbia, ma anche della sua curiosità (finale rosso o finale viola: vede la bellezza nelle cose brutte.)
    //Contenuto: Prima gioia per gli insetti, ecc, poi domande sulla sua violenza alla mentore.
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        ~ secondStoryQuestCount ++
        
        {charNameTwo}: Questo posto è PIENO di animali!
        {charNameTwo}: Ma ho lasciato a casa il tablet.
        {charNameTwo}: Come faccio a capire cosa fanno?
        {charNameTwo}: Sapevi che gli uccelli vedono dieci colori?
        {charNameTwo}: DIECI! Mica solo tre come noi!
        {charNameTwo}: E che l'acso, atso, axotolot si fa ricrescere le braccia?
            + [Gli chiedo perché ha picchiato {charNameFive}.]
                -> top
            + [Lo lascio continuare.]
            -
            
        {charNameTwo}: E le capre hanno dei loro accenti!
        {charNameTwo}: Non sono mica tutti dei beeeeeeeeee uguali!
        {charNameTwo}: Solo i colibrì sanno volare all'indietro!
        {charNameTwo}: Tu sai camminare indietro? Secondo me no.
            + [Gli chiedo perché ha picchiato {charNameFive}.]
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
        {name}: {charNameFive} dice che l'hai picchiata.
            
            + (twoBlue) [delusione]
                ~ secondBlue ++
                
            + (twoYellow) [Perché non le hai fatto uno scherzo?]
                ???: Perché ero arrabbiato.
                ???: E non so fare gli scherzi.
                ???: Ma lei continuava a dire che i bambini qui non ci possono stare.
                ???: Che non potevo saltare nel fiume.
                ???: E mi ha messo una mano sulla spalla.
                ???: E a me
                ???: non
                ???: piace
                ???: quando
                ???: i grandi
                ???: mi toccano.
                    ~ secondYellow ++
                
            + (twoRed) [Picchiare una così è un po' da sfigati.]
                ???: Mi aveva preso il braccio!
                ???: E continuava a dire che sono un bambino e che i bambini qui non ci devono stare.
                ???: E che devo tornare a casa e io NON ci voglio tornare a casa.
                ???: Non volevo picchiarla.
                ???: Volevo solo spingerla via.
                ???: Ma mi sono arrabbiato troppo.
                    ~ secondRed ++

                
            + (twoGreen) [C'è rimasta male, sai?]
                ???: E a me che mi importa?
                ???: Mi ha sgridato perché saltavo nel fiume.
                ???: E poi mi ha detto che i bambini qui non ci devono stare.
                ???: E mi ha preso per la spalla.
                ???: Non mi piace quando mi toccano.
                    ~ secondGreen ++
  
                
            + (twoPurple) [Hai ottenuto quello che volevi?]
                ???: Ha smesso di dirmi che non devo stare qui.
                ???: Che devo tornare a casa.
                ???: E ha mollato la mia spalla.
                ???: Non le volevo fare mica male.
                ???: Ma non mi piace quando i grandi mi toccano.
                    ~ secondPurple ++

            -
        {charNameTwo}: Se {charNameFive} non mi lascia in pace chiamo mio fratello.
        {charNameTwo}: Lui è superforte.
        {charNameTwo}: Ora lasciami in pace.
        
             ~ secondPauseTalking = secondCharPauseDurantion
            -> main


    
    = three
    //Obiettivo: mostrare che ha mentito all'inizio
    //Contenuto: Ci chiede come ci chiamiamo, emerge una bugia diversa a seconda del genere -> Qui però scopriamo che ci mente, possiamo decidere di mettere in evidenza o meno questa bugia, solitudine.
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    ~ secondStoryQuestCount ++
        
        {charNameTwo}: Mica mi hai detto come ti chiami.
            
        - (top)
            * [Prima dimmi il tuo.]
                {charNameTwo}: No, prima mi dici il tuo.
                    -> top
            + {name_choice} [Mi chiamo {name}.]
    	    + [Il mio nome è...]
    	        -> name_choice ->
    	    -
    	    {name}: E i miei pronomi sono...
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
            	  ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
            	  ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
            	  
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
        	  ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
        	  
            	  {charNameTwo}: Ah.
            	  {charNameTwo}: Sei una ragazza quindi.
            	  {charNameTwo}: Non ci parlo mica molto con le ragazze, siete strane.
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
        	  ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
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
        ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
            //Definire meglio in base ai colori.
            
            + {him_liar} [Avevi detto di esser pieno di action figures.]
                    ~ secondBlue ++
            
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
            
            
            + {her_liar or they_liar} [Non avevi detto che questo è il regalo di compleanno di tua mamma?]
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
                {charNameTwo}: Sì!
                {charNameTwo}: Anzi: no!
                {charNameTwo}: Una spia non direbbe mai che è una spia.
                {charNameTwo}: Oppure ti confonde, così non capisci cosa è vero o cosa no.
                {charNameTwo}: Così è più interessante.
                {charNameTwo}: Però tu non puoi farlo!
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
             ~ secondPauseTalking = secondCharPauseDurantion
            -> main
    
    
    
    
    = four
    //Obiettivo: Far vedere che c'è qualcosa che non va a casa.
    //Contenuto: Momento di vulnerabilità, ci parla della nonna (ma non ci dice che è morta) e ci dice che è fuggito da casa.
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
    ~ secondStoryQuestCount ++
        -> secondAffinityCheckCalc ->
        
        {charNameTwo}: Nonna non mi tratta mai come un bambino.
        {charNameTwo}: Mi ha anche insegnato come barare a carte.
        {charNameTwo}: E come aprire il cassetto dei dolci di mamma.
        {charNameTwo}: Quando mamma e papà ci lasciavano a casa da soli mangiavamo sempre cose buone.
        {charNameTwo}: E guardavamo assieme la tele.
        {charNameTwo}: E potevo scegliere cosa guardare.
        {charNameTwo}: Quando papà è andato via nonna ha aiutato mamma a stare bene.
        {charNameTwo}: Anche se a mamma mica piaceva la nonna.
        {charNameTwo}: E quando papà è tornato ha ripreso a trattarla male.
        {charNameTwo}: Ma nonna dice che succede.
        {charNameTwo}: Che i grandi fanno cose cattive senza saperlo.
        {charNameTwo}: Mi spiace essere scappato di casa.
        
            + [Dammi dettagli più concreti.]
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
                {charNameTwo}: No.
                {charNameTwo}: Sì.
                {charNameTwo}: Voglio tornare.
                {charNameTwo}: Ma non so come.
                {charNameTwo}: E se poi mamma si arrabbia?
                {charNameTwo}: O papà?
                {charNameTwo}: Vorrei tornare a casa di mio fratello.
                {charNameTwo}: Lì mi piace.
                {charNameTwo}: Ma non piaccio al suo amico.
                {charNameTwo}: Dove devo andare?
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
        {charNameTwo}: Ma tu la terrai lontano, vero?
        {charNameTwo}: Ora però lasciami solo.
        
            //Leviamo l'innaffiatoio
            ~ move_entity(WateringCan, Safekeeping)
            ~ secondPauseTalking = secondCharPauseDurantion
            -> main
    
    = five
    //Obiettivo: Mostrare sempre il carattere complicato ma anche la posizione complicata socialmente. La scuola è un posto in cui non è al sicuro.
    //Contenuto: Lo accusiamo del furto, da lì emergono alcune cose sulla scuola. A seconda del rapporto, mente per evitare le punizioni, o è sincero. Il discorso dei compagni parte a prescindere.
  
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    ~ secondStoryQuestCount ++
        
        {name}: Dalla serra è scomparso l'innaffiatoio.
            + [Secondo {charNameFive} sei stato tu a prenderlo.]
                {charNameTwo}: Perché lei mi odia.
            
            + [Secondo me sei stato tu a prenderlo.]
                {charNameTwo}: Perché date sempre la colpa a me?
            
            + [Hai idea di dove sia?]
                {charNameTwo}: Pensi che è colpa mia?
            -
     
        {charNameTwo}: Anche a scuola danno sempre la colpa a me.
        {charNameTwo}: Non mi piace mica tanto la scuola.
        {charNameTwo}: I ragazzi più grandi fanno male.
        {charNameTwo}: Ma io non piango.
        {charNameTwo}: Non sono una femmina.
        {charNameTwo}: E sono più forte di loro.
        {charNameTwo}: Ma non coi pugni.
        {charNameTwo}: E le ragazze della mia età sono strane.
        {charNameTwo}: E mi dicono che.
        {charNameTwo}: No, non te lo dico.
        {charNameTwo}: E le maestre mi mettono sempre in castigo.
        {charNameTwo}: Se mi nascondo nell'armadio perché ho sonno.
        {charNameTwo}: Se spingo gli altri per terra.
        {charNameTwo}: Se mi distraggo.
        {charNameTwo}: Una volta nonna, quando stava bene, è venuta e ha sgridato tutte le maestre.
        {charNameTwo}: Ora sono un po' più gentili.
        {charNameTwo}: Ma quella di matematica dice sempre che le dispiace per me.
        {charNameTwo}: E non mi piace quando fa così.
            
        
        
            + [Anche i maschi piangono, esempio animale.]
                    ~ secondBlue ++
                
            + [La scuola è un posto terribile, non c'è spazio per la fantasia!]
                {charNameTwo}: Già.
                {charNameTwo}: A me mi piace tanto raccontare le storie.
                {charNameTwo}: Inventare cose nuove.
                {charNameTwo}: Fare gli esperimenti.
                {charNameTwo}: Parlare di animali.
                {charNameTwo}: Ma ogni cosa che faccio fa arrabbiare qualcuno.
                {charNameTwo}: Ma se non faccio cose mi annoio.
                {charNameTwo}: E se mi annoio comunque finisco in castigo.
                    ~ secondYellow ++
                
            + [Stringi i denti, lotta, e diventa più forte degli altri!]
                {charNameTwo}: Lo dice anche papà.
                {charNameTwo}: Ma a me non mi interessa mica tanto.
                {charNameTwo}: Voglio solo studiare gli animali.
                {charNameTwo}: E che mi lascino in pace.
                    ~ secondRed ++

                
            + [A me spiace per te, sai?]
                {charNameTwo}: Mmm.
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
            {charNameTwo}: Non ho mai visto nessun innaffiacoso.
            {charNameTwo}: Non bagno mica le piante, io.
            {charNameTwo}: Cerca bene e vedi che lo trovi.
            
            //Se fiducia alta.
            {charNameTwo}: Non l'ho mica visto.
            {charNameTwo}: Ma.
            {charNameTwo}: Sono sicuro che se cerchi bene lo trovi dove l'avete lasciato.
            
            //Ricompare l'innaffiatoio
            ~ move_entity(WateringCan, Greenhouse)
            ~ secondPauseTalking = secondCharPauseDurantion
                -> main
    
    
    = six
    //Obiettivo: Mostrare che sta iniziando a non mentire.
    //Contenuto: Ci racconta della rana, possiamo decidere di non credergli o meno.
        ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
        ~ secondStoryQuestCount ++
        
        {charNameTwo}: Prima ho visto una rana allo stagno.
        {charNameTwo}: E so tutto sulle rane.
        {charNameTwo}: Che mica chiudono gli occhi per dormire.
        {charNameTwo}: E che alcune sono velenose.
        {charNameTwo}: E velenoso e tossico non sono la stessa cosa.
        {charNameTwo}: Nonna dice che se lo lecchi e stai male, è tossico.
        {charNameTwo}: Se lo tocchi e stai male, è velenoso.
        {charNameTwo}: E se ti guarda e stai male, è mamma.
        {charNameTwo}: E so altre cose sulle rane.
        {charNameTwo}: Ma non ho mai visto una rana parlare.
        {charNameTwo}: O fare dei regali.
        {charNameTwo}: E quella dello stagno mi ha parlato.
        {charNameTwo}: Ma mi ha detto che il regalo è per te invece.
        
            + [Dammi dettagli più concreti.]
                ~ secondBlue ++
                
            + [Speriamo sia il nuovo Super Wario!]
                {charNameTwo}: Posso giocarci anche io?
                {charNameTwo}: Ma dove lo attacchiamo?
                {charNameTwo}: Qui non ci sono TV.
                {charNameTwo}: Però lo stagno sberluccica.
                {charNameTwo}: Forse la rana lo trasforma in uno schermo!
                    ~ secondYellow ++
                
            + [{charNameTwo}, se continui con le balle non mi fido più di te!]
                {charNameTwo}: Non sono balle!
                {charNameTwo}: Mi piacciono gli animali.
                {charNameTwo}: Non mi serve inventare altri animali perché quelli che ci sono mi piacciono già.
                {charNameTwo}: La rana c'è, vai a vedere!
                    ~ secondRed ++

                
            + [Sembra una rana molto gentile.]
                {charNameTwo}: A me sta simpatica.
                {charNameTwo}: E non credo sia tossica o velenosa.
                {charNameTwo}: Però anche io vorrei un regalo.
                {charNameTwo}: Se non ti piace mi dai quello che ti dà?
                {charNameTwo}: Spero tanto sia un cucciolo.
                {charNameTwo}: O la Play!
                    ~ secondGreen ++
  
                
            + [Se lo tocchi e stai male è velenoso, se lo senti e prudono le orecchie, è una bugia.]
                {charNameTwo}: Non è una bugia!
                {charNameTwo}: Perché non mi credi?
                {charNameTwo}: Non siamo amici?
                {charNameTwo}: Ti giuro che c'è una rana nello stagno!
                    ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDurantion
             ~  move_entity(TheFrog, GreenhouseMiddlePath)
                -> main
    
    = seven
    //Obiettivo: raccontare il suo rapporto con la fantasia e le tensioni in famiglia (finale verde e finale viola)
    //Contenuto: Parla della fantasia, e del fatto che la sera si riscrive la giornata, capiamo che la famiglia litiga spesso. Tensione in casa anche per la morte della nonna
    
        ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
        ~ secondStoryQuestCount ++
        
        {charNameTwo}: La rana prima mi ha detto che tu scrivi storie.
        {charNameTwo}: A me piacciono le storie.
        {charNameTwo}: C'è una cosa che non dico mai a nessuno.
        {charNameTwo}: Mamma è felice perché vado a letto presto senza fare mica storie.
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
        
            + [Dammi dettagli più concreti.]
                ~ secondBlue ++
                
            + [Hai mai corretto una giornata mettendoci i vampiri? O gli zombie?]
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
                {charNameTwo}: A volte mi dicono che sono scemo, per via degli animali.
                {charNameTwo}: A volte che sono strano.
                {charNameTwo}: E che non gli piace quando mi arrabbio.
                    ~ secondRed ++

                
            + [Grazie per avermi raccontato questa cosa.]
                {charNameTwo}: Non è una cosa così grossa comunque.
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
             ~ secondPauseTalking = secondCharPauseDurantion
            -> main        
            
            
    = eight
    //Obiettivo: presentare la relazione col fratello maggiore, che è una persona molto pragmatica (finale blu, finale giallo)
    //Contenuti: ci parla del fratello come mito, riferimento, modello. All'inizio mente, ma poi si ridimensiona da solo (sta iniziano a fidarsi).
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    ~ secondStoryQuestCount ++
        
        {charNameTwo}: Sai che mio fratello è campione di Karate?
        {charNameTwo}: E ha una macchina enorme gialla che fa arrabbiare papà
        {charNameTwo}: E...
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
        {charNameTwo}: Mi ha promesso che mi porta a pescare una volta.
        {charNameTwo}: Senza dirlo a mamma perché lei ha paura perché non so nuotare.
        {charNameTwo}: Ma lui sa fare tutto.
        {charNameTwo}: E il suo amico fa dei dolci buonissimi.
        {charNameTwo}: E anche lui non sa nuotare.
        {charNameTwo}: Ma non mi sembra felice quando vado da loro e quindi ci vado poco.
            
            + [t.]
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

                
            + [Hai mai chiesto all'amico di tuo fratello cosa pensa di te?]
                {charNameTwo}: Scherzi?
                {charNameTwo}: Quella è una cosa davvero strana.
                {charNameTwo}: Però una volta l'ho chiesto a mio fratello.
                {charNameTwo}: E mi ha detto che gli piaccio molto.
                {charNameTwo}: Ma non ci credo molto.
                {charNameTwo}: Anche perché dice che non gli piacciono i bambini.
                {charNameTwo}: Ed è una cosa che rende molto triste mio fratello.
                    ~ secondGreen ++
  
                
            + [Grazie per aver corretto le tue bugie.]
                {charNameTwo}: Già.
                {charNameTwo}: Non so ancora se mi piaci.
                {charNameTwo}: Ma sei l'unica persona qui.
                {charNameTwo}: A parte {charNameFive}, ma lei di sicuro non mi piace mica.
                {charNameTwo}: Poi le cose qui sono belle.
                {charNameTwo}: Le bugie sono meno interessanti.
                    ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDurantion
            -> main    
    
    
    = nine
    TODO: Bimbo ha consapevolezza climatica, riscrivo paura futuro di quella e no lavoro (e ama gli animali, tenero, paura per loro, conosce dati e situazioni).
    //Obiettivo: mostrare tra le righe la paura per il futuro, anche dimostrazione di rabbia verso di sè? (finale rosso sicuro, finale blu?
    //Contenuti: tutti sanno cosa diventare da grandi, io voglio fare il veterinaio ma?
        ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
        ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        ~ secondStoryQuestCount ++
        
        {charNameTwo}: Tu hai sempre voluto fare {pronouns has him: il riscrittore|{pronouns has her: la riscrittora|lə riscrittorə}} come lavoro?
        
            + [Dammi dettagli più concreti.]
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
                {charNameTwo}: E invece di dire "Ho sbagliato", se la prendono con la persona che volevano aiutare.
                {charNameTwo}: Per questo si fa prima a fare da soli.
                {charNameTwo}: Mica puoi litigare con te stesso, no?
                    ~ secondGreen ++
  
                
            + [Mi piace portare un cambiamento grande partendo dal piccolo.]
                {charNameTwo}: Sembra una cosa faticosa.
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
        {charNameTwo}: E vanno a cavallo.
        {charNameTwo}: E sanno già cosa vogliono fare come lavoro.
        {charNameTwo}: A me piacciono solo gli animali.
        {charNameTwo}: Ma so anche le cose brutte degli animali.
        {charNameTwo}: Che molti stanno sparendo per colpa dell'inquinamento.
        {charNameTwo}: Che gli oceani sono sempre più vuoti.
        {charNameTwo}: Che gli incendi uccidono un sacco di animali ogni anno.
        {charNameTwo}: E che il futuro sarà sempre peggiore.
        {charNameTwo}: E quindi non so cosa fare da grande.
        {charNameTwo}: Non so se ci saranno ancora gli animali quando sarò grande.
        {charNameTwo}: E questa cosa mi fa arrabbiare.
        {charNameTwo}: Non voglio essere un bambino per sempre.
        {charNameTwo}: Ma non voglio essere grande.
            
            + [Sai che crescerai anche se non lo vuoi, vero?]
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
        
             ~ secondPauseTalking = secondCharPauseDurantion
            -> main    
    
    = ten
    //Obiettivo: si fida di noi, mostriamo il suo rapporto con la violenza. Finale rosso, finale viola (aiutare gli altri).
    //Contenuti: capiamo che a scuola è un bullo, ma ci sono persone che protegge.
        ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
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
        {charNameTwo}: Ma se sono arrabbiato e non so cosa fare.
        
        
            + [Dammi dettagli più concreti.]
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
  
                
            + [La tua rabbia fa male, ma la rabbia della ragazzina ha protetto il fratello.]
                {charNameTwo}: Ma chi protegge me?
                {charNameTwo}: Uh, bugia, scusa.
                {charNameTwo}: Qui sono stato io a fare il cattivo.
                {charNameTwo}: Forse potrei chiedere a lei come fa?
                {charNameTwo}: Ma sarebbe stupido.
                    ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDurantion
            -> main    
    
    = eleven
    //Obiettivo: curiosità, sperimentazione. finale giallo, finale viola
    //Contenuti: esperimenti in casa (microscopio, muro bruciato col Meccano
        ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
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
        
            + [Hai la mente da scienziato: se una cosa non la provi allora non è vera!]
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
                
            + [Mi piaci, perché alla fine fai quello che ti va.]
                {charNameTwo}: Già.
                {charNameTwo}: Questa cosa agli adulti non piace molto.
                {charNameTwo}: Ma se non posso capire le cose, mi rimangono in testa.
                {charNameTwo}: Mi danno davvero fastidio.
                {charNameTwo}: A volte mi sveglio apposta presto e faccio tutte le cose che non dovrei fare.
                {charNameTwo}: Come provare gli attrezzi di papà.
                {charNameTwo}: O il respiratore di nonna.
                {charNameTwo}: Solo per capire.
                {charNameTwo}: Poi li rimetto a posto prima che si svegliano tutti.
                    ~ secondRed ++

                
            + [Promettimi che non mangerai nulla di strano, qui.]
                {charNameTwo}: Troppo tardi.
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
             ~ secondPauseTalking = secondCharPauseDurantion
            -> main    
    
    = twelve
    //Obiettivo: narrativamente, lasciarcelo con una immagine positiva. Far vedere il peso dei genitori. Finale verde, finale giallo.
    //Contenuti. Momento tenero. L'altra nonna, la casa al mare, momenti di pace. I genitori non ci sono in queste occasioni
        ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
        ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        ~ secondStoryQuestCount ++
        
        {charNameTwo}: Mi piace la biblioteca.
        {charNameTwo}: Ma non mi piace leggere.
        {charNameTwo}: Però mi ricorda la casa della nonna.
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
        {charNameTwo}: Quando finiscono le vacanze però mi sento triste.
        {charNameTwo}: E arrabbiato.
        {charNameTwo}: Ora che nonna è nella casa dei vecchi, vorrei vivere sempre con l'altra nonna.
        {charNameTwo}: Tanto so studiare da solo.
        {charNameTwo}: Magari studio come si curano i pesci.
        {charNameTwo}: Anche se non ci puoi mica giocare con loro.
            
            + [Dammi dettagli più concreti.]
                    ~ secondBlue ++
                
            + [Secondo me dobbiamo solo capire la lingua dei pesci e allora ci possiamo giocare.]
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
                {charNameTwo}: Che poi ora ho capito che non ce l'ha mica con me.
                {charNameTwo}: Forse mi inizia anche a piacere.
                {charNameTwo}: Ma sì, un rutto se lo merita.
                    ~ secondRed ++

                
            + [Vorresti che venissero anche mamma e papà?]
                {charNameTwo}: Io...
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
             ~ secondPauseTalking = secondCharPauseDurantion
            -> main            
            
            

    = not_talk
    ???: Non ci parlo con chi parla con quella là!
    ???: Mi ha fatto male!
        -> main
                        

        
=== second_character_opinions
~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    //Le sue opinioni comunque ci fanno capire meglio il modo in cui vede il mondo e parte della sua vita fuori da qui.
    {charNameTwo}: {~ Bisogna sporcarsi le mani. Nelle cose. Non c’è contatto con le vita se le mani sono sempre pulite.|Le dita devono sapere di terra, come quando da bambina non avevi paura di cadere. Che cosa c’è di vivo se sono sempre pulite?}
            -> main


=== second_story_gift ===
~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
<i> Stai per donare qualcosa a {charNameTwo}.</i>
        + {findedGifts != ()} [Scelgo il dono.]
            ~ currentReceiver += SecondCharacter
            -> inventory_management -> ink_outcome 
        + {findedGifts == ()} <i> Il tuo inventario è vuoto.</i>
            ->main
        
    
        = ink_outcome    
            <i>Dopo il tuo dono {inkTranslator(secondCharacterInkLevel)}.
                 -> talk_with_second_character
            //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco

=== second_story_chech_trigger
      ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
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
~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
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
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    
    //Parole chiave legate alla fiducia.
        {charNameTwo}: Abbiamo parlato tantissimo.
        {charNameTwo}: Ma davvero TANTISSSSSSIMO!
        {charNameTwo}: Sai cosa penso di te?
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
            {charNameTwo}: Non mi piace come cosa.
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
        {charNameTwo}: E mamma quando papà non c'è si arrabbia sempre con me.
        {charNameTwo}: E l'unica cosa che mi dice è che devo smetterla di piangere e fare il grande.
        {charNameTwo}: Che anche se piango nonna non torna.
        {charNameTwo}: E a scuola le maestre sono fastidiose.
        {charNameTwo}: <b>Stronze</b>.
        {charNameTwo}: Scusa.
        {charNameTwo}: Papà dice che devo crescere, che ora sono grande.
        {charNameTwo}: Ma i grandi fanno schifo.
        {charNameTwo}: E non voglio fare schifo.
        {charNameTwo}: Mio fratello dice che il mondo è un posto orribile.
        {charNameTwo}: Per questo sono venuto qui.
        {charNameTwo}: Per stare con gli animali.
        {charNameTwo}: Non è il mio compleanno.
        {charNameTwo}: Scusa per la bugia.
        {charNameTwo}: Ma se non mi invento un motivo per le cose nessuno mi ascolta.

            + [Forse so come farti vedere le cose in modo diverso.]
                -> statement
            + [Capisco il tuo dolore, ma ho bisogno di riflettere un attimo.]
                -> main


    = statement
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
        <i>A seguito del rapporto che {name} ha creato con {charNameTwo} {secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 1): l'inchiostro è aumentato di due unità.|{secondPurple or secondGreen or secondRed or secondBlue or secondYellow >= (secondStoryQuestCount - 2): l'inchiostro è aumentato di una unità|l'inchiostro non ha subito variazioni}}.</i>
        //Sopra ho già aggiornato il livello di inchiostro e quindi di affinità.
            ~ inkLevel(secondCharacterInkLevel)
        + [Voglio cominciare la riscrittura.]
            -> secondNaming -> 
            -> one
        + [Preferisco prendermi del tempo.]
            -> main

    = one
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    
    //Affrontiamo i genitori
    {name}: Tua mamma e tuo papà ti dicono che devi crescere, comportarti da adulto, non piangere.
   
        
        + [Rosso.]
            {name}: E ammettere una propria paura, una scelta enorme.
                   ~ secondRed ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(red)
        
        + [Eppure loro non piangono e sono tristi e infelici.]
            {name}: Litigano spesso.
            {name}: Non sono felici di quello che fanno.
            {name}: Se vuoi piangere, puoi essere più libero e felice.
                   ~ secondGreen ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(green)  
        
        + [Giallo.]
                   ~ secondYellow ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(yellow)          
     
            
        + [Blu]
                   ~ secondBlue ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(blue)    
        + [Viola.]
           
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
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    
    //Affrontiamo gli adulti in generale
    {name}: Hai detto che i grandi fanno schifo, che non ti fidi di loro. //Nonna, fratello, grandi come grossi bambini
    

        + [Giallo.]
                   ~ secondYellow ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(yellow)            
  
                    
        + [Blu.]
                   ~ secondBlue ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(blue)    
    
            
        + [Rosso.]
                    ~ secondRed ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(red)            
            
        + [Verde.]
 
                   ~ secondGreen ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(green)  
                
        + [Viola.]
 
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
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    //Affrontiamo il mondo. Rabbia, bugie, fantasia, violenza etc.
    {name}: Dici che il mondo fa schifo.
    
        + [Viola.]
         
                   ~ secondPurple ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(purple)    
            
        
        + [Verde.]
                   ~ secondGreen ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(green)  
                
        + [Rosso.]
                    ~ secondRed ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(red)
            
        
        + [Giallo.]
                   ~ secondYellow ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(yellow)            

                
        + [Blu.]
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
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)    
    
    //Commento più personale
    {name}: {charNameFive} ti ha chiamato {charNameTwo}.
    
        + [Rosso.]
                    ~ secondRed ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(red)
        
        + [Blu.]
                   ~ secondBlue ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(blue)    
        
        + [Viola.]

                   ~ secondPurple ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(purple)    
             
            
        + [Verde.]
 
                   ~ secondGreen ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(green)          
        
        + [Giallo.]
                    ~ secondYellow ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(yellow)    
            
        -
        
        -> ending

    = ending
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
     Per questo ti dico...
     
        + {secondRed > 0} [Non farti schiacciare dal mondo.]
                    ~ secondRed ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(red)        
        
        + {secondPurple > 0} [Tutti abbiamo paura. Condividi questa paura con le altre persone.]
                   ~ secondPurple ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(purple)    
                    
        
        + {secondYellow > 0} [the opposite of doom is curiosity.]
                   ~ secondYellow ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(yellow)            
                
        + {secondGreen > 0} [I tuoi genitori sono spaventati, aiutatevi a vicenda.]
                   ~ secondGreen ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(green)          
                
        + {secondBlue > 0} [Con la tua intelligenza puoi rendere il mondo migliore.]
                   ~ secondBlue ++
                    -> secondColourCheck ->
                    ~ secondStatementVariation(blue)            
                
        
                
        -     
        
    {charNameTwo}: Grazie, {name}.
    {charNameTwo}: Mentre parlavi mi è nata una nuova canzone in testa.
    {charNameTwo}: Qualcosa di fresco, di pronto a cambiare.
    {charNameTwo}: La canzone del mio vero nome.

        {
            - secondCharacterPossibleStates has IlRiccio:
                {charNameTwo}: Che <b>resterà Chitarra</b>, perché l'unica cosa che posso fare, è far sì che altr3 scelgano per me.
            
            - secondCharacterPossibleStates has IlGrizzly:
                {charNameTwo}: E il mio vero nome è <b>Triangolo</b>, perché pensavo di essere uno strumento, e invece ho solo fallito.
                    ~ secondCharacterState = ()
                    ~ secondCharacterState += IlGrizzly
            
            - secondCharacterPossibleStates has IlLupo:
                {charNameTwo}: Mi chiamerò <b>Ragazza Orchestra</b>: nel non saper Chitarrare sono diventata l'ornitorinco della musica.
                    ~ secondCharacterState = ()
                    ~ secondCharacterState += IlLupo
            
            - secondCharacterPossibleStates has IlDelfino:
                {charNameTwo}: Il mio nome è <b>Flauto Dolce</b>: perché semplice, elementare, ma apprezzata da chi ha buon cuore.
                    ~ secondCharacterState = ()
                    ~ secondCharacterState += IlDelfino                
            
            - secondCharacterPossibleStates has IlCapibara:
                {charNameTwo}: Mi chiamerò <b>Ocarina</b>: perché il suo suono è gioco e festa.
                    ~ secondCharacterState = ()
                    ~ secondCharacterState += IlCapibara
            
            - secondCharacterPossibleStates has IlCorvo:
                {charNameTwo}: Io sono <b>Violino</b>: perché anche se suono bene da sola, do il meglio di me stessa suonando con e per gli altri.
                    ~ secondCharacterState = ()
                    ~ secondCharacterState += IlCorvo
        }
        
            
        
        {
        - secondCharacterSpecialEvent == true:
            -> secret_ending
        - else:
            -> exit
        }
    
    
    = secret_ending
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
        {charNameTwo}: C'è una cosa che vorrei dirti, {name}.
        {charNameTwo}: Riguarda Il mentore.

            ~ secondStory = Ended
            ~ movementsCounter = 0
            ~ PG_advace_management(secondStory)
                -> main
            
    = exit
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
        {charNameTwo}: Credo rimarrò ancora in giro per un poco, in attesa del prossimo bus.
            ~ secondStory = Ended
            ~ movementsCounter = 0
            ~ PG_advace_management(secondStory)
        -> main  
    
=== second_char_story_ended
~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
//Con questa formula dopo un tot di scambi la personaggia se ne va salutandoci.
//In alcune situazioni questa cosa non c'è, in altre c'è solo se ho determinati status (es: socievole). In altri non c'è la possibilità che la personaggia se ne vada senza averci salutate (e quindi non c'è l'opzione in story_start)

    {
        - secondCharEndingDialogue < 4:
            -> top
        - else:
            -> goodbye
    }
    
        - (top)
        {charNameTwo}: {~ Mi chiedo se le cose sarebbero andate diversamente, se Talco fosse arrivatə qui con me.|Sono sicura di aver visto un'altra persona alla fermata del bus, ma quando ho cercato di raggiungerla è scomparsa.|Ogni tanto te la prendi una pausa da questo posto, vero?|Sapevi che a volte c'è una rana nello stagno che circonda la serra?}
                ~ secondCharEndingDialogue ++
        -> main
        
        = goodbye
        ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
        {charNameTwo}: {name}, per me è arrivato il momento di tornare a casa.
        {secondCharacterPossibleStates hasnt Chitarra: {charNameTwo}: Non so di preciso cosa mi accadrà ora, ma in un certo senso so che sono più pronta.}
        {secondCharacterPossibleStates hasnt Chitarra: {charNameTwo}: Grazie per quello che hai fatto, davvero.}
        {secondCharacterPossibleStates has Chitarra: {charNameTwo}: Vedremo cosa mi accadrà.}
            ~ move_entity(SecondCharacter, Safekeeping)
            //Abbiamo accesso alle note solo se è cambiata. Sennò lei se ne va abbastanza arresa da tutto.
            {
                - secondCharacterPossibleStates hasnt IlRiccio:
                    ~ move_entity(SecondCharacterNotes, BusStop)
            }    
            
        -> main

















    
