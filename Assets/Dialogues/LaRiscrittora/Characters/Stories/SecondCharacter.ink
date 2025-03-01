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
            {charNameTwo}: {~ Torna dopo.|Ora ho voglia di stare da solo.|Lasciami in pace.}
        -> main
    }

= hub
~ temp charNameTwo = uppercaseTranslator(secondCharacterState)

    {charNameTwo}: {~ Ciao.|...}
    
            + [Ti va di raccontarmi qualcosa di te?]
                -> knowing_second_character
                
    
            //Se non ho ancora fatto e ho parlato abbastanza con lui
            + {secondStoryQuestCount > minStoryQuesTCount && findedGifts != ()} [Voglio regalarti questa cosa.]
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
                        ???: Non ci parlo con chi parla con quella là!
                        ???: Mi ha fatto male!
                        -> main
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
                        {charNameTwo}: La mentore ce l'ha con me!
                        {charNameTwo}: Fa qualcosa!
                        -> main
                }
                
            - not six:
                -> six
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
            
            + [t]
                ~ secondBlue ++
                
            + [t]
                ~ secondYellow ++
                
            + [t]
                ~ secondRed ++

                
            + [t]
                ~ secondGreen ++
  
                
            + [t]
                ~ secondPurple ++
            -    
        
        ???: Io sono qui perché è il mio compleanno.
        ???: Mamma mi ha promesso qualcosa di FIGHISSIMO!
        ???: L'anno scorso per Natale mi ha preso tutte le action figures dei miei videogiochi preferiti.
        ???: Ma poi mio fratello me le ha rubate tutte.
        ???: Ma lui qui mica ci può venire.
        ???: Perché mamma ha detto che avrebbe dato solo a me qualcosa di bellissimo.
        ???: Ma dove trovo le caramelle?
        ???: Mamma dice sempre che non c'è compleanno senza caramelle!
        
            + (twoBlue) [t]
                    ~ secondBlue ++
                
            + (twoYellow) [t]
                    ~ secondYellow ++
                
            + (twoRed) [t]
                ~ secondRed ++

                
            + (twoGreen) [t]
                ~ secondGreen ++
  
                
            + (twoPurple) [t]
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
        {charNameTwo}: Come le faccio tutte le foto per la scuola?
        {charNameTwo}: Sapevi che gli uccelli vedono dieci colori?
        {charNameTwo}: DIECI! Mica solo tre come noi!
        {charNameTwo}: E che l'acso, atso, axotolot si fa ricrescere le braccia?
            + [Gli chiedo perché ha picchiato {charNameFive}.]
                -> top
            + [Lo lascio continuare]
            -
            
        {charNameTwo}: E le capre hanno dei loro accenti!
        {charNameTwo}: Non sono mica tutti dei beeeeeeeeee uguali!
        {charNameTwo}: Solo i colibrì sanno volare all'indietro!
        {charNameTwo}: Tu sai camminare indietro? Secondo me no.
            + [Gli chiedo perché ha picchiato {charNameFive}.]
                -> top
            + [Lo lascio continuare]
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
            + (twoBlue) [t]
                ~ secondBlue ++
                
            + (twoYellow) [t]
                ~ secondYellow ++
                
            + (twoRed) [t]
                ~ secondRed ++

                
            + (twoGreen) [t]
                ~ secondGreen ++
  
                
            + (twoPurple) [t]
                ~ secondPurple ++

            -
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
            	  {charNameTwo}: Ma a te piacciono le action figures?
            	  {charNameTwo}: Tutti i miei compagni di classe ne hanno, ma io no.
            	  {charNameTwo}: Mamma fa sempre storie se le chiedo di comprarmi qualcosa.
            	  {charNameTwo}: Ne avevo una di Kratos.
            	  {charNameTwo}: Ma mamma voleva buttarla perché dice che è troppo violento per un bambino.
            	  {charNameTwo}: Ma mica sono un bambino.
            	  {charNameTwo}: E così l'ho regalata a mio fratello.
            	  {charNameTwo}: Che l'ha nascosta sotto al letto.
            	  {charNameTwo}: Mamma non ci guarda sotto al suo letto, nemmeno quando è arrabbiata.
            	  {charNameTwo}: Sennò lui si arrabbia più di lei.
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
        	        {charNameTwo}: Ma preferisco le tartarughe ninja.
        	        {charNameTwo}: Così poi vedo i coccodrilli delle fogne.
          
                -> three_continue
       
       
        = three_continue 
        ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
            //Definire meglio in base ai colori.
            
            + {him_liar} [Avevi detto di esser pieno di action figures.]
                    ~ secondBlue ++
            
            + {him_liar} [Tuo fratello non te le aveva rubate tutte?]
                    ~ secondGreen ++
            
            + {her_liar or they_liar} [Non avevi detto che questo è il regalo di compleanno di tua mamma?]
                    ~ secondBlue ++
            
            + {her_liar} [Si arrabbia spesso, mamma?]
                    ~ secondGreen ++
            
            + {they_liar} [Perdonami, ma non era il suo regalo di compleanno, questo?]
                    ~ secondGreen ++
            

            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ secondYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ secondRed ++
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDurantion
            -> main
    
    
    
    
    = four
    //Obiettivo: Far vedere che c'è qualcosa che non va a casa.
    //Contenuto: Momento di vulnerabilità, ci parla della nonna (ma non ci dice che è morta) e ci dice che è fuggito da casa.
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ secondStoryQuestCount ++
        -> secondAffinityCheckCalc ->
        
        {charNameTwo}: Nonna non mi tratta mai come un bambino.
        {charNameTwo}: Mi ha anche insegnato come barare a carte.
        {charNameTwo}: E come aprire il cassetto dei dolci di mamma.
        {charNameTwo}: Quando mamma e papà ci lasciano a casa da soli mangiamo sempre cose buone.
        {charNameTwo}: E guardiamo assieme la tele.
        {charNameTwo}: E posso scegliere cosa guardare.
        {charNameTwo}: Quando papà è andato via nonna ha aiutato mamma a stare bene.
        {charNameTwo}: Anche se a mamma mica piace la nonna.
        {charNameTwo}: E quando papà è tornato ha ripreso a trattarla male.
        {charNameTwo}: Ma nonna dice che succede.
        {charNameTwo}: Che gli adulti fanno cose cattive senza saperlo.
        {charNameTwo}: Mi spiace essere scappato di casa.
        
            + [Dammi dettagli più concreti.]
                    ~ secondBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ secondYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ secondRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ secondGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ secondPurple ++
 
            -
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
        {charNameTwo}: Se faccio cadere le cose per terra.
        {charNameTwo}: Se mi distraggo.
        {charNameTwo}: Una volta nonna, quando stava bene, è venuta e ha sgridato tutte le maestre.
        {charNameTwo}: Ora sono un po' più gentili.
        {charNameTwo}: Ma quella di matematica dice sempre che le dispiace per me.
        {charNameTwo}: E non mi piace quando fa così.
            
        
        
            + [Dammi dettagli più concreti.]
                    ~ secondBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ secondYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ secondRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ secondGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
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
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                ~ secondYellow ++
                
            + [Menti!]
                ~ secondRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ secondGreen ++
  
                
            + [Menti!]
                ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDurantion
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
        {charNameTwo}: E c'era ancora la nonna.
        {charNameTwo}: E quando papà è tornato dopo essere andato via ed era arrabbiato, invece è tornato con un cane.
        {charNameTwo}: Non ho mai avuto un cane.
        {charNameTwo}: Sai che i cani sentono suoni fino a duecento metri?
        {charNameTwo}: Se li chiami e non vengono è perché non vogliono.
        {charNameTwo}: Anche io faccio così.
        
            + [Dammi dettagli più concreti.]
                ~ secondBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                ~ secondYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ secondRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ secondGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDurantion
            -> main        
            
            
    = eight
    //Obiettivo: presentare la relazione col fratello maggiore, che è una persona molto pragmatica (finale blu, finale giallo)
    //Contenuti: ci parla del fratello come mito, riferimento, modello. All'inizio mente, ma poi si ridimensiona da solo (sta iniziano a fidarsi).
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
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
            
            + [Ma non hai detto che tua mamma non guarda sotto al letto di tuo fratello.]
                {charNameTwo}: Sì.
                {charNameTwo}: E non è una bugia, perché ha un letto.
                {charNameTwo}: E mamma va al garage ogni tanto.
                {charNameTwo}: Ma non ci guarda mica sotto.
                    ~ secondBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ secondYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ secondRed ++

                
            + [Se non sai nuotare forse non dovresti andare allo stagno da solo.]
                ~ secondGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDurantion
            -> main    
    
    
    = nine
    //Obiettivo: mostrare tra le righe la paura per il futuro, anche dimostrazione di rabbia verso di sè? (finale rosso sicuro, finale blu?
    //Contenuti: tutti sanno cosa diventare da grandi, io voglio fare il veterinaio ma?
        ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
        ~ secondStoryQuestCount ++
        
        {charNameTwo}: Tu hai sempre voluto fare {pronouns has him: il riscrittore|{pronouns has her: la riscrittora|lə riscrittorə}} come lavoro?
        
            + [Dammi dettagli più concreti.]
                    ~ secondBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ secondYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ secondRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ secondGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ secondPurple ++
 
            -
            
        {charNameTwo}: I miei compagni fanno un sacco di cose.
        {charNameTwo}: Calcio.
        {charNameTwo}: Basket.
        {charNameTwo}: Corsi di pianoforte o chitarra o la batteria.
        {charNameTwo}: Oppure imparano il cinese e l'inglese.
        {charNameTwo}: E vanno a cavallo.
        {charNameTwo}: E sanno già cosa vogliono fare come lavoro.
        {charNameTwo}: E io ho un sacco di tempo libero invece.
        {charNameTwo}: Non posso fare quei corsi.
        {charNameTwo}: Mamma dice che i bambini devono giocare, non fare gli adulti.
        {charNameTwo}: Ma non ho nessuno con cui giocare.
        {charNameTwo}: E non so cosa voglio fare.
        {charNameTwo}: E questa cosa mi fa arrabbiare.
        {charNameTwo}: Non voglio essere un bambino per sempre.
        {charNameTwo}: Ma non mi piace essere grande.
            
            + [Dammi dettagli più concreti.]
                    ~ secondBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ secondYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ secondRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ secondGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
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
        {charNameTwo}: E quando sono tornato a casa papà mi ha picchiato.
        {charNameTwo}: E ora quando vedo il bambino mi sento in colpa.
        {charNameTwo}: Ho provato a chiedergli scusa ma lui scappa.
        {charNameTwo}: E sua sorella una volta mi ha lanciato una scarpa in faccia.
        {charNameTwo}: Mio fratello dice che succede.
        {charNameTwo}: Che tra bambini ci si picchia.
        {charNameTwo}: E anche tra adulti.
        {charNameTwo}: Penso che gli adulti facciano schifo.
        {charNameTwo}: Quando papà mi picchia dice che è colpa mia.
        {charNameTwo}: Ma a me non piace farmi picchiare.
        {charNameTwo}: O picchiare.
        {charNameTwo}: Ma se sono arrabbiato e non so cosa fare.
        
        
            + [Dammi dettagli più concreti.]
                    ~ secondBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ secondYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ secondRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ secondGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
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
        {charNameTwo}: E a me piacciono le cose strane.
        {charNameTwo}: Mi piace provare le cose.
        {charNameTwo}: Capire.
        {charNameTwo}: Non mi piacciono le cose che non capisco.
        {charNameTwo}: Ma a volte faccio dei pasticci.
        {charNameTwo}: Una volta ho mischiato le cose per pulire casa e ho vomitato tutto il pomeriggio.
        {charNameTwo}: Una volta ho riempito il letto di mamma di sabbia e si è grattata per una settimana.
        {charNameTwo}: E una volta ho provato ad attaccare un mio robot al frullatore dell'amico di mio fratello.
        {charNameTwo}: E ha fatto una fiammata gigante e un pezzo di muro si è fatto nero.
        {charNameTwo}: Mio fratello si è spaventato tantissimo.
        {charNameTwo}: Ma io ero contento perché non sapevo che ci sono dei fili nel muro.
        {charNameTwo}: E ora so cosa è l'elettricità.
        {charNameTwo}: Ma qui non c'è.
        {charNameTwo}: Chissà se è la rana che fa accadere le cose allora.
        
            + [Dammi dettagli più concreti.]
                    ~ secondBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ secondYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ secondRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ secondGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDurantion
            -> main    
    
    = twelve
    //Obiettivo: narrativamente, lasciarcelo con una immagine positiva. Far vedere il peso dei genitori. Finale verde, finale giallo.
    //Contenuti. Momento tenero. L'altra nonna, la casa al mare, momenti di pace. I genitori non ci sono in queste occasioni
        ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
        ~ secondStoryQuestCount ++
        
        {charNameTwo}: Mi piace la biblioteca.
        {charNameTwo}: Ma non mi piace leggere.
        {charNameTwo}: Però mi ricorda la casa della nonna.
        {charNameTwo}: L'altra nonna, quella che sta al mare.
        {charNameTwo}: Ci vado d'estate e mi diverto tantissimo.
        {charNameTwo}: Lei mi prepara un sacco di cose buone.
        {charNameTwo}: E io le insegno tutte le cose più strane sugli animali.
        {charNameTwo}: Mamma e papà non vengono mai.
        {charNameTwo}: Ma mio fratello e il suo amico sì.
        {charNameTwo}: Una volta mi hanno portato a una festa sulla spiaggia.
        {charNameTwo}: E mi hanno fatto cantare nel microfono.
        {charNameTwo}: Da nonna mi addormento subito.
        {charNameTwo}: Non devo correggere le giornate.
        {charNameTwo}: Quando arriva fine agosto però mi sento triste.
        {charNameTwo}: E arrabbiato.
        {charNameTwo}: Ora che nonna non c'è più, vorrei vivere sempre con l'altra nonna.
        {charNameTwo}: Tanto so studiare da solo.
        {charNameTwo}: Magari studio come si curano i pesci.
        {charNameTwo}: Anche se non gli puoi mica fare le coccole.
        {charNameTwo}: Uffi.
            
            + [Dammi dettagli più concreti.]
                    ~ secondBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ secondYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ secondRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ secondGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ secondPurple ++
 
            -
             ~ secondPauseTalking = secondCharPauseDurantion
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
            * [Voglio comunque approfondire la storia di questa personaggia.]
                -> main_story_second_character
            * [Salto.]
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
        {charNameTwo}: Ho realizzato una cosa, una cosa su noi due.
            -> secondAffinityCalc ->
        {
        - firstPurple && firstYellow > firstBlue: {charNameTwo}: Sento ancora la mancanza di Talco, ma con te mi sento come se fossimo parte da sempre della stessa band.
        <i>{charNameTwo} vede {name} come una persona amica e fidata.</i>
        
        -firstPurple or firstYellow > firstBlue:{charNameTwo}: Ci sono momenti in cui cantiamo all'unisono, ed è bello. Mi sento ascoltata.
        
        <i>{charNameTwo} si trova bene con {name}.</i>
        
        - firstPurple && firstYellow < firstBlue: {charNameTwo}: Facciamo parte di due cori diversi, vero? Non credo tu abbia preso una sola delle mie note.
        
        <i>{charNameTwo} non si è sentita capita da {name}.</i>
        
        
        - else: A volte siamo sullo stesso brano, altre no. E non ho ancora capito chi tra noi stia ignorando l'altra parte.
        
        <i>{charNameTwo} non riesce a capire che rapporto sta costruendo con {name}.</i>
        
        }
        {charNameTwo}: E credo di aver capito perché il mio nome
            
            + [Credo di sapere come aiutarti.]
                -> statement
            + [Capisco il tuo dolore, ma ho bisogno di riflettere un attimo.]
                -> main


    = statement
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
        <i>A seguito del rapporto che {name} ha creato con {charNameTwo} {firstPurple && firstYellow > firstBlue: l'inchiostro è aumentato di due unità.|{firstPurple or firstYellow > firstBlue: l'inchiostro è aumentato di una unità|l'inchiostro non ha subito variazioni}}.</i>
        //Sopra ho già aggiornato il livello di inchiostro e quindi di affinità.
            ~ inkLevel(secondCharacterInkLevel)
        + [Voglio cominciare la riscrittura.]
            -> secondNaming -> 
            -> one
        + [Preferisco prendermi del tempo.]
            -> main

    = one
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    {name}: Prima hai detto che hai il terrore di fare una scelta.
        
        + [Qui hai accettato il tuo nuovo nome.]
            {name}: E ammettere una propria paura, una scelta enorme.
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }            
        
        + [Eppure hai deciso di costruire una famiglia con l3 tu3 amic3.]
  
        
        + [Dimenticando che per finire gli studi hai lottato per anni.]
     
            
        + [Ma hai più volte accettato il rischio di suonare sul]
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
        + [Però da che sei qui hai esplorato tutto questo luogo.]
           
                {
                	- firstCharacterPossibleStates hasnt Rinuncia:
    		            ~ firstCharacterPossibleStates --
    		           {debugChangeName: Diminuisco lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
            
        -
 
        {
        - secondCharacterInkLevel == Empty:
            -> ending
        - else: 
            -> two
        }        
        
    = two
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)

        + [Con Talco puoi litigare, eppure siete legatissim3.]
            {name}: Pensi davvero che ti accuserebbe di tradimento solo perché hai deciso di decidere per te stessa?
            {name}: Il Talco che hai raccontato si arrabbierebbe di più se tu facessi una scelta per te pensando a ləi.
            
                    
        + [La paura di tradire è un'altra faccia dell'ego.]
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
    
            
        + [Il tuo cuore si preoccupa molto di loro, e poco di te.]
   
            
        + [Forse accadrà, ma non è un tuo problema.]
 
                {
                	- firstCharacterPossibleStates hasnt Rinuncia:
    		            ~ firstCharacterPossibleStates --
    		           {debugChangeName: Diminuisco lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
                
        + [Tradiamo la fiducia rompendo le regole a nostro vantaggio.]
 
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
                    
        -
        {
        - secondCharacterInkLevel == Low:
            -> ending
        - else: 
            -> three
        }
        
    = three
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
            
        + [Se non tiri nessun dado, non c'è storia da far avanzare.]
         
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
        
        + [Ma ogni persona ha immaginato sorti diverse per Jonah.]
                {
                	- firstCharacterPossibleStates hasnt Rinuncia:
    		            ~ firstCharacterPossibleStates --
    		           {debugChangeName: Diminuisco lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
                
        + [Eppure la prima cosa che hai visto qui sono otto sentieri.]
 
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
            
        
        + [La storia di Jonah è un successo.]

                
        + [Ragioni come se fossi sola se dovessi cadere.]
     
        -
        {
        - secondCharacterInkLevel == Normal:
            -> ending
        - else: 
            -> four
        }
    
    = four
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)

        + [Giocare è bello perché puoi sempre rinunciare a farlo.]

                {
	                - secondCharacterPossibleStates hasnt Violino:
		                ~ secondCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {secondCharacterPossibleStates }}
                }            
         
        
        + [Quando Anna ha rinunciato all'ex, ha scoperto la sicurezza.]

        
        + [Un infinito più piccolo resta comunque infinito.]

                {
	                - secondCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }    
            
        + [Rinunciando a cercare Talco ti sei tutelata.]
 
                {
                	- secondCharacterPossibleStates hasnt Rinuncia:
    		            ~ firstCharacterPossibleStates --
    		           {debugChangeName: Diminuisco lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }            
        
        + [C'è più coraggio nella rinuncia che nel compromesso.]
 
            
        -
        
        -> ending

    = ending
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
     Per questo ti dico...
        + {secondRed > 0} [Prendi una strada e se non ti piace cambiala!]
        
        + {secondPurple > 0} [Dai alla tua vita uno scopo più grande.]
        
        + {secondYellow > 0} [Ogni gioco richiede una pausa, e tu hai bisogno di ascoltarti.]
                
        + {secondGreen > 0} [Non deluderai i tuoi amici: loro saranno sempre con te.]
                
        + {secondBlue > 0} [Questa non è la tua strada. Succede. Ora puoi cambiare.]
                
        
                
        -     
        
    {charNameTwo}: Grazie, {name}.
    {charNameTwo}: Mentre parlavi mi è nata una nuova canzone in testa.
    {charNameTwo}: Qualcosa di fresco, di pronto a cambiare.
    {charNameTwo}: La canzone del mio vero nome.

        {
            - firstCharacterPossibleStates has Rinuncia:
                {charNameTwo}: Che <b>resterà Rinuncia</b>, perché l'unica cosa che posso fare, è far sì che altr3 scelgano per me.
            
            - firstCharacterPossibleStates has Triangolo:
                {charNameTwo}: E il mio vero nome è <b>Triangolo</b>, perché pensavo di essere uno strumento, e invece ho solo fallito.
                    ~ secondCharacterState = ()
                    ~ secondCharacterState += Triangolo
            
            - firstCharacterPossibleStates has RagazzaOrchestra:
                {charNameTwo}: Mi chiamerò <b>Ragazza Orchestra</b>: nel non saper rinunciare sono diventata l'ornitorinco della musica.
                    ~ secondCharacterState = ()
                    ~ secondCharacterState += RagazzaOrchestra
            
            - firstCharacterPossibleStates has FlautoDolce:
                {charNameTwo}: Il mio nome è <b>Flauto Dolce</b>: perché semplice, elementare, ma apprezzata da chi ha buon cuore.
                    ~ secondCharacterState = ()
                    ~ secondCharacterState += FlautoDolce                
            
            - firstCharacterPossibleStates has Ocarina:
                {charNameTwo}: Mi chiamerò <b>Ocarina</b>: perché il suo suono è gioco e festa.
                    ~ secondCharacterState = ()
                    ~ secondCharacterState += Ocarina
            
            - firstCharacterPossibleStates has Violino:
                {charNameTwo}: Io sono <b>Violino</b>: perché anche se suono bene da sola, do il meglio di me stessa suonando con e per gli altri.
                    ~ secondCharacterState = ()
                    ~ secondCharacterState += Violino
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
        {firstCharacterPossibleStates hasnt Rinuncia: {charNameTwo}: Non so di preciso cosa mi accadrà ora, ma in un certo senso so che sono più pronta.}
        {firstCharacterPossibleStates hasnt Rinuncia: {charNameTwo}: Grazie per quello che hai fatto, davvero.}
        {firstCharacterPossibleStates has Rinuncia: {charNameTwo}: Vedremo cosa mi accadrà.}
            ~ move_entity(SecondCharacter, Safekeeping)
            //Abbiamo accesso alle note solo se è cambiata. Sennò lei se ne va abbastanza arresa da tutto.
            {
                - secondCharacterPossibleStates hasnt Rinuncia:
                    ~ move_entity(SecondCharacterNotes, BusStop)
            }    
            
        -> main

















    
