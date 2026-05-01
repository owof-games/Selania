/* ---------------------------------

       Storylets tutorial

 ----------------------------------*/
///RIORDINO TUTORIAL
=== tutorial_mentorTalkingChoiceRelationship
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(FifthCharacter, "hurry")}:                 Oh, quanto ho sperato nel tuo arrivo!
                                                    Scusa, ma sono così felice che tu sia qui.
        {
            - that_little_liar_storylet:
                {charTag(FifthCharacter, "sad")}:           Con tutto il trambusto causato da quel bambino non ho nemmeno fatto una buona figura.
        }
    {charTag(FifthCharacter, "hurry")}:                     Avrai un milione di domande, vero?
        
        + (airChoice) \ {charTag(PG, "neutral")}: Anche più di un milione, ma la prima è: dove mi trovo?
            -> glyph_modifier_variation_management(Mentor, airC) ->

            {
                - contentsTrainStop has PG:
                    {charTag(FifthCharacter, "neutral")}:   Questa? È la fermata del treno.
                                                            Da qui arrivano le persone che hanno bisogno del nostro aiuto.
                - contentsForest has PG:
                    {charTag(FifthCharacter, "neutral")}:   Ora siamo nella foresta.
                                                            O meglio, la chiamo così perché.
                                                            Beh, ci sono tanti alberi.

                - contentsPond has PG:
                    {charTag(FifthCharacter, "neutral")}:   Questo è lo stagno.
                                                            Regno di ninfee, libellule e calura.
            }
            {charTag(FifthCharacter, "neutral")}:           Ma forse intendi dire cos'è questo luogo in generale, vero?
            {charTag(FifthCharacter, "hurry")}:             Non ha un vero nome, ma il lo chiamo <b><i>Il giardino</b></i>.
            {charTag(FifthCharacter, "neutral")}:           E faccio di tutto per renderlo un posto sicuro.
                                                            Un posto dove prenderti cura di te.
            {charTag(FifthCharacter, "hurry")}:             Non male, no?
        
        + (waterChoice) \ {charTag(PG, "neutral")}: Che cosa tenera e gentile da dire! Perché sei felice che sono qui?
            -> glyph_modifier_variation_management(Mentor, waterC) ->

            {charTag(FifthCharacter, "neutral")}:           Perché io sono <b><i>{charNameFive}</b></i>.
                                                            La tua {charNameFive}.
                                                            E ora che sei qui, ho uno scopo.


        + (aetherChoice) \ {charTag(PG, "neutral")}: Siamo in un luogo misterico, vero?
            -> glyph_modifier_variation_management(Mentor, aetherC) ->

            {charTag(FifthCharacter, "neutral")}:           Io.
            {charTag(FifthCharacter, "sorry")}:             Uh, è una domanda inaspettata.
            {charTag(FifthCharacter, "hurry")}:             Sicuramente c'è qualcosa di magico.
            {charTag(FifthCharacter, "neutral")}:           Ma nulla viene tenuto nascosto.
            {charTag(FifthCharacter, "hurry")}:             Al contrario: hai in me una guida.

                
        + (fireChoice) \ {charTag(PG, "neutral")}: <i>Cerco un modo per tornare a casa.</i>
            -> glyph_modifier_variation_management(Mentor, fireC) ->

            {charTag(FifthCharacter, "sad")}:               Vuoi già andartene?
                                                    Forse devo rivedere il mio benvenuto.
            {charTag(FifthCharacter, "sorry")}:             Forse sono stata troppo formale?
            {charTag(FifthCharacter, "hurry")}:             O dovrei essere più autorevole?
                                                    Ma non devo essere scortese ora.
            {charTag(FifthCharacter, "neutral")}:           Mi hai fatto una domanda, e vedrò di rispondere.
            {
                - contentsTrainStop has PG:
                                                    Lì ad est troverai una porta, e ti ritroverai nella tua camera da letto.
                                                    Basta che ti stenderai a dormire, e tornerai nel mondo da cui vieni.
                - else:
                                                    A est della stazione troverai una porta, e da lì, la tua camera da letto.
                                                    Stenditi a dormire, e ti troverai nel mondo da cui vieni.
            }
                                                    E se deciderai di tornare, troverai tutto nello stato in cui l'hai lasciato.
            {charTag(FifthCharacter, "hurry")}:             Prima però lascia che ti rubi giusto un secondo!
            
        + (earthChoice) \ {charTag(PG, "neutral")}: Non sai quanto mi mancava tutta questa natura!
            -> glyph_modifier_variation_management(Mentor, earthC) ->

            {charTag(FifthCharacter, "hurry")}:             È pace per il cuore, vero?
            {charTag(FifthCharacter, "neutral")}:           Ogni angolo di questo spazio mi rasserena, anche quando mi sento fuori fuoco.
            {charTag(FifthCharacter, "hurry")}:             Continua a stupirmi, giorno per giorno.
        
        -

        {charTag(FifthCharacter, "hurry")}:             Ma come ti devo chiamare?
                                                        E quali pronomi usi?
        {charTag(FifthCharacter, "neutral")}:           Puoi usare un nome qualsiasi e i pronomi che preferisci: prendi questa occasione come un nuovo inizio.
            -> name_choice.top2 ->
            -> gender.top ->
        {charTag(FifthCharacter, "hurry")}:             Piacere di conoscerti, {player_name}.
                                                E {player_pronouns has him:benvenuto|{player_pronouns has her:benvenuta|benvenutə}}.
                                                Con me usa pure i pronomi femminili.
        {
            - not waterChoice:
        {charTag(FifthCharacter, "neutral")}:           Ah, che sbadata. Mi chiamo <b><i>{charNameFive}</b></i>, e il mio obiettivo è farti stare bene.
            - else:
        {charTag(FifthCharacter, "neutral")}:           Come mentore, il mio unico obiettivo è farti stare bene.
        }
        - (selfName)
                                                Tra poco ti spiegherò anche il tuo lavoro, {player_name}.
        {
            - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "annoyed")}:   Cioè, {player_pronouns has him:uno|{player_pronouns has her:una|unə}} deve ritrovarsi a lavorare anche in una allucinazione?
                {charTag(FifthCharacter, "neutral")}:   Allucinazione?
        }
        {charTag(FifthCharacter, "neutral")}:           Prima però una cosa importante: qui avrai a che fare con cose viventi piene di storie.
                                                E ogni storia ha le sue complessità.
        {charTag(FifthCharacter, "sorry")}:             Per questo potresti incontrare tematiche per te faticose.
        {charTag(FifthCharacter, "neutral")}:           Ci saranno occasioni in cui potrai evitarle e non ti perderai nulla di questa esperienza.
                                                Ma quando si tratta delle persone, accogliere le loro ferite farà parte del tuo lavoro.
                                                Sono sicura che parleranno di cose delicate nel modo migliore, ma ricorda: fermarsi o rinunciare non è un fallimento.
                                                Se senti il bisogno di staccare puoi tornare in camera, il posto da cui sei {player_pronouns has him:arrivato|{player_pronouns has her:arrivata|arrivatə}} e stenderti sul letto.
                                                Al risveglio, troverai tutto come l'hai lasciato.
        {charTag(FifthCharacter, "hurry")}:             E se non vorrai più tornare, ci saranno sicuramente altre persone pronte ad aiutare chi viene qui in cerca di risposte.

     
        + \ {charTag(PG, "neutral")}:           <i>Annuisco: non c'è altro da aggiungere.</i>
            -> glyph_modifier_variation_management(Mentor, aetherC) ->

            {charTag(FifthCharacter, "sad")}:           Mi sento una gran chiacchierona, davanti al tuo silenzio.
            {charTag(FifthCharacter, "neutral")}:       Ma ci sta: alla fine sono io quella che deve spiegare le cose, vero?
        
        +  \ {charTag(PG, "neutral")}:          Faccio sempre a fatica a distanziarmi dal dolore delle altre persone.
            -> glyph_modifier_variation_management(Mentor, waterC) ->
            
            {charTag(FifthCharacter, "sad")}:           Ti capisco, {player_name}.
            {charTag(FifthCharacter, "neutral")}:       Proprio per questo è importante prendersi i propri tempi.

            
        + \ {charTag(PG, "neutral")}:            Ci si può fare forza nelle reciproche sofferenze.
            -> glyph_modifier_variation_management(Mentor, earthC) ->

            {charTag(FifthCharacter, "hurry")}:          Mi piace questo approccio!
            {charTag(FifthCharacter, "neutral")}:        La cosa bella del lavoro che farai qui, è che puoi anche imparare molto su di te.
            {charTag(FifthCharacter, "sad")}:            Sono poche le occasioni a questo mondo in cui questa cosa è vera.


        + \ {charTag(PG, "neutral")}:           Quindi: se la situazione è pesante, mi faccio una pausa.
            -> glyph_modifier_variation_management(Mentor, airC) ->

            {charTag(FifthCharacter, "neutral")}:       Sintetic{player_pronouns has him:o|{player_pronouns has her:a|ə}} e puntuale.
                                                Ma è esattamente quello il punto.
                                                Non strafare, e prenditi cura di te.

            
        + \ {charTag(PG, "neutral")}:           Sono una persona pratica, so affrontare tutto!
            -> glyph_modifier_variation_management(Mentor, fireC) ->

            {charTag(FifthCharacter, "sad")}:           Però non è un discorso di praticità o meno, amic{player_pronouns has him:o|{player_pronouns has her:a|ə}} mi{player_pronouns has him:o|{player_pronouns has her:a|ə}}.
            {charTag(FifthCharacter, "neutral")}:       Anche la persona più pratica al mondo ha i suoi limiti.
                                                E quando li raggiunge, deve saper riposare.
            {charTag(FifthCharacter, "hurry")}:         Cosa non vera se hai il carico di tutto un luogo sulle tue spalle.

        -

            {charTag(FifthCharacter, "hurry")}:         Comunque questo luogo è comunque pieno di spazi di ristoro e cura, anche per te.
                                                E se avrai bisogno del mio aiuto, ti basterà cercarmi.
            {charTag(FifthCharacter, "neutral")}:       Ho sempre qualche dritta su come affrontare i momenti più difficili.
            {charTag(FifthCharacter, "hurry")}:         E risposte alla maggior parte delle tue domande.
            {charTag(FifthCharacter, "neutral")}:       Ma a proposito di risposte.
                                                La maggior parte delle cose che dirai in questo luogo influenzeranno il rapporto che hai con le persone che incontri.
                                                Ogni frase in fondo rappresenta un modo di vedere il mondo.
                                                E non tutte le visioni vanno d'accordo.

        {
            - fireChoice:
                {charTag(FifthCharacter, "sad")}:       Quando prima hai cercato di andartene, ad esempio, mi sono sentita ferita.
                {charTag(FifthCharacter, "hurry")}:     Poi fortunatamente la mia preparazione mi ha aiutato a sopprimere quel sentimento.
                {charTag(FifthCharacter, "sad")}:       Un'altra persona magari si sarebbe offesa.
                {charTag(FifthCharacter, "neutral")}:   O avrebbe apprezzato la tua propensione per l'azione.

            - aetherChoice:
                {charTag(FifthCharacter, "neutral")}:   Quando prima mi hai chiesto se questo sia un luogo misterico, hai mostrato con tranquillità un interesse verso l'occulto e le cose spirituali.
                {charTag(FifthCharacter, "hurry")}:     Ed è una cosa che mi risuona molto.
                {charTag(FifthCharacter, "sad")}:       Altre persone potrebbero giudicarti poco razionale, scollegat{player_pronouns has him:o|{player_pronouns has her:a|ə}} dalla realtà.
                {charTag(FifthCharacter, "neutral")}:   Oppure potrebbero ritrovare in te un{player_pronouns has him:o|{player_pronouns has her:a|ə}} compagn{player_pronouns has him:o|{player_pronouns has her:a|ə}} con cui confidare le esperienze più insolite.

            - earthChoice:
                {charTag(FifthCharacter, "hurry")}:     Quando prima hai detto che ti mancava tutta questa natura, ho scoperto di aver già un punto di contatto con te.
                {charTag(FifthCharacter, "sad")}:       Non tutte le persone potrebbero trovarsi d'accordo: c'è chi ama gli spazi urbani e chi ha paura dell'imprevedibilità di un bosco.
                {charTag(FifthCharacter, "neutral")}:   Oppure potresti trovare qualcunə che non aspettava altro che di parlarti di tutti i suoi animali preferiti.

            - airChoice:
                {charTag(FifthCharacter, "neutral")}:   La prima cosa che mi hai chiesto è stata dove siamo.
                {charTag(FifthCharacter, "hurry")}:     E l'hai chiesto con una curiosità che ho apprezzato molto: le domande sono strade aperte verso il sapere.
                {charTag(FifthCharacter, "sad")}:       Ma potresti trovare qualcunə che invece preferisce un approccio più emotivo, o spirituale, e potrebbe mettersi sulla difensiva.
                {charTag(FifthCharacter, "neutral")}:   Oppure unə compagnə di studi, scambi ed analisi.

            - waterChoice:
                {charTag(FifthCharacter, "neutral")}:   La prima cosa che mi hai detto è stata parlare di dolcezza e tenerezza.
                {charTag(FifthCharacter, "hurry")}:     L'emotività attrae molte persone, perché in tant3 abbiamo bisogno di parlare di ciò che proviamo, di condividere gli aspetti profondi del nostro cuore.
                {charTag(FifthCharacter, "sad")}:       Ma allontana altrettante persone, vuoi perché quello non è il loro linguaggio, vuoi perché non se la sentono di parlarne con chi non conoscono.
        }

        {charTag(FifthCharacter, "neutral")}:           Le cose non sono poi così lineari, perché giustamente il modo in cui ognunə di noi vede il mondo è molto molto molto complesso.
        {charTag(FifthCharacter, "hurry")}:             La cosa bella però è che le persone tendono sempre a reagire a ciò che diciamo.
        {charTag(FifthCharacter, "neutral")}:           E capire le loro reazioni è la prima parte del tuo lavoro.
                                                Prima di riempirti di troppe informazioni, ti invito per un po' <>
        {
            - first_char_main_storylets:
                                                a continuare a parlare con le persone che incontrerai qui in giro, <>
            - else:
                                                a parlare con le persone che incontrerai qui in giro, <>
        }
                                                e a capire meglio come ragionano.
        {charTag(FifthCharacter, "hurry")}:             Capire come ragionano ti aiuterà a conquistare la loro fiducia.
        {charTag(FifthCharacter, "neutral")}:           Che è la parte davvero fondamentale per compiere il tuo lavoro.
                                                Ma prima di salutarti, due cose che potrebbero aiutarti.
        {charTag(FifthCharacter, "hurry")}:             Questo è un Grimorio: ti aiuterà nel raccogliere tutte le informazioni che incontrerai man mano.
        {
            - contentsForest has PG:
                ~ move_entity(Grimoire, Forest)
            - contentsTrainStop has PG:
                ~ move_entity(Grimoire, TrainStop)
            - contentsPond has PG:
                ~ move_entity(Grimoire, Pond)        
        }
        {charTag(FifthCharacter, "neutral")}:           Consultalo ogni volta che sei in difficoltà.
                                                E poi ti ho aperto la serra, <>
                                        {
                                            - contentsPond has PG:
                                                è quell'edificio lì a destra.
                                            - else:
                                                la trovi nei pressi dello stagno.
                                        }
                                                
            ~ opening_places()
        {charTag(FifthCharacter, "hurry")}:     La serra è un bel posto dove rilassarsi, e non solo.
        {charTag(FifthCharacter, "bored")}:     Ma evita assolutamente tutti gli altri posti bloccati, perché sono pericolosi!
                                        Più tardi ti spiegherò perché sei qui.
        {charTag(FifthCharacter, "hurry")}:     Io devo raccogliere le foglie dalla foresta.

            -> mentor_closing_storylet ->
            -> main


=== tutorial_mentorInkAndYouAreARewriter
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(FifthCharacter, "hurry")}:         Ho visto che ci hai preso gusto a chiacchierare, e la cosa mi fa solo che piacere.
        {charTag(FifthCharacter, "neutral")}:       Direi quindi che è giunto il momento di spiegarti il tuo lavoro.
                                            Questo non è solo un posto magnifico di per sé, {player_name}.
                                            È un luogo con uno scopo, uno scopo che riguarda anche te.
        {charTag(FifthCharacter, "hurry")}:         Soprattutto te.
        {charTag(FifthCharacter, "neutral")}:       Le persone che incontri qui rimaste bloccate in qualcosa: rimpianti, rimorsi, vecchie ferite e quant'altro.
                                            E il tuo scopo, {player_name}, è aiutarle a riscrivere il modo in cui raccontano la loro storia, così che possano sbloccarsi.
        {charTag(FifthCharacter, "hurry")}:         Perché tu {player_pronouns has him:amico mio|{player_pronouns has her:amica mia|amicə miə}} sei <b><i>{player_pronouns has him:un riscrittore|{player_pronouns has her:una riscrittora|unə riscrittorə}}</b></i>!
        {charTag(FifthCharacter, "neutral")}:       E se farai bene il tuo lavoro, aiuterai moltissime persone a sbloccarsi, e a scegliere un nuovo nome, il segno di un nuovo inizio.
            {
                - are_two_entities_together(FirstCharacter, PG):
                    {charTag(FirstCharacter, "annoyed")}:       Tipo, un nome diverso da {charNameOne}.
                    {charTag(FifthCharacter, "hurry")}:                 Esattamente, {charNameOne}!   
            }
        {charTag(FifthCharacter, "neutral")}:       Quello {player_pronouns has him:del riscrittore|{player_pronouns has her:della riscrittora|dellə riscrittorə}} è un lavoro con pochi strumenti.
                                            Come ti dicevo all'inizio, il primo è l'ascolto.
                                            Accogli le loro storie, capisci quale sia la cosa giusta da dire per farle sentire comprese.
        {charTag(FifthCharacter, "hurry")}:         Conquista la loro fiducia.
        {charTag(FifthCharacter, "neutral")}:       Così otterrai il secondo strumento: l'<b><i>inchiostro</b></i>.
                                            L'inchiostro è il premio di una buona relazione.
                                            Ogni goccia di inchiostro raccoglie l'essenza della persona che l'ha creato, ed è uno strumento potentissimo per la <b>riscrittura</b>, l'ultimo atto del tuo lavoro.
                                            Ma tratteremo meglio la riscrittura più avanti.

            + \ {charTag(PG, "neutral")}:           Non potrebbe servire a tutt3 un nuovo nome, un nuovo inizio?
                    -> glyph_modifier_variation_management(Mentor, aetherC)->

                {charTag(FifthCharacter, "sad")}:           Immagino possa servire a molt3.
                {charTag(FifthCharacter, "neutral")}:       A me no, ad esempio.
                                                    Questo è stato, è e sarà sempre il mio nome.
                                                    Ma alla fine il nome è solo un simbolo, non è l'obiettivo in sé.       
                    
            + \ {charTag(PG, "neutral")}:           La fiducia non è una cosa che si conquista, ma che si costruisce. Assieme.
                    -> glyph_modifier_variation_management(Mentor, earthC)->

                {charTag(FifthCharacter, "sorry")}:         Credo tu abbia capito cosa intendo, {player_name}.
                {charTag(FifthCharacter, "neutral")}:       Hai un obiettivo, e per raggiungerlo ti serve uno strumento.
                                                    E tra te e quello strumento, che è l'inchiostro, c'è di mezzo la fiducia dell'altra persona.
        
                    
            + \ {charTag(PG, "neutral")}:           Non hanno persone care da cui farsi aiutare?
                    -> glyph_modifier_variation_management(Mentor, waterC)->

                {charTag(FifthCharacter, "neutral")}:       A volte è più facile aprirsi a chi non si conosce.
                                                    E mentre noi riflettiamo sulle loro difficoltà, impariamo anche qualcosa su di noi.
                        
            + \ {charTag(PG, "neutral")}:           Non avrebbe più senso chiamarla "rilettura" invece di "riscrittura"?
                    -> glyph_modifier_variation_management(Mentor, airC)->

                {charTag(FifthCharacter, "hurry")}:         Ci ho pensato molte volte anche io, sai?
                {charTag(FifthCharacter, "neutral")}:       La risposta che mi sono data è che "riscrivere" dà un senso di azione, di cambiamento, che "rileggere" non ha.
                                                    E nel momento in cui una persona si sente bloccata, la cosa di cui ha più bisogno è di sentire la possibilità di poter di nuovo agire sul mondo, su di sé.
                {charTag(FifthCharacter, "bored")}:         Ogni tanto questa discrepanza mi urta.
                {charTag(FifthCharacter, "neutral")}:       Ma alla fine deve funzionare per le persone che aiutiamo, non per noi.
  
            + \ {charTag(PG, "neutral")}:           Un nome è soltanto un nome. A cosa serve cambiarlo?
                    -> glyph_modifier_variation_management(Mentor, fireC)->

                {charTag(FifthCharacter, "neutral")}:       Un nome è come una magia che carichiamo di volta in volta di significato..
                                                    A volte quella magia non va più bene, e dobbiamo cercare una nuova formula. 
                                                    Un nuovo nome.
            -
        {charTag(FifthCharacter, "neutral")}:       Un modo per dimostrare a una persona che l'hai compresa, è farle un <b>dono</b>, ed è per questo che ti ho sbloccato la serra.
        {charTag(FifthCharacter, "hurry")}:         Il dono giusto è un modo per dire "Ehi, ti vedo, ti capisco".
                                            Migliorare il rapporto.
                                            E ottenere più inchiostro.
        {charTag(FifthCharacter, "neutral")}:       Continua a lavorare sulle relazioni che stai costruendo, e tra un po' ti spiego cos'è la riscrittura.
        {charTag(FifthCharacter, "sad")}:           Ora devo assolutamente spolverare le foglie della foresta.
                                            Questo posto collasserebbe senza me.
        {charTag(FifthCharacter, "neutral")}:       A dopo!    

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
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(FifthCharacter, "hurry")}:         {player_name}!
                                            Credo sia giunto il momento di spiegarti le ultime cose importanti per il tuo lavoro di {player_pronouns has him:riscrittore|{player_pronouns has her:riscrittora|riscrittorə}}.
                {
                    - are_two_entities_together(SecondCharacter, PG):
                        {charTag(SecondCharacter, "angry")}:            Uffi. Sembra di stare a scuola.
                
                }
        {charTag(FifthCharacter, "hurry")}:         Quando avrai parlato a sufficienza con una persona, sentirai di poterle proporre di rileggere assieme la sua storia.
        {charTag(FifthCharacter, "neutral")}:       Se glielo proporrai la persona sarà finalmente capace di condividere con te come si legge, cosa la blocca qui.
                                            E a quel punto tu potrai proporre una riscrittura.
                                            O meglio: <b><i>delle riscritture</b></i>.
        {charTag(FifthCharacter, "hurry")}:         Hai presente l'inchiostro di cui parlavamo prima? 
                                            Ogni goccia di inchiostro è una possibilità in più di proporre una riscrittura di un aspetto della vita della persona.
        {charTag(FifthCharacter, "neutral")}:       E quindi la logica diventa: più fiducia uguale più inchiostro uguale più riscritture uguale maggiori occasioni di successo!
                                            Ma se anche non dovessi avere una sola goccia di inchiostro, non disperare, perché ogni riscrittorə ha in sé un terzo strumento: lo strumento dell'<b><i>epilogo</b></i>.
                                            L'<b><i>epilogo</b></i> è una dichiarazione finale dellə riscrittorə, con l'obiettivo di far mettere alla persona un punto sul suo presente e iniziare a guardare al futuro in modo diverso.
        {charTag(FifthCharacter, "hurry")}:         Così persona e riscrittorə raggiungeranno il loro obiettivo: un nuovo nome, simbolo di un nuovo inizio.

    
                + \ {charTag(PG, "neutral")}:               Questa cosa di dare un nuovo nome mi spaventa, non è invadente?
                        -> glyph_modifier_variation_management(Mentor, waterC)->

                    {charTag(FifthCharacter, "neutral")}:           No, {player_name}, non sei tu a decidere che nome la persona sceglierà.
                                                            Né che percorso farà.
                    {charTag(FifthCharacter, "hurry")}:             Tu aiuti queste persone a rileggere il proprio passato, il loro presente.
                    {charTag(FifthCharacter, "neutral")}:           A poi starà a loro, e solo a loro, decidere verso quale futuro andare.

                + \ {charTag(PG, "neutral")}:               Ma non posso dire "Ehi tu chiamati così e cosà" e bona?
                        -> glyph_modifier_variation_management(Mentor, fireC)->

                    {charTag(FifthCharacter, "neutral")}:           Un nuovo nome è una nuova esperienza.
                                                            E l'esperienza viene dal percorso.
                    {charTag(FifthCharacter, "sad")}:               Se non c'è percorso, non c'è cambiamento.
                    {charTag(FifthCharacter, "neutral")}:           E poi sta alla persona decidere il suo nome.
                        
                + \ {charTag(PG, "neutral")}:               Creo fiducia, prendo l'inchiostro, aiuto a riscrivere. Matematico.
                        -> glyph_modifier_variation_management(Mentor, airC)->

                    {charTag(FifthCharacter, "neutral")}:           Non è così matematico.
                                                            Le persone non sono numeri.
                                                            E le relazioni non si creano con una formula.
                                                            Ma sì, direi che hai capito il succo.
                        
                + \ {charTag(PG, "neutral")}:               Mi son pers{player_pronouns has him:o|{player_pronouns has her:a|ə}} alla terza frase. Succede sempre.
                        -> glyph_modifier_variation_management(Mentor, earthC)->

                    {charTag(FifthCharacter, "sad")}:               Capita anche a me.
                    {charTag(FifthCharacter, "hurry")}:             Però non ti far problemi a richiedermi cosa fare, sono sempre qui al tuo servizio!
                        


                + \ {charTag(PG, "neutral")}:               Sembra tutto molto pratico e razionale, per essere un'esperienza così spirituale.
                        -> glyph_modifier_variation_management(Mentor, aetherC)->

                        {
                            - are_two_entities_together(FirstCharacter, PG):
                                {charTag(FirstCharacter, "annoyed")}:       Già.
                        }

                        {charTag(FifthCharacter, "neutral")}:       "Sembra" però è la cosa giusta da dire.
                                                            Perché non devi ascoltare solo con la testa, ma soprattutto col cuore.
                                                            Capire cosa desidera una persona.
                                                            Come ragiona.
                                                            Che dono farle.
                                                            Non è solo razionalità, per fortuna.   
                -

        {charTag(FifthCharacter, "neutral")}:                       Ricorda {player_name}: sei una guida, ma sta alla persona decidere alla fine chi è, e di cosa ha bisogno.
                                                            Anche per questo non c'è un buon esito o un cattivo esito di una riscrittura.
        {charTag(FifthCharacter, "sorry")}:                         Ma mi permetterò comunque di darti dei feedback, per aiutarti nel tuo percorso.                                                    
        {charTag(FifthCharacter, "neutral")}:                       Quando te la senti, affronta questo ultimo passaggio e poi torna da me.
        
                -> mentor_closing_storylet ->
                -> main


//Commenti sui minigames
=== about_greenhouse
~ temp charNameFive = translator(fifthChar_ActualName)

    {charTag(FifthCharacter, "neutral")}:                           Sai {player_name}? La <b><i>serra</b></i> non è solo un bel posto dove rilassarsi.
    {charTag(FifthCharacter, "hurry")}:                             Tra i tanti modi per migliorare un rapporto con una persona, fare il dono giusto è forse il più immediato.
            {
                - firstChar_giftedObject != () or secondChar_giftedObject != () or thirdChar_giftedObject != ():
                                                            E vedo che hai già imparato come fare! Sei sempre un passo avanti.
                
                - else:
                    {charTag(FifthCharacter, "neutral")}:           E ti consiglio di farlo, per facilitarti la vita.
            }
    {charTag(FifthCharacter, "neutral")}:                           Il dono giusto mostra comprensione, è la dimostrazione di aver ascoltato l'altra persona.
                                                            So chi sei.
            {
                - are_two_entities_together(SecondCharacter, PG):
                    {charTag(SecondCharacter, "emotional")}:        Io so di essere una persona che vuole le caramelle.
                    
            } 

    {charTag(FifthCharacter, "neutral")}:                           Anche per questo esistono doni sbagliati.
    {charTag(FifthCharacter, "bored")}:                             O mediocri.
            {
                - are_two_entities_together(FirstCharacter, PG):
                    {charTag(FirstCharacter, "annoyed")}:   Come sa chiunque riceva regali di Natale dai parenti.
                    
            } 
    {charTag(FifthCharacter, "hurry")}:                             La serra, con le sue piante magnifiche, è personalmente il posto migliore dove coltivare e recuperare doni.
    {charTag(FifthCharacter, "neutral")}:                           Gli effetti dei doni tra l'altro sono immediati e permanenti.
                                                                    Ed è per questo che ogni riscrittorə può darne solo uno a persona.
    {charTag(FifthCharacter, "sorry")}:                             Qualcosa di così forte non può certo essere usato senza coscienza.


        -> mentor_closing_storylet ->
        -> main


=== about_kitchen
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

    {charTag(FifthCharacter, "bored")}:                             Una cucina su una palude?
                                                                    Non la mia prima scelta.
    {charTag(FifthCharacter, "sad")}:                               Non mi fa impazzire che tu vada in luoghi così malmessi.
    {charTag(FifthCharacter, "neutral")}:                           Ma l'idea della cucina non è così cattiva in sé: cucinare assieme è un momento di intimità.
                                                                    E mangiare è uno spazio di bella condivisione.
                                                                    E magari puoi aggiungere anche l'ingrediente giusto, e far felice la persona con cui stai ai fornelli.
{
    - are_two_entities_together(FirstCharacter, PG):
            {charTag(FirstCharacter, "curious")}:                   Ci facciamo una pastasciutta assieme, {charNameFive}?
            {charTag(FifthCharacter, "hurry")}:                     Magari più tardi?
            {charTag(FifthCharacter, "sorry")}:                     Ho da pulire la cera delle candele.
        
} 
    {charTag(FifthCharacter, "neutral")}:                           Passare del tempo in cucina con qualcunə può essere un bel modo per conoscervi meglio.
                                                                    E per capire che piega stia prendendo la vostra relazione.
            {
                - are_two_entities_together(SecondCharacter, PG): 
                    {charTag(SecondCharacter, "energy")}:           O per bruciare cose strane e vedere cosa succede!
                    
            }
    
        -> mentor_closing_storylet ->
        -> main


=== about_nest
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    
    
    {charTag(FifthCharacter, "neutral")}:                       Ho visto che {charNameThree} ha trovato il modo di sbloccarti l'accesso al Nido.
    {charTag(FifthCharacter, "hurry")}:                         Non posso certo dire che le persone qui non si diano da fare, ed è una bella cosa.
    {charTag(FifthCharacter, "neutral")}:                       Ho dei sentimenti contrastanti verso quello che si può fare su quella spiaggia.
    {charTag(FifthCharacter, "sad")}:                           Da una parte i Sigilli mi danno l'impressione di essere una forma di controllo.
    {charTag(FifthCharacter, "neutral")}:                       Ma la cosa che penso ogni volta che li vedo è che rendano la comunicazione più chiara.
    {charTag(FifthCharacter, "sad")}:                           È così difficile far capire alle altre persone quello che si prova e si pensa, e sarebbe bello avere uno strumento, un codice, qualcosa che ti faccia sapere sin da subito che verrai capita.
    {charTag(FifthCharacter, "neutral")}:                       Immagino che sarà il modo in cui ne farai uso a definirne il valore.
    {charTag(FifthCharacter, "hurry")}:                         Un giorno mi piacerebbe impararne qualcuno.

            -> mentor_closing_storylet ->
            -> main


//Altre informazioni importanti
=== about_not_mandatory_work
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    

    {charTag(FifthCharacter, "neutral")}:                       Stavo pensando a una cosa, {player_name}.
        {
            - grimoire_firstChar has grimFirstOpenKitchen:
                                                        Sono felice che {charNameOne} abbia sistemato la vecchia cucina.
        }
        {
            - grimoire_secondChar has grimSecondOpenLibrary:
                {
                    - grimoire_firstChar has grimFirstOpenKitchen:
                                                        E mi <>
                    
                    - else:
                                                        Mi <>
                }
                                                        fa piacere che {charNameTwo} abbia aperto la strada per la biblioteca.
                
        }
        {
            - grimoire_thirdChar has grimThirdOpenNest:
                                                        E anche il nido è disponibile, grazie al lavoro di {charNameThree}.
        }
                                                        Ogni spazio aggiuntivo, inclusa la serra, è un'occasione in più per conoscere meglio le persone che stai aiutando.
                                                        E alcuni di questi possono anche offrirti qualche strumento che, sinceramente, nemmeno avevo calcolato.
                                                        Ma ricorda che non sono passaggi obbligatori per compiere il tuo lavoro.
    {charTag(FifthCharacter, "hurry")}:                         Fai sempre e solo quello di cui senti il bisogno.

        -> mentor_closing_storylet ->
        -> main


 
=== first_char_new_mail
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    


        {charTag(FifthCharacter, "hurry")}:             Sembra che {charNameOne} ti abbia scritto una lettera, {player_name}! 
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
    
    
        {charTag(FifthCharacter, "hurry")}:             Sembra che {charNameTwo} ti abbia scritto una lettera, {player_name}! 
                                                Che cosa dolce, vero?
        {
            - entity_location(PG) == TrainStop:
                                                L'ha con sé quella cagnolina!
                
            - else:
                                                La trovi alla fermata del treno.
        }

        -> main
   
   
=== third_char_new_mail
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    
    
        {charTag(FifthCharacter, "hurry")}:             Sembra che {charNameThree} ti abbia scritto una lettera, {player_name}! 
                                                Che cosa dolce, vero?
        {
            - entity_location(PG) == TrainStop:
                                                L'ha con sé quella cagnolina!
                
            - else:
                                                La trovi alla fermata del treno.
        }

        -> main
   