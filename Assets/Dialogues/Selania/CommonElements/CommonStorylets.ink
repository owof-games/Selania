=== first_second_chit_chat
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    Quindi anche tu non ricordi come sei arrivato qui?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
    Sì no boh.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
    No.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
    A un certo punto ero alla stazione.
    E avevo voglia di caramelle.
    Ma voglio sempre le caramelle.
    Pensi ci abbiano rapito?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
    Sarebbe DIVERTENTISSIMO!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
    Bimbo, dobbiamo rivedere la tua idea di divertente!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
    E poi che senso ha rapirci e lasciarci in un posto figo, così a caso?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
    
        {
            - are_two_entities_together(Mentor, PG):
                Sono felice che apprezzi questi luoghi, {charNameOne}.
        }
        
    Io voglio capire TUTTO di questo posto. Tutto!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
    Capire cosa si può mangiare e cosa no.
    E dove portano tutti quei posti chiusi.
    E...
    (Chitarra) Uh, bimbo, respira!
    Perché non partiamo da una cosa più tranquilla?
    Tipo che ne so, dormircela un attimo?
    Sai quante occasioni ti capiteranno per dormire a modo dopo le elementari?
    Zero.
    (Riccio)No no no.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
    Che noia.
    Forse posso arrampicarmi sugli alberi della foresta e vedere se ci sono scoiattoli!
    (Chitarra) E io inizio a pregare che da qualche parte ci sia un'infermeria.
        
        {
            - are_two_entities_together(Mentor, PG):
                Fammi vedere se ho dei cerotti da qualche parte.
                E delle garze.
                Avrò del disinfettante?
                Non è mai servito del disinfettante!
                Devo controllare, subito!
                    ~ change_entity_place(Mentor)
        }
        
    (Riccio) Tu cosa fai se ci hanno rapito gli alieni?
    
            + [Dormiamo qualche giorno, siii!]
                 -> color_variation_management(FirstCharacter, yellowC)->
                 -> color_variation_management(SecondCharacter, purpleC)->

                Voi persone vecchie siete noiose.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Nemmeno la nonna pensa così tanto a dormire!
                Perché tua nonna è in pensione e non deve pensare costantemente a PRODURRE!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed

            + [Anche io voglio studiarmi tutto!]
                -> color_variation_management(FirstCharacter, purpleC)->
                -> color_variation_management(SecondCharacter, blueC)->
                 
                Sìì! E il nostro team batte il team SIAMO NOIOSI E DORMIAMO SEMPRE DI {charNameOne}!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Sarò noiosa, ma tu arriverai ai quindici anni più ansioso di un pinscher, piccoletto.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed

            + [Mi metterei a piangere {player_pronouns has him:terrorizzato|{player_pronouns has her:terrorizzata|terrorizzatə}} in un angolino.]
                    -> color_variation_management(FirstCharacter, greenC)->
                    -> color_variation_management(SecondCharacter, greenC)->
                    
                Come i bambini piccoli. No no no.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Mi ci riconosco, totale.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate

            + [Mentre mi leggono la mente penso a cose assurdissime!]
                -> color_variation_management(FirstCharacter, blueC)->
                -> color_variation_management(SecondCharacter, yellowC)->
                
                Sarebbe divertentissimo!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Ora provo a pensare tantissimo alla cacca!
                La mia mente è limpida e innocente.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                Non come quella di un bambino, ascoltando le cose che dice il piccoletto.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                
            + [Magari conoscono il senso della vita.]
                -> color_variation_management(FirstCharacter, purpleC)->
                -> color_variation_management(SecondCharacter, redC)->
                
                Te lo dico io: caramelle!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                E vedere i pinguini.
                Ma sarebbe una risposta che mi risolverebbe una marea di problemi.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate

            -    
    Bene, direi che abbiamo tutt3 qualcosa a cui pensare.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
    Tipo, dove schiacciarmi quel pisolino.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
            ~ firstChar_pauseTalking = firstChar_pauseDuration
            ~ secondChar_pauseTalking = secondChar_pauseDuration
            ~ actual_speaker = ()
        -> main    

