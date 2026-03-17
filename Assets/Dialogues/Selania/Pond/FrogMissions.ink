//Missioni    
=== mission_one
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
        Vediamo vediamo vediamo.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
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

            ~ frog_currentMission += missionOne
            ~ frog_availableCommonMissions -= missionOne
            @animation:RewriterBook
             -> main

=== mission_two
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
        L'avresti mai detto?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
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

            ~ frog_currentMission += missionTwo
            ~ frog_availableCommonMissions -= missionTwo
            @animation:RewriterBook
                -> main
    

    
=== mission_three
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
        Questa è facile.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        Mi raccomando Franco, non distrarti.
        La nostra amica comune, hai presente no?
        Quella che ci spiega le cose.
        La voce.
        Ecco.
        Mi ha spiegato tante cose su {mentorName}.
        Sapevi ad esempio che può respirare fino a due minuti sott'acqua?
            {
                - are_two_entities_together(Mentor, PG):
                    Eh?#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
            }
            {
                - are_two_entities_together(FirstCharacter, PG):
                    Questa me la voglio godere tutta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
            }
        E che mangia solo pesce?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        E che le piace giocare?
            {
                - are_two_entities_together(SecondCharacter, PG):
                    IM-POS-SI-BI-LE!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    {
                        - are_two_entities_together(Mentor, PG):
                            Guarda che sono bravissima a burraco!#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                            Ma è una roba da vecchi!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                    }
            }
        E che ha una tasca sotto l'ascella dove conserva le pietre che usa per rompere i gusci?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            {
                - are_two_entities_together(Mentor, PG):
                    A dire il vero ne ho anche una in testa, dove raccolgo le sciocchezze dette dalle rane.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    Ma le rana sono molto sagge, quindi non hai molto da raccogliere.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            }
        E.
        Uh, una lettera di Euforbo.
        "Papà Franco, quella è la lontra, non {mentorName}."
        Uh.
        Euforbo.
        È più furbo di un pesce rosso.
        Ma {mentorName}.
        Di cosa aveva bisogno {mentorName}?
        <i>{mentorName} ama dare consigli per far star bene le persone.#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState #portrait: {witch_state()}
        <i>{mentorName} crede di potere esistere solo quando si rende utile.
        Esatto.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        Quella roba lì.
        Chiedile un consiglio.
        E poi torna pure qui.
            {
                - are_two_entities_together(Mentor, PG):
                    Uh, che cosa carina, Franco!#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
            }
        Ma quindi non è {charNameOne} che fa il nido sugli alberi?
            {
                - are_two_entities_together(FirstCharacter, PG):
                    Esatto!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                    E poi ululo alla luna!
                    Devo subito avvisare Euforbo!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
            }
            ~ frog_currentMission += missionThree
            ~ frog_availableCommonMissions -= missionThree
            @animation:RewriterBook    
                -> main


=== mission_four
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        ~ change_entity_place(Mentor)
        Quando ero ancora un girino, mamma Craazia mi diceva sempre:#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
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
                        In effetti non sarebbe male rilassarmi un poco.#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                }

        Io intanto vado a salutare bisnonno Ninfea.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral

            ~ frog_currentMission += missionFour
            ~ frog_availableCommonMissions -= missionFour
            @animation:RewriterBook
                -> main


=== mission_five
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
        Tra qualche sera c'è il karaoke di cugina Sputt.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
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
        "Dal{player_pronouns has him:gli|{player_pronouns has her:le|lə}} la missione, Franco, abbi pietà per quella povera creatura!"
        Oggi i mariti sono un po' nervosetti.
        Pensavo comunque {player_name}: perché non provi a parlare a {charNameOne} e {charNameTwo} quando sono assieme?
        Sono abbastanza sicuro che succederà qualcosa di interessante.
            {
                - are_two_entities_together(SecondCharacter, PG):
                    Noi due ci diciamo sempre cose grandi!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
            }

            {
                - are_two_entities_together(FirstCharacter, PG):
                    Cose metafisiche proprio.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                        
            }
        Magari anche loro si mettono a nuotare!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral

        ~ frog_currentMission += missionFive
        ~ frog_availableCommonMissions -= missionFive
        @animation:RewriterBook    
            -> main


=== mission_six
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
        Prima c'è stato l'incontro tra genitori e insegnanti.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
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
        Ci sono anni in cui un solo incontro dura settimane.
        Un anno c'erano così tanti girini che abbiamo avuto più tempo speso all'incontro che non con le lezioni.
        Ora però ci sono classi più piccole.
        Soprattutto dopo <b>quel</b> fattaccio con l'airone.
        Glielo avevano detto tutti a zio Gracco che non aveva davvero la faccia da critico gastronomico.
        Poveri girini.
        Però poteva andare peggio, per fortuna ci ha aiutato la nostra amica comune.
        E visto che alcune cose sono cambiate, perché non provi a parlarle direttamente?
        Vive nell'albero della foresta.
            {
                - are_two_entities_together(SecondCharacter, PG):
                    C'è qualcuno nell'albero!!!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_emotional
                        
            }

            {
                - are_two_entities_together(FirstCharacter, PG):
                    C'è qualcuno nell'albero???#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                        
            }

            {
                - are_two_entities_together(Mentor, PG):
                    C'è qualcuno nell'albero?!?#speaker:{fifthChar_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Influenced)} #portrait:mentore_bored
                        
            }
        Credo.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
        Come dice sempre zia Graaak: "Chi va piano non arriva lontano."
        O era qualcosa sulla minestra?
        A dopo girino!

            ~ frog_currentMission += missionSix
            ~ frog_availableCommonMissions -= missionSix
            @animation:RewriterBook     
                -> main


=== mission_seven
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
        Mannaggina che sonno, girino.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
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
            + No!
            + No?!?
            + NO!
            + NOOOOOOO!
            + Franco, per fortuna che sei divertente. Ma no.
            -
        Come dice il detto?
        "{player_pronouns has him:Il riscrittore|{player_pronouns has her:La riscrittora|Lə riscrittorə}} ha sempre ragione!"
        Povero zio Gracco.
        Spera sempre di diventare famoso.
        A dopo {player_name}!

            ~ frog_currentMission += missionSeven
            ~ frog_availableCommonMissions -= missionSeven
            @animation:RewriterBook    
                -> main

=== mission_eight
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
        Euforbo ha portato a casa una pulce d'acqua.#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
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
        
            ~ frog_currentMission += missionEight
            ~ frog_availableCommonMissions -= missionEight
            @animation:RewriterBook  
                -> main



//Missioni speciali, con script ad hoc per dare premi o cose del genere.


=== special_mission_one
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
        Avvio missione nest

        ~ move_entity(earthGlyph, Nest)
        ~ frog_currentMission += specialMissionOne
        ~ frog_availableSpecialMissions -= specialMissionOne
        ~ move_entity(Franco, Nest)
    @animation:RewriterBook    
    -> main
    
=== special_mission_one_closed

    Feedback missione nido conclusa.
    Hai trovato {sigils_translator(nest_francoChosenSigil)}
    Ora lo consumo e ti aggiorno i valori 
            //Associo ~ glyph_actualActiveSigil al sigillo di Franco
            ~ glyph_actualActiveSigil = nest_francoChosenSigil
            //Aggiorno i testi
            ~ glyph_grimoireTripleSigilsUpdater()
            ~ glyph_grimoireTripleSigilsUpdater()
            ~ glyph_grimoireTripleSigilsUpdater()
            //Poi aggiorno il sigillo principale
            ~ glyph_grimoireMainSigilsUpdater()
            //E svuoto glyph_actualActiveSigil
            ~ glyph_actualActiveSigil = ()
    
    Ti lascio il glifo, girino!

    ~ move_entity(Franco, Pond)
    ~ frog_currentMission = ()
    ~ frog_aboutGiftRequest = ()
    //Metto in pausa le missioni speciali
    ~ frog_pauseSpecialMission = frog_pauseSpecialMissionMax
    ~ nest_francoUsedEarth = false
        @animation:RewriterBook

            -> main
    

  
=== special_mission_two
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        Girino!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
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
                        Ma sai nuotare?#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                        No.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                        Allora sei una rana, sicuro!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral
                        
                }

        Ci vediamo in cucina!#speaker:{frog_tag()} #inkA:offState #inkB:offState #inkC:offState #ewWord:{em_state(Other)} #inkD:offState #portrait:frog_neutral

        ~ move_entity(Franco, Safekeeping)
        ~ move_entity(TheKitchenFrog, Kitchen)
        ~ kitchen_kitchenOccupied = true
        ~ frog_currentMission += specialMissionTwo
        ~ frog_availableSpecialMissions -= specialMissionTwo
        @animation:RewriterBook    
            -> main
    




