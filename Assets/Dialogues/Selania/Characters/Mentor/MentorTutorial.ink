/* ---------------------------------

       Storylets tutorial

 ----------------------------------*/
///RIORDINO TUTORIAL
=== tutorial_mentorTalkingChoiceRelationship
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        Oh, quanto ho sperato nel tuo arrivo!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Scusa, ma sono così felice che tu sia qui.
            {
                - that_little_liar_storylet:
                    Con tutto il trambusto causato da quel bambino non ho nemmeno fatto una buona figura.#speaker:{fifthChar_tag()}#inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_sad
            }
        Avrai un milione di domande, vero?#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        
            + (airChoice) Anche più di un milione, ma la prima è: dove mi trovo?
                -> glyph_modifier_variation_management(Mentor, aetherC, decreaseNo)->
                    {
                        - contentsTrainStop has PG:
                            Questa? È la fermata del treno.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                            Da qui arrivano le persone che hanno bisogno del nostro aiuto.
                        - contentsForest has PG:
                            Ora siamo nella foresta.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                            O meglio, la chiamo così perché.
                            Beh, ci sono tanti alberi.
                            Compreso quello lì tutto brutto e deperito.
                        - contentsPond has PG:
                            Questo è lo stagno.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                            Regno dei funghi, dell'umidità e delle zanzare.
                            E lì c'è la serra!
                    }
                Ma forse intendi dire cos'è questo luogo in generale, vero?#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Non ha un vero nome, ma il lo chiamo <b><i>Il giardino</b></i>.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                E faccio di tutto per renderlo un posto sicuro.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Un posto dove prenderti cura di te.
                Non male, no?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
            
            + (waterChoice) Che cosa tenera e gentile da dire! Perché sei felice che sono qui?
                    -> glyph_modifier_variation_management(Mentor, waterC, decreaseNo)->
                Sì!#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Non mi fraintendere: non so di preciso tu chi sia.#speaker:{fifthChar_tag()}#inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                Ma so <i>perché</i> sei qui.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                E il mio di <i>perché</i> è legato alla tua presenza.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Perché io sono la persona che tiene in piedi questo luogo, ma non solo.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                Io sono <b><i>{translator(mentor_ActualName)}</b></i>.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral 
                La tua {translator(mentor_ActualName)}.
                E ora che sei qui, ho uno scopo.

            + (aetherChoice) Siamo in un luogo misterico, vero?
                    -> glyph_modifier_variation_management(Mentor, airC, decreaseNo)->
                Io.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Uh, è una domanda inaspettata.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                Sicuramente c'è qualcosa di magico.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                Ma nulla viene tenuto nascosto.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Al contrario: hai in me una guida.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry

                    
            + (fireChoice) <i>Cerco un modo per tornare a casa.
                    -> glyph_modifier_variation_management(Mentor, fireC, decreaseNo)->
                Vuoi già andartene?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                Forse devo rivedere il mio benvenuto.
                Forse sono stata troppo formale?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_sorry
                O dovrei essere più autorevole?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                Ma non devo essere scortese ora.
                Mi hai fatto una domanda, e vedrò di rispondere.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    {
                        - contentsTrainStop has PG:
                            Lì ad est troverai una porta, e ti ritroverai nella tua camera da letto.
                            Basta che ti stenderai a dormire, e tornerai nel mondo da cui vieni.
                        
                        - else:
                            A est della stazione troverai una porta, e da lì, la tua camera da letto.
                            Stenditi a dormire, e ti troverai nel mondo da cui vieni.
                    }
                E se deciderai di tornare, troverai tutto nello stato in cui l'hai lasciato.
                Prima però lascia che ti rubi giusto un secondo!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                
            + (earthChoice) Non sai quanto mi mancava tutta questa natura!
                    -> glyph_modifier_variation_management(Mentor, earthC, decreaseNo)->
                È pace per il cuore, vero?#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                Ogni angolo di questo spazio mi rasserena, anche quando mi sento fuori fuoco.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Continua a stupirmi, giorno per giorno.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
            -
        Ma come ti devo chiamare?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        E quali pronomi usi?
        Puoi usare un nome qualsiasi e i pronomi che preferisci: prendi questa occasione come un nuovo inizio.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            -> name_choice.top ->
            -> gender.top ->
        Piacere di conoscerti, {player_name}.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        E {player_pronouns has him:benvenuto|{player_pronouns has her:benvenuta|benvenutə}}.
        Con me usa pure i pronomi femminili.
        {not waterChoice:Ah, che sbadata. Mi chiamo <b><i>{mentorName}</b></i>, e il mio obiettivo è farti stare bene.|Come Mentore, il mio unico obiettivo è farti stare bene.}#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            - (selfName)
        Tra poco ti spiegherò anche il tuo lavoro, {player_name}.
                {
                    - are_two_entities_together(FirstCharacter, PG):
                        Cioè, {player_pronouns has him:uno|{player_pronouns has her:una|unə}} deve ritrovarsi a lavorare anche in una allucinazione?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                        Allucinazione?{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                }
        Prima però una cosa importante: qui avrai a che fare con cose viventi piene di storie.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        E ogni storia ha le sue complessità.
        Per questo potresti incontrare tematiche per te faticose.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
        Ci saranno occasioni in cui potrai evitarle e non ti perderai nulla di questa esperienza.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Ma quando si tratta delle persone, accogliere le loro ferite farà parte del tuo lavoro.
        Sono sicura che parleranno di cose delicate nel modo migliore, ma ricorda: fermarsi o rinunciare non è un fallimento.
        Se senti il bisogno di staccare puoi tornare in camera, il posto da cui sei {player_pronouns has him:arrivato|{player_pronouns has her:arrivata|arrivatə}} e stenderti sul letto.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Al risveglio, troverai tutto come l'hai lasciato.
        E se non vorrai più tornare, ci saranno sicuramente altre persone pronte ad aiutare chi viene qui in cerca di risposte.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        E a proposito di risposte.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        La maggior parte delle cose che dirai in questo luogo influenzeranno il rapporto che hai con le persone che incontri.
        Ogni frase in fondo rappresenta un modo di vedere il mondo. E non tutte le visioni vanno d'accordo.
        {
            - fireChoice:
                Quando prima hai cercato di andartene, ad esempio, mi sono sentita ferita.#speaker:{fifthChar_tag()}#inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                Poi fortunatamente la mia preparazione mi ha aiutato a sopprimere quel sentimento.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                Un'altra persona magari si sarebbe offesa.#speaker:{fifthChar_tag()}#inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                O avrebbe apprezzato la tua propensione per l'azione.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral

            - aetherChoice:
                Quando prima mi hai chiesto se questo sia un luogo misterico, hai mostrato con tranquillità un interesse verso l'occulto e le cose spirituali.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Ed è una cosa che mi risuona molto.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                Altre persone potrebbero giudicarti poco razionale, scollegat{player_pronouns has him:o|{player_pronouns has her:a|ə}} dalla realtà.#speaker:{fifthChar_tag()}#inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                Oppure potrebbero ritrovare in te un{player_pronouns has him:o|{player_pronouns has her:a|ə}} compagn{player_pronouns has him:o|{player_pronouns has her:a|ə}} con cui confidare le esperienze più insolite.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral

            - earthChoice:
                Quando prima hai detto che ti mancava tutta questa natura, ho scoperto di aver già un punto di contatto con te.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                Non tutte le persone potrebbero trovarsi d'accordo: c'è chi ama gli spazi urbani e chi ha paura dell'imprevedibilità di un bosco.#speaker:{fifthChar_tag()}#inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                Oppure potresti trovare qualcunə che non aspettava altro che di parlarti di tutti i suoi animali preferiti.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral

            - airChoice:
                La prima cosa che mi hai chiesto è stata dove siamo.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                E l'hai chiesto con una curiosità che ho apprezzato molto: le domande sono strade aperte verso il sapere.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                Ma potresti trovare qualcunə che invece preferisce un approccio più emotivo, o spirituale, e potrebbe mettersi sulla difensiva.#speaker:{fifthChar_tag()}#inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                Oppure unə compagnə di studi, scambi ed analisi.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral

            - waterChoice:
                La prima cosa che mi hai detto è stata parlare di dolcezza e tenerezza.
                L'emotività attrae molte persone, perché in tant3 abbiamo bisogno di parlare di ciò che proviamo, di condividere gli aspetti profondi del nostro cuore.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                Ma allontana altrettante persone, vuoi perché quello non è il loro linguaggio, vuoi perché non se la sentono di parlarne con chi non conoscono.#speaker:{fifthChar_tag()}#inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_sad

        }
        Le cose non sono poi così lineari, perché giustamente il modo in cui ognunə di noi vede il mondo è molto molto molto complesso.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        La cosa bella però è che le persone tendono sempre a reagire a ciò che diciamo.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        E capire le loro reazioni è la prima parte del tuo lavoro.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Prima di riempirti di troppe informazioni, ti invito per un po' <>
        {
            - first_char_main_storylets:
                a continuare a parlare con le persone che incontrerai qui in giro, <>
            - else:
                a parlare con le persone che incontrerai qui in giro, <>
        }
        e a capire meglio come ragionano.
        Capire come ragionano ti aiuterà a conquistare la loro fiducia.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Che è la parte davvero fondamentale per compiere il tuo lavoro.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Ma prima di salutarti, due cose che potrebbero aiutarti.
        Questo è un Grimorio: ti aiuterà nel raccogliere tutte le informazioni che incontrerai man mano.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
            {
                - contentsForest has PG:
                    ~ move_entity(Grimoire, Forest)
                - contentsTrainStop has PG:
                    ~ move_entity(Grimoire, TrainStop)
                - contentsPond has PG:
                    ~ move_entity(Grimoire, Pond)        
            }
        Consultalo ogni volta che sei in difficoltà.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral    
        E poi ti ho aperto la serra, la trovi nei pressi dello stagno.
                -> opening_places ->
        La serra è un bel posto dove rilassarsi, e non solo.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Ma evita assolutamente tutti gli altri posti bloccati, perché sono pericolosi!#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_bored
        Più tardi ti spiegherò perché sei qui.
        Io devo raccogliere le foglie dalla foresta.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry

            -> mentor_closing_storylet ->
            -> main


=== tutorial_mentorInkAndYouAreARewriter
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        Ho visto che ci hai preso gusto a chiacchierare, e la cosa mi fa solo che piacere.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Direi quindi che è giunto il momento di spiegarti il tuo lavoro.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Questo non è solo un posto magnifico di per sé, {player_name}.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        È un luogo con uno scopo, uno scopo che riguarda anche te.
        Soprattutto te.
        Le persone che incontri qui rimaste bloccate in qualcosa: rimpianti, rimorsi, traumi e tutto lo scibile dell'esperienza umana.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
        E il tuo scopo, {player_name}, è aiutarle a riscrivere il modo in cui raccontano la loro storia, così che possano sbloccarsi.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Perché tu {player_pronouns has him:amico mio|{player_pronouns has her:amica mia|amicə miə}} sei <b><i>{player_pronouns has him:un riscrittore|{player_pronouns has her:una riscrittora|unə riscrittorə}}</b></i>!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        E se farai bene il tuo lavoro, aiuterai moltissime persone a sbloccarsi, e a scegliere un nuovo nome, il segno di un nuovo inizio.
            {
                - are_two_entities_together(FirstCharacter, PG):
                    Tipo, un nome diverso da {charNameOne}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
                    Esattamente, {charNameOne}!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry   
            }
        Quello {player_pronouns has him:del riscrittore|{player_pronouns has her:della riscrittora|dellə riscrittorə}} è un lavoro con pochi strumenti, ma che richiede molta empatia.
        Come ti dicevo all'inizio, il primo è l'ascolto.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Accogli le loro storie, capisci quale sia la cosa giusta da dire per farle sentire comprese.
        Conquista la loro fiducia.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Così otterrai il secondo strumento: l'<b><i>inchiostro</b></i>.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        L'inchiostro è il premio di una buona relazione.
        Ogni goccia di inchiostro raccoglie l'essenza della persona che l'ha creato, ed è uno strumento potentissimo per la <b>riscrittura</b>, l'ultimo atto del tuo lavoro.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Ma tratteremo meglio la riscrittura più avanti.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral

            + Non potrebbe servire a tutt3 un nuovo nome, un nuovo inizio?
                    -> glyph_modifier_variation_management(Mentor, aetherC, decreaseNo)->
                Immagino possa servire a molt3.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                A me no, ad esempio.
                Questo è stato, è e sarà sempre il mio nome.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Ma alla fine il nome è solo un simbolo, non è l'obiettivo in sé.       
                    
            + Con l'inchiostro ci posso disegnare?
                    -> glyph_modifier_variation_management(Mentor, earthC, decreaseNo)->
                Apprezzo la tua creatività, {player_name}.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Ma tu sei {player_pronouns has him:un riscrittore|{player_pronouns has her:una riscrittora|unə riscrittorə}}, non {player_pronouns has him:un disegnatore|{player_pronouns has her:una disegnatrice|unə disegnatricə}}.
                    
            + Solo le persone care ci fanno vedere noi stess3 in modo diverso.
                    -> glyph_modifier_variation_management(Mentor, waterC, decreaseNo)->
                A volte è più facile aprirsi a chi non si conosce.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                E mentre noi riflettiamo sulle loro difficoltà, impariamo anche qualcosa su di noi.
                        
            + Non avrebbe più senso chiamarla "rilettura" invece di "riscrittura"?
                    -> glyph_modifier_variation_management(Mentor, airC, decreaseNo)->
                Ci ho pensato molte volte anche io, sai?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                La risposta che mi sono data è che "riscrivere" dà un senso di azione, di cambiamento, che "rileggere" non ha.
                E nel momento in cui una persona si sente bloccata, la cosa di cui ha più bisogno è di sentire la possibilità di poter di nuovo agire sul mondo, su di sé.
                Ogni tanto questa discrepanza mi urta.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                Ma alla fine deve funzionare per le persone che aiutiamo, non per noi.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
  
            + Un nome è soltanto un nome. A cosa serve cambiarlo?
                    -> glyph_modifier_variation_management(Mentor, fireC, decreaseNo)->
                Un nome è come una magia che carichiamo di volta in volta di significato..#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                A volte quella magia non va più bene, e dobbiamo cercare una nuova formula. 
                Un nuovo nome.
            -
        Un modo per dimostrare a una persona che l'hai compresa, è farle un <b>dono</b>, ed è per questo che ti ho sbloccato la serra.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Il dono giusto è un modo per dire "Ehi, ti vedo, ti capisco".#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Migliorare il rapporto.
        E ottenere più inchiostro.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Continua a lavorare sulle relazioni che stai costruendo, e tra un po' ti spiego cos'è la riscrittura.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Ora devo assolutamente spolverare le foglie della foresta.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Questo posto collasserebbe senza me.
        A dopo!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry    

            {
                - entity_location(Mentor) != Forest:
                    ~ move_entity(Mentor, Forest)
            }    

            -> mentor_closing_storylet ->
            -> main
             

=== tutorial_mentorInkAndRewriting
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        {player_name}!#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Credo sia giunto il momento di spiegarti le ultime cose importanti per il tuo lavoro di {player_pronouns has him:riscrittore|{player_pronouns has her:riscrittora|riscrittorə}}.
                {
                    - are_two_entities_together(SecondCharacter, PG):
                        Uffi. Sembra di stare a scuola.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    
                }
        Quando avrai parlato a sufficienza con una persona, sentirai di poterle proporre di rileggere assieme la sua storia.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Se glielo proporrai la persona sarà finalmente capace di condividere con te come si legge, cosa la blocca qui.
        E a quel punto tu potrai proporre una riscrittura.
        O meglio: <b><i>delle riscritture</b></i>.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Hai presente l'inchiostro di cui parlavamo prima? #speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Ogni goccia di inchiostro è una possibilità in più di proporre una riscrittura di un aspetto della vita della persona.
        E quindi la logica diventa: più fiducia uguale più inchiostro uguale più riscritture uguale maggiori occasioni di successo!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Ma se anche non dovessi avere una sola goccia di inchiostro, non disperare, perché ogni riscrittorə ha in sé un terzo strumento: lo strumento dell'<b><i>epilogo</b></i>.
        L'<b><i>epilogo</b></i> è una dichiarazione finale dellə riscrittorə, con l'obiettivo di far mettere alla persona un punto sul suo presente e iniziare a guardare al futuro in modo diverso.
        Così persona e riscrittorə raggiungeranno il loro obiettivo: un nuovo nome, simbolo di un nuovo inizio.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry

    
                + Questa cosa di dare un nuovo nome mi spaventa, è invasiva come roba, no?
                        -> glyph_modifier_variation_management(Mentor, waterC, decreaseNo)->
                    No, {player_name}, non sei tu a decidere che nome la persona sceglierà.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    Né che percorso farà.
                    Tu aiuti queste persone a rileggere il proprio passato, il loro presente.
                    A poi starà a loro, e solo a loro, decidere verso quale futuro andare.

                + Ma non posso dire "Ehi tu chiamati così e cosà" e bona?
                        -> glyph_modifier_variation_management(Mentor, fireC, decreaseNo)->
                    Un nuovo nome è una nuova esperienza.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    E l'esperienza viene dal percorso.
                    Se non c'è percorso, non c'è cambiamento.
                    E poi sta alla persona decidere il suo nome.
                        
                +  \ {charNameOne} non è una persona razionale. Può farcela?
                        -> glyph_modifier_variation_management(Mentor, airC, decreaseNo)->
                    {player_name}, capisco la tua perplessità, ma con la giusta guida, ogni strada è percorribile.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    E noi due assieme non possiamo di certo sbagliare!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                        {
                            - are_two_entities_together(FirstCharacter, PG):
                                E {charNameOne} è razionale.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                                A modo suo.     
                        }
                        
                + Mi son pers{player_pronouns has him:o|{player_pronouns has her:a|ə}} alla terza frase. Succede sempre.
                        -> glyph_modifier_variation_management(Mentor, earthC, decreaseNo)->
                    Capita anche a me.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                    Forse dovrei scrivere queste cose da qualche parte.
                    E poi ricorda che hai sempre il Grimorio con te!
                        
                + Preferisco darmi i miei obiettivi da sol{player_pronouns has him:o|{player_pronouns has her:a|ə}}.
                        -> glyph_modifier_variation_management(Mentor, aetherC, decreaseNo)->
                    Il tuo obiettivo <i>qui</i>, perdonami.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    Non avendo altri luoghi in cui andare, mi dimentico che possono esserci sono altre vite, altri obiettivi da raggiungere. 
                -

        Ricorda {player_name}: sei una guida, ma sta alla persona decidere alla fine chi è, e di cosa ha bisogno.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Anche per questo non c'è un buon esito o un cattivo esito di una riscrittura.
        Quando te la senti, affronta questo ultimo passaggio e poi torna da me.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        

                -> mentor_closing_storylet ->
                -> main


//Minitutorial sui minigames
=== about_greenhouse

    Sai {player_name}? La <b><i>serra</b></i> non è solo un bel posto dove rilassarsi.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    Tra i tanti modi per migliorare un rapporto con una persona, fare il dono giusto è forse il più immediato.
            {
                - firstChar_giftedObject != () or secondChar_giftedObject != ():
                    E vedo che hai già imparato come fare! Sei sempre un passo avanti.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                
                - else:
                    E ti consiglio di farlo, per facilitarti la vita.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
            }
    Il dono giusto mostra comprensione, è la dimostrazione di aver ascoltato l'altra persona.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    So chi sei.
            {
                - are_two_entities_together(SecondCharacter, PG):
                    Io so di essere una persona che vuole le caramelle.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    
            } 

    Anche per questo esistono doni sbagliati.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
    O mediocri.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            {
                - are_two_entities_together(FirstCharacter, PG):
                    Come sa chiunque riceva regali di Natale dai parenti.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed 
                    
            } 
    La serra, con le sue piante magnifiche, è personalmente il posto migliore dove coltivare e recuperare doni.
    Gli effetti dei doni tra l'altro sono immediati e permanenti.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
    Ed è per questo che ogni riscrittorə può darne solo uno a persona.
    Qualcosa di così forte non può certo essere usato senza coscienza. #speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry


        -> mentor_closing_storylet ->
        -> main


=== about_kitchen
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    Una cucina su una palude?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    Non la mia prima scelta.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_bored
    Non mi fa impazzire che tu vada in luoghi così malmessi.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
    Ma forse non è una così cattiva idea: cucinare assieme è un momento di intimità.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    E mangiare è uno spazio di bella condivisione.
            {
                - are_two_entities_together(FirstCharacter, PG):
                        Ci facciamo una pastasciutta assieme, {mentorName}?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                        Magari più tardi?
                        Ho da sverniciare la panchina.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    
            } 
    Passare del tempo in cucina con qualcunə può essere un bel modo per conoscervi meglio.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
    E per capire che piega stia prendendo la vostra relazione.
            {
                - are_two_entities_together(SecondCharacter, PG): 
                    O per bruciare cose strane e vedere cosa succede!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
                    
            }
    
        -> mentor_closing_storylet ->
        -> main


=== about_nest
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    Ho visto che {charNameThree} ha trovato il modo di sbloccarti l'accesso al Nido.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    Non posso certo dire che le persone qui non si diano da fare, ed è una bella cosa.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
    Ho dei sentimenti contrastanti verso quello che si può fare su quella spiaggia.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    Da una parte i Sigilli mi danno l'impressione di essere una forma di controllo.#speaker:{fifthChar_tag()}#inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_sad
    Ma la cosa che penso ogni volta che li vedo è che rendano la comunicazione più chiara.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    È così difficile far capire alle altre persone quello che si prova e si pensa, e sarebbe bello avere uno strumento, un codice, qualcosa che ti faccia sapere sin da subito che verrai capita.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
    Immagino che sarà il modo in cui ne farai uso a definirne il valore.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    Un giorno mi piacerebbe impararne qualcuno.

            -> mentor_closing_storylet ->
            -> main


//Altre informazioni importanti
=== about_not_mandatory_work
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    Stavo pensando a una cosa, {player_name}.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        {
            - open_the_kitchen:
                Sono felice che {charNameOne} abbia sistemato la vecchia cucina.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        }
        {
            - open_the_library:
                {
                    - open_the_kitchen:
                        E mi <>
                    
                    - else:
                        Mi <>
                }
                fa piacere che {charNameTwo} abbia aperto la strada per la biblioteca.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                
        }   
    Ogni spazio aggiuntivo, inclusa la serra, è un'occasione in più per conoscere meglio le persone che stai aiutando.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    E alcuni di questi possono anche offrirti qualche strumento che, sinceramente, nemmeno avevo calcolato.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
    Ma ricorda che non sono passaggi obbligatori.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
    Fai sempre e solo quello di cui senti il bisogno.

        -> mentor_closing_storylet ->
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
                L'ha con sé quella cagnolina!
                
            - else:
                La trovi alla fermata del treno.
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
                L'ha con sé quella cagnolina!
                
            - else:
                La trovi alla fermata del treno.
        }

        -> main
   
   
