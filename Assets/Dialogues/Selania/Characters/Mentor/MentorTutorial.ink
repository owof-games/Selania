/* ---------------------------------

       Storylets tutorial

 ----------------------------------*/
=== tutorial_mentorTalkingChoiceRelationship
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FifthCharacter

            {charTag(FifthCharacter, "hurry")}:                 Rieccoci {player_name}!
                                                                Sono contenta che hai parlato un po' con le persone che hai incontrato in giro per questo luogo!
            {charTag(FifthCharacter, "neutral")}:               Direi che ora sei pront{player_pronoun has him:o|{player_pronoun has her:a|ə}} per ascoltare il mio primo insegnamento sul tuo lavoro.
                {
                - grimoire_appendices has tutorialChoicesRelationship:
                {charTag(FifthCharacter, "sad")}:               Anche se ho visto che ne hai parlato anche con la capra.
                    {
                    - are_two_entities_together(Carla, PG):
                     {charTag(Carla, "bored")}:                 Ti avrei lasciato volentieri l'onore, collega.    
                    }
                }
            {charTag(FifthCharacter, "hurry")}:                 Parliamo di <b>dialogo</b>!
            {charTag(FifthCharacter, "neutral")}:               Il dialogo è tutto nel tuo lavoro, come nella vita.
                                                                Ogni volta che dirai qualcosa le persone presenti si faranno un'idea su di te.
                                                                Parlare è agire, e le nostre azioni raccontano sempre il modo in cui vediamo il mondo.
            {charTag(FifthCharacter, "sorry")}:                 E non tutte le visioni del mondo sanno conciliarsi.
            {charTag(FifthCharacter, "hurry")}:                 Ad esempio:

        {
            - fifth_char_intro.fireChoice:
                {charTag(FifthCharacter, "sad")}:               Quando prima ti ho incontrat{player_pronoun has him:o|{player_pronoun has her:a|ə}}, la prima cosa che hai fatto è stata cercare di andartene, ad esempio, mi sono sentita ferita.
                {charTag(FifthCharacter, "hurry")}:             Poi fortunatamente la mia preparazione mi ha aiutato a sopprimere quel sentimento.
                {charTag(FifthCharacter, "sad")}:               Un'altra persona magari si sarebbe offesa.
                {charTag(FifthCharacter, "neutral")}:           O avrebbe apprezzato la tua propensione per l'azione.

            - fifth_char_intro.aetherChoice:
                {charTag(FifthCharacter, "neutral")}:           Quando prima ti ho incontrat{player_pronoun has him:o|{player_pronoun has her:a|ə}}, la prima cosa che mi hai chiesto è se questo sia un luogo misterico, mostrando con tranquillità un interesse verso l'occulto e le cose spirituali.
                {charTag(FifthCharacter, "hurry")}:             Ed è una cosa che mi risuona molto.
                {charTag(FifthCharacter, "sad")}:               Altre persone potrebbero giudicarti poco razionale, scollegat{player_pronoun has him:o|{player_pronoun has her:a|ə}} dalla realtà.
                {charTag(FifthCharacter, "neutral")}:           Oppure potrebbero ritrovare in te un{player_pronoun has him:o|{player_pronoun has her:a|ə}} compagn{player_pronoun has him:o|{player_pronoun has her:a|ə}} con cui confidare le esperienze più insolite.

            - fifth_char_intro.earthChoice:
                {charTag(FifthCharacter, "hurry")}:             Quando prima ti ho incontrat{player_pronoun has him:o|{player_pronoun has her:a|ə}}, la prima cosa che ha fatto è stata abbandonarti a tutta questa natura, e ho scoperto di aver già un punto di contatto con te.
                {charTag(FifthCharacter, "sad")}:               Non tutte le persone potrebbero trovarsi d'accordo: c'è chi ama gli spazi urbani e chi ha paura dell'imprevedibilità di un bosco.
                {charTag(FifthCharacter, "neutral")}:           Oppure potresti trovare qualcunə che non aspettava altro che di parlarti di tutti i suoi animali preferiti.

            - fifth_char_intro.airChoice:
                {charTag(FifthCharacter, "neutral")}:           Quando prima ti ho incontrat{player_pronoun has him:o|{player_pronoun has her:a|ə}}, la prima cosa che mi hai chiesto è stata dove siamo.
                {charTag(FifthCharacter, "hurry")}:             E l'hai chiesto con una curiosità che ho apprezzato molto: le domande sono strade aperte verso il sapere.
                {charTag(FifthCharacter, "sad")}:               Ma potresti trovare qualcunə che invece preferisce un approccio più emotivo, o spirituale, e potrebbe mettersi sulla difensiva.
                {charTag(FifthCharacter, "neutral")}:           Oppure unə compagnə di curiosità, studio e analisi.
                                                                Qualcunə con cui passare le ore a chiacchierare.

            - fifth_char_intro.waterChoice:
                {charTag(FifthCharacter, "neutral")}:           Quando prima ti ho incontrat{player_pronoun has him:o|{player_pronoun has her:a|ə}}, una delle prima parole che hai usato è stata <i>dolcezza</i>, e l'hai fatto con un carico enorme di gioia.
                {charTag(FifthCharacter, "hurry")}:             L'emotività attrae molte persone, perché in tantə abbiamo bisogno di parlare di ciò che proviamo, di condividere gli aspetti profondi del nostro cuore.
                {charTag(FifthCharacter, "sad")}:               Ma allontana altrettante persone, vuoi perché quello non è il loro linguaggio, vuoi perché non se la sentono di parlarne con chi non conoscono.
        }

        {charTag(FifthCharacter, "neutral")}:                   Le cose non sono poi così lineari, perché giustamente il modo in cui ognunə di noi vede il mondo è molto molto molto complesso.
        {charTag(FifthCharacter, "hurry")}:                     La cosa bella però è che le persone tendono sempre a reagire a ciò che diciamo.
        {charTag(FifthCharacter, "neutral")}:                   E capire le loro reazioni è la prima parte del tuo lavoro.
                                                                Prima di riempirti di troppe informazioni, ti invito a continuare a parlare con le persone che incontrerai qui in giro, e a capire meglio come ragionano.
        {charTag(FifthCharacter, "hurry")}:                     Capire il modo in cui vedono il mondo ti aiuterà a conquistare la loro fiducia.
        {charTag(FifthCharacter, "neutral")}:                   Che è la parte davvero fondamentale del tuo lavoro.
        {charTag(FifthCharacter, "hurry")}:                     Più tardi ti spiegherò perché sei qui.
        {charTag(FifthCharacter, "hurry")}:                     Intanto vedo cosa c'è da spolverare.

            -> mentor_closing_storylet ->
            -> main


=== tutorial_mentorInkAndYouAreARewriter
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FifthCharacter
    

        {charTag(FifthCharacter, "hurry")}:                     {player_name}!
        {charTag(FifthCharacter, "neutral")}:                   È giunto il momento di spiegarti il tuo lavoro.
                {
                - grimoire_appendices has tutorialRereading:
                {charTag(FifthCharacter, "sad")}:               O meglio, a rispiegartelo, visto che Carla mi ha battuta.
                    {
                    - are_two_entities_together(Carla, PG):
                     {charTag(Carla, "happy")}:                 Se sapevo che c'era una gara mi sarei data malata.
                    } 
                }
        {charTag(FifthCharacter, "neutral")}:                   Questo non è solo un posto magnifico di per sé, {player_name}.
        {charTag(FifthCharacter, "hurry")}:                     È un luogo con uno scopo, uno scopo che riguarda soprattutto te.
        {charTag(FifthCharacter, "neutral")}:                   Le persone che incontrerai qui sono rimaste bloccate in qualcosa: rimpianti, rimorsi, vecchie ferite e quant'altro.
            {
            - are_two_entities_together(ThirdCharacter, PG):
            {charTag(ThirdCharacter, "jester")}:                La ricerca del birrozzo nel frigo.
            }
        {charTag(FifthCharacter, "neutral")}:                   Il tuo scopo, {player_name}, è aiutarle a riscrivere il modo in cui raccontano la loro storia, così che possano sbloccarsi.
        {charTag(FifthCharacter, "hurry")}:                     Perché tu {player_pronoun has him:amico mio|{player_pronoun has her:amica mia|amicə miə}} sei <b><i>{player_pronoun has him:un riscrittore|{player_pronoun has her:una riscrittora|unə riscrittorə}}</b></i>!
        {charTag(FifthCharacter, "neutral")}:                   E se farai bene il tuo lavoro, aiuterai moltissime persone a sbloccarsi, e a scegliere un nuovo nome, il segno di un nuovo inizio.
            {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "annoyed")}:           Tipo, un nome diverso da {charNameOne}.
                {charTag(FifthCharacter, "hurry")}:             Esattamente, {charNameOne}!   
            }
        {charTag(FifthCharacter, "neutral")}:                   Quello {player_pronoun has him:del riscrittore|{player_pronoun has her:della riscrittora|dellə riscrittorə}} è un lavoro con pochi strumenti.
                                                                Come ti dicevo all'inizio, il primo è l'ascolto.
                                                                Accogli le loro storie, capisci quale sia la cosa giusta da dire per farle sentire comprese.
        {charTag(FifthCharacter, "hurry")}:                     Conquista la loro fiducia.
        {charTag(FifthCharacter, "neutral")}:                   Così otterrai il secondo strumento: l'<b><i>inchiostro</b></i>.
                                                                L'inchiostro è il premio di una buona relazione.
                                                                Ogni goccia di inchiostro raccoglie l'essenza della persona che l'ha creato, ed è uno strumento potentissimo per la <b>riscrittura</b>, l'ultimo atto del tuo lavoro.
                                                                Ma tratteremo meglio la riscrittura più avanti.

            + \ {charTag(PG, "neutral")}:                       Chi decide chi ha bisogno di un nuovo nome e chi no?
                    -> glyph_choice_manager(Mentor, aetherC)->

                {charTag(FifthCharacter, "neutral")}:           Non c'è un'autorità, se è quello che mi stai chiedendo.
                                                                C'è qualcosa in questo luogo che chiama chi ne ha il bisogno.
                {charTag(FifthCharacter, "sad")}:               Forse poche persone si rendono conto dell'importanza di un nuovo nome?
                {charTag(FifthCharacter, "neutral")}:           Non serve a tuttə, comunque.
                                                                Non a me per esempio.
                                                                Questo è stato, è e sarà sempre il mio nome.
                                                                Ma alla fine il nome è solo un simbolo, non è l'obiettivo in sé.       
                    
            + \ {charTag(PG, "neutral")}:                       Sento la fiducia come qualcosa che si costruisce, non che si conquista.
                    -> glyph_choice_manager(Mentor, earthC)->

                {charTag(FifthCharacter, "sorry")}:             Credo tu abbia capito cosa intendo, {player_name}.
                {charTag(FifthCharacter, "neutral")}:           Hai un obiettivo, e per raggiungerlo ti serve uno strumento.
                                                                E tra te e quello strumento, che è l'inchiostro, c'è di mezzo la fiducia dell'altra persona.
        
                    
            + \ {charTag(PG, "neutral")}:                       Preparo la mia spalla per farlə piangere, e l'orecchio per ascoltarlə.
                    -> glyph_choice_manager(Mentor, waterC)->

                {charTag(FifthCharacter, "neutral")}:           Ottima attitudine.
                                                                Anche se per fortuna non ci saranno solo pianti, ma anche risate.
                {charTag(FifthCharacter, "sad")}:               E momenti di rabbia.
                                                                Non so perché ma le persone si arrabbiano tantissimo quando cercano di lasciare andare qualcosa.
                        
            + \ {charTag(PG, "neutral")}:                       Perché si chiama riscrittura, se le aiutiamo a rileggersi?
                    -> glyph_choice_manager(Mentor, airC)->

                {charTag(FifthCharacter, "hurry")}:             Ci ho pensato molte volte anche io, sai?
                {charTag(FifthCharacter, "neutral")}:           La risposta che mi sono data è che "riscrivere" dà un senso di azione, di cambiamento, che "rileggere" non ha.
                                                                E nel momento in cui una persona si sente bloccata, la cosa di cui ha più bisogno è di sentire la possibilità di poter di nuovo agire sul mondo, su di sé.
                {charTag(FifthCharacter, "bored")}:             Ogni tanto questa discrepanza mi urta.
                {charTag(FifthCharacter, "neutral")}:           Ma alla fine deve funzionare per le persone che aiutiamo, non per noi.
  

            + \ {charTag(PG, "neutral")}:                       Capito: brucio il passato così cresce qualcosa di nuovo.
                    -> glyph_choice_manager(Mentor, fireC)->

                {charTag(FifthCharacter, "sad")}:               No niente fuoco, grazie!
                {charTag(FifthCharacter, "neutral")}:           Ma soprattutto, non buttiamo via il passato!
                                                                L'obbiettivo è quello di accogliere la propria storia, ma di guardarla in modo diverso.
                                                                Non di far finta che non sia esistita.
                {charTag(FifthCharacter, "sad")}:               O è garantito che si ripresenteranno gli stessi problemi.                                                
            -

        {charTag(FifthCharacter, "neutral")}:                   Un modo per dimostrare a una persona che l'hai compresa, è farle un <b>dono</b>, ed è per questo che ti ho sbloccato la serra.
            {
            - tutorial_inkActive_requested == true:
                                                                Cosa che stavi già facendo in autonomia, ed è grandioso!    
            }
        {charTag(FifthCharacter, "hurry")}:                     Il dono giusto è un modo per dire "Ehi, ti vedo, ti capisco".
                                                                Migliorare il rapporto.
                                                                E ottenere più inchiostro.
        {charTag(FifthCharacter, "neutral")}:                   Continua a lavorare sulle relazioni che stai costruendo, e tra un po' ti spiego cos'è la riscrittura.
        {charTag(FifthCharacter, "sad")}:                       Ora devo assolutamente spolverare le foglie della foresta.
                                                                Questo posto collasserebbe senza me.
        {charTag(FifthCharacter, "neutral")}:                   A dopo!    

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

    //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FifthCharacter
    

        {charTag(FifthCharacter, "hurry")}:                     {player_name}!
                                                                Credo sia giunto il momento di spiegarti le ultime cose importanti per il tuo lavoro di {player_pronoun has him:riscrittore|{player_pronoun has her:riscrittora|riscrittorə}}.
            {
            - are_two_entities_together(SecondCharacter, PG):
            {charTag(SecondCharacter, "angry")}:                Uffa. Sembra di stare a scuola.
            
            }
        {charTag(FifthCharacter, "hurry")}:                     Quando avrai parlato a sufficienza con una persona, sentirai di poterle proporre di rileggere assieme la sua storia.
        {charTag(FifthCharacter, "neutral")}:                   Se lo farai, la persona sarà finalmente capace di condividere con te come si legge, cosa la blocca qui.
                                                                E a quel punto tu potrai proporre una riscrittura.
                                                                O meglio: <b><i>delle riscritture</b></i>.
        {charTag(FifthCharacter, "hurry")}:                     Hai presente l'inchiostro di cui parlavamo prima?
                {
                - grimoire_appendices has tutorialGreenhouse:
                {charTag(FifthCharacter, "sad")}:               Quello di cui ti ha parlato anche Carla?
                    {
                    - are_two_entities_together(Carla, PG):
                    {charTag(Carla, "bored")}:                 Hanno mandato qui quest{player_pronoun has him:o|{player_pronoun has her:a|ə}} tizi{player_pronoun has him:o|{player_pronoun has her:a|ə}} totalmente impreparat{player_pronoun has him:o|{player_pronoun has her:a|ə}} per fare il suo lavoro.
                                                                Come al solito.
                                                                Che dovevo fare?
                    {charTag(FifthCharacter, "neutral")}:       Lasciare fare a me, ad esempio.
                    {charTag(FifthCharacter, "neutral")}:       Dicevo.                                         
                    }
                }
                                                                Ogni goccia di inchiostro è una possibilità in più di proporre una riscrittura di un aspetto della vita della persona.
        {charTag(FifthCharacter, "neutral")}:                   E quindi la logica diventa: più fiducia uguale più inchiostro uguale più riscritture uguale maggiori occasioni di successo!
        {charTag(FifthCharacter, "hurry")}:                     Ma se anche non dovessi avere una sola goccia di inchiostro, non disperare, perché ogni riscrittorə ha in sé un terzo strumento: lo strumento dell'<b><i>epilogo</b></i>.
        {charTag(FifthCharacter, "neutral")}:                   L'<b><i>epilogo</b></i> è una dichiarazione finale dellə riscrittorə, con l'obiettivo di far mettere alla persona un punto sul suo presente e iniziare a guardare al futuro in modo diverso.
        {charTag(FifthCharacter, "hurry")}:                     Così persona e riscrittorə raggiungeranno il loro obiettivo: un nuovo nome, simbolo di un nuovo inizio.

    
            + \ {charTag(PG, "neutral")}:                       Questa cosa di dare un nuovo nome mi spaventa, mi sembra invadente.
                    -> glyph_choice_manager(Mentor, waterC)->

                {charTag(FifthCharacter, "neutral")}:           No, {player_name}, non sei tu a decidere che nome la persona sceglierà.
                                                                Né che percorso farà.
                {charTag(FifthCharacter, "hurry")}:             Tu aiuti queste persone a rileggere il proprio passato, il loro presente.
                {charTag(FifthCharacter, "neutral")}:           A poi starà a loro, e solo a loro, decidere verso quale futuro andare.

            + \ {charTag(PG, "neutral")}:                       È un bel po' di lavoro per una sola persona.
                    -> glyph_choice_manager(Mentor, fireC)->

                {charTag(FifthCharacter, "neutral")}:           Ma non sei sol{player_pronoun has him:o|{player_pronoun has her:a|ə}}: hai me.
                                                                E l'esperienza che man mano accumulerai.
                {charTag(FifthCharacter, "neutral")}:           Ma soprattutto me.                                                
                    
            + \ {charTag(PG, "neutral")}:                       Ma da dove viene l'inchiostro? Ce lo porta qualcuno? Ce lo dona la persona da riscrivere?
                    -> glyph_choice_manager(Mentor, airC)->

                {charTag(FifthCharacter, "sad")}:               Non ne ho idea, scusa.
                {charTag(FifthCharacter, "neutral")}:           Non immaginarlo però come qualcosa di concreto.
                                                                È più come quando dici qualcosa a una persona che non conosci molto, e quella sorride guardandoti negli occhi.
                                                                E nei suoi occhi vedi che si è aperta una porticina.
                                                                E si lascia capire un po' meglio.
                {charTag(FifthCharacter, "sad")}:               Sempre che tu sappia guardare le persone negli occhi.
                    
            + \ {charTag(PG, "neutral")}:                       Tutto chiaro. Sicuramente mi approccerò a tutto questo in modo meno serioso.
                    -> glyph_choice_manager(Mentor, earthC)->
                {charTag(FifthCharacter, "sad")}:               Mi sembra una scelta legittima.
                {charTag(FifthCharacter, "neutral")}:           Non mi fraintendere: è giusto che sia chi riscrive a trovare la sua modalità.                                                
                {charTag(FifthCharacter, "sad")}:               Voglio solo essere sicura che tu non sottovaluti l'importanza del tuo lavoro.
                    


            + \ {charTag(PG, "neutral")}:                       Una persona bloccata potrebbe non aver voglia di cambiare, e a quel punto non potrei aiutarla.
                    -> glyph_choice_manager(Mentor, aetherC)->

                    {
                        - are_two_entities_together(FirstCharacter, PG):
                        {charTag(FirstCharacter, "annoyed")}:           Non mettermi ansie che non sapevo di avere, {player_name}!
                    }
                    {
                    - are_two_entities_together(ThirdCharacter, PG):
                    {charTag(ThirdCharacter, "bored")}:                 O non ha niente da cambiare.
                    }
                {charTag(FifthCharacter, "bored")}:             IMPOSSIBILE!
                {charTag(FifthCharacter, "sad")}:               Scusami, ma non è possibile.
                {charTag(FifthCharacter, "neutral")}:           Questa cosa non è possibile.
                                                                Se qualcuno arriva qui è perché ha bisogno di cambiare.
                                                                E prima o poi tutti arrivano al cambiamento, anche se tu dovessi fare un lavoro mediocre.
                    {
                        - are_two_entities_together(FirstCharacter, PG):
                        {charTag(FirstCharacter, "annoyed")}:           Qualcuno ha dell'ansiolitico per {charNameFive}?
                                                                        Un'altra domanda di questo tipo da parte di {player_name} e mi muore di infarto.
                    }                                                    
            -

        {charTag(FifthCharacter, "neutral")}:                   Ricorda {player_name}: sei una guida, ma sta alla persona decidere alla fine chi è, e di cosa ha bisogno.
                                                                Anche per questo non c'è un buon esito o un cattivo esito di una riscrittura.
        {charTag(FifthCharacter, "sorry")}:                     Ma mi permetterò comunque di darti dei feedback, per aiutarti nel tuo percorso.                                                    
        {charTag(FifthCharacter, "neutral")}:                   Quando te la senti, affronta questo ultimo passaggio e poi torna da me.
        
                -> mentor_closing_storylet ->
                -> main


//Commenti sui minigames
=== about_greenhouse
~ temp charNameFive = translator(fifthChar_ActualName)

    {charTag(FifthCharacter, "neutral")}:                       Sai {player_name}? La <b><i>serra</b></i> non è solo un bel posto dove rilassarsi.
    {charTag(FifthCharacter, "hurry")}:                         Tra i tanti modi per migliorare un rapporto con una persona, fare il dono giusto è forse il più immediato.
        {
            - firstChar_giftedObject != () or secondChar_giftedObject != () or thirdChar_giftedObject != ():
                                                                E vedo che hai già imparato come fare! Sei sempre un passo avanti.
            
            - else:
                {charTag(FifthCharacter, "neutral")}:           E ti consiglio di farlo, per facilitarti la vita.
        }
    {charTag(FifthCharacter, "neutral")}:                       Il dono giusto mostra comprensione, è la dimostrazione di aver ascoltato l'altra persona.
                                                                So chi sei.
        {
        - are_two_entities_together(SecondCharacter, PG):
            {charTag(SecondCharacter, "emotional")}:            Io so di essere una persona che vuole le caramelle.
                
        }

    {charTag(FifthCharacter, "neutral")}:                       Anche per questo esistono doni sbagliati.
    {charTag(FifthCharacter, "bored")}:                         O mediocri.
        {
            - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "annoyed")}:           Come sa chiunque riceva regali di Natale dai parenti. 
        }
        {
            - grimoire_appendices has tutorialGreenhouse:
            {charTag(FifthCharacter, "sad")}:                   Ma sicuramente te l'avrà spiegato meglio la tua amica Carla.
                {
                - are_two_entities_together(Carla, PG):
                {charTag(Carla, "bored")}:                      E a forza di domande mi ha fatto anche saltare il pranzo, maledizione!                                          
                }
        }
    {charTag(FifthCharacter, "hurry")}:                         La serra, con le sue piante magnifiche, è personalmente il posto migliore dove coltivare e recuperare doni.
    {charTag(FifthCharacter, "neutral")}:                       Gli effetti dei doni tra l'altro sono immediati e permanenti.
                                                                Ed è per questo che ogni riscrittorə può darne solo uno a persona.
    {charTag(FifthCharacter, "sorry")}:                         Qualcosa di così forte non può certo essere usato senza coscienza.


        -> mentor_closing_storylet ->
        -> main


=== about_kitchen
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

    {charTag(FifthCharacter, "bored")}:                         Una cucina su una palude?
                                                                Non la mia prima scelta.
    {charTag(FifthCharacter, "sad")}:                           Non mi fa impazzire che tu vada in luoghi così malmessi.
    {charTag(FifthCharacter, "neutral")}:                       Ma l'idea della cucina non è così cattiva in sé: cucinare assieme è un momento di intimità.
                                                                E mangiare è uno spazio di bella condivisione.
        {
        - tutorial_MentorTutorial == true:
        {charTag(FifthCharacter, "hurry")}:                     E magari puoi aggiungere anche l'ingrediente giusto, e far felice la persona con cui stai ai fornelli.
        }                                                        
                                                                
        {
        - are_two_entities_together(FirstCharacter, PG):
        {charTag(FirstCharacter, "curious")}:                   Ci facciamo una pastasciutta assieme, {charNameFive}?
        {charTag(FifthCharacter, "hurry")}:                     Magari più tardi?
        {charTag(FifthCharacter, "sorry")}:                     Ho da pulire la cera delle candele.
                
        } 
    {charTag(FifthCharacter, "neutral")}:                       Passare del tempo in cucina con qualcunə può essere un bel modo per conoscervi meglio.
        
        {
        - tutorial_MentorTutorial == true:
        {charTag(FifthCharacter, "neutral")}:                   E per capire che piega stia prendendo la vostra relazione.
        }    

        {
        - are_two_entities_together(SecondCharacter, PG): 
        {charTag(SecondCharacter, "energy")}:                   O per bruciare cose strane e vedere cosa succede!
                
        }
    
        -> mentor_closing_storylet ->
        -> main


=== about_nest
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    
    
    {charTag(FifthCharacter, "neutral")}:                       Ho visto che {charNameThree} ha trovato il modo di sbloccarti l'accesso al nido.
    {charTag(FifthCharacter, "hurry")}:                         Non posso certo dire che le persone qui non si diano da fare, ed è una bella cosa.
            {
            - are_two_entities_together(ThirdCharacter, PG):
            {charTag(ThirdCharacter, "jester")}:                Sono o non sono il migliore, zia?
            {charTag(FifthCharacter, "hurry")}:                 Sicuramente sei il più sfacciato, {charNameThree}.
            }
    {charTag(FifthCharacter, "neutral")}:                       Ho dei sentimenti contrastanti verso quello che si può fare su quella spiaggia.
    {charTag(FifthCharacter, "sad")}:                           Da una parte i Sigilli mi danno l'impressione di essere una forma di controllo.
    {charTag(FifthCharacter, "neutral")}:                       Ma la prima cosa che pensato vedendoli, è che rendano la comunicazione più chiara.
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
        {
            - are_two_entities_together(ThirdCharacter, PG):
            {charTag(ThirdCharacter, "jester")}:                Su, un po' di lavoro non ha mai ammazzato nessuno.
            {charTag(FifthCharacter, "neutral")}:               Ma nemmeno un po' di riposo.
            }

        -> mentor_closing_storylet ->
        -> main


 
=== first_char_new_mail
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    


        {charTag(FifthCharacter, "hurry")}:                     Sembra che {charNameOne} ti abbia scritto una lettera, {player_name}! 
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
    
    
        {charTag(FifthCharacter, "hurry")}:                     Sembra che {charNameTwo} ti abbia scritto una lettera, {player_name}! 
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
    
    
        {charTag(FifthCharacter, "bored")}:                     {charNameThree} ti ha scritto una lettera, {player_name}!
                                                                Che faccia tosta.
                                                                
        {
            - entity_location(PG) == TrainStop:
                                                                L'ha con sé quella cagnolina!
                
            - else:
                                                                La trovi alla fermata del treno.
        }

        -> main
   