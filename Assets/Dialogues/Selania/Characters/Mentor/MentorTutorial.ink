/* ---------------------------------

       Storylets tutorial

 ----------------------------------*/

=== welcome ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
        Oh, quanto ho sperato nel tuo arrivo!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Scusa, ma sono così felice che tu sia qui.
        Immagino tu abbia un milione di domande, vero?
        
            {
                - not about_colors_choices:
                    -> about_colors_choices ->
            }

        
            + (dove) [Questo posto è così insolito. Dove mi trovo?]
                -> color_variation_management(Mentor, purpleC)->
                    {
                        - trainStopContents has PG:
                            Questa? È la fermata del treno.
                            Da qui arrivano le persone che hanno bisogno del nostro aiuto.
                        - forestContents has PG:
                            Ora siamo nella foresta.
                            O meglio, la chiamo così perché.
                            Beh, ci sono tanti alberi.
                            Compreso quello lì tutto brutto e deperito.
                        - pondContents has PG:
                            Questo è lo stagno.
                            Regno dei funghi, dell'umidità e delle zanzare.
                            E lì c'è la serra!
                    }
                Ma forse intendi dire cos'è questo luogo in generale, vero?
                Mmm.
                Questo luogo non ha un nome, non che io sappia.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Per me è <b><i>Il giardino</b></i>, ma vedrai anche tu che è anche molte molte altre cose.
                E probabilmente prenderai a chiamarlo con un nome tutto tuo.
                La cosa che posso dirti con certezza è che faccio di tutto per renderlo un posto sicuro.
                Un posto dove prenderti cura di te.
                Non male, no?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
            
            + (chiSei) [Hai detto di essere felice che io sa qui?]
                    -> color_variation_management(Mentor, greenC)->
                Sì!
                Non mi fraintendere: non so di preciso tu chi sia.
                Ma so <i>perché</i> sei qui.
                E il mio di <i>perché</i> è legato alla tua presenza.
                Perché io sono la persona che tiene in piedi questo luogo, ma non solo.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                Io sono <b><i>{translator(mentor_ActualName)}</b></i>.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral 
                La tua {translator(mentor_ActualName)}.
                E ora che sei qui, ho uno scopo.

            + [I binari vanno nel nulla e partono da una porta. Non ha senso.]
                    -> color_variation_management(Mentor, blueC)->
                Uh, credo dipenda.
                Nel senso.
                Ehm.
                I binari devono collegare cose, no?
                E ora collegano la stazione alla foresta.
                    {
                        - firstChar_storyStatus == story_storyStarted:
                            Ed è anche arrivata una persona prima, si è sentito il rumore del treno.
                            {
                                - trainStopContents has PG: 
                                    Ed è lì, di fianco a noi.
                                    {
                                        - are_two_entities_together(FirstCharacter, PG):
                                            Yup.
                                            Anche se devo dire che il treno non me lo ricordo proprio.
                                            Ma in qualche modo devo essere arrivata qui!
                                    }

                            }
                    }
                Le cose hanno.
                Non mi devo agitare.
                Ecco: le cose hanno il senso che gli diamo.    
                    
            + [Voglio tornare a casa!]
                    -> color_variation_management(Mentor, redC)->
                Vuoi già andartene?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                Forse devo rivedere il mio benvenuto.
                Forse sono stata troppo formale?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_sorry
                O dovrei essere più autorevole?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                Ma non devo essere scortese ora.
                Mi hai fatto una domanda, e vedrò di rispondere.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    {
                        - trainStopContents has PG:
                            Lì ad est troverai una porta, e ti ritroverai nella tua camera da letto.
                            Basta che ti stenderai a dormire, e tornerai nel mondo da cui vieni.
                        - else:
                            A est della stazione troverai un sentiero che ti riporterà a casa.
                    }
                E se deciderai di tornare, troverai tutto nello stato in cui l'hai lasciato.
                Ma lascia che ti rubi giusto un secondo!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                
            + [{trainStopContents has PG: Posso dare da mangiare a quegli uccellini?|Posso dare da mangiare agli uccellini della stazione?}]
                    -> color_variation_management(Mentor, yellowC)->
                Credo ci sia la loro mamma in giro, a recuperare vermetti vari.
                Ma se hai voglia di fare cose, non ti preoccupare: ho compiti a bizzeffe da proporti!
            -
                -> your_name
    
    = your_name
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)

        Ora tocca a me farti una domanda.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry  
        Come ti devo chiamare?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Puoi usare un nome qualsiasi e i pronomi che preferisci: prendi questa occasione come un nuovo inizio.
            -> name_choice ->
            -> gender ->
        Piacere di conoscerti, {player_name}.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        E {player_pronouns has him:benvenuto|{player_pronouns has her:benvenuta|benvenutə}}.
        Con me usa pure i pronomi femminili.
        {not chiSei:Ah, che sbadata. Mi chiamo <b><i>{mentorName}</b></i>, e il mio obiettivo è farti stare bene.|Come Mentore, il mio unico obiettivo è farti stare bene.}#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            - (selfName)
        Tra poco ti spiegherò anche il tuo lavoro, {player_name}.
                {
                    - are_two_entities_together(FirstCharacter, PG):
                        Cioè, {player_pronouns has him:uno|{player_pronouns has her:una|unə}} deve ritrovarsi a lavorare anche in una allucinazione?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                        Allucinazione?{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                }
        Ma partiamo da una cosa fondamentale!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Qui avrai a che fare con cose viventi piene di storie.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        E ogni storia ha le sue complessità.
        Questo si traduce nel rischio che tu possa incontrare tematiche per te faticose.
        Ci saranno occasioni in cui potrai evitarle e non ti perderai nulla di questa esperienza.
        Ma quando si tratta delle persone, accogliere le loro ferite farà parte del tuo lavoro.
        Perché se sono qui è per affrontare qualcosa che per loro è complesso.
        Sono sicura che cercheranno di raccontarti le loro difficoltà nel modo più delicato possibile.
        Ma ricorda: fermarsi o rinunciare non è un fallimento.
        Non per me, ovviamente.
        Ma se senti il bisogno di staccare, puoi tornare in camera, il posto da cui sei {player_pronouns has him:arrivato|{player_pronouns has her:arrivata|arrivatə}} e stenderti sul letto.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Al risveglio, troverai tutto come l'hai lasciato.
        E se non vorrai più tornare, ci saranno sicuramente altre persone pronte ad aiutare chi viene qui in cerca di risposte.
        E a proposito di risposte!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Ti ho sbloccato la porta della serra, quell'edificio di vetro che dà sullo stagno.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                -> opening_places ->
        La serra è un bel posto dove rilassarsi, e non solo.
        Ma evita tutti gli altri posti bloccati, perché sono pericolosi!
        Ma mi stavo dimenticando di dirti cosa devi fare.
        Perché se sei qui, è per uno scopo, uno scopo davvero importante, {player_name}.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
            
            {
                //Se non ho parlato con nessunx (ovvero: Chitarra, perché senza parlare a Chitarra, Riccio non compare)
                    - not first_char_main_storylets:
                        Facciamo così: inizia parlando con qualcunə tra le persone che incontrerai qui in giro.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                        E poi torna da me.
                    
                //Se sono già in uno stato intermedio di conoscenza con unx dellx PNG
                    - (firstChar_storyletsForRewritingCount > (firstChar_minStoryletsForRewriting - 3)) or (secondChar_storyletsForRewritingCount > (secondChar_storyletsForRewritingCount - 4)):
                        E visto che hai già parlato un po' con chi girella per questo luogo, è il caso che te lo spieghi subito!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                            -> about_ink_usage
                
                //Altrimenti
                    - else:
                        Facciamo così: visto che sei già {player_pronouns has him:partito|{player_pronouns has her:partita|partitə}} col piede giusto, continua a parlare con {charNameOne} e le altre persone che popolano questo luogo.
                        E quando avrai fatto un po' di amicizia con loro, torna da me, così ti dirò cosa dovrai fare.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    
            }
            
        Io devo raccogliere le foglie dalla foresta.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                ~ mentor_pauseTalking = mentor_pauseDuration
                ~ move_entity(FifthRecap, BookPlace)
                @animation:RewriterBook 
        
        //Con questa voce evito che "about_ink_usage" compaia subito dopo se le condizioni sono sensate.
                ~ mentor_tutorialPauses = true
                ~ actual_speaker = ()
                -> main
                
            
=== about_ink_usage
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
        
        Questo non è solo un posto magnifico di per sé, {player_name}.
        È un luogo con uno scopo, uno scopo che riguarda anche te.
        Soprattutto te.
        Come avrai notato, possono comparire delle nuove persone.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            {
                - are_two_entities_together(SecondCharacter, PG):
                    Come me! Io sono toooooooooooootalmente nuovo!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    
            } 
        Sono persone rimaste bloccate in qualcosa: rimpianti, rimorsi, traumi e tutto lo scibile dell'esperienza umana.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
        E il tuo scopo, {player_name}, è aiutarle a riscrivere il modo in cui raccontano la loro storia, così che possano sbloccarsi.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Perché tu {player_pronouns has him:amico mio|{player_pronouns has her:amica mia|amicə miə}} sei <b><i>{player_pronouns has him:un riscrittore|{player_pronouns has her:una riscrittora|unə riscrittorə}}</b></i>!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        E se farai bene il tuo lavoro, aiuterai moltissime persone a sbloccarsi, e a scegliere un nuovo nome, il segno di un nuovo inizio.
            {
                - are_two_entities_together(FirstCharacter, PG):
                    Tipo, un nome diverso da {charNameOne}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
                    Esattamente, {charNameOne}!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry   
            }
        Quello {player_pronouns has him:del riscrittore|{player_pronouns has her:della riscrittora|dellə riscrittorə}} è un lavoro con pochi strumenti, ma che richiede molta empatia.
        Il primo strumento è l'ascolto.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Accogli le loro storie, capisci quale sia la cosa giusta da dire per farle sentire comprese.
        Conquista la loro fiducia.
        Così otterrai il secondo strumento: l'<b><i>inchiostro</b></i>.
        Ma questo te lo spiego dopo.

            + [Non potrebbe servire a tutt3 un nuovo nome, un nuovo inizio?]
                    -> color_variation_management(Mentor, purpleC)->
                Immagino possa servire a molt3.
                A me no, ad esempio.
                Questo è stato, è e sarà sempre il mio nome.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Ma alla fine il nome è solo un simbolo, non è l'obiettivo in sé.       
                    
            + [Con l'inchiostro ci posso disegnare?]
                    -> color_variation_management(Mentor, yellowC)->
                Apprezzo la tua creatività, {player_name}.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Ma tu sei {player_pronouns has him:un riscrittore|{player_pronouns has her:una riscrittora|unə riscrittorə}}, non {player_pronouns has him:un disegnatore|{player_pronouns has her:una disegnatrice|unə disegnatricə}}.
                    
                    
            + [Solo le persone care ci fanno vedere in modo diverso.]
                    -> color_variation_management(Mentor, greenC)->
                A volte è più facile aprirsi a chi non si conosce.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                E mentre noi riflettiamo sulle loro difficoltà, impariamo anche qualcosa su di noi.
                        
            + [Non è fare gaslighting?]
                -> color_variation_management(Mentor, redC)->
                No no no assolutamente no.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                Cavolo, devo essere più chiara.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                Ma no.
                Noi siamo qui per aiutare, non per fare coercizione.
                            
            + [Un nome è un nome. Che se ne fanno di uno nuovo?]
                    -> color_variation_management(Mentor, blueC)->
                Un nome è come una magia che carichiamo di volta in volta di significato..#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                A volte quella magia non va più bene, e dobbiamo cercare una nuova formula. 
                Un nuovo nome.
            -
            
        Non voglio stordirti di informazioni, per cui ti lascio un po' di suspense.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        E più tardi ti spiegherò la funzione dell'inchiostro.
        Ora devo assolutamente spolverare le foglie della foresta.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Questo posto collasserebbe senza me.
            {
                - not are_two_entities_together(Backpack, PG):
                    Uh, che sbadata!
                    Ti servirà di sicuro qualcosa per raccogliere gli oggetti!
                    Ecco, tieni uno zainetto.
                    {
                        - forestContents has PG:
                            ~ move_entity(Backpack, Forest)
                        
                        - trainStopContents has PG:
                            ~ move_entity(Backpack, TrainStop)
                        
                        - pondContents has PG:
                            ~ move_entity(Backpack, Pond)                            
                    
                    }
                - else:
                    Noto che hai già uno zainetto con te.
                    Spero non sia qualcosa che hai raccolto in giro: questo posto è delicato.
            }
            - (sbadata)
        A dopo!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry    
        
            ~ move_entity(RulesRecap, BookPlace)      
            ~ mentor_pauseTalking = mentor_pauseDuration
            //Con questa voce evito che "questions" compaia subito dopo se le condizioni sono sensate.
            ~ mentor_tutorialPauses = true
        
        @animation:RewriterBook
            
                -> main
             

    
=== questions
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour= translator(fourthChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)


                L'inchiostro ti aiuta concretamente nel riscrivere assieme la loro storia.
        Ogni persona ha il suo inchiostro, e aumenta man mano che aumenta la fiducia che prova nei tuoi confronti.
        Quindi: più fiducia uguale più inchiostro uguale più occasioni di riscrittura uguale maggiori occasioni di successo!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral


            {player_name}, ci siamo: sto per darti le ultime istruzioni per renderti {player_pronouns has him:un perfetto Riscrittore|{player_pronouns has her:una perfetta Riscrittora|unə perfettə Riscrittorə}}!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
            Più sei in confidenza con la persona più avrai inchiostro a disposizione per aiutarla a riscrivere la sua storia.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            Tra mentori definiamo le azioni che l'inchiostro permette di compiere <b><i>riscritture</b></i>.
            Un po' come quando riscriviamo un testo.
            Come dicevamo prima: più inchiostro significa più possibilità di aiutare quella persona a vedersi in un modo nuovo.
            A prescindere dalla quantità di inchiostro, ogni Riscrittorə ha in sé il dono dell'<b><i>epilogo</b></i>.
            L'<b><i>epilogo</b></i> è una dichiarazione finale dellə Riscrittorə che permette alla persona di mettere un punto sul presente, e iniziare a guardare al futuro in modo diverso.
            Così persona e Riscrittorə raggiungeranno il loro obiettivo: un nuovo nome, simbolo di un nuovo inizio.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
            Per cui: anche se non dovessi accumulare inchiostro, potrai comunque provare ad aiutare la persona, usando il tuo potere dell'epilogo.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                        {
                - are_two_entities_together(FirstCharacter, PG): Commento Chitarra!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
                    
            } 
            
                + [Hai un consiglio da darmi Mentore?]
                    -> color_variation_management(Mentor, greenC)->
                    Ascolta a cuore aperto.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    Segui i miei consigli.
                    E non chiedere all'altra persona di diventare qualcosa che non è.
                        
                        
                + [Ma non posso dirle: chiamati così e cosà, addio!?]
                    -> color_variation_management(Mentor, redC)->
                    Un nuovo nome è una nuova esperienza.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    E l'esperienza viene dal percorso.
                    Se non c'è percorso, non c'è cambiamento.
                        
                
                + [{charNameOne} non è una persona razionale. Può farcela?]
                    -> color_variation_management(Mentor, blueC)->
                    {player_name}, capisco la tua perplessità, ma con la giusta guida, ce la può fare.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    E assieme noi non possiamo di certo sbagliare!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                        
                        
                + [Gli scoiattoli non hanno bisogno di riscriverla, invece?]
                    -> color_variation_management(Mentor, yellowC)->
                    {player_name}, apprezzo la tua creatività, ma mantieni l'attenzione sull'obiettivo.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    E gli scoiattoli non si fanno queste domande.
                    Gli scoiattoli <i>sono</i>, e basta.
                        
                        
                + [Non dovrei essere io a decidere il mio obiettivo?]
                    -> color_variation_management(Mentor, purpleC)->
                    Il tuo obiettivo <i>qui</i>, perdonami.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    Non avendo altri luoghi in cui andare, mi dimentico che possono esserci sono altre vite, altri obiettivi da raggiungere.
                        
                -
                
                {
                - are_two_entities_together(SecondCharacter, PG): Commentto Riccio!
                    #speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    
                } 
            Ricorda {player_name}: sei una guida, ma sta alla persona decidere alla fine chi è, e di cosa ha bisogno.
            Quando te la senti, affronta questo ultimo passaggio e poi torna da me.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            
            ~ mentor_pauseTalking = mentor_pauseDuration
            @animation:RewriterBook
                ~ mentor_tutorialPauses = true
                
                -> main
        
        



//Minitutorial sui minigame
=== about_greenhouse
    Sai {player_name}? La <b><i>serra</b></i> non è solo un bel posto dove rilassarsi.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    Tra i tanti modi per migliorare un rapporto con una persona, fare il dono giusto è forse il più immediato.
    {
        - firstChar_giftedObject != () or secondChar_giftedObject != ():
            E vedo che hai già imparato come fare! Sei sempre un passo avanti.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        
        - else:
            E ti consiglio di farlo, per facilitarti la vita.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
    }
    Il dono giusto dice alla persona: ti ascolto, ti capisco.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    So chi sei.
    {
                - are_two_entities_together(SecondCharacter, PG): Commentto Riccio!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    
            } 
                        {
                - are_two_entities_together(FirstCharacter, PG): Commento Chitarra!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
                    
            } 
    Anche per questo esistono doni sbagliati.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
    O mediocri.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    La serra, con le sue piante magnifiche, è personalmente il posto migliore dove coltivare e recuperare doni.
    Gli effetti dei doni tra l'altro sono immediati e permanenti.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
    Ed è per questo che ogni Riscrittorə può darne solo uno a persona.
    Qualcosa di così forte non può certo essere usato senza coscienza. #speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
    @animation:RewriterBook
            ~ mentor_tutorialPauses = true
            ~ mentor_pauseTalking = mentor_pauseDuration
    -> main





=== about_kitchen
    Una cucina su una palude?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    
    Non la mia prima scelta.
    Ti avevo suggerito di non andare nei luoghi malmessi, ma sembra che qualcunə abbia fatto il lavoro per te.
    Forse non è una così cattiva idea: cucinare assieme è un momento di intimità.
    E mangiare è uno spazio di bella condivisione.
    Passar del tempo in cucina con qualcunə può essere un bel modo per conoscervi meglio.
    E per capire che piega stia prendendo la vostra relazione.
                {
                - are_two_entities_together(FirstCharacter, PG): Commento Chitarra!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
                    
            } 
            {
                - are_two_entities_together(SecondCharacter, PG): Commentto Riccio!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    
            } 
    @animation:RewriterBook
        ~ mentor_tutorialPauses = true
        ~ mentor_pauseTalking = mentor_pauseDuration
    -> main







=== about_nest
    Quel posto, quella roba sulla spiaggia. #speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    Non mi piace.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
    Non mi piacciono i posti isolati.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
    Non mi piacciono i posti malmessi.
    E non mi piace quello che ti permette di fare. #speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
    Sto per tradire il mio ruolo di Mentore, ma non sarò io a dirti cosa farne.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
    {
                - are_two_entities_together(SecondCharacter, PG): Commentto Riccio!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    
            } 
            {
                - are_two_entities_together(FirstCharacter, PG): Commento Chitarra!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
                    
            } 
    @animation:RewriterBook
    ~ mentor_pauseTalking = mentor_pauseDuration
    ~ mentor_tutorialPauses = true
    -> main



//Altre informazioni importanti
=== about_not_mandatory_work
    Qui è dove mentore ci dice che i posti nuovi (elencati se aperti) possono essere comodi per avere occasioni per costruire relazioni, ma non sono per nulla obbligatori.
                {
                - are_two_entities_together(FirstCharacter, PG): Commento Chitarra!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
                    
            } 
            {
                - are_two_entities_together(SecondCharacter, PG): Commentto Riccio!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    
            } 

@animation:RewriterBook
~ mentor_pauseTalking = mentor_pauseDuration
    ~ mentor_tutorialPauses = true
    -> main


 
=== first_char_new_mail
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    Sembra che {charNameOne} ti abbia scritto una lettera, {player_name}! #speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    Che cosa dolce, vero?
    {
        - entity_location(PG) == TrainStop:
            La trovi lì, sulla bacheca!
            
        - else:
            La trovi sulla bacheca della fermata del treno!
    }

-> main


=== second_char_new_mail
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    Sembra che {charNameTwo} ti abbia scritto una lettera, {player_name}! #speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    Che cosa dolce, vero?
    {
        - entity_location(PG) == TrainStop:
            La trovi lì, sulla bacheca!
            
        - else:
            La trovi sulla bacheca della fermata del treno!
    }

-> main
   
   
