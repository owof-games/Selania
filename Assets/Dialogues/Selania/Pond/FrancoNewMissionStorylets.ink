/*****************************

        Avvio commissioni

****************************/ 
=== mission_one
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    
    
        {charTag(Franco, "question")}:                  Vediamo vediamo vediamo.
        {charTag(Franco, "neutral")}:                   Interessante.
                                                        Ho dimenticato di ordinare del punteruolo.
                                                        Devo assolutamente passare a prenderlo da qualche parte, prima che Tullio se ne accorga.
        {charTag(Franco, "party")}:                     Ehi, {player_name}!
        {charTag(Franco, "question")}:                  Volevi qualcosa?
        {charTag(Franco, "neutral")}:                   Ah sì è vero.
        {charTag(Franco, "question")}:                  Vediamo un po' cosa farti fare.
        {charTag(Franco, "neutral")}:                   Questa è facile.
        {charTag(Franco, "party")}:                     Mi diceva zio Gracco che hai trovato un libro.
        {charTag(Franco, "question")}:                  Ma che non lo stai leggendo molto.
        {charTag(Franco, "party")}:                     E come dico sempre ai gemelli: sapere è podere.
                                                        E se il podere ha uno stagno, allora c'è una rana.
                                                        E se c'è una rana, sarà felice di sapere anche lei che {player_name} ha letto il suo libro.
        {charTag(Franco, "neutral")}:                   Per cui girino: leggi un po' del tuo libro e poi torna da me.

            //@animation:RewriterBook
             -> main

=== mission_two
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    
    
        {charTag(Franco, "question")}:                  L'avresti mai detto?
                                                        I girini sono future rane.
                                                        Ma se si lanciano sulla terra, non sanno respirare.
        {charTag(Franco, "neutral")}:                   Da piccolo ci ho provato, e mamma Craazia mi ha detto: "Franco, hai il fango sugli occhi! Svegliati!"
                                                        Poi mi sono lavato via il fango e ci ho riprovato.
                                                        A quel punto è arrivato zio Gracco, che mi ha detto: "Non ti azzardare a rifare la algonara con la panna!"
                                                        E mi ha ributtato in acqua.
        {charTag(Franco, "party")}:                     Ma c'è una lettera delle formiche!
        {charTag(Franco, "reading")}:	                "Ci servono più piante in serra, è di vitale importanza!"
        {charTag(Franco, "neutral")}:                   Ah, le formiche.
                                                        Il rapporto tra me e loro è un po' complicato perché.
                                                        Insomma.
                                                        Di solito le rane mangiano le formiche.
        {charTag(Franco, "party")}:                     Ma poi Giulio mi ha fatto diventare vegetariano.
        {charTag(Franco, "neutral")}:                   Ma loro comunque non si fidano.
                                                        Giulio dice sempre: "Con l'arrivo dei gemelli dovremmo fare le formiche, non comprare cose inutili!"
                                                        E allora scavo dei cunicoli per tutto lo stagno.
                                                        E lui mi bacia sulla testa e mi dice: "Fortuna che ti amo."
        {charTag(Franco, "party")}:                     Anche io lo amo tanto.
                                                        Per cui facciamo le formiche.
                                                        E facciamole felici: torna quando avrai coltivato almeno tre piante!

            //@animation:RewriterBook
                -> main
    

    
