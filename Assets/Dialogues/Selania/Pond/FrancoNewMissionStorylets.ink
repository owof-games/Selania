/*****************************

        Avvio commissioni

****************************/ 
=== mission_one
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
        {charTag(Franco, "{portrait_Franco()}")}:       Vediamo vediamo vediamo.
                                                        Interessante.
                                                        Ho dimenticato di ordinare del punteruolo.
                                                        Devo assolutamente passare a prenderlo da qualche parte, prima che Tullio se ne accorga.
                                                        Ehi, {player_name}!
                                                        Volevi qualcosa?
                                                        Ah sì è vero.
                                                        Vediamo un po' cosa farti fare.
                                                        Questa è facile.
                                                        Mi diceva zio Gracco che hai trovato un libro.
                                                        Ma che non lo stai leggendo molto.
                                                        E come dico sempre ai gemelli: sapere è podere.
                                                        E se il podere ha uno stagno, allora c'è una rana.
                                                        E se c'è una rana, sarà felice di sapere anche lei che {player_name} ha letto il suo libro.
                                                        Per cui girino: leggi un po' del tuo libro e poi torna da me.

            @animation:RewriterBook
             -> main

=== mission_two
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
        {charTag(Franco, "{portrait_Franco()}")}:       L'avresti mai detto?
                                                        I girini sono future rane.
                                                        Ma se si lanciano sulla terra, non sanno respirare.
                                                        Da piccolo ci ho provato, e mamma Craazia mi ha detto: "Franco, hai il fango sugli occhi! Svegliati!"
                                                        Poi mi sono lavato via il fango e ci ho riprovato.
                                                        A quel punto è arrivato zio Gracco, che mi ha detto: "Non ti azzardare a rifare la algonara con la panna!"
                                                        E mi ha ributtato in acqua.
                                                        Ma c'è una lettera delle formiche!
                                                        "Ci servono più piante in serra, è di vitale importanza!"
                                                        Ah, le formiche.
                                                        Il rapporto tra me e loro è un po' complicato perché.
                                                        Insomma.
                                                        Di solito le rane mangiano le formiche.
                                                        Ma poi Giulio mi ha fatto diventare vegetariano.
                                                        Ma loro comunque non si fidano.
                                                        Giulio dice sempre: "Con l'arrivo dei gemelli dovremmo fare le formiche, non comprare cose inutili!"
                                                        E allora scavo dei cunicoli per tutto lo stagno.
                                                        E lui mi bacia sulla testa e mi dice: "Fortuna che ti amo."
                                                        Anche io lo amo tanto.
                                                        Per cui facciamo le formiche.
                                                        E facciamole felici: torna quando avrai coltivato almeno tre piante!

            @animation:RewriterBook
                -> main
    

    
=== mission_three
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
        {charTag(Franco, "{portrait_Franco()}")}:       Questa è facile.
                                                        Mi raccomando Franco, non distrarti.
                                                        La nostra amica comune, hai presente no?
                                                        Quella che ci spiega le cose.
                                                        La voce.
                                                        Ecco.
                                                        Mi ha spiegato tante cose su {mentorName}.
                                                        Sapevi ad esempio che può respirare fino a due minuti sott'acqua?
            {
                - are_two_entities_together(Mentor, PG):
                    {charTag(Mentor, "hurry")}:             Eh?
            }
            {
                - are_two_entities_together(FirstCharacter, PG):
                    Questa me la voglio godere tutta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
            }
        {charTag(Franco, "{portrait_Franco()}")}:       E che mangia solo pesce?
                                                        E che le piace giocare?
            {
                - are_two_entities_together(SecondCharacter, PG):
                    IM-POS-SI-BI-LE!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    {
                        - are_two_entities_together(Mentor, PG):
                            {charTag(Mentor, "hurry")}:             Guarda che sono bravissima a burraco!
                            Ma è una roba da vecchi!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    }
            }
        {charTag(Franco, "{portrait_Franco()}")}:       E che ha una tasca sotto l'ascella dove conserva le pietre che usa per rompere i gusci?
            {
                - are_two_entities_together(Mentor, PG):
                    {charTag(Mentor, "neutral")}:                   A dire il vero ne ho anche una in testa, dove raccolgo le sciocchezze dette dalle rane.
                    {charTag(Franco, "{portrait_Franco()}")}:       Ma le rana sono molto sagge, quindi non hai molto da raccogliere.
            }
                                                        E.
                                                        Uh, una lettera di Euforbo.
                                                        "Papà Franco, quella è la lontra, non {mentorName}."
                                                        Uh.
                                                        Euforbo.
                                                        È più furbo di un pesce rosso.
                                                        Ma {mentorName}.
                                                        Di cosa aveva bisogno {mentorName}?
        {charTag(TheWitch, witch_state())}:         <i>{mentorName} ama dare consigli per far star bene le persone.</i>
                                                        <i>{mentorName} crede di potere esistere solo quando si rende utile.</i>
        {charTag(Franco, "{portrait_Franco()}")}:       Esatto.
                                                        Quella roba lì.
                                                        Chiedile un consiglio.
                                                        E poi torna pure qui.
            {
                - are_two_entities_together(Mentor, PG):
                    {charTag(Mentor, "hurry")}:             Uh, che cosa carina, Franco!
            }
        {charTag(Franco, "{portrait_Franco()}")}:       Ma quindi non è {charNameOne} che fa il nido sugli alberi?
            {
                - are_two_entities_together(FirstCharacter, PG):
                    Esatto!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                    E poi ululo alla luna!
                    {charTag(Franco, "{portrait_Franco()}")}:       Devo subito avvisare Euforbo!
            }


            @animation:RewriterBook    
                -> main


=== mission_four
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        ~ change_entity_place(Mentor)
        {charTag(Franco, "{portrait_Franco()}")}:       Quando ero ancora un girino, mamma Craazia mi diceva sempre:
                                                        "Tuo fratello Clodoveo ha preso la mia intelligenza."
                                                        "Tua sorella Boemonda la bellezza di tuo padre."
                                                        E poi continuava così elencando tutt3 l3 mi3 centottantasei fradell3.
                                                        E infine.
                                                        "Tu, Franco. Hai delle belle pupille."
                                                        Mi piacciono le mie pupille, mi fanno vedere tante cose.
                                                        Cose strane.
                                                        E le cose strane vanno condivise, così le persone sanno cosa aspettarsi dal mondo.
                                                        Come quando ho scoperto che gli umani chiamano la mia pancia "tronco".
                                                        Come il tronco degli alberi.
                                                        E allora ho capito che noi rane nasciamo girini, diventiamo rane, e poi, quando siamo vecchie, alberi.
                                                        Bello, vero?
                                                        Il mondo è un po' una grande rana.
                                                        E allora stavo pensando: perché non racconti a {mentorName} qualcosa di strano che hai scoperto?
                                                        Sono sicuro che così si diverte, e magari si rilassa un poco.
                {
                    - are_two_entities_together(Mentor, PG):
                        {charTag(Mentor, "neutral")}:                   In effetti non sarebbe male rilassarmi un poco.
                }

        {charTag(Franco, "{portrait_Franco()}")}:       Io intanto vado a salutare bisnonno Ninfea.

            @animation:RewriterBook
                -> main


=== mission_five
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
        {charTag(Franco, "{portrait_Franco()}")}:       Tra qualche sera c'è il karaoke di cugina Sputt.
                                                        Non hai idea delle cose che accadono durante le sue feste, girino!
                                                        L'anno scorso ero così ubriaco di grappa d'alghe che ho addirittura...
                                                        Oh, mi vergogno a dirlo.
                                                        No, non posso dirlo.
                                                        Una cosa così stupida.
                                                        Ehi, una lettera di Tullio!
                                                        "Diglielo amore, ti supplico, diglielo e lascial{player_pronouns has him:o|{player_pronouns has her:a|ə}} andare."
                                                        Uh.
                                                        Insomma, {player_name}!
                                                        Ho <b>nuotato</b>!
                                                        Non è assurdo?
                                                        Una rana che nuota!
                                                        Quando l'ho raccontato ai girini, mi hanno preso per pazzo!
                                                        Quest'anno ho promesso che non toccherò la grappa.
                                                        Niente, zero.
                                                        Sennò chissà cosa farò.
                                                        Magari mi metto addirittura a <b>saltare</b>!
                                                        Te la immagini, girino?
                                                        Una rana che salta?
                                                        Ma c'è una lettera di Giulio.
                                                        "Da{player_pronouns has him:gli|{player_pronouns has her:lle|llə}} la commissione, Franco, abbi pietà per quella povera creatura!"
                                                        Oggi i mariti sono un po' nervosetti.
                                                        Pensavo comunque {player_name}: perché non provi a parlare con due persone quando sono assieme?
                                                        Sono abbastanza sicuro che succederà qualcosa di interessante.
            {
                - are_two_entities_together(SecondCharacter, PG):
                    Io parlo sempre di cose grandi!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
            }

            {
                - are_two_entities_together(FirstCharacter, PG):
                    Cose metafisiche proprio.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                        
            }
        {charTag(Franco, "{portrait_Franco()}")}:       Magari anche loro si mettono a nuotare!

        @animation:RewriterBook    
            -> main


=== mission_six
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
        {charTag(Franco, "{portrait_Franco()}")}:       Prima c'è stato l'incontro tra genitori e insegnanti.
                                                        Non è facilissimo quando ci sono così tanti girini in giro.
                                                        "Girini in giro", suona bene!
                                                        Potrei farci una canzone trap!
                                                        "Girano i girini col girello nel girotondo".
                                                        "Girano e si agitano e smuovono il fondo!"
                                                        "Sono profondo!"
                                                        E poi?
                                                        "Ah."
                                                        O è meglio "Yeah"?
                                                        Ah no, stavo parlando dell'incontro con gli insegnanti.
                                                        Ci sono anni in cui un incontro dura settimane.
                                                        Una volta c'erano così tanti girini che abbiamo avuto più tempo speso all'incontro che non con le lezioni.
                                                        Ora però ci sono classi più piccole.
                                                        Soprattutto dopo <b>quel</b> fattaccio con l'airone.
                                                        Glielo avevano detto tutti a zio Gracco che non aveva davvero la faccia da critico gastronomico.
                                                        Poveri girini.
                                                        Però poteva andare peggio, per fortuna ci ha aiutato la nostra amica comune.
                                                        E visto che alcune cose sono cambiate, perché non provi a parlarle direttamente?
                                                        La trovi dalle parti della discarica.
            {
                - are_two_entities_together(SecondCharacter, PG):
                    C'è qualcuno nella discarica?!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                        
            }

            {
                - are_two_entities_together(FirstCharacter, PG):
                    C'è un'altra persona qui in giro?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                        
            }

            {
                - are_two_entities_together(Mentor, PG):
                    {charTag(Mentor, "bored")}:             C'è una discarica?!?
                        
            }
        {charTag(Franco, "{portrait_Franco()}")}:       Credo.
                                                        Come dice sempre zia Graaak: "Chi va piano non arriva lontano."
                                                        O era qualcosa sulla minestra?
                                                        A dopo girino!

            @animation:RewriterBook     
                -> main


=== mission_seven
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
        {charTag(Franco, "{portrait_Franco()}")}:       Mannaggina che sonno, girino.
                                                        Ma sai una cosa?
                                                        Mi diceva Dora che c'è della posta per te in stazione.
                                                        Perché non vai a vedere, e poi torni da me?
                                                        Intanto mi faccio un pisolino.
                                                        Uh, una lettera di zio Gracco!
                                                        "Franco, c'è questo tizio che sembra un recensore magnifico!"
                                                        "E ha definito i miei lombrichi all'amatriciana "sublimi"!"
                                                        "Deve avere ovviamente buon gusto."
                                                        "Avrebbe bisogno di un po' di spazio per dormire, ma qui stiamo attendendo una nuova schiusa."
                                                        "Non è che puoi ospitarlo tu?"
                                                        "Si firma Signor Gufo de Predatoris."
                                                        "Puoi contattarlo tramite la carpa della sera."
                                                        "Anche se l'ultima è sparita da qualche giorno."
                                                        Mmm.
                                                        Che cosa strana.
                                                        Non dovrebbe essere "Signore Gufo" invece di "Signor Gufo"?
                                                        Sennò è come se dicessi "Ciao, sono la Ran Franco", no?
                                                        Mi devo fidare?
                                                            +  \ {charTag(PG, "neutral")}:         No!
                                                            +  \ {charTag(PG, "neutral")}:         No?!?
                                                            +  \ {charTag(PG, "neutral")}:         NO!
                                                            +  \ {charTag(PG, "neutral")}:         NOOOOOOO!
                                                            +  \ {charTag(PG, "neutral")}:         Franco, per fortuna che sei divertente. Ma no.
                                                            -
                                                        Come dice il detto?
                                                        "{player_pronouns has him:Il riscrittore|{player_pronouns has her:La riscrittora|Lə riscrittorə}} ha sempre ragione!"
                                                        Povero zio Gracco.
                                                        Spera sempre di diventare famoso.
                                                        A dopo {player_name}!

            @animation:RewriterBook    
                -> main

=== mission_eight
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
        {charTag(Franco, "{portrait_Franco()}")}:       Euforbo ha portato a casa una pulce d'acqua.
                                                        La maestra vuole che imparino a prendersi cura di altre forme di vita.
                                                        Gli altri gemelli hanno già divorato le loro pulci, ma Euforbo ha un altro cuore.
                                                        Che un po' è ovvio: non è che potrebbe condividere il cuore con un altro gemello.
                                                        O con Tullio.
                                                        O con Giulio.
                                                        O con me.
                                                        Anche se Tullio mi dice sempre "Ti ho nel cuore".
                                                        Che è una cosa che un po' mi confonde.
                                                        Come quando Giulio dice "Euforbo ha la testa sulle spalle."
                                                        Ma è un girino, al massimo ha la testa sull'addome.
                                                        A volte quando condivido questi dubbi, Euforbo mi bacia sulla fronte e mi dice: "Papà, perché non torni a scuola?"
                                                        Mamma Craazia diceva sempre che prendo tutto alla lettera.
                                                        Forse per questo mi scrivono così spesso.
                                                        Ma a proposito di scrivere!
                                                        I topi della biblioteca hanno bisogno di un po' di movimento.
                                                        Perché non sposti qualche racconto, e magari lo leggi?
                                                        Così sono felici.
                                                        I racconti.
                                                        E i topi.
                                                        E forse anche le lettere.
                                                        Uh, è da un po' che non mi scrivono.
        
            @animation:RewriterBook  
                -> main

=== mission_nine
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
        {charTag(Franco, "{portrait_Franco()}")}:       Mi è arrivata una lettera dall'Accademia dei Bei Party.
                                                        "Esimio dottor Franco Lelio Arpagone Romualdo Arcezio Nepomiceno Alcuino."
                                                        "Le scriviamo in merito alla sua applicazione fatta per le veci del signor Giulio Igidio Liutprando Rigoberto Odovilio Sulpicio Policarpo Oruccio."
                                                        "E per l'ottava volta le ripetiamo che, per quanto apprezziamo gli sforzi del signor Giulio Il Rospo, noi siamo un'agenzia di viaggi e NON"
                                                        "E ripetiamo NON"
                                                        "Un'accademia di pittura."
                                                        "Per cui NO, non abbiamo borse di studio per il signor Giulio Il Rospo e"
                                                        "NO, non doniamo blocchi di marmo di Craackrara"
                                                        "E NO, non è che escludiamo il signor Giulio Il Rospo dai nostri corsi per un pregiudizio contro le rane."
                                                        "Ma noi non facciamo corsi di alcun tipo perché noi siamo una AGENZIA DI VIAGGI!"
                                                        "Se le interessa, abbiamo un pacchetto famiglia molto conveniente per l'isola dei serpenti."
                                                        "Cordialmente."
                                                        "Lo staff ABP."
                                                        "PS: e comunque i ritratti del signor Giulio Il Rospo sono brutti."
                                                        {player_name}, questa Accademia è così esclusiva!
                                                        Sono due anni che provo a coronare il sogno di Giulio di diventare pittore.
                                                        Tutto questo è crudele.
                                                        Potrei forse andare a parlare loro di persona?
                                                        Nel mentre ti chiedo un favore: ho appeso uno dei suoi ritratti nella tua camera.
                                                        Ti andrebbe di darci un'occhiata e dirmi cosa ne pensi?
                                                        Nel mentre rispondo all'Accademia.
                                                        "Cara Accademia dei Bei Party."
                                                        "Sono sicuro che possiamo raggiungere un accordo per far accedere mio marito ai vostri corsi."
                                                        "Vi piacciono le nocciole?"

            @animation:RewriterBook  
                -> main



=== mission_ten
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
        {charTag(Franco, "{portrait_Franco()}")}:       Ti svelo un segreto.
                                                        Sapevi che Franco, questo Franco, non un altro Franco, tipo Franco il postino o Franco il cugino di Pino.
                                                        E neanche quel cugino Franco che ha deciso di fare il poliziotto, e allora zia Graaak l'ha buttato fuori di casa.
                                                        No no, questo Franco che vedi qui davanti a te, lo sapevi che è un socio MENSA?
                                                        Non è che la cosa mi rende molto orgoglioso: è un po' snob come posto.
                                                        E poi non penso capiscano proprio proprio bene che il test per entrare è pieno di limiti.
                                                        E che magari non è che una rana non ce la fa ad entrarci perché è stupida, ma perché è una poveraccia.
                                                        Però l'ho fatto perché zio Gracco insisteva.
                                                        Dice che è fondamentale per trovare certi tipi di lavoro.
                                                        E io continuo a dirglielo che non voglio lavorare.
                                                        Soprattutto non in cucina.
                                                        Che è difficilissimo mettere l'ingrediente giusto.
                                                        E al MENSA hanno i corsi per gli ingredienti.
                                                        E anche per scegliere i mestoli.
                                                        Mica per niente si chiama Mestolo, Erbazzone, Nocciola: Scegliere Accuratamente.
                                                        Se gli dico che non mi piacciono le nocciole, mi tolgono la tessera?
                                                        Però so che tu sai fare le scelte giuste, {player_name}.
                                                        Per cui la tua prossima commissione è: quando sarai in cucina con un'altra persona, aggiungi un ingrediente extra.
                                                        E poi torna da me.

            @animation:RewriterBook  
                -> main

//Missioni speciali, con script ad hoc per dare premi o cose del genere.
=== special_mission_one
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
        {charTag(Franco, "{portrait_Franco()}")}:       Girino!
                                                        Mi serve un favore enorme, grande almeno quanto il cuore di zia Graaak.
                                                        Che il medico dice che è un problema.
                                                        Il cuore, non zia Graak.
                                                        Lei è adorabile, quando non mi sgrida.
                                                        E ora mi sgriderebbe perché ho perso il filo.
                                                        Vediamoci sulla spiaggia!

        ~ move_entity(earthGlyph, Nest)
        ~ move_entity(Franco, Nest)
        
    @animation:RewriterBook    
    -> main
    
=== special_mission_one_contents
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        {charTag(Franco, "{portrait_Franco()}")}:       Eccoti girino!
                                                        Questa è una cosa molto delicata, per cui promettimi che la terrai per te.
                                                        E per me ovviamente, perché se la tieni solo per te me la dimentico, e quello sì che diventerebbe un problema.
                                                        Si tratta di Euforbo.
                                                        Le maestre sono preoccupate.
                                                        Dicono che è molto intelligente. 
                                                        Sa tipo come respirare sott'acqua e ha anche trovato un modo per gracchiare senza sputare, e conosce tutto delle salamandre.
                                                        Ma non sa come esprimere bene le sue emozioni, si agita tantissimo quando prova a dirle e poi si zittisce tutto.
                                                        Mi si rompe il cuore quando lo vedo così.
                                                        Ma la nostra amica comune mi ha detto che ci sono questi sigilli che non servono per chiudere le cose ma per aprirle.
                                                        Che quindi sarebbero delle chiavi, no?
                                                        Anche se pure le chiavi chiudono e aprono.
                                                        Quindi forse dei grimaldelli?
                                                        Che poi ho visto che mi ha dato un sasso, quel sasso lì nuovo che vedi.
                                                        E i sassi aprono anche le teste con un po' di forza.
                                                        Ma non voglio metterci le emozioni dentro a Euforbo, voglio che le sappia dire.
                                                        E mi ha detto "crediamo che con questo tipo di glifo all'inizio, {player_name} possa scoprire un sigillo adatto per aiutare Euforbo".
        {charTag(TheWitch, witch_state())}:         Confermiamo. 
        {charTag(Franco, "{portrait_Franco()}")}:       Mi fido di lei, non mi ha detto molto altro.
                                                        E non so cosa faranno quei sigilli di preciso, ma mi sono ricordato di quando Euforbo era piccolo e non voleva nuotare.
                                                        Poi l'abbiamo lasciato da solo quando abbiamo traslocato verso la nuova corrente e ha imparato da solo.
                                                        Un pezzo alla volta.
                                                        E quindi mi sa che se ci dai un sigillo così, bello o brutto che sia, alla fine è come il primo colpo di pinna, e poi lui sa meglio come dirle le cose.
                                                        Creane uno, io me lo prendo e poi glielo dono e vediamo che succede.
                                                        Grazie, girino!

    @animation:RewriterBook  

    -> main


=== special_mission_two
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        {charTag(Franco, "{portrait_Franco()}")}:       Girino!
                                                        Ho una sorpresa per te!
                                                        Troviamoci in cucina.
                                                        Ma non "nella" cucina.
                                                        Sul pontile.
                                                        Perché se ci mettiamo nella cucina, poi finisce che si cuoce.
                                                        Come la rana nella pentola, hai presente?
                                                        Quella che era nell'acqua.
                                                        Poi l'acqua ha iniziato a bollire.
                                                        E poi le hai detto "Ma se facessi pagare per questa esperienza?"
                                                        E così ha aperto degli stabilimenti termali in una vecchia cucina.
                                                        Ma nessuno ci è andato.
                                                        Perché nessuna rana vuole davvero bollire.
                                                        E perché poi le rane odiano gli imprenditori.
                {
                    - are_two_entities_together(FirstCharacter, PG):
                        Allora sono una rana.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                        {charTag(Franco, "{portrait_Franco()}")}:       Ma sai nuotare?
                        No.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                        {charTag(Franco, "{portrait_Franco()}")}:       Allora sei una rana, sicuro!
                        
                }

        {charTag(Franco, "{portrait_Franco()}")}:       Ci vediamo in cucina!

        ~ move_entity(Franco, Kitchen)
        ~ kitchen_kitchenOccupied = true
        @animation:RewriterBook    
        -> main
    