=== about_violence_and_peace
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    Non hai detto "Ti devo chiedere scusa {charNameTwo}?#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
    Perché mica l'hai ancora fatto!
    Sì, ma è importante che anche tu ragioni sulla tua violenza.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
    Non sono io che ti ho picchiato.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_angry
    In realtà.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
    No.
    Respira {mentorName}, respira.
    Hai ragione.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
    Sono qui per chiederti scusa, {charNameTwo}.
    Non avrei dovuto farti male.
    Mi dispiace.
    Ok.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
    Ok?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
    Sì, non ho mica altro da dirti.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
    Ma io.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
    I grandi chiedono sempre scusa per tutte le cose ma poi le rifanno.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
    Poi piangono e chiedono scusa.
    E poi le rifanno.
    Ma io ci credo davvero, {charNameTwo}!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
    Non ti voglio più far del male.
    Ok.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
    Però va bene così.
    Ora ho voglia solo di cercare qualcosa da mangiare.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral

                    {
                        - are_two_entities_together(FirstCharacter, PG):
                            Povero piccolo.
                            Però è stato molto coraggioso, vero?
                    }
        
                ~ change_entity_place(SecondCharacter)
                ~ mentor_pauseTalking = mentor_pauseDuration
                ~ secondChar_pauseTalking = secondChar_pauseDuration
                ~ actual_speaker = ()
        
        -> main

=== special_mission_one_dialogue
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    Questa conversazione è generata dalla missione della rana. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    Mentore e Riccio stanno discutendo se è meglio Wicked  o Attack of Titan. Mentore tifa per il primo, Riccio per il secondo.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
    
        + (not_intervention)[Decidi di non intervenire]
             -> color_variation_management(Mentor, blueC)->
             -> color_variation_management(SecondCharacter, blueC)->
    
        + (pro_mentor) [Wicked!]
            -> color_variation_management(Mentor, blueC)->
            -> color_variation_management(SecondCharacter, redC)->
     
        + (pro_riccio) [Attack of Titan, ovvio!]
                -> color_variation_management(Mentor, yellowC)->
                -> color_variation_management(SecondCharacter, blueC)->
    
        + (disagree)[The Lady, mi spiace.]
            -> color_variation_management(Mentor, redC)->
            -> color_variation_management(SecondCharacter, redC)->
    
            
        + (paracula)[Attack of the Wicked, che ne dite?]
            -> color_variation_management(Mentor, greenC)->
            -> color_variation_management(SecondCharacter, greenC)->
                -    
    Finisce la scena. #speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        ~ secondChar_pauseTalking = secondChar_pauseDuration
        ~ mentor_pauseTalking = mentor_pauseDuration
        ~ actual_speaker = ()
        -> main
    
    
=== first_mentor_chit_chat
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    C: No, non scherzo, {mentorName}, ti invidio un sacco.
    C: Hai uno scopo chiaro.
    C: E fai qualcosa di buono per le altre persone.
    C: Mi sembra la cosa migliore che possa capitare nella vita.
    M: Anche tu hai uno scopo, {charNameOne}.
    M: Tutti l’abbiamo.
    C: E quale sarebbe il mio?
    M: Un po’ lo scoprirai da te, parlando con {player_name}.
    M: Ma una cosa è certa: se non saprai trovare il bello in ciò che già hai, non sarai felice nemmeno quando avrai un nuovo nome.
    M: La felicità non è un luogo da raggiungere, ma qualcosa che si ha dentro.
    C: Mmm.
    C: Certo.
    C: Scusa {mentorName}, però un po’ mi viene da dirti che è facile dirlo, quando fai già quello che ami.
    C: è una posizione privilegiata.
    M: è un privilegio che mi sono creata, accogliendo il bello anche nelle cose difficili.
    C: {player_name}, tu cosa pensi?
    C: La felicità è questa roba che dice {mentorName}?
    C: Che te la ritrovi se ti fai andare bene quello che hai?
    M: O quello che dice {charNameOne}.
    M: Qualcosa che è sempre altrove e quindi irraggiungibile?
    
        + [{mentorName}, tu parli di arrendersi.]
            -> color_variation_management(FirstCharacter, redC)->
            -> color_variation_management(Mentor, redC)->
            Non arrendersi, {player_name}, ma accogliere quello che si ha.
            C: E non vedo differenza, {mentorName}.
            
        + [{mentorName}, razionalmente la felicità ha una natura temporanea.]
            -> color_variation_management(FirstCharacter, blueC)->
            -> color_variation_management(Mentor, blueC)->
            C: Oh, che bello sentire qualcun{player_pronouns has him:o|{player_pronouns has her:a|ə}} che matcha la mia gioia di vivere.
            M: Il fatto che sia temporanea non nega la mia teoria.
        
        + [La felicità ce l'hai se trovi il gioco e l'assurdo ovunque.]
            -> color_variation_management(FirstCharacter, yellowC)->
            -> color_variation_management(Mentor, yellowC)->
            C: Credo che quello si chiami "abuso di sostanze".
            M: Con un linguaggio meno colorito, direi comunque che sì, ha ragione {charNameOne}.

        + [Non credo nella felicità, ma credo nel piacere dato dalle persone vicine.]
            -> color_variation_management(FirstCharacter, greenC)->    
            -> color_variation_management(Mentor, greenC)->
            M: Questa è una lettura che potrei apprezzare.
            C: Woah!
            C: Vuol dire che {player_name} ha trovato un punto di contatto tra noi?
            M: Eh sì, mi sa proprio di sì.
            
        + [La felicità è qualcosa che cresce nelle pieghe del quotidiano.]
            -> color_variation_management(FirstCharacter, purpleC)->
            -> color_variation_management(Mentor, blueC)->
            M: Sono contenta che la vediamo allo stesso modo.
            C: Le cose che crescono nelle pieghe di solito sono sporche.
            C: Infestanti.
            C: E indesiderate.
        -
    C: Comunque spero tu abbia imparato la lezione, {mentorName}.
    M: Lezione?
    C: Sì: che se una persona ti dice che ti ammira, è meglio portarsi a casa il complimento e goderselo.
    C: Non sono vecchia come te, ma so che non sono tanti gli elogi che ci vengono dati in vita.
    
        ~ firstChar_pauseTalking = firstChar_pauseDuration
        ~ mentor_pauseTalking = mentor_pauseDuration
    
    
-> main

=== frog_and_mentor_chit_chat
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    M: Però non ti ho mai visto in giro.
    R: Però sono sempre stato cra!
    M: Ma non ti ho mai mai visto in giro.
    M: E ogni giorno vengo a sistemare il sentiero e pulire la serra.
    R: Forse allora non sei venuta ogni giorno.
    R: O forse mi hai scambiato per Tullio? A volte succede.
    R: O forse non è che hai proprio proprio proprio tutto sotto il tuo controllo.
    R: Un po' come zio Gracco e il suo problema con l'alcool. E i combustibili in generale.
    M: Impossibile.
    M: Controllo tutto, è il mio lavoro.
    R: Eppure eccoci cra, con io che so dove sono stato, e tu mi dici che non ricordo bene.
    M: Non ho detto che non ricordi bene.
    R: Ma dici che hai tutto sotto il tuo controllo e che non mi hai visto, quindi o non ricordo bene, o mento.
    R: E la rana non ha un collo e quindi non mento.
    M: Non mi permetterei mai di dirlo.
    R: Infatti non l'hai detto, l'hai implicato.
    R: Questa me l'ha insegnata stamani mio figlio Euforbo.
    R: Ma mi ha chiesto di non usare "stazampe" invece di stamani.
    M: Non mi piace il tuo tono, rana.
    R: Ma non cambia il fatto che mi stai dando o del bugiardo o dello smemorato.
    M: Io non l'ho detto!
    R: Ma l'hai implicato.
    R: E ampliato.
    R: Che non è ampilato, perché i lati non sono ampi.
    R: Questo lo dice sempre Euforbo.
    M: AAAAAAAARG!
    M: SEI INSOPPORTABILE!
        ~ change_entity_place(Mentor)
    R: No, sono Franco La Rana.
    R: Non mi ha molto ascoltato.    
    R: E comunque non ricordo l'esistenza di nessun mentore da queste parti.
        {
            - are_two_entities_together(FirstCharacter, PG):
                C:In che senso, scusa?
                R: {charNameOne}!
                R: Prima è passata zia Graaak e ti voleva parlare!
                R: Tullio dice che c'ha una cotta per te.
                R: Però non ho visto dove si è bruciata.
                R: O se ti deve bruciare.
                R: Non sarebbe molto gentile però, vero?
                C: Ooook. 
                C: No, non è vero: non ce la posso fare.
                    ~ change_entity_place(FirstCharacter)
        }
        -> main


=== the_witch_and_the_mentor
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    Quindi puoi parlare con, con questa pianta?
    Perché mi piacerebbe.
    Oh, è una cosa vanitosa.
    Ma mi piacerebbe sapere cosa ne pensa di me.
    Del mio lavoro.
    Se sto facendo un buon lavoro.
    Visto che vedono e sentono tutto.

    <i>Crediamo che {mentorName} stia facendo un buon lavoro.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    <i>Così come l'acqua che si raccoglie tra le mani per dissetarci.
    <i>Ma così come l'acqua non può essere incendio, così {mentorName} non può essere qualcosa che non è.
    <i>O portare nomi che non sa.

        + [Metà delle cose che la voce dice sono illogiche.]
                -> color_variation_management(Mentor, blueC)->
            <i>{player_name} non vede, e quindi decide che qualcosa non esiste.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            <i>Ma quella cosa esiste anche se {player_name} non vede.
            Uh, peccato.
            Ma ci sta: questo luogo è così insolito, immagino sia inevitabile non capirlo fino in fondo.
            
        + [Dice che stai facendo un buon lavoro.]
                -> color_variation_management(Mentor, greenC)->
            Oh, ma sicuramente esagera.
            Prendi prima: ho scoperto che per via della mia incuria sta crescendo del muschio sotto la panchina.
            Però.
            Ringrazia la voce da parte mia.
            <i>Dire una mezza verità porta su una mezza strada.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
        
        + [Boh, ha parlato di incendi e acqua, forse hai bruciato qualcosa?]
                -> color_variation_management(Mentor, yellowC)->
            Non è che ho lasciato qualcosa di acceso in cucina?
            No dai, si vedrebbe il fumo da qui, sicuro.
            Magari è qualcosa di simbolico.
            Spero di non aver distrutto nulla.
        
        + [Non è più importante il tuo di giudizio sul tuo lavoro, {mentorName}?]
                -> color_variation_management(Mentor, purpleC)->
            Credo di sì.
            Ma uno sguardo esterno ci può aiutare, immagino.
            Oh, non lo so.
            Sì.
            Credo di star facendo un buon lavoro.

        + [Ha detto tante cose ma la risposta è: no.]
                -> color_variation_management(Mentor, redC)->
            <i>La frusta che cade senza motivo non porta alcun insegnamento.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            Oh.
            Forse potrei chiedere scusa in qualche modo a...
            Ma a chi?
            Come?
            Ho deciso: pulisco il tronco.
            Potrebbe apprezzare, immagino.
            <i>Noi non abbiamo bisogno di pulizia, il nostro sporco è nido per funghi e insetti.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()} 
        -
    Immagino sia faticoso, avere una voce in testa, così.
    O magari ti fa sentire meno {player_pronouns has him:solo|{player_pronouns has her:sola|solə}}.
    Ho qualcosa su cui riflettere, immagino.
       
        ~ firstChar_pauseTalking = firstChar_pauseDuration
        ~ mentor_pauseTalking = mentor_pauseDuration


-> main


=== frog_and_first_char_chit_chat
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    C: Credo di avere il mal di testa.
    R: Lo dice sempre anche Giulio.
    C: Che è tuo figlio.
    R: No, che è uno dei miei mariti.
    R: I miei figli sono Abaco, Aimone, Altobrando, Appasilarco, Azzolino, Borci, Clodoveo, Comunardo
    C: No aspetta aspetta, ti avevo solo chiesto di.
    R: Emerenzio, Etelbero, Euforbo, Fulco, Matteo.
    C: Matteo?
    C: Un nome così normale?
    R: L'abbiamo adottato.
    R: Poi c'è Giosafatta, Gondio, Grimildo, Pierpietro, Piersabato.
    C: Ti ho solo chiesto dove si trova del vino!
    R: Zelinda, Veneranda, Uga, Torlonia, Tamatta, Ruslana e Ruslanina.
    C: Qualcuno mi soffochi, ora.
         ~ change_entity_place(FirstCharacter)

-> main


=== frog_and_second_char_chit_chat
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    F: E Franco ti dice che non è vero, {charNameTwo}.
    R: Ma è im-pos-si-bi-le!
    F: No no no, impossibile è un bambino che sa parlare.
    R: Ma io so parlare!
    F: E sei un bambino? Dimostralo!
    R: Sono basso.
    F: Anche io.
    R: E vado a scuola.
    F: Quello lo fanno i girini, non i bambini.
    R: E non sono un girino?
    F: Hai delle braccia, i girini non li hanno.
    R: Quindi sono una rana?
    F: Può darsi.
    F: Sai fare CRAAAAAAC?
    R: CRAAAAAAC!
    F: E sai saltare?
    R: Sìì!
    F: E hai uno zio che si chiama Gracco?
    R: No.
    F: Forse però non è così importante.
    F: Quindi sì: non sei un bambino, sei una rana!
    F: E sai nuotare?
    R: Sì no boh.
    R: No.
    F: Visto?
    F: Come ti dicevo prima: le rane non sanno nuotare.
    F: Logico, no?
    R: Mmm.
    R: Non sono mica convinto.
        {
            - are_two_entities_together(FirstCharacter, PG):
                Questa roba tra qualche anno si trasformerà in un lunghissimo percorso dalla psicologa.
        }
        {
            - are_two_entities_together(Mentor, PG):
                Comincio a sospettare che questa rana faccia più danni di quanto pensassi.
        }

    -> main