=== mission_three
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    
        {charTag(Franco, "neutral")}:                   Questa è facile.
                                                        Mi raccomando Franco, non distrarti.
        {charTag(Franco, "question")}:                  La nostra amica comune, hai presente no?
                                                        Quella che ci spiega le cose.
        {charTag(Franco, "neutral")}:                   La voce.
                                                        Ecco.
        {charTag(Franco, "party")}:                     Mi ha raccontato tante cose su {charNameFive}.
        {charTag(Franco, "question")}:                  Sapevi ad esempio che può respirare fino a due minuti sott'acqua?
            {
                - are_two_entities_together(Mentor, PG):
                    {charTag(FifthCharacter, "hurry")}:         Eh?
            }
            {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "curious")}:       Questa me la voglio godere tutta. 
            }
        {charTag(Franco, "question")}:                  E che mangia solo pesce?
                                                        E che le piace giocare?
            {
            - are_two_entities_together(SecondCharacter, PG):
            {charTag(SecondCharacter, "neutral")}:          IM-POS-SI-BI-LE!
            {
                - are_two_entities_together(Mentor, PG):
            {charTag(FifthCharacter, "hurry")}:             Guarda che sono bravissima a burraco!
            {charTag(SecondCharacter, "neutral")}:          Ma è una roba da vecchi!
            }
            }
        {charTag(Franco, "question")}:                  E che ha una tasca sotto l'ascella dove conserva le pietre che usa per rompere i gusci?
            {
            - are_two_entities_together(Mentor, PG):
            {charTag(FifthCharacter, "neutral")}:           A dire il vero ne ho anche una in testa, dove raccolgo le sciocchezze dette dalle rane.
            {charTag(Franco, "neutral")}:                   Ma le rana sono molto sagge, quindi non hai molto da raccogliere.
            }
        {charTag(Franco, "neutral")}:                   E.
                                                        Uh, una lettera di Euforbo.
                                                        "Papà Franco, quella è la lontra, non {charNameFive}."
                                                        Uh.
                                                        Euforbo.
        {charTag(Franco, "party")}:                     È più furbo di un pesce rosso.
        {charTag(Franco, "neutral")}:                   Ma {charNameFive}.
        {charTag(Franco, "question")}:                  Di cosa aveva bisogno {charNameFive}?
        {charTag(TheWitch, witch_state())}:             <i>{charNameFive} ama dare consigli per far star bene le persone.</i>
                                                        <i>{charNameFive} crede di potere esistere solo quando si rende utile.</i>
        {charTag(Franco, "neutral")}:                   Esatto.
                                                        Quella roba lì.
        {charTag(Franco, "party")}:                     La farà felice.
                                                        Fallo.
                                                        E poi torna pure qui.
            {
            - are_two_entities_together(Mentor, PG):
                {charTag(FifthCharacter, "hurry")}:         Fai cosa? Fai cosa, {player_name}?
            }
        {charTag(Franco, "question")}:                  Ma quindi non è {charNameOne} che fa il nido sugli alberi?
            {
            - are_two_entities_together(FirstCharacter, PG):
            {charTag(FirstCharacter, "curious")}:           Esatto! 
                                                            E poi ululo alla luna!
            {charTag(Franco, "neutral")}:                   Devo subito avvisare Euforbo!
            }


            //@animation:RewriterBook    
                -> main


=== mission_four
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

        {charTag(Franco, "neutral")}:                   Quando ero ancora un girino, mamma Craazia mi diceva sempre:
                                                        "Tuo fratello Clodoveo ha preso la mia intelligenza."
                                                        "Tua sorella Boemonda la bellezza di tuo padre."
                                                        E poi continuava così elencando tuttə lə miə centottantasei fradellə.
                                                        E infine.
                                                        "Tu, Franco. Hai delle belle pupille."
        {charTag(Franco, "party")}:                     Mi piacciono le mie pupille, mi fanno vedere tante cose.
                                                        Cose strane.
        {charTag(Franco, "neutral")}:                   E le cose strane vanno condivise, così le persone sanno cosa aspettarsi dal mondo.
                                                        Come quando ho scoperto che gli umani chiamano la mia pancia "tronco".
        {charTag(Franco, "party")}:                     Come il tronco degli alberi.
                                                        E allora ho capito che noi rane nasciamo girini, diventiamo rane, e poi, quando siamo vecchie, alberi.
                                                        Bello, vero?
                                                        Il mondo è un po' una grande rana.
        {charTag(Franco, "question")}:                  E allora stavo pensando: perché non racconti a {charNameFive} qualcosa di strano che hai scoperto?
        {charTag(Franco, "party")}:                     Sono sicuro che così si diverte, e magari si rilassa un poco.
    {
        - are_two_entities_together(Mentor, PG):
        {charTag(FifthCharacter, "neutral")}:           In effetti non sarebbe male rilassarmi un poco.
    }

        {charTag(Franco, "neutral")}:                   Io intanto vado a salutare bisnonno Ninfeo.

            //@animation:RewriterBook
                -> main


=== mission_five
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
        {charTag(Franco, "neutral")}:                   Tra qualche sera c'è il karaoke di cugina Sputt.
        {charTag(Franco, "party")}:                     Non hai idea delle cose che accadono durante le sue feste, girino!
                                                        L'anno scorso ero così ubriaco di grappa d'alghe che ho addirittura...
                                                        Oh, mi vergogno a dirlo.
        {charTag(Franco, "neutral")}:                   No, non posso dirlo.
                                                        Una cosa così stupida.
        {charTag(Franco, "party")}:                     Ehi, una lettera di Tullio!
        {charTag(Franco, "reading")}:	                "Diglielo amore, ti supplico, diglielo e lascial{player_pronoun has him:o|{player_pronoun has her:a|ə}} andare."
        {charTag(Franco, "neutral")}:                   Uh.
                                                        Insomma, {player_name}!
        {charTag(Franco, "party")}:                     Ho <b>nuotato</b>!
        {charTag(Franco, "question")}:                  Non è assurdo?
        {charTag(Franco, "party")}:                     Una rana che nuota!
                                                        Quando l'ho raccontato ai girini, mi hanno preso per pazzo!
        {charTag(Franco, "neutral")}:                   Quest'anno ho promesso che non toccherò la grappa.
                                                        Niente, zero.
                                                        Sennò chissà cosa farò.
        {charTag(Franco, "party")}:                     Magari mi metto addirittura a <b>saltare</b>!
        {charTag(Franco, "question")}:                  Te la immagini, girino?
                                                        Una rana che salta?
        {charTag(Franco, "neutral")}:                   Ma c'è una lettera di Giulio.
        {charTag(Franco, "reading")}:	                "Da{player_pronoun has him:gli|{player_pronoun has her:lle|llə}} la commissione, Franco, abbi pietà per quella povera creatura!"
        {charTag(Franco, "question")}:	                Oggi i mariti sono un po' nervosetti.
        {charTag(Franco, "neutral")}:                   Pensavo comunque {player_name}: perché non provi a parlare con due persone quando sono assieme?
                                                        Sono abbastanza sicuro che succederà qualcosa di interessante.
                                                        E a volte, quando non c'è comprensione, una voce esterna può essere di grande aiuto.
            {
                - are_two_entities_together(SecondCharacter, PG):
                    {charTag(SecondCharacter, "energy")}:       Io parlo sempre di cose grandi!
            }

            {
                - are_two_entities_together(FirstCharacter, PG):
                    {charTag(FirstCharacter, "annoyed")}:       Diremo cose metafisiche proprio.
                        
            }
        {charTag(Franco, "party")}:                     Magari anche loro si mettono a nuotare!

        //@animation:RewriterBook    
            -> main


=== mission_six
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    
    
        {charTag(Franco, "neutral")}:                   Prima c'è stato l'incontro tra genitori e insegnanti.
                                                        Non è facilissimo quando ci sono così tanti girini in giro.
        {charTag(Franco, "party")}:                     "Girini in giro", suona bene!
                                                        Potrei farci una canzone trap!
                                                        "Girano i girini col girello nel girotondo".
                                                        "Girano e si agitano e smuovono il fondo!"
                                                        "Sono profondo!"
        {charTag(Franco, "question")}:                  E poi?
        {charTag(Franco, "party")}:                     "Ah."
        {charTag(Franco, "question")}:                  O è meglio "Yeah"?
        {charTag(Franco, "neutral")}:                   Ah no, stavo parlando dell'incontro con gli insegnanti.
                                                        Ci sono anni in cui un incontro dura settimane..
                                                        Ora però ci sono classi più piccole.
                                                        Soprattutto dopo <b>quel</b> fattaccio con l'airone.
                                                        Glielo avevano detto tutti a zio Gracco che non aveva davvero la faccia da critico gastronomico.
                                                        Poveri girini.
        {charTag(Franco, "party")}:                     Però poteva andare peggio, per fortuna ci ha aiutato la nostra amica comune.
                                                        E visto che alcune cose sono cambiate, perché non provi a parlarle direttamente?
        {charTag(Franco, "neutral")}:                   La trovi dalle parti della discarica.
                                                        Credo potrebbe farti del bene conoscerla direttamente.
            {
            - are_two_entities_together(SecondCharacter, PG):
                {charTag(SecondCharacter, "emotional")}:        C'è qualcuno nella discarica?!
                        
            }

            {
            - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "curious")}:           C'è un'altra persona qui in giro? 
                        
            }

            {
            - are_two_entities_together(Mentor, PG):
                {charTag(FifthCharacter, "bored")}:             C'è una discarica?!?
                        
            }
            {
            - are_two_entities_together(ThirdCharacter, PG):
            {charTag(ThirdCharacter, "jester")}:                Voi la chiamate discarica, ma da me quello è il parco giochi comunale.
            }
        {charTag(Franco, "neutral")}:                   Come dice sempre zia Graaak: "Chi va piano non arriva lontano."
        {charTag(Franco, "question")}:                  O era qualcosa sulla minestra?
        {charTag(Franco, "neutral")}:                   A dopo girino!

            //@animation:RewriterBook     
                -> main


=== mission_seven
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    
    
        {charTag(Franco, "neutral")}:                   Mannaggina che sonno, girino.
        {charTag(Franco, "question")}:                  Ma sai una cosa?
        {charTag(Franco, "neutral")}:                   Mi diceva Dora l'ape che c'è della posta per te in stazione.
                                                        Perché non vai a vedere, e poi torni da me?
                                                        Intanto mi faccio un pisolino.
                                                        Uh, una lettera di zio Gracco!
        {charTag(Franco, "reading")}:	                "Franco, c'è questo tizio che sembra un recensore magnifico!"
                                                        "E ha definito i miei lombrichi all'amatriciana "sublimi"!"
                                                        "Deve avere ovviamente buon gusto."
                                                        "Avrebbe bisogno di un po' di spazio per dormire, ma qui stiamo attendendo una nuova schiusa."
                                                        "Non è che puoi ospitarlo tu?"
                                                        "Si firma Signor Gufo de Predatoris."
                                                        "Puoi contattarlo tramite la carpa della sera."
                                                        "Anche se l'ultima è sparita da qualche giorno."
        {charTag(Franco, "neutral")}:	                Mmm.
        {charTag(Franco, "question")}:                  Che cosa strana.
    {
    - are_two_entities_together(SecondCharacter, PG):
        {charTag(SecondCharacter, "emotional")}:        Più strana di Franco?
                                                        Franco la Rana Strana?
        {charTag(Franco, "party")}:                     Esatto!                                                 
    }                                                  
        {charTag(Franco, "question")}:                  Non dovrebbe essere "Signore Gufo" invece di "Signor Gufo"?
                                                        Sennò è come se dicessi "Ciao, sono la Ran Franco", no?
                                                        Mi devo fidare?
                                                            +  \ {charTag(PG, "neutral")}:         No!
                                                            +  \ {charTag(PG, "neutral")}:         No?!?
                                                            +  \ {charTag(PG, "neutral")}:         NO!
                                                            +  \ {charTag(PG, "neutral")}:         NOOOOOOO!
                                                            +  \ {charTag(PG, "neutral")}:         Franco, per fortuna che sei divertente. Ma no.
                                                            -
        {charTag(Franco, "question")}:                  Come dice il detto?
                                                        "{player_pronoun has him:Il riscrittore|{player_pronoun has her:La riscrittora|Lə riscrittorə}} ha sempre ragione!"
        {charTag(Franco, "neutral")}:                   Povero zio Gracco.
                                                        Spera sempre di diventare famoso.
                                                        A dopo {player_name}!

            //@animation:RewriterBook    
                -> main

=== mission_eight
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    
    
        {charTag(Franco, "neutral")}:                   Euforbo ha portato a casa una pulce d'acqua.
                                                        La maestra vuole che imparino a prendersi cura di altre forme di vita.
                                                        Gli altri gemelli hanno già divorato le loro pulci, ma Euforbo ha un altro cuore.
        {charTag(Franco, "question")}:                  Che un po' è ovvio: non è che potrebbe condividere il cuore con un altro gemello.
        {charTag(Franco, "neutral")}:                   O con Tullio.
                                                        O con Giulio.
                                                        O con me.
                                                        Anche se Tullio mi dice sempre "Ti ho nel cuore".
        {charTag(Franco, "question")}:                  Che è una cosa che un po' mi confonde.
        {charTag(Franco, "neutral")}:                   Come quando Giulio dice "Euforbo ha la testa sulle spalle."
        {charTag(Franco, "question")}:                  Ma è un girino, al massimo ha la testa sull'addome.
        {charTag(Franco, "neutral")}:                   A volte quando condivido questi dubbi, Euforbo mi bacia sulla fronte e mi dice: "Papà, perché non torni a scuola?"
                                                        Mamma Craazia diceva sempre che prendo tutto alla lettera.
                                                        Forse per questo mi scrivono così spesso.
                                                        Ma a proposito di scrivere!
                                                        I topi della biblioteca hanno bisogno di un po' di movimento.
        {charTag(Franco, "question")}:                  Perché non sposti qualche racconto, e magari lo leggi?
        {charTag(Franco, "party")}:                     Così sono felici.
                                                        I racconti.
                                                        E i topi.
                                                        E forse anche le lettere.
        {charTag(Franco, "question")}:                  Uh, è da un po' che non mi scrivono.
        
            //@animation:RewriterBook  
                -> main

=== mission_nine
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    
    
        {charTag(Franco, "neutral")}:                   Mi è arrivata una lettera dall'Accademia dei Bei Party.
        {charTag(Franco, "reading")}:	                "Esimio dottor Franco Lelio Arpagone Romualdo Arcezio Nepomiceno Alcuino."
                                                        "Le scriviamo in merito alla sua applicazione fatta per le veci del signor Giulio Igidio Liutprando Rigoberto Odovilio Sulpicio Policarpo Oruccio."
                                                        "E per l'ottava volta le ripetiamo che, per quanto apprezziamo gli sforzi del signor Giulio Il Rospo, noi siamo un'agenzia di viaggi e NON"
                                                        "E ripetiamo NON"
                                                        "Un'accademia di pittura."
                                                        "Per cui NO, non abbiamo borse di studio per il signor Giulio Il Rospo e"
                                                        "NO, non doniamo blocchi di marmo di Craackara"
                                                        "E NO, non è che escludiamo il signor Giulio Il Rospo dai nostri corsi per un pregiudizio contro le rane."
                                                        "Ma noi non facciamo corsi di alcun tipo perché noi siamo una AGENZIA DI VIAGGI!"
                                                        "Se le interessa, abbiamo un pacchetto famiglia molto conveniente per l'Isola dei Serpenti."
                                                        "Cordialmente."
                                                        "Lo staff ABP."
                                                        "PS: e comunque i ritratti del signor Giulio Il Rospo sono brutti."
        {charTag(Franco, "neutral")}:	                {player_name}, questa Accademia è così esclusiva!
        {charTag(Franco, "party")}:                     Sono due anni che provo a coronare il sogno di Giulio di diventare pittore.
        {charTag(Franco, "neutral")}:                   Tutto questo è crudele.
        {charTag(Franco, "question")}:                  Potrei forse andare a parlare loro di persona?
        {charTag(Franco, "party")}:                     Nel mentre ti chiedo un favore: ho appeso uno dei suoi ritratti nella tua camera.
        {charTag(Franco, "question")}:                  Ti andrebbe di darci un'occhiata e dirmi cosa ne pensi?
        {charTag(Franco, "neutral")}:                   Nel mentre rispondo all'Accademia.
                                                        "Cara Accademia dei Bei Party."
                                                        "Sono sicuro che possiamo raggiungere un accordo per far accedere mio marito ai vostri corsi."
                                                        "Vi piacciono le nocciole?"

            //@animation:RewriterBook  
                -> main



=== mission_ten
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    
    
        {charTag(Franco, "neutral")}:                   Ti svelo un segreto.
        {charTag(Franco, "question")}:                  Sapevi che Franco, questo Franco, non un altro Franco, tipo Franco il postino o Franco il cugino di Pino.
                                                        E neanche quel cugino Franco che ha deciso di fare il poliziotto, e allora zia Graaak l'ha buttato fuori di casa.
                                                        No no, questo Franco che vedi qui davanti a te, lo sapevi che è un socio MENSA?
                                                        Non è che la cosa mi rende molto orgoglioso: è un po' snob come posto.
                                                        E poi non penso capiscano proprio proprio bene che il test per entrare è pieno di limiti.
                                                        E che magari non è che una rana non ce la fa a superare il test perché è stupida, ma perché è una poveraccia.
        {charTag(Franco, "neutral")}:                   Però l'ho fatto perché zio Gracco insisteva.
                                                        Dice che è fondamentale per trovare certi tipi di lavoro.
                                                        E io continuo a dirglielo che non voglio lavorare.
                                                        Soprattutto non in cucina.
                                                        Che è difficilissimo mettere l'ingrediente giusto.
                                                        E al MENSA hanno i corsi per gli ingredienti.
                                                        E anche per scegliere i mestoli.
                                                        Mica per niente si chiama Mestolo, Erbazzone, Nocciola: Scegliere Accuratamente.
        {charTag(Franco, "question")}:                  Se gli dico che non mi piacciono le nocciole, mi tolgono la tessera?
        {charTag(Franco, "party")}:                     Però so che tu sai fare le scelte giuste, {player_name}.
        {charTag(Franco, "neutral")}:                   Per cui la tua prossima commissione è: quando sarai in cucina con un'altra persona, aggiungi un ingrediente extra.
                                                        E poi torna da me.
        {charTag(Franco, "party")}:                     Potresti fare molto felice la persona che cucina con te.

            //@animation:RewriterBook  
                -> main

//Missioni speciali, con script ad hoc per dare premi o cose del genere.
=== special_mission_one
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    
    
        {charTag(Franco, "party")}:                     Girino!
                                                        Mi serve un favore enorme, grande almeno quanto il cuore di zia Graaak.
        {charTag(Franco, "neutral")}:                   Che il medico dice che è un problema.
                                                        Il cuore, non zia Graaak.
        {charTag(Franco, "party")}:                     Lei è adorabile, quando non mi sgrida.
        {charTag(Franco, "neutral")}:                   E ora mi sgriderebbe perché ho perso il filo.
        {charTag(Franco, "party")}:                     Vediamoci sulla spiaggia!

        ~ move_entity(earthGlyph, Nest)
        ~ move_entity(Franco, Nest)
        
    //@animation:RewriterBook    
    -> main
    
=== special_mission_one_contents
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    

        {charTag(Franco, "party")}:                     Eccoti girino!
        {charTag(Franco, "neutral")}:                   Questa è una cosa molto delicata, per cui promettimi che la terrai per te.
                                                        E per me ovviamente, perché se la tieni solo per te me la dimentico, e quello sì che diventerebbe un problema.
                                                        Si tratta di Euforbo.
                                                        Le maestre sono preoccupate.
                                                        Dicono che è molto intelligente. 
        {charTag(Franco, "party")}:                     Sa tipo come respirare sott'acqua e ha anche trovato un modo per gracchiare senza sputare, e conosce tutto delle salamandre.
        {charTag(Franco, "neutral")}:                   Ma non sa come esprimere bene le sue emozioni, si agita tantissimo quando prova a dirle e poi si zittisce tutto.
                                                        Mi si rompe il cuore quando lo vedo così.
                                                        Ma la nostra amica comune mi ha detto che ci sono questi sigilli che non servono per chiudere le cose ma per aprirle.
        {charTag(Franco, "question")}:                  Che quindi sarebbero delle chiavi, no?
        {charTag(Franco, "neutral")}:                   Anche se pure le chiavi chiudono e aprono.
        {charTag(Franco, "question")}:                  Quindi forse dei grimaldelli?
                                                        Che poi ho visto che mi ha dato un sasso, quel sasso lì nuovo che vedi.
        {charTag(Franco, "neutral")}:                   E i sassi aprono anche le teste con un po' di forza.
                                                        Ma non voglio metterci le emozioni dentro a Euforbo, voglio che le sappia dire.
                                                        E mi ha detto "crediamo che con questo tipo di glifo all'inizio, {player_name} possa scoprire un sigillo adatto per aiutare Euforbo".
        {charTag(TheWitch, witch_state())}:             <i>Confermiamo.</i>
        {charTag(Franco, "neutral")}:                   Mi fido di lei, non mi ha detto molto altro.
                                                        E non so cosa faranno quei sigilli di preciso, ma mi sono ricordato di quando Euforbo era piccolo e non voleva nuotare.
                                                        Poi l'abbiamo lasciato da solo quando abbiamo traslocato verso la nuova corrente e ha imparato da solo.
                                                        Un pezzo alla volta.
                                                        E quindi mi sa che se ci dai un sigillo così, bello o brutto che sia, alla fine è come il primo colpo di pinna, e poi lui sa meglio come dirle le cose.
                                                        Creane uno, io me lo prendo e poi glielo dono e vediamo che succede.
        {charTag(Franco, "party")}:                     Grazie, girino!

    //@animation:RewriterBook  

    -> main


=== special_mission_two
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    

        {charTag(Franco, "party")}:                     Girino!
                                                        Ho una sorpresa per te!
                                                        Troviamoci in cucina.
        {charTag(Franco, "neutral")}:                   Ma non "nella" cucina.
                                                        Sul pontile.
                                                        Perché se ci mettiamo nella cucina, poi finisce che si cuoce.
        {charTag(Franco, "question")}:                  Come la rana nella pentola, hai presente?
        {charTag(Franco, "neutral")}:                   Quella che era nell'acqua.
                                                        Poi l'acqua ha iniziato a bollire.
        {charTag(Franco, "question")}:                  E poi le hai detto "Ma se facessi pagare per questa esperienza?"
        {charTag(Franco, "neutral")}:                   E così ha aperto degli stabilimenti termali in una vecchia cucina.
                                                        Ma nessuno ci è andato.
                                                        Perché nessuna rana vuole davvero bollire.
        {charTag(Franco, "party")}:                     E perché poi le rane odiano gli imprenditori.
{
    - are_two_entities_together(FirstCharacter, PG):
        {charTag(FirstCharacter, "affectionate")}:      Allora sono una rana.
        {charTag(Franco, "question")}:                  Ma sai nuotare?
        {charTag(FirstCharacter, "sad")}:               No.
        {charTag(Franco, "party")}:                     Allora sei una rana, sicuro!
        
}

        {charTag(Franco, "party")}:                     Ci vediamo in cucina!

        ~ move_entity(Franco, Safekeeping)
        ~ move_entity(FrancoCucina, Kitchen)
        ~ kitchen_kitchenOccupied = true
        //@animation:RewriterBook    
        -> main
    