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
            {charTag(Franco, "question")}:                      E Franco? Franco cosa pensa?
            {charTag(ThirdCharacter, "jester")}:                Zio, tu devi pensare meno.
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
            {charTag(FirstCharacter, "annoyed")}:               Fagli il culo {player_name}.
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
        {
        - grimoire_thirdChar hasnt grimThirdCharKitchenAlone:
                                                                Il momento in cui sei stato più vivo, è quando mi hai parlato di tua mamma e dei pic nic.                                                    
        }
        {
        - grimoire_thirdChar has grimThirdOpenNest:
                                                                Dov'è la gioia che hai provato quando hai atteso quel giorno tuo padre sotto la pioggia dopo la partita?     
        }                                                        
        {
        - grimoire_franco has grimFrancoThirdIngredientFailure:
                                                                Neanche il povero Franco è stato capace di capire di cosa hai davvero bisogno.   
        }
        {
        - grimoire_thirdChar hasnt grimThirdCharKitchenThree:
                                                                Per quanto in cucina tu ti sia acceso parlando della gioia che provi nel prenderti cura dei clienti.
                                                                E della grinta di Petra, la tua collega.
        } 



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
        {
        - grimoire_thirdChar has grimThirdCharNovel:
                                                                O infuriarsi per un racconto dove una donna che subisce violenza si ribella.    
        }
        {
        - grimoire_thirdChar has grimThirdCharKitchenTwo:
                                                                Che poi me l'hai detto anche tu in cucina: la relazione con Ava va bene, ma il sesso ti manca.
                                                                E vorresti diventare padre.
                                                                Ma non sai se farlo con lei o meno.
        } 




        + \ {charTag(PG, "neutral")}:                           A lavoro ti fai il mazzo, eppure non hai niente.
            -> glyph_choice_manager(false, earthC)->
        {charTag(PG, "neutral")}:                               Quando hai parlato del tuo capo l'hai descritto come un idiota incapace.
                                                                E per questo finisce che fai il suo lavoro, che i fornitori ti chiamano mentre non sei in turno, così come i colleghi.
        {
        - grimoire_thirdChar hasnt grimThirdCharKitchenThree:
                                                                E quando abbiamo cucinato assieme hai rimarcato la cosa, raccontando del poco che fa.
                                                                Della fidanzata incapace che è lì solo per spiarvi.
                                                                Del poco riconoscimento per il mazzo che ti fai. 
        }                                                         
        {
        - third_char_main_storylets.one.aether2:
                                                                Lavori quasi tutte le sere, torni che sei distrutto, che non hai tempo per te.
        }                                                       
                                                                Hai fatto un lavoro che ti faceva sentire figo, ma ora?
                                                                I tuoi compagni di calcetto non prendono il tuo lavoro sul serio.
                                                                E nel mentre vivi con un coinquilino che detesti.
        {
        - grimoire_thirdChar hasnt grimThirdCharKitchenThree:
                                                                In cucina hai raccontato di amare la possibilità di prenderti cura dei clienti.
                                                                Può essere un punto di partenza per qualcosa di diverso?   
        }                                                        
                                                                




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
        {
        - grimoire_thirdChar has grimThirdCharKitchenTwo:
                                                                Persino in cucina, parlando di figli, mi hai detto che ti pesa che tua sorella sia arrivata "prima di te" nel portare un nipote in famiglia.
        } 



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
        {
        - grimoire_thirdChar has grimThirdCharKitchenOne:
                                                                Cucinando assieme, hai raccontato di nuovo dei problemi che hai nelle relazioni con i tuoi amici: da una parte un gruppetto giudicante, dall'altra la confidenza che ancora non sboccia con Rocco, e il peso della relazione che più ti manca.  
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
                                                                Scommetto che non c'hai amici, vero?
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
                                                                E ti saluto col dito medio più grosso che hai mai visto.
                                                                
        -> third_char_closing_storylet ->
        -> endingPNGstory(ThirdCharacter)



=== third_char_second_rewriting
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

            {charTag(TheWitch, witch_state())}:                 {charNameThree} ha chiesto a {player_name} la possibilità di venire riscritto.
                                                                E {player_name} può procedere come {charNameThree} fosse qui con noi.
                                                                Anche se dovremo aspettare per scoprire come {charNameThree} reagirà alla rilettura della sua storia da parte di {player_name}.

            
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

            
            {charTag(PG, "neutral")}:                           Sei partito dicendo che fai schifo con le donne, criticandoti per l'amore che hai provato per Ava.
                                                                Ti pesa il rapporto che hai con la tua famiglia.
                                                                Dici che i tuoi amici se ne fregano di te.
                                                                E il tuo migliore amico si è allontanato da te per l'età che Donatella aveva quando vi siete conosciuti.

            + (fire) \ {charTag(PG, "neutral")}:                Affronta il gruppo di calcetto e chiedigli un altro tipo di amicizia. {letters_thirdCharLetterThreeChoice has fireC: Hai già iniziato col litigio, no?|Lo stai già facendo saltando gli incontri.}
            {charTag(PG, "neutral")}:                           Tanto vale rischiare di perderli del tutto, no?
                                                                E magari potresti pure stupirti della loro reazione.
                {
                - letters_thirdCharLetterThreeChoice has fire: 
                                                                Alla fine hai già urlato a tutti una volta quando ti sei trovato coi due sostituti portati dal Merlo, no?    
                }
                {
                - letters_thirdCharLetterThreeChoice has waterC:
                                                                E comunque Rocco ti ha già fatto capire che ha voglia di passare del tempo con te, tra D&D e la proposta di correre assieme.    
                }                                      
            
            + (water) \ {charTag(PG, "neutral")}:               Forse Ava non era la persona giusta, ma {charNameThree}: hai amato.
            {charTag(PG, "neutral")}:                           Ricordi come mi hai parlato di lei quando eri qui?
                    {
                    - letters_thirdCharLetterFourChoice has waterC:
                                                                E la lacrimuccia quando l'hai cancellata?    
                    }
                    {
                    - letters_thirdCharLetterFourChoice has aetherC:
                                                                Ma hai anche ammesso che sei riuscito a rimanere ancorato coi piedi a terra perché avevi altre persone, persone reali, nella tua vita.   
                    }
                                                                Sai già che forse le app di dating non sono il tuo strumento preferito.
                                                                Ma il mondo è pieno di occasioni per chi ha un cuore aperto.
                    {
                    - grimoire_thirdChar has grimWitchThirdChar:
                                                                Come ti ha detto anche {witch_actualName} quando avete parlato assieme.
                    }                                             
            

            + (earth) \ {charTag(PG, "neutral")}:               Sei un buon amico per Petra{!letters_thirdCharLetterTwoChoice has airC && !letters_thirdCharLetterTwoChoice has fireC && !letters_thirdCharLetterTwoChoice has earthC:, un buono fratello per tua sorella }: porta queste cose nelle tue relazioni.
            {charTag(PG, "neutral")}:                           Non serve per forza essere quello che esce con mille ragazze.
                {
                - grimoire_thirdChar has grimThirdCharKitchenTwo:
                                                                O che si porta le clienti sul retro del locale.
                }
                {
                - letters_thirdCharLetterTwoChoice has aetherC:
                                                                Pensa a come tua sorella ha cercato di aiutarti, proponendoti di fare volontariato, di cercare qualcosa di diverso nella tua vita.    
                }
                {
                - letters_thirdCharLetterTwoChoice has waterC:
                                                                Pensa a come tua sorella ha cercato di aiutarti, con la sua schiettezza, chiedendoti se tu fossi stanco di fare il coglione, senza sapere però come smettere.   
                }
                {
                - letters_thirdCharLetterFourChoice has waterC:
                                                                Ti ricordi com'è stata la scampagnata con Marta, mentre parlavi di Ava?  
                }
                {
                - letters_thirdCharLetterSevenChoice has aetherC:
                                                                C'è stato quell'abbraccio che ti ha dato Marta a casa sua, mentre parlavi con tuo padre e ti sei emozionato. 
                }      
                {
                 - letters_thirdCharLetterFourChoice has earthC:
                                                                E con Petra c'è l'idea della attività assieme, è l'inizio di un rapporto diverso con qualcuno di cui ti fidi.   
                }
                {
                - grimoire_thirdChar has grimThirdCharNovel:
                                                                Pensa a quanto sei cambiato da quando avevi letto <i>Polvere</i> qui in biblioteca, e ti sei arrabbiato contro la protagonista!
                }   
                {
                - letters_thirdCharLetterThreeChoice has aetherC:
                                                                Pensa a quando ti sei messo lì ad ascoltare Petra per capire perché era arrabbiata per la rissa che avevi scatenato per difenderla.   
                }                                               
                                
            + (air) \ {charTag(PG, "neutral")}:                 Adori il piccolo Armando: perché non riparti da lì con la tua famiglia?
                {
                - grimoire_thirdChar has grimThirdCharKitchenTwo:
                {charTag(PG, "neutral")}:                       Lo stesso piccolo Armando che, mentre cucinavamo assieme, vedevi come "una vittoria" di tua sorella su di te.
                } 
            {charTag(PG, "neutral")}:                           Quando sei arrivato qui hai detto che invidi tua sorella per l'attenzione che ha ricevuto dalla famiglia dopo essere diventata mamma.
                                                                E se fosse invece l'occasione anche per te per riavvicinarti a loro?
                                                                Perché se hai paura che ti detestino, alla fine di loro ti importa, no?
                {
                - letters_thirdCharLetterSevenChoice has aetherC or letters_thirdCharLetterSevenChoice has waterC:
                                                                E le cose stanno già andando meglio dopo la chiacchierata con tuo padre, non trovi?    
                }                                                

            + (aether) \ {charTag(PG, "neutral")}:              Hai deciso di ascoltare cosa avesse da dirti Donatella: forse la strada è continuare a prenderti le tue responsabilità. 
            {charTag(PG, "neutral")}:                           Per le cose che sono accadute con tua sorella.
                                                                Con tuo padre.
                                                                Per il rapporto che hai coi ragazzi del calcetto.
                                                                E anche se il Poggi ha chiuso per sempre la sua porta, ci sono cose su cui lavorare anche nel rapporto che hai avuto con lui.
                                                                O con te stesso. 
                {
                  - letters_thirdCharLetterSixChoice has aetherC or letters_thirdCharLetterSixChoice has waterC:
                                                                E Donatella stessa si è proposta di starti vicina come amica. È bello avere accanto qualcuno che ti conosce da tanto e sa dirti le cose come stanno.
                }                                                
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

            {charTag(PG, "neutral")}:                           Hai detto di essere un fallimento come persona: per il lavoro che fai, per i problemi che hai con la casa.
                                                                Per il rapporto col tuo coinquilino, che hai odiato a lungo, e a cui ora credi di somigliare.
                                                                C'è il giudizio delle persone che ti conoscono, su come hai trattato Donatella.
                                                                L'impossibilità di poterti definire ancora un <i>bravo ragazzo</i> ti toglie il fiato.
                                                                E la soluzione che hai trovato: il bere.

            + (fire) \ {charTag(PG, "neutral")}:                Hai affrontato una conversazione complessa con tuo padre, puoi battere anche l'alcool.
            {charTag(PG, "neutral")}:                           Quando le cose non vanno come vogliamo si fa quel che si può.
                                                                E può starci come soluzione temporanea, ma poi c'è il momento di tirarsi indietro le maniche e affrontare il problema.
                    {
                    - letters_thirdCharLetterSevenChoice has aetherC or letters_thirdCharLetterSevenChoice has waterC:
                                                                E alla fine la chiacchierata con lui è andata bene, no?   
                    }                                             
            
            + (water) \ {charTag(PG, "neutral")}:               Rocco ti ha mostrato che puoi avere altri amici: perché non trovarne un altro nel tuo coinquilino?
            {charTag(PG, "neutral")}:                           Una persona che ci somiglia può insegnarci molte cose.
                                                                E ci si può aiutare assieme per uscire dalle situazioni che ci fanno stare male.
                                                                O offrirci nuove prospettive.
                    {
                    - letters_thirdCharLetterThreeChoice has fireC:
                                                                Magari senza gomitate sul naso.    
                    }
                    {
                    - letters_thirdCharLetterThreeChoice has airC:
                                                                Magari senza girare anche a lui contenuti discutibili dai gruppi che segui. 
                    } 
                    {
                    - letters_thirdCharLetterThreeChoice has earthC:
                                                                Magari senza dirgli di trovarsi altre donne, come hai fatto con Rocco.
                    }                                               
                    
            + (earth) \ {charTag(PG, "neutral")}:               Ma ogni volta che mi hai parlato del tuo lavoro, ne hai parlato con amore.
                    {
                    - grimoire_thirdChar has grimThirdOpenNest:
                    {charTag(PG, "neutral")}:                   Pensa a quando mi hai aperto il nido, e mi hai detto che la cosa più bella del tuo lavoro è capire cosa dire alle persone quando stanno di merda.
                    }

            {charTag(PG, "neutral")}:                           Il problema è economico, o le tensioni col capo.
                                                                Ma queste sono cose che si possono risolvere, e che non tolgono valore alla persona che sei.
                                                                E soprattutto: una persona <i>fa</i> il proprio lavoro, ma non <i>è</i> il proprio lavoro.
                    {
                    - letters_thirdCharLetterFourChoice has earthC:
                                                                E poi c'è il piano con Petra, per il nuovo locale!
                    }                                              
                                
            + (air) \ {charTag(PG, "neutral")}:                 Non sei curioso di sapere cosa succede però se smetti di essere un <i>bravo ragazzo</i> e inizi ad essere una buona persona?
            {charTag(PG, "neutral")}:                           Qualcuno che si muove secondo i suoi principi e non per fare una buona figura, come Petra.
                                                                Qualcuno che cerca un modo per prendersi cura di chi ama, come Rocco.
                                                                Qualcuno che fa la cosa giusta, anche quando ha un costo, come tuo padre.
                                                                Qualcuno che affronta una conversazione difficile per poter capire la persona che ha amato e ferito, come hai fatto tu con Donatella.

            + (aether) \ {charTag(PG, "neutral")}:              Ma io vedo qualcuno coraggioso che cerca di capire le persone che ha ferito.
            {charTag(PG, "neutral")}:                           Lo stai facendo con Donatella, e l'hai fatto anche col Poggi.
                                                                Con tuo padre.
                                                                Le cose non sono andate come volevi.
                                                                Ma non ti sei fermato.
                    {
                    - letters_thirdCharLetterSevenChoice has aetherC or letters_thirdCharLetterSevenChoice has waterC:
                                                                E si è aperto un nuovo spiraglio con tuo padre, non è grandioso?
                    }
                    {
                    - letters_thirdCharLetterSixChoice has aetherC or letters_thirdCharLetterSixChoice has waterC:
                                                                E Donatella è disposta ad essere tua amica, cosa che non ritenevi nemmeno pensabile quando sei venuto qui.
                    }                                               
                                                                Lascia che gli altri pensino quel che gli pare.
                                                                Tu stai già costruendoti un nuovo futuro.
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

        {charTag(PG, "neutral")}:                               Il passato sembra schiacciarti a terra: dici di aver tradito le promesse fatte a tua madre.
                                                                Di essere bloccato nel luogo in cui sei cresciuto, che ti è sempre più stretto.
                                                                Di aver speso una vita a non voler essere come tuo padre, per poi vederti come un fallito ancora peggiore.

        + (fire) \ {charTag(PG, "neutral")}:                    Cazzate: sei cresciuto in un posto con poco, ti sei fatto il culo, e stai comunque vivendo la tua vita.
        {charTag(PG, "neutral")}:                               La migliore del mondo?
                                                                Magari no, e lì si può fare di più.
                                                                Ma non continuare a pensare a ciò che avresti potuto ottenere.
                                                                Al massimo, datti da fare!
        
        + (water) \ {charTag(PG, "neutral")}:                   Però tuo padre ha ragione: continuare a seguire la promessa fatta a tua madre non ti farà bene.
        {charTag(PG, "neutral")}:                               Sei arrivato ad un punto di crisi perché sei stato anche quel tipo di persona.
                                                                Se vuoi vivere, stare bene, forse è arrivato il momento di provare qualcosa di diverso.
                                                                Magari imparando proprio da tuo padre.    
                
        + (earth) \ {charTag(PG, "neutral")}:                   Ma anche ora stai gettando nuove radici: col lavoro, con la casa.
        {
        - letters_thirdCharLetterFourChoice has earthC:
        {charTag(PG, "neutral")}:                               Col piano per il nuovo locale con Petra.

        }
        {charTag(PG, "neutral")}:                               Non sono soluzioni perfette forse, ma non sono per forza un punto d'arrivo.
                                                                E quando hai perso il vecchio lavoro o la casa con Donatella, ti sei attivato per gettare nuove fondamenta.
                            
        + (air) \ {charTag(PG, "neutral")}:                     Ma io vedo la curiosità e l'acume con cui ti butti nel calcio e nel fantacalcio.
                {
                - grimoire_thirdChar has grimThirdCharFranco:
                                                                Ti ricordi come hai provato in tutti i modi a spiegarne le regole a Franco?
                } 
        {charTag(PG, "neutral")}:                               La vitalità che traspare quando parli delle cose che ami è contagiosa.
                                                                Il modo in cui ti mantieni sempre attento e curioso.
                {
                - grimoire_thirdChar has grimThirdOpenNest:
                                                                O la curiosità che ti ha spinto ad aprirmi il nido.

                }                                                

        + (aether) \ {charTag(PG, "neutral")}:                  E dove mettiamo il {charNameThree} del futuro, quello che sta imparando a mettersi in discussione con Petra?
        {
        - letters_thirdCharLetterThreeChoice has aetherC:
        {charTag(PG, "neutral")}:                               Quello che le ha chiesto di spiegargli perché lei si fosse arrabbiata quando l'ha difesa, e l'ha ascoltata mentre gli parlava di questioni femministe?

        }
        {charTag(PG, "neutral")}:                               Potevi avere tutte le scuse per fregartene, e invece hai deciso di ascoltare qualcosa di diverso, di accoglierlo.     
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

        {charTag(PG, "neutral")}:                               Ti sei paragonato a tutti gli uomini che conosci: Merlo e Giova sono ricchi.
                                                                Rocco ha una famiglia affiatata.
                                                                Dario ha dalla sua la giovinezza.
                                                                Il tuo migliore amico se ne è fregato degli altri, e si è fatto la vita che voleva.

        + (fire) \ {charTag(PG, "neutral")}:                    Il tempo non torna, ma puoi sempre prenderti cura di te: fai sport, datti da fare.
        {charTag(PG, "neutral")}:                               Se ti metti in moto, la giovinezza di Dario varrà poco nulla.
                {
                - letters_thirdCharLetterThreeChoice has earthC:
                                                                Hai già iniziato con la palestra, perché non aggiungere anche qualcosa di più dinamico?    
                }
                {
                - grimoire_thirdChar has grimThirdCharKitchenTwo:
                                                                In cucina mi ha raccontato che ti paragonavano a Joe Manganiello.
                                                                Non è l'età a dettare il successo, ma il lavoro che fai su di te.
                } 
                                                                Anche se ricordo ancora quando ci siamo presentat3, e mi hai detto che le ragazze adorano la tua pancetta da birra.
        
        + (water) \ {charTag(PG, "neutral")}:                   Ma perché non prendere come riferimento tuo padre, che ha messo i suoi valori davanti al denaro?
        {charTag(PG, "neutral")}:                               L'hai descritto come un fallito, per poi raccontarmi di qualcuno capace di mettere i propri valori e le persone a cui tiene davanti a tutto il resto.
                                                                Ed è qualcosa che non svanisce come la bellezza, né che non si acquista coi soldi.   
                
        + (earth) \ {charTag(PG, "neutral")}:                   Chiedi consigli a Merlo e Giova per avere maggiore stabilità.
        {charTag(PG, "neutral")}:                               Hai paura di perdere la casa dove stai.
                                                                Di essere come tuo padre.
                                                                A lavoro non ti rispettano.
                                                                Questa cosa ti pesa, ma hai anche due persone di successo a cui chiedere una mano. 
                            
        + (air) \ {charTag(PG, "neutral")}:                     Ti sei mai chiesto se loro si fanno paragoni con te?
        {charTag(PG, "neutral")}:                               Sei uscito in piedi da una relazione lunghissima.
                                                                Sei un ottimo professionista.
                {
                - grimoire_thirdChar has grimThirdCharKitchenThree:
                                                                E mentre cucinavamo mi hai raccontato di come sei in grado di prenderti cura dei tuoi clienti.
                }
                                                                La vita degli altri sembra sempre migliore di quello che davvero è. 

        + (aether) \ {charTag(PG, "neutral")}:                  Smettila di essere un bicchiere riempito dagli altri: impara da Poggi, è fregatene.
        {charTag(PG, "neutral")}:                               Una vita di paragoni non è mai la propria vita.
                {
                - grimoire_thirdChar has grimWitchThirdCharFollowUp:
                                                                Quando abbiamo parlato dopo la tua chiacchierata con {witch_actualName}, temevi non avresti più incontrato qualcuno pronto a volerti bene.
                                                                E invece Rocco è lì, Petra pure, e anche il piccolo Armando.
                    {
                    - grimoire_thirdChar has grimThirdCharKitchenOne:
                                                                Rocco che si è aperto con te in quel viaggio da Milano, e non con gli altri perché sapeva che tu non l'avresti giudicato.
                    }  

                                                                Vai già bene per come sei, {charNameThree}!
                } 
                                                        
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
    //Partendo da "non sono abbastanza uomo per nulla, nemmeno per finire fino in fondo", si fanno proposte legate ai cinque possibili esiti

            {
            - story_endedStories == ():
            {charTag(TheWitch, witch_state())}:                 <i>{player_name} sta per utilizzare per la prima volta il potere dell'<b><i>epilogo</b></i>.
                                                                <i>Quale epilogo proporrà?</i>
            
            - else:
            {charTag(TheWitch, witch_state())}:                 <i>Quale <b><i>epilogo</b></i> proporrà {player_name}?</i>   
            } 

            {
            - thirdChar_InkLevel == ink_empty:
            {charTag(PG, "neutral")}:                           Mi spiace non esser stat{player_pronoun has him:o|{player_pronoun has her:a|ə}} capace di creare un rapporto di fiducia con te.
                                                                Spero sarai però disposto ad accogliere quello che sto per dirti.
                                                                
            } 

        {charTag(PG, "neutral")}:                               Credo di aver compreso qual è il tuo blocco, cosa ti ha portato da noi la prima volta, e che continua a farti stare male.
                                                                Mi hai reso il lavoro facile, perché me l'hai scritto esplicitamente: <i>Non sono abbastanza uomo per nulla, nemmeno per fallire fino in fondo.</i>.
                                                                Per questo ti dico {charNameThree}:


        + (fire) \ {charTag(PG, "neutral")}:                    Un uomo non è uno che non cade, ma uno che si rialza sempre: è giunto il momento di lottare.
        {charTag(PG, "neutral")}:                               Fatti valere col tuo capo.
                                                                Coi tuoi amici.
                                                                Trova una persona che ti rispetti.
                                                                Chiedi al mondo ciò che ti spetta.
            
        + (water) \ {charTag(PG, "neutral")}:                   Apri la porta alla vulnerabilità. Con la tua famiglia, con le persone amiche. Con te stesso.
        {charTag(PG, "neutral")}:                               Cos'hai da perdere?
                                                                Sei stato stoico e chiuso in te stesso per tutti questi anni, e ora sei qui che stai male.
                                                                Cosa c'è di peggiore di ciò che provi ora?
                                                                E soprattutto, cosa c'è di peggiore dell'affrontare tutto questo da solo?
                                                                Perché non sei solo, hai la possibilità di scegliere.
                
        + (earth) \ {charTag(PG, "neutral")}:                   Hai bisogno di darti delle basi solide. Risolvi i problemi concreti, il resto viene da sé.
        {charTag(PG, "neutral")}:                               Fatti rispettare dal capo, o trova un nuovo lavoro.
                                                                Affronta la padrona di casa, o cerca una soluzione diversa.
                                                                Che sia anche lo stare da tuo padre o tua sorella per il tempo di risparmiare a sufficienza per un posto che sia tuo.
                                                                Una tana da cui ricominciare.
                            
        + (air) \ {charTag(PG, "neutral")}:                     Sii curioso: cerca persone nella tua situazione, condividi, scopri le loro soluzioni.
        {charTag(PG, "neutral")}:                               È vissuta così tanta gente, non sarai certo il primo a provare ciò che senti ora.
                                                                E qualcuno avrà dipinto o scritto o cantato quello che provi.
                                                                E magari ha già anche tracciato una strada per farti stare meglio.
                {
                - grimoire_thirdChar has grimThirdCharKitchenTwo:
                                                                Quando abbiamo cucinato assieme hai detto che il bello della relazione con Ava era che ti faceva ragionare.
                                                                Riprendi quel piacere con altre persone come te.  
                }                                                

        + (aether) \ {charTag(PG, "neutral")}:                  Fallisci gloriosamente e sii ancora meno uomo, sii altro.
        {charTag(PG, "neutral")}:                               O sii un altro tipo di uomo, perché quello che sei ora ti fa sentire solo, ti fa stare male.
                                                                Sono trent'anni che invidi il Poggi perché se ne frega del giudizio altrui: prova a imparare da lui.
                                                                O da tuo padre, che ha preferito proteggere chi era in difficoltà invece che fregarsene come il resto del mondo.
                                                                O dalla persona che sei quando sei con Armando.
                {
                - grimoire_thirdChar has grimWitchThirdChar:
                                                                Un po' come già ti disse {witch_actualName} quando ti parlò attraverso di me.
                }                                                 
        -

    -> saluti

    = saluti

    {charTag(TheWitch, witch_state())}:                         Come vuole chiudere la lettera {player_name}?

            + (fire) \ {charTag(PG, "neutral")}:                Spacca tutto <i>vecio</i>!
            
            + (water) \ {charTag(PG, "neutral")}:               Ti voglio bene. 
                    
            + (earth) \ {charTag(PG, "neutral")}:               Ho fiducia in te.
                                
            + (air) \ {charTag(PG, "neutral")}:                 Conosci tutto ciò che ti serve per farcela, ne sono sicur{player_pronoun has him:o|{player_pronoun has her:a|ə}}.

            + (aether) \ {charTag(PG, "neutral")}:              Che la luna sia con te.
   
            -
    ->->




=== third_char_post_rewriting

    //Nota: la parte di accettazione del nome è prima dell'aggiornamento, così il nome nuovo compare solo quando viene dichiarato.
    {charTag(ThirdCharacter, "neutral")}:                   Ehi {player_name}!
                                                            Spero mi riconosci!
                                                            Sono, ero Boccale.
                                                            Ho riflettuto a lungo sulle cose che mi hai detto, sai, e in particolare <>

    {
    - third_char_second_rewriting.ending.fire:
    {charTag(ThirdCharacter, "neutral")}:                   Alla cosa fuoco.
    
    - third_char_second_rewriting.ending.aether:
    {charTag(ThirdCharacter, "neutral")}:                   Alla cosa spirito.
        
    - third_char_second_rewriting.ending.earth:
    {charTag(ThirdCharacter, "neutral")}:                   Alla cosa terra.

    - third_char_second_rewriting.ending.water:
    {charTag(ThirdCharacter, "neutral")}:                   Alla cosa acqua.

    - third_char_second_rewriting.ending.air:
    {charTag(ThirdCharacter, "neutral")}:                   Alla cosa aria.
            
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
            {charTag(ThirdCharacter, "neutral")}:           <b><i>{charNameThree}</b></i>.

    - thirdChar_ActualName has Canovaccio:
            {
            - third_char_second_rewriting.ending.water:
                                                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
            - else:
                                                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
            }
                                                            Mi chiamerò...
            {charTag(ThirdCharacter, "neutral")}:           <b><i>{charNameThree}</b></i>.

    - thirdChar_ActualName has Sigaro:
            {
            - third_char_second_rewriting.ending.earth:
                                                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
            - else:
                                                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
            }
                                                            E il mio nome è...
            {charTag(ThirdCharacter, "neutral")}:           <b><i>{charNameThree}</b></i>.
                        
    
    - thirdChar_ActualName has Cerchio:
            {
            - third_char_second_rewriting.ending.aether:
                                                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
            - else:
                                                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
            }
                                                            Mi chiamerò...
            {charTag(ThirdCharacter, "neutral")}:           <b><i>{charNameThree}</b></i>.    
            
    - thirdChar_ActualName has Forum:
            {
            - third_char_second_rewriting.ending.air:
                                                            E se penso a tutte le cose che abbiamo detto, c'è questo animale che è un po' me e che mi piace.
            - else:
                                                            Ma se penso a tutte le cose che abbiamo detto c'è un animale che mi piace e che so che è il nome che mi serve.
            }
                                                            Io sono...
            {charTag(ThirdCharacter, "neutral")}:           <b><i>{charNameThree}</b></i>.    
                
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
            {charTag(TheWitch, witch_state())}:             <i>{charNameTwo} ripone piena fiducia in {player_name}, ed è pronto a condividere con {player_pronoun has him:lui|{player_pronoun has her:lei|ləi}} una informazione importante.
        }

        {charTag(ThirdCharacter, "neutral")}:               Frase.
                                                            Ci dice qualcosa su di noi? Tipo "Non sono l'unico che si studia le persone, sai?"
        -> third_char_closing_storylet ->
        -> close


    = close
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
        
        
        {charTag(ThirdCharacter, "neutral")}:               Che viaggione, vero?
                                                            Ma ora c'è una sorpresa che ti aspetta! Vieni in cucina!
                                                            E ci porta alla festa.
                                                                    
        -> third_char_closing_storylet ->
        -> endingPNGstory(ThirdCharacter)        