=== fifth_char_intro
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FifthCharacter

        {charTag(FifthCharacter, "hurry")}:                     Oh, quanto ho sperato nel tuo arrivo!
                                                                Scusa, ma sono così felice che tu sia qui.

            {
            - grimoire_fifthChar has grimMentorLiar:
            {charTag(FifthCharacter, "sad")}:                   Con tutto il trambusto causato da quel bambino non ho nemmeno fatto una buona figura.
            }

        {charTag(FifthCharacter, "hurry")}:                     Avrai un milione di domande, vero?
        
        + (airChoice) \ {charTag(PG, "neutral")}:               Un milione e uno, ma la prima è: dove mi trovo?
            -> glyph_choice_manager(Mentor, airC) ->

            {
                - contentsTrainStop has PG:
                    {charTag(FifthCharacter, "neutral")}:       Questa? È la fermata del treno.
                                                                Da qui arrivano le persone che hanno bisogno del nostro aiuto.
                - contentsForest has PG:    
                    {charTag(FifthCharacter, "neutral")}:       Ora siamo nella foresta.
                                                                O meglio, la chiamo così perché.
                                                                Beh, ci sono tanti alberi.
                                                            
                - contentsPond has PG:
                    {charTag(FifthCharacter, "neutral")}:       Questo è lo stagno.
                                                                Regno di ninfee, libellule e calura.

                - contentsLibrary has PG:
                    {charTag(FifthCharacter, "neutral")}:       Questa è la biblioteca.
                                                                Posto di libri e scaffali infiniti da spolverare.

                - contentsDump has PG:
                    {charTag(FifthCharacter, "neutral")}:       Questa è la discarica.
                                                                Il posto meno elegante dove presentarci, direi.                                              
            }
            {charTag(FifthCharacter, "neutral")}:               Ma forse volevi sapere cos'è questo luogo in generale, vero?
            {charTag(FifthCharacter, "hurry")}:                 Non ha un vero nome, ma il lo chiamo <b><i>Il giardino</b></i>.
            {charTag(FifthCharacter, "neutral")}:               E faccio di tutto per renderlo un posto sicuro.
                                                                Un posto dove prenderti cura di te.
            {charTag(FifthCharacter, "hurry")}:                 Non male, no?
        
        + (waterChoice) \ {charTag(PG, "neutral")}:             Davvero sei felice che sono qui? È una cosa dolcissima!
            -> glyph_choice_manager(Mentor, waterC) ->

            {charTag(FifthCharacter, "hurry")}:                 Certo che sono felice!
            {charTag(FifthCharacter, "neutral")}:               Perché io sono <b><i>{charNameFive}</b></i>.

                ~ grimoire_fifthChar += grimMentorPresentation

            {charTag(FifthCharacter, "hurry")}:                 La tua {charNameFive}.
                                                                E ora che sei qui, ho uno scopo.


        + (aetherChoice) \ {charTag(PG, "neutral")}:            C'è qualcosa di insolito in questo posto, vero?
            -> glyph_choice_manager(Mentor, aetherC) ->

            {charTag(FifthCharacter, "neutral")}:               Io.
            {charTag(FifthCharacter, "sorry")}:                 Uh, è una domanda inaspettata.
            {charTag(FifthCharacter, "hurry")}:                 Sicuramente c'è qualcosa di magico.
            {charTag(FifthCharacter, "neutral")}:               Ma nulla di insolito, o di nascosto.
                                                                Nulla.
            {charTag(FifthCharacter, "hurry")}:                 Al contrario: hai in me una guida.

                
        + (fireChoice) \ {charTag(PG, "neutral")}:              Dimmi come torno a casa.
            -> glyph_choice_manager(Mentor, fireC) ->

            {charTag(FifthCharacter, "sad")}:                   Vuoi già andartene?
                                                                Forse devo rivedere il mio benvenuto.
            {charTag(FifthCharacter, "sorry")}:                 Forse sono stata troppo formale?
            {charTag(FifthCharacter, "hurry")}:                 O dovrei essere più autorevole?
                                                                Ma non devo essere scortese ora.
            {charTag(FifthCharacter, "neutral")}:               Mi hai fatto una domanda, e vedrò di rispondere.
            {
                - contentsTrainStop has PG:
                                                                Lì ad est troverai una porta, e ti ritroverai nella tua camera da letto.
                                                                Basta che ti stenderai a dormire, e tornerai nel mondo da cui vieni.
                - else:
                                                                A est della stazione troverai una porta, e da lì, la tua camera da letto.
                                                                Stenditi a dormire, e ti troverai nel mondo da cui vieni.
            }
                                                                E se deciderai di tornare, troverai tutto nello stato in cui l'hai lasciato.
            {charTag(FifthCharacter, "hurry")}:                 Prima però lascia che ti rubi giusto un secondo!
            
        + (earthChoice) \ {charTag(PG, "neutral")}:             <i>Mi godo la tranquillità della natura che mi circonda.</i>
            -> glyph_choice_manager(Mentor, earthC) ->

            {charTag(FifthCharacter, "hurry")}:                 È una pace per il cuore, vero?
            {charTag(FifthCharacter, "neutral")}:               Ogni angolo di questo spazio mi rasserena, anche quando mi sento fuori fuoco.
            {charTag(FifthCharacter, "hurry")}:                 Continua a stupirmi, giorno dopo giorno.
        
        -

        {charTag(FifthCharacter, "hurry")}:                     Ma come ti devo chiamare?
                                                                E quali pronomi usi?
        {charTag(FifthCharacter, "neutral")}:                   Puoi usare un nome qualsiasi e i pronomi che preferisci: prendi questa occasione come un nuovo inizio.
            -> name_choice.top2 ->
            -> gender ->
        {charTag(FifthCharacter, "hurry")}:                     Piacere di conoscerti, {player_name}.
                                                                E {player_pronoun has him:benvenuto|{player_pronoun has her:benvenuta|benvenutə}}.
                                                                {player_pronoun has her:Anche io uso i pronomi femminili.|Con me invece usa pure i pronomi femminili.}

            {
            - not waterChoice:
            {charTag(FifthCharacter, "neutral")}:               Ah, che sbadata, non mi sono presentata!
                                                                Mi chiamo <b><i>{charNameFive}</b></i>.
                                                                E il mio obiettivo è farti stare bene.

                    ~ grimoire_fifthChar += grimMentorPresentation
                    
            - else:
            {charTag(FifthCharacter, "neutral")}:               E come {charNameFive} il mio unico obiettivo è farti stare bene.
            }
        - (selfName)
            {
            - tutorial_MentorTutorial == true:
            {charTag(FifthCharacter, "hurry")}:                 Arriverà anche il momento in cui dovrò spiegarti perché sei qui, che cosa dovrei fare.

                {
                - grimoire_appendices has tutorialChoicesRelationship:
                {charTag(FifthCharacter, "sad")}:               Anche se la capretta ti ha già dato un bel po' di informazioni.
                    {
                    - are_two_entities_together(Carla, PG):
                     {charTag(Carla, "bored")}:                 E probabilmente {player_name} non se ne ricorderà mezza.   
                    }
                }

                {
                - are_two_entities_together(FirstCharacter, PG) && grimoire_firstChar hasnt grimFirstCharTwo:
                {charTag(FirstCharacter, "annoyed")}:           Cioè, si deve lavorare anche in una allucinazione?
                {charTag(FifthCharacter, "neutral")}:           Allucinazione?
                }

            {charTag(FifthCharacter, "neutral")}:               Ma prima pensiamo al tuo benessere.
            }

        {charTag(FifthCharacter, "neutral")}:                   C'è una cosa importante che devo dirti, {player_name}: qui avrai a che fare con cose viventi piene di storie.
                                                                E ogni storia ha le sue complessità.
        {charTag(FifthCharacter, "sorry")}:                     Per questo potresti incontrare tematiche per te faticose.
        {charTag(FifthCharacter, "neutral")}:                   Ci saranno occasioni in cui potrai evitarle e non ti perderai nulla di questa esperienza.
                                                                Ma quando si tratta di esseri viventi, accogliere le loro ferite farà parte del tuo lavoro.
                                                                Per questo ricorda: fermarsi o rinunciare non è un fallimento.
                                                                Se senti il bisogno di staccare puoi tornare in camera, il posto da cui sei {player_pronoun has him:arrivato|{player_pronoun has her:arrivata|arrivatə}}, e stenderti sul letto.
                                                                Al risveglio, troverai tutto come l'hai lasciato.
        {charTag(FifthCharacter, "hurry")}:                     E se non vorrai più tornare, ci saranno sicuramente altre persone pronte ad aiutare chi viene qui in cerca di risposte.


        + \ {charTag(PG, "neutral")}:                           <i>Annuisco: non c'è altro da aggiungere.</i>
            -> glyph_choice_manager(Mentor, aetherC) ->

            {charTag(FifthCharacter, "sad")}:                   Mi sento una gran chiacchierona, davanti al tuo silenzio.
            {charTag(FifthCharacter, "neutral")}:               Ma ci sta: alla fine sono io quella che deve spiegare le cose, vero?
        
        +  \ {charTag(PG, "neutral")}:                          Faccio tanta fatica a non sentirmi addosso il dolore degli altri.
            -> glyph_choice_manager(Mentor, waterC) ->
            
            {charTag(FifthCharacter, "sad")}:                   Ti capisco, {player_name}.
            {charTag(FifthCharacter, "neutral")}:               Proprio per questo è importante prendersi i propri tempi, staccare.
                                                                E capire quando è il caso di fermarsi.

            
        + \ {charTag(PG, "neutral")}:                           Capita che qualcunə se ne vada e non torni più?
            -> glyph_choice_manager(Mentor, airC) ->

            {charTag(FifthCharacter, "neutral")}:               Uh.
                                                                Non.
                                                                Credo di sì.
            {charTag(FifthCharacter, "sad")}:                   Sì, sicuramente sì.
                                                                Alla fine non esiste una cosa che possa andare bene a tutte le persone, no?                                                   


        + \ {charTag(PG, "neutral")}:                           Quando si tratta di farsi una pausa, non serve dirmelo due volte.
            -> glyph_choice_manager(Mentor, earthC) ->
                    {
                    - are_two_entities_together(Carla, PG):
                     {charTag(Carla, "happy")}:                 Siamo in due.
                    }
            {charTag(FifthCharacter, "neutral")}:               La cosa mi fa piacere.
            {charTag(FifthCharacter, "sad")}:                   Vorrei poter dire lo stesso.
            {charTag(FifthCharacter, "hurry")}:                 Ma se mi fermassi crollerebbe tutto, no?
                                                                Per cui riposa anche per me {player_name}!

            
        + \ {charTag(PG, "neutral")}:                           Non mi pesa correre qualche rischio!
            -> glyph_choice_manager(Mentor, fireC) ->

            {charTag(FifthCharacter, "sad")}:                   Non si tratta di correre dei rischi o meno, amic{player_pronoun has him:o|{player_pronoun has her:a|ə}} mi{player_pronoun has him:o|{player_pronoun has her:a|ə}}.
            {charTag(FifthCharacter, "neutral")}:               Anche la persona più scavezzacollo al mondo a un certo punto può spezzarsi.
                                                                E per questo è importante capire quali siano i propri confini prima di farsi male.

        -
        
            {charTag(FifthCharacter, "hurry")}:                 Comunque questo luogo è pieno di spazi di ristoro e cura, anche per te.
                                                                E se avrai bisogno del mio aiuto, ti basterà cercarmi.
            {charTag(FifthCharacter, "neutral")}:               Ho sempre qualche dritta su come affrontare i momenti più difficili.
            {charTag(FifthCharacter, "sad")}:                   Dimenticavo: ti ho aperto la serra, <>                                                    

                                        {
                                            - contentsPond has PG:
                                                                è quell'edificio lì a destra.
                                            - else:
                                                                la trovi nei pressi dello stagno.
                                        }
                                                                //Apertura della serra
                                                                ~ opening_places()

        {charTag(FifthCharacter, "hurry")}:                     La serra è un bel posto dove rilassarsi, e non solo.
        {charTag(FifthCharacter, "bored")}:                     Ma evita assolutamente tutti gli altri posti bloccati, perché sono pericolosi!       
        {charTag(FifthCharacter, "neutral")}:                   Ora ti saluto e 
        {charTag(FifthCharacter, "hurry")}:                     No!
        {charTag(FifthCharacter, "sad")}:                       Cavoletti. 
        {charTag(FifthCharacter, "sorry")}:                     Perché dimentico sempre tutto?!?
        {charTag(FifthCharacter, "hurry")}:                     Questo è per te.
                                                                È un Grimorio: ti aiuterà nel raccogliere tutte le informazioni che incontrerai man mano.
        
                                                                    //Sblocco del grimorio
                                                                    ~ grimoire_isEnabled = true

        {charTag(FifthCharacter, "neutral")}:                   Consultalo ogni volta che sei in difficoltà.
        {charTag(FifthCharacter, "hurry")}:                     E ora mi metto a spazzare un po' di foglie.


        -> mentor_closing_storylet ->
        -> main

//Storylets sul secondo personaggio
    === that_little_liar_storylet
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FifthCharacter
    
        
        {
        
            - mentor_riccioMentoreViciniColpo == true:
                {charTag(FifthCharacter, "sad")}:                       {grimoire_fifthChar hasnt grimMentorIntro: Ti prego|{player_name}}, almeno tu sii ragionevole. Non ho fatto male a nessuno.
                {charTag(SecondCharacter, "angry")}:                    Bugiarda!
                                                                        Sei vecchia e cattiva e bugiarda!
                    {
                    - are_two_entities_together(ThirdCharacter, PG):
                    {charTag(ThirdCharacter, "angry")}:                 Ehi!
                                                                        Non si tratta così una signora!
                    }                                                    
                        ~ change_entity_place(SecondCharacter)
            
            - else:
                {charTag(FifthCharacter, "neutral")}:                   {grimoire_fifthChar hasnt grimMentorIntro: Perdonami|{player_name}}, hai rispedito quel bambino a casa?
                    {
                        - are_two_entities_together(SecondCharacter, PG):
                        {charTag(FifthCharacter, "bored")}:             A quanto vedo no.
                        {charTag(SecondCharacter, "angry")}:            Vecchia strega!
                                                                        Sei vecchia e cattiva e mi hai fatto male!
                            ~ change_entity_place(SecondCharacter)
                            
                        {charTag(FifthCharacter, "sad")}:               {charNameTwo}!
                                                                        Torna qui!
                                                                        Cavolo.
                    }
        
        }
    
        {charTag(FifthCharacter, "sorry")}:                             Questo posto non è adatto a chi è così giovane.
                                                                        Non ce l'ho con lui, ma i pericoli qui sono tanti: i binari, lo stagno, la serra pericolante, e le bestie della foresta.
        {charTag(FifthCharacter, "sad")}:                               E potrei continuare per ore.
        {charTag(FifthCharacter, "neutral")}:                           E non è nemmeno è un bambino facilissimo.
                                                                        Ho perso il conto delle bugie che mi ha detto da quando è arrivato.
            {
                - are_two_entities_together(Franco, PG):
                {charTag(Franco, "neutral")}:                           Sono bugie solo se hanno le gambe corte.
                                                                        Ma {charNameTwo} ha quattro zampette.
                                                                        Quindi al massimo sono...
                {charTag(Franco, "question")}:                          Cosa sono?
                {
                    - are_two_entities_together(FirstCharacter, PG):
                        {charTag(FirstCharacter, "curious")}:           Se due gambe fanno una bugia, il doppio fa una duogia?
                        {charTag(Franco, "party")}:                     Esatto!
                        {charTag(Franco, "neutral")}:                   Sono sicuro che è il termine scientifico!
                                                                        Quindi {charNameTwo} non può dire bugie, ma solo duogie!
                        {charTag(FifthCharacter, "bored")}:             Basta!
                        {charTag(FifthCharacter, "neutral")}:           Quel bambino è inaffidabile!

                    - else:
                        {charTag(FifthCharacter, "bored")}:             Franco!
                        {charTag(FifthCharacter, "neutral")}:           Quel bambino dice solo sciocchezze e bugie da quando è qui!    
                }
            }
        {charTag(FifthCharacter, "sad")}:                               E mi ha tirato un calcio!
            
        
            {
                -not_talk:
                    {charTag(PG, "neutral")}:                           Gli hai fatto male? Perché lui ne è convinto.
                    {charTag(FifthCharacter, "neutral")}:               L'ho afferrato perché faceva i salti nello stagno.
                    {charTag(FifthCharacter, "sad")}:                   Ma non so cosa c'è in quell'acqua lurida.
                    {charTag(FifthCharacter, "sorry")}:                 Forse l'ho stretto più di quanto volessi.
                    {charTag(FifthCharacter, "neutral")}:               Ma non l'ho fatto apposta.
                
                - else:
                    {charTag(FifthCharacter, "sorry")}:                 Stavo solo cercando di fermarlo.
                                                                        Continuava a saltare nello stagno, e non ho idea di cosa possa esserci in quell'acqua lurida e limacciosa.
                    {
                        - are_two_entities_together(Franco, PG):
                           {charTag(Franco, "neutral")}:                I miei figli.
                    }
            } 

        {charTag(FifthCharacter, "sad")}:                               Mi spiace se si è spaventato.
        {charTag(FifthCharacter, "neutral")}:                           E mi fa tenerezza, sai?
        {charTag(FifthCharacter, "hurry")}:                             Il riccio gli calza a pennello.
                                                                        Così carino, tenero.
        {charTag(FifthCharacter, "neutral")}:                           Quando è assorto nei suoi discorsi sugli animali o è incuriosito da qualcosa è adorabile.
        {charTag(FifthCharacter, "sad")}:                               Ma poi provi ad avvicinarti, a conoscerlo meglio, e ti fa male.
        {charTag(FifthCharacter, "sorry")}:                             Mi spiace di avere perso la pazienza con lui.
                                                                        E so che non è un'emozione nobile per una mentore, ma sono rimasta ferita da quel calcio.
                                                                        E anche per questo ti chiedo di occupartene tu, così che i miei sentimenti non complichino la situazione.
        {charTag(FifthCharacter, "neutral")}:                           Trova un modo per allontanarlo.
                                                                        Velocemente, se riesci.
            {
                - are_two_entities_together(FirstCharacter, PG):
                    {charTag(FirstCharacter, "annoyed")}:               Se allontanate {charNameTwo} io qui muoio di noia!
                    {
                    - are_two_entities_together(ThirdCharacter, PG):
                    {charTag(ThirdCharacter, "jester")}:                Ma hai sempre me, {charNameOne}.
                    {charTag(FirstCharacter, "annoyed")}:               Vado a bermi della varechina, va. 
                    }
            }

            -> mentor_closing_storylet ->
            -> main
    
    === addressing_violence
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FifthCharacter
    

        {
            - mentor_riccioMentoreViciniColpo:
                {charTag(PG, "neutral")}:                               Dopo la discussione di prima ho riparlato con {charNameTwo}, e dice che gli hai dato uno strattone {charNameFive}.
                                                                        Che ti sei comportata da prepotente.
            
            - else:
                {charTag(PG, "neutral")}:                               Ho parlato con {charNameTwo}, e dice che gli hai dato uno strattone, {charNameFive}.
                                                                        Che ti sei comportata da prepotente.
        }
            
        {
            - are_two_entities_together(PG, SecondCharacter):
                {charTag(SecondCharacter, "melanchonic")}:              E a {charNameTwo} non va di venir picchiato di nuovo, per cui se ne va.
                        ~ change_entity_place(SecondCharacter)
        }

    {charTag(FifthCharacter, "bored")}:                                 Non sono stata prepotente!
    {charTag(FifthCharacter, "sorry")}:                                 Volevo solo che non si facesse del male!
    {charTag(FifthCharacter, "neutral")}:                               Quel bambino stava saltando senza pensare a quello che stava facendo.
    {charTag(FifthCharacter, "bored")}:                                 E il mio lavoro è proteggervi!
                                                                        Se si fosse!
    {charTag(FifthCharacter, "sad")}:                                   Se.  
                                                                        Io.
    {charTag(FifthCharacter, "sorry")}:                                 A me.
                                                                        Mi spiace.
                                                                        Non dovevo.
    {
        - are_two_entities_together(PG, FirstCharacter):
        {charTag(FirstCharacter, "annoyed")}:                           E fino a qui c'eravamo tuttə.
    }
    {charTag(FifthCharacter, "neutral")}:                               Non mi piace arrabbiarmi, {player_name}.
    {charTag(FifthCharacter, "sad")}:                                   E quando accade non so cosa fare.
                                                                        E forse la cosa peggiore è che.
    {charTag(FifthCharacter, "neutral")}:                               No.
                                                                        Non me la sento.
        
        +\ {charTag(PG, "neutral")}:                                    Ma cos'è che ti ha fatto arrabbiare, {charNameFive}?
                -> glyph_choice_manager(Mentor, airC)->

            {charTag(FifthCharacter, "sad")}:                           Mi sono sentita impotente.
                                                                        Non mi ascoltava.
                                                                        E mi ha ricordato una persona che faceva così.
            {charTag(FifthCharacter, "neutral")}:                       Sai qual è la cosa terribile {player_name}?
            {charTag(FifthCharacter, "sorry")}:                         Che a volte mi sembra che l'unico modo per essere ascoltata è alzare le mani.
            {charTag(FifthCharacter, "sad")}:                           Non so come guardare questa cosa, come affrontarla.
            {
                - are_two_entities_together(PG, FirstCharacter):
                    {charTag(FirstCharacter, "affectionate")}:          Vedere il problema è il passo più grande, {charNameFive}.
                                                                        L'importante è che non sia l'unico.
            }

        +\ {charTag(PG, "neutral")}:                                    Ammettilo: perdere il controllo a volte è liberatorio.
                -> glyph_choice_manager(Mentor, fireC)->

            {charTag(FifthCharacter, "sorry")}:                         Peggio.
            {charTag(FifthCharacter, "neutral")}:                       Il controllo non si perde, {player_name}.
                                                                        Si decide sempre se fare o meno il salto da "non alzare le mani" a "dai uno schiaffo"
            {charTag(FifthCharacter, "sad")}:                           E io quel salto l'ho fatto volontariamente.
            {charTag(FifthCharacter, "neutral")}:                       Sento il bisogno di.
                                                                        Non so.
            {charTag(FifthCharacter, "sorry")}:                         Di farmi rispettare.
                 {
                - are_two_entities_together(ThirdCharacter, PG):
                {charTag(ThirdCharacter, "neutral")}:                   Un po' di severità serve a volte, non ti ci preoccupare troppo.
                                                                        La prossima volta almeno ti ascolta.
                }
                {
                    - are_two_entities_together(PG, FirstCharacter):
                        {charTag(FirstCharacter, "neutral")}:           Questa roba vuoi non è rispetto ma paura.
                                                                        Non la meglio cosa, non trovi?
                }
            
        +\ {charTag(PG, "neutral")}:                                    Credo che arrabbiarsi sia un'emozione e non è sbagliata in sé, se non diventa violenza.
                -> glyph_choice_manager(Mentor, waterC)->

            {charTag(FifthCharacter, "bored")}:                         Arrabbiarsi è da deboli.
            {charTag(FifthCharacter, "neutral")}:                       Lo fai quando non comprendi le tue emozioni.
                                                                        E quando non provi empatia per le altre persone.
                                                                        No.
            {charTag(FifthCharacter, "sorry")}:                         Arrabbiarsi magari è umano, ma non è degno del mio ruolo.
            {
                - are_two_entities_together(PG, FirstCharacter):
                {charTag(FirstCharacter, "neutral")}:                   E questo è il momento in cui qualcunə dovrebbe dirti di andare in terapia.
                                                                        Mi prenderò questo compito.
                {charTag(FirstCharacter, "affectionate")}:              {charNameFive}: cercati unə terapeuta, per favore.
                {charTag(FifthCharacter, "bored")}:                     L'ho già fatto!
                {charTag(FifthCharacter, "sad")}:                       L'ho già fatto.
            }
            
        +\ {charTag(PG, "neutral")}:                                    Bene, non ti piace arrabbiarti. Però hai ferito {charNameTwo}.
                -> glyph_choice_manager(Mentor, earthC)->

            {charTag(FifthCharacter, "bored")}:                         Essere {player_pronoun has him:riscrittore|{player_pronoun has her:riscrittora|riscrittorə}} chiede empatia, {player_name}.
            {charTag(FifthCharacter, "sorry")}:                                 Scusa, hai ragione.
            {charTag(FifthCharacter, "sad")}:                           L'ho ferito, ed è la parte centrale di questa faccenda.

            
        +\ {charTag(PG, "neutral")}:                                    Se sei davvero qui per proteggerci serve che affronti le tue difficoltà, {charNameFive}.
                -> glyph_choice_manager(Mentor, aetherC)->
                    {
                    - are_two_entities_together(ThirdCharacter, PG):
                    {charTag(ThirdCharacter, "bored")}:                 Non è che ha ucciso qualcuno, su.
                    }
            {charTag(FifthCharacter, "sorry")}:                         Hai ragione, {player_name}.
            {charTag(FifthCharacter, "sad")}:                           La cosa peggiore è che non mi piace arrabbiarmi, ma mi fa sentire potente.
            {charTag(FifthCharacter, "neutral")}:                       Visibile.
            {charTag(FifthCharacter, "hurry")}:                         Per pochi secondi mi sembra di potermi far rispettare.
            {charTag(FifthCharacter, "bored")}:                         A volte <b>voglio</b> arrabbiarmi.
            {charTag(FifthCharacter, "sorry")}:                         Perché è l'unico modo per farmi ascoltare.
                {
                    - are_two_entities_together(PG, FirstCharacter):
                        {charTag(FirstCharacter, "sad")}:               Totale esperienza femminile, ama.
                        {charTag(FirstCharacter, "neutral")}:           Ma non toglie il problema di ciò che hai fatto.
                }
        -
    {charTag(FifthCharacter, "neutral")}:                               Comunque c'è una sola cosa sensata da fare.
        {
            - are_two_entities_together(Franco, PG):
                {charTag(Franco, "question")}:                          Insegnarmi a nuotare?
        }
    {charTag(FifthCharacter, "neutral")}:                               Chiedere scusa a {charNameTwo}.
                                                                        E vedere se avrà voglia di perdonarmi.
                                                                        Grazie per l'ascolto, {player_name}.
    {charTag(FifthCharacter, "hurry")}:                                 Sono sicura che diventerai {player_pronoun has him:un ottimo riscrittore|{player_pronoun has her:un'ottima riscrittora| unə ottimə riscrittorə}}.

        
        -> mentor_closing_storylet ->
        -> main
    
=== a_story_of_transformation

//Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FifthCharacter

    {charTag(FifthCharacter, "neutral")}:                               Sono un po' pensierosa {player_name}.
                                                                        Prima mi sono concessa una pausa in biblioteca.
    {charTag(FifthCharacter, "sorry")}:                                 Una pausa piccolissima.
    {charTag(FifthCharacter, "neutral")}:                               E ho letto questo racconto, si chiama <b>Il cancello</b>.
                                                                        E la protagonista...
                                                                        Non so se ti capita mai di leggere una storia che non è la tua, eppure ti accende ricordi, ti accende modi diversi di guardare i tuoi ricordi.
    {charTag(FifthCharacter, "sad")}:                                   Leggo poco perché a volte le storie mi entrano nella testa e non riesco a star bene fino a quando non sono concluse.
    {charTag(FifthCharacter, "neutral")}:                               E Liliana.
                                                                        Non so.
                                                                        Liliana mi ricorda la persona che sono stata.
    {charTag(FifthCharacter, "sad")}:                                   La persona che poteva anche arrabbiarsi.
                                                                        E la sua stanchezza.
    {charTag(FifthCharacter, "sorry")}:                                 Ti senti mai così {player_pronoun has him:stanco|{player_pronoun has her:stanca|stancə}} che vorresti sparire per un po' dal mondo, e basta?

        +\ {charTag(PG, "neutral")}:                                    Quando hai smesso di poterti arrabbiare?
                -> glyph_choice_manager(Mentor, airC)->

            {charTag(FifthCharacter, "sad")}:                           Dopo il matrimonio.
            {charTag(FifthCharacter, "neutral")}:                       A un certo punto le responsabilità...
            {charTag(FifthCharacter, "hurry")}:                         Che sciocca che sono comunque.
            {charTag(FifthCharacter, "neutral")}:                       Sembra che mi spiaccia non potermi arrabbiare.
                                                                        E poi perché dico <i>potermi</i>?
                                                                        È il risultato ovvio dell'essere Mentore, no?
                {
                    - are_two_entities_together(FirstCharacter, PG):
                        {charTag(FirstCharacter, "curious")}:           Il livello di gaslighting che ti stai facendo da sola è da Nobel.
                }
    
        +\ {charTag(PG, "neutral")}:                                    Liliana è stanca dell'ingiustizia, non del mondo. E ha deciso di reagire.
                -> glyph_choice_manager(Mentor, fireC)->

            {charTag(FifthCharacter, "neutral")}:                       Ma una magari a volte ha voglia di non reagire e basta.
            {charTag(FifthCharacter, "hurry")}:                         E di agire.
                                                                        No?
            {charTag(FifthCharacter, "neutral")}:                       Di fare quello che vuole.
            {charTag(FifthCharacter, "bored")}:                         E non solo rispondere a quello che ha attorno.
     
        +\ {charTag(PG, "neutral")}:                                    Mi chiedo se senti il bisogno di sparire dal mondo, o da te stessa.
                -> glyph_choice_manager(Mentor, aetherC)->

            {charTag(FifthCharacter, "sorry")}:                         Cambierebbe poi così tanto?
            {charTag(FifthCharacter, "sad")}:                           No, è una cosa stupida da dire.
            {charTag(FifthCharacter, "neutral")}:                       Ed è stato stupido dire di voler sparire.
                                                                        Lascia perdere.
    
        +\ {charTag(PG, "neutral")}:                                    Se capita è perché ho perso il mio centro, e cerco di prendermi cura di me.
                -> glyph_choice_manager(Mentor, earthC)->

            {charTag(FifthCharacter, "neutral")}:                       Per prendersi cura di sé però bisogna sapere di che cosa si ha bisogno, non trovi?
            {charTag(FifthCharacter, "sad")}:                           E io non ne ho idea.
                                                                        Zero proprio.

            
        +\ {charTag(PG, "neutral")}:                                    Ora vorrei tanto stringerti e dirti che andrà tutto bene.
                -> glyph_choice_manager(Mentor, waterC)->

            {charTag(FifthCharacter, "neutral")}:                       Grazie, {player_name}, è una cosa molto tenera.
                                                                        Ma non serve.
            {charTag(FifthCharacter, "sorry")}:                         So che voler sparire è una scelta egoista.
                                                                        Perché abbiamo una responsabilità verso il mondo.
            {charTag(FifthCharacter, "sad")}:                           Ma questo mondo a volte sa essere davvero <b>troppo</b>.
        -    
    {charTag(FifthCharacter, "hurry")}:                                 Comunque alla fine Liliana con la sua rabbia trova un modo per cambiare.
                                                                        E quando riesce a vedere la sua casa come uno spazio brillante, mi ha fatto pensare: questa è l'essenza stessa della riscrittura.

        -> mentor_closing_storylet ->
        -> main   


=== dog_mentor
    {
        - contentsTrainStop has PG:
            {
                - contentsTrainStop has DoggoNoLetters:
                    {charTag(FifthCharacter, "hurry")}:                 Ma quanto sei carina cagnolina!
                                                                        Ma quanto!
                                                                        Andiamo a fare due passi?
                                                                        Giochiamo con il bastoncino?
                            {charTag(Doggo, "neutral")}:                Woof!
                
                - else:
                    {charTag(FifthCharacter, "hurry")}:                 Ehi {player_name}!
                                                                        Hai visto quella cagnolina prima?
                    {charTag(FifthCharacter, "neutral")}:               Era lì sotto alla fermata.
                    {charTag(FifthCharacter, "hurry")}:                 Con un musino adorabile.
                    {charTag(FifthCharacter, "sorry")}:                 Ho provato a giocarci, ma si è allontanata.
            }
        - else:
            {charTag(FifthCharacter, "hurry")}:                         Ehi {player_name}!
                                                                        Hai visto quella cagnolina prima?
            {charTag(FifthCharacter, "neutral")}:                       Era alla fermata della stazione.
            {charTag(FifthCharacter, "hurry")}:                         Con un musino adorabile.
            {charTag(FifthCharacter, "sorry")}:                         Ho provato a giocarci, ma si è allontanata.
    }

    -> mentor_closing_storylet ->
    -> main


=== about_olobino
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(FifthCharacter, "bored")}:                             Ma che diavolo è successo alla serra!
        {charTag(FifthCharacter, "sorry")}:                             Scusa.
        {charTag(FifthCharacter, "neutral")}:                           Ma mi è preso un colpo quando ho visto quella.
        {charTag(FifthCharacter, "bored")}:                             Cos'è quella roba che cresce sui vetri?
                                                                        Ci sono troppi cambiamenti.
        {charTag(FifthCharacter, "sad")}:                               Troppi cambiamenti!
        {charTag(FifthCharacter, "neutral")}:                           Devo fare qualcosa.
            ~ change_entity_place(Mentor)

                {
                    - are_two_entities_together(FirstCharacter, PG):
                        {charTag(FirstCharacter, "sad")}:               Quella donna ha bisogno di una vacanza.
                }

                {
                    - are_two_entities_together(Franco, PG):
                    {charTag(Franco, "question")}:                      Urlare non è già fare qualcosa?
                    {charTag(Franco, "neutral")}:                       Zia Graaak lo dice sempre, che non è vero che non fa nulla, perché ci sgrida tutto il giorno.
                }
    
    -> mentor_closing_storylet ->
    -> main

=== again_about_olobino
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(FifthCharacter, "neutral")}:                           Curioso, {player_name}.
                                                                        Prima ho dato un'occhiata alla serra, e quel fungo gigante.
                                                                        Insomma.
        {charTag(FifthCharacter, "hurry")}:                             L'ha resa più stabile.
        {charTag(FifthCharacter, "neutral")}:                           Ma non mi piace molto.
                                                                        Lo terrò sotto controllo.
        {charTag(FifthCharacter, "sorry")}:                             Anche per evitare che qualcunə se lo mangi e stia male.
        {
            - are_two_entities_together(FirstCharacter, PG):
            {charTag(FirstCharacter, "curious")}:                       Credo mi offrirò come cavia per capire, ehm, i suoi pericoli.
            {
                - are_two_entities_together(SecondCharacter, PG):
                    {charTag(SecondCharacter, "energy")}:               Anche io anche io anche io!
                                                                        Mi piace provare le cose!
                    {charTag(FifthCharacter, "bored")}:                 Non credo sia il caso, per nessuno dei due!
            } 
        }
        {
            - are_two_entities_together(Franco, PG):
                {charTag(Franco, "neutral")}:                           La mia famiglia lo mangia da anni e va tutto bene.
                {charTag(Franco, "party")}:                             A parte quella volta che mamma Craazia ha iniziato a cantare in melanzanese.
        }

    
    -> mentor_closing_storylet ->
    -> main

=== mentor_rage
Mentore sbrocca

    -> mentor_closing_storylet ->
    -> main
        
    
 
//Fine della demo
    === ending_demo

        {charTag(FifthCharacter, "neutral")}:                           Sembra che la demo sia finita qui, {player_name}.
                                                                        Potrai girare ancora per gli spazi aperti.
                                                                        Continuare a leggere le storie della <b><i>biblioteca</b></i>.
                                                                        Coltivare cosa rimane da coltivare nella <b><i>serra</b></i>.
                                                                        Creare nuovi sigilli.
                                                                        Ma non compariranno nuove persone bisognose.
                                                                        Se te la senti, dopo aver chiuso l'esperienza potrai rispondere a qualche domanda su <i>Selanìa</i>.
                                                                        E aggiungere in wishlist su Steam il gioco.
                                                                        Un gesto semplice che aiuta i giochi indie a essere più visibili.
                                                                        Grazie di cuore, e buona vita.
                                                                        A presto!
    -> main