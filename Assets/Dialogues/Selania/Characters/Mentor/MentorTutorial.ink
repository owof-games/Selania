/* ---------------------------------

       Storylets tutorial

 ----------------------------------*/

=== welcome ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
        Sapevo che sarebbe arrivata una nuova persona!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        
        Immagino tu abbia un milione di domande, vero?
        
            * (dove) [Dove sono? (opzione blu)]
                -> color_variation_management(Mentor, blueC)->
                 Questo luogo non ha un nome.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                 Per me è <b><i>Il giardino</b></i>, ma vedrai anche tu che è anche molte molte altre cose.
                 E probabilmente prenderai a chiamarlo con un nome tutto tuo.
                 La cosa che posso dirti con certezza è che faccio di tutto per renderlo un posto sicuro.
                 Un posto dove prenderti cura di te.
                 Non male, no?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                 Soprattutto quando fuori da qui è difficile trovare un senso.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_sorry
                    -> your_name
            
            * (chiSei) [Chi sei? (opzione verde)]
                -> color_variation_management(Mentor, greenC)->
                La persona che tiene in piedi questo luogo!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                Ma tu puoi chiamarmi <b><i>{translator(mentor_ActualName)}</b></i>.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral 
                Così puoi ricordarti con facilità qual è il mio scopo.
                    -> your_name

            * [Come me ne vado da qui? (opzione gialla)]
                -> color_variation_management(Mentor, yellowC)->
                 Vuoi già andartene?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                 Forse devo rivedere il mio benvenuto.
                 Forse sono stata troppo formale?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_sorry
                 O dovrei essere più autorevole?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                 Ma non devo essere scortese ora.
                 Mi hai fatto una domanda, e vedrò di rispondere.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                 A est della stazione troverai un sentiero che ti riporterà a casa.
                 E se deciderai di tornare, troverai tutto nello stato in cui l'hai lasciato.
                    -> your_name
                    
            * [Non ho più voglia di parlare. (opzione rossa)]
                -> color_variation_management(Mentor, redC)->
                 Lascia che ti rubi giusto un secondo!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                    -> your_name
                
            * [Ma perché sono qui? (opzione viola)]
                -> color_variation_management(Mentor, purpleC)->
                 Cose viola#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                    -> your_name
            -
            Ora tocca a me farti una domanda.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry        
            -> your_name
    
    = your_name
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp mentorName = translator(mentor_ActualName)
        
        Come ti devo chiamare?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Puoi usare un nome qualsiasi e i pronomi che preferisci: prendi questa occasione come un nuovo inizio.
            -> name_choice ->
            -> gender ->
        Piacere di conoscerti, {player_name}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        E {player_pronouns has him:benvenuto|{player_pronouns has her:benvenuta|benvenutə}}.
        Con me usa pure i pronomi femminili.
        {not chiSei:Ah, che sbadata. Mi chiamo <b><i>{mentorName}</b></i>, e il mio obiettivo è farti stare bene.|Come Mentore, il mio unico obiettivo è farti stare bene.}#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            - (selfName)
        Tra poco ti spiegherò anche il tuo lavoro, {player_name}.
        Ma prima: una cosa im-por-tant-tis-si-ma!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        In questo luogo avrai a che fare con persone e altre cose viventi con una propria storia.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        E ogni storia ha le sue complessità.
        E questo si traduce con il rischio che tu possa incontrare tematiche per te faticose.
        Ma non preoccuparti: ogni luogo e ogni persona ha il suo modo di avvisarti, e di permetterti di scegliere cosa fare.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        E se dovessi decidere di saltare qualcosa perché non è nelle tue corde, non ti perderai nulla di questa esperienza.
        Come dico sempre: sicuro è bello!
        E a proposito di sicurezza: non c'è nulla di più sicuro del riposo.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Non per me, ovviamente.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Se senti il bisogno di staccare, puoi tornare in camera, il posto da cui sei {player_pronouns has him:arrivato|{player_pronouns has her:arrivata|arrivatə}} e stenderti sul letto.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Al risveglio, troverai tutto come l'hai lasciato.
        E a proposito di luoghi! #speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Ti ho sbloccato la porta della serra, quell'edificio di vetro che dà sullo stagno.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                -> opening_places ->
        Evita tutti i posti che vedi bloccati, perché sono pericolosi.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
        Ma la serra è un posto magnifico per rilassarsi.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral

        
        Mannaggia a me, sto aprendo così tante parentesi che mi sono dimenticata di dirti cosa devi fare.
        Perché se sei qui, è per uno scopo, uno scopo davvero importante, {player_name}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
            
            {
                //Se non ho parlato con nessunx (ovvero: Chitarra, perché senza parlare a Chitarra, Riccio non compare)
                    - not knowing_first_character:
                        Facciamo così: inizia parlando con qualcunə tra le persone che incontrerai qui in giro.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                        E poi torna da me.
                    
                //Se sono già in uno stato intermedio di conoscenza con unx dellx PNG
                    - (firstChar_storyletsForRewritingCount > (firstChar_minStoryletsForRewriting - 3)) or (secondChar_storyletsForRewritingCount > (secondChar_storyletsForRewritingCount - 4)):
                        E visto che hai già parlato un po' con chi girella per questo luogo, è il caso che te lo spieghi subito!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                            -> about_ink_usage
                
                //Altrimenti
                    - else:
                        Facciamo così: visto che sei già {player_pronouns has him:partito|{player_pronouns has her:partita|partitə}} col piede giusto, continua a parlare con {charNameOne} e le altre persone che popolano questo luogo.
                        E quando avrai fatto un po' di amicizia con loro, torna da me, così ti dirò cosa dovrai fare.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    
            }
            
        Io devo raccogliere le foglie dalla foresta.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
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
        
        {player_name}: è arrivato il momento di spiegarti perché sei qui.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Come avrai notato, in questo luogo possono comparire delle persone nuove.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Sono persone rimaste bloccate in qualcosa: rimpianti, rimorsi, traumi.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
        Ma per loro fortuna ci sarai qui tu, {player_name}, ad aiutarle!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Il modo più semplice è ascoltarle.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Accogli le loro storie, cerca di capire quale sia la cosa giusta da dire per farle sentire comprese.
        Perché tu {player_pronouns has him:amico mio|{player_pronouns has her:amica mia|amicə miə}} sei <b><i>{player_pronouns has him:un riscrittore|{player_pronouns has her:una riscrittora|unə riscrittorə}}</b></i>!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Aiuti queste persone bloccate a riscrivere la propria storia in modo diverso, a scegliersi un nuovo nome.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        E come ogni persona che scrive, per farlo, avrai bisogno di <b><i>inchiostro</b></i>.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        E l'inchiostro che potrai usare con una persona sarà tanto più alto quanto più lei si fiderà di te.
        Quindi: più fiducia uguale più inchiostro uguale un lavoro per te più facile quando farai la riscrittura.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        
            + [E tu hai bisogno di un nuovo nome?]
                -> color_variation_management(Mentor, purpleC)->
                Io?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                No!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
                Questo è stato, è e sarà sempre il mio nome.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    
                    
            + [Con l'inchiostro ci posso disegnare?]
                -> color_variation_management(Mentor, yellowC)->
                Apprezzo la tua creatività, {player_name}.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Ma tu sei {player_pronouns has him:un riscrittore|{player_pronouns has her:una riscrittora|unə riscrittorə}}, non {player_pronouns has him:un disegnatore|{player_pronouns has her:una disegnatrice|unə disegnatricə}}.
                    
                    
            + [Solo le persone care ci fanno vedere in modo diverso.]
                -> color_variation_management(Mentor, greenC)->
                A volte è più facile aprirsi a chi non si conosce.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                E mentre noi riflettiamo sulle loro difficoltà, impariamo anche qualcosa su di noi.
                        
                        
            + [Tipo gaslighting?]
                -> color_variation_management(Mentor, redC)->
                No no no assolutamente no.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                Cavolo, devo essere più chiara.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                Ma se una persona si sente presa in giro, non si fiderà mai di te.
                        
            
            + [Un nome è un nome. Che se ne fanno di uno nuovo?]
                -> color_variation_management(Mentor, blueC)->
                Un nome è come una magia.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Lo carichiamo di volta in volta di significato.
                E quando lo usiamo, ci dice chi siamo.
                A volte quella magia non va più bene, e dobbiamo cercare una nuova formula. Un nuovo nome.
                    
            -
            
            Non voglio stordirti di informazioni, per cui ti lascio un po' di suspence, e ti spiegherò più avanti a cosa serve l'inchiostro.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            Ora devo assolutamente spolverare le foglie della foresta.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
            Questo posto collasserebbe senza me.
                {
                - not are_two_entities_together(Backpack, PG): Uh, che sbadata! Ti servirà di sicuro qualcosa per raccogliere gli oggetti!
                    {
                        - forestContents has PG:
                            ~ move_entity(Backpack, Forest)
                        
                        - trainStopContents has PG:
                            ~ move_entity(Backpack, TrainStop)
                        
                        - pondContents has PG:
                            ~ move_entity(Backpack, Pond)                            
                    
                    }
                - else: Noto che hai già uno zainetto con te.
                }
            {safekeepingContents hasnt Backpack: Ecco, prendi!| Spero non sia qualcosa che hai trovato in giro: questo posto è delicato.}
                - (sbadata)
            A dopo!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry    
            
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

            {player_name}, ci siamo: sto per darti le ultime istruzioni per renderti {player_pronouns has him:un perfetto Riscrittore|{player_pronouns has her:una perfetta Riscrittora|unə perfettə Riscrittorə}}!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
            Più sei in confidenza con la persona più avrai inchiostro a disposizione per aiutarla a riscrivere la sua storia.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            Tra mentori definiamo le azioni che l'inchiostro permette di compiere <b><i>riscritture</b></i>.
            Un po' come quando riscriviamo un testo.
            Come dicevamo prima: più inchiostro significa più possibilità di aiutare quella persona a vedersi in un modo nuovo.
            A prescindere dalla quantità di inchiostro, ogni Riscrittorə ha in sé il dono dell'<b><i>epilogo</b></i>.
            L'<b><i>epilogo</b></i> è una dichiarazione finale dellə Riscrittorə che permette alla persona di mettere un punto sul presente, e iniziare a guardare al futuro in modo diverso.
            Così persona e Riscrittorə raggiungeranno il loro obiettivo: un nuovo nome, simbolo di un nuovo inizio.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
            Per cui: anche se non dovessi accumulare inchiostro, potrai comunque provare ad aiutare la persona, usando il tuo potere dell'epilogo.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            
                + [Hai un consiglio da darmi Mentore?]
                    -> color_variation_management(Mentor, greenC)->
                    Ascolta a cuore aperto.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    Segui i miei consigli.
                    E non chiedere all'altra persona di diventare qualcosa che non è.
                        
                        
                + [Ma non posso dirle: chiamati così e cosà, addio!?]
                    -> color_variation_management(Mentor, redC)->
                    Un nuovo nome è una nuova esperienza.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    E l'esperienza viene dal percorso.
                    Se non c'è percorso, non c'è cambiamento.
                        
                
                + [{charNameOne} non è una persona razionale. Può farcela?]
                    -> color_variation_management(Mentor, blueC)->
                    {player_name}, capisco la tua perplessità, ma con la giusta guida, ce la può fare.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    E assieme noi non possiamo di certo sbagliare!#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                        
                        
                + [Gli scoiattoli non hanno bisogno di riscriverla, invece?]
                    -> color_variation_management(Mentor, yellowC)->
                    {player_name}, apprezzo la tua creatività, ma mantieni l'attenzione sull'obiettivo.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    E gli scoiattoli non si fanno queste domande.
                    Gli scoiattoli <i>sono</i>, e basta.
                        
                        
                + [Non dovrei essere io a decidere il mio obiettivo?]
                    -> color_variation_management(Mentor, purpleC)->
                    Il tuo obiettivo <i>qui</i>, perdonami.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    Non avendo altri luoghi in cui andare, mi dimentico che possono esserci sono altre vite, altri obiettivi da raggiungere.
                        
                -
            Ricorda {player_name}: sei una guida, ma sta alla persona decidere alla fine chi è, e di cosa ha bisogno.
            Quando te la senti, affronta questo ultimo passaggio e poi torna da me.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            
            ~ mentor_pauseTalking = mentor_pauseDuration
            @animation:RewriterBook
                ~ mentor_tutorialPauses = true
                
                -> main
        
        



//Minitutorial sui minigame
=== about_greenhouse
    Sai {player_name}? La <b><i>serra</b></i> non è solo un bel posto dove rilassarsi.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    Tra i tanti modi per migliorare un rapporto con una persona, fare il dono giusto è forse il più immediato.
    {
        - firstChar_giftedObject != () or secondChar_giftedObject != ():
            E vedo che hai già imparato come fare! Sei sempre un passo avanti.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        
        - else:
            E ti consiglio di farlo, per facilitarti la vita.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
    }
    Il dono giusto dice alla persona: ti ascolto, ti capisco.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    So chi sei.
    Anche per questo esistono doni sbagliati.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
    O mediocri.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    La serra, con le sue piante magnifiche, è personalmente il posto migliore dove coltivare e recuperare doni.
    Gli effetti dei doni tra l'altro sono immediati e permanenti.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
    Ed è per questo che ogni Riscrittorə può darne solo uno a persona.
    Qualcosa di così forte non può certo essere usato senza coscienza. #speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
    @animation:RewriterBook
            ~ mentor_tutorialPauses = true
            ~ mentor_pauseTalking = mentor_pauseDuration
    -> main





=== about_kitchen
    Una cucina su una palude?#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    Non la mia prima scelta.
    Ti avevo suggerito di non andare nei luoghi malmessi, ma sembra che qualcunə abbia fatto il lavoro per te.
    Forse non è una così cattiva idea: cucinare assieme è un momento di intimità.
    E mangiare è uno spazio di bella condivisione.
    Passar del tempo in cucina con qualcunə può essere un bel modo per conoscervi meglio.
    E per capire che piega stia prendendo la vostra relazione.
    @animation:RewriterBook
        ~ mentor_tutorialPauses = true
        ~ mentor_pauseTalking = mentor_pauseDuration
    -> main







=== about_nest
    Quel posto, quella roba sulla spiaggia. #speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    Non mi piace.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
    Non mi piacciono i posti isolati.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
    Non mi piacciono i posti malmessi.
    E non mi piace quello che ti permette di fare. #speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
    Sto per tradire il mio ruolo di Mentore, ma non sarò io a dirti cosa farne.#speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
    @animation:RewriterBook
    ~ mentor_pauseTalking = mentor_pauseDuration
    ~ mentor_tutorialPauses = true
    -> main



//Altre informazioni importanti
=== about_not_mandatory_work
    Qui è dove mentore ci dice che i posti nuovi (elencati se aperti) possono essere comodi per avere occasioni per costruire relazioni, ma non sono per nulla obbligatori.

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
    Sembra che {charNameOne} ti abbia scritto una lettera, {player_name}! #speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
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
    Sembra che {charNameTwo} ti abbia scritto una lettera, {player_name}! #speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    Che cosa dolce, vero?
    {
        - entity_location(PG) == TrainStop:
            La trovi lì, sulla bacheca!
            
        - else:
            La trovi sulla bacheca della fermata del treno!
    }

-> main
   
   
