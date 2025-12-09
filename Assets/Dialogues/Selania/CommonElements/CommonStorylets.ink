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
            - are_two_entities_together(Mentor, PG): Sono felice che apprezzi questi luoghi, {charNameOne}.
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
            - are_two_entities_together(Mentor, PG): Fammi vedere se ho dei cerotti da qualche parte.
            E delle garze.
            Avrò del disinfettante?
            Non è mai servito del disinfettante!
            Devo controllare, subito!
                ~ change_entity_place(Mentor)
        }
        
    (Riccio) Tu cosa fai se ci hanno rapito gli alieni?
    
            + [L'idea di dormirmela per qualche giorno non mi dispiace!]
                 -> color_variation_management(FirstCharacter, yellowC)->
                 -> color_variation_management(SecondCharacter, purpleC)->

                Voi persone vecchie siete noiose.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:riccio_neutral
                Nemmeno la nonna pensa così tanto a dormire!
                Perché tua nonna è in pensione e non deve pensare costantemente a PRODURRE!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed

            + [Anche io voglio studiarmi tutto!]
                -> color_variation_management(FirstCharacter, purpleC)->
                -> color_variation_management(SecondCharacter, blueC)->
                 
                 Sìì! E il nostro team batte il team SIAMO NOIOSI E DORMIAMO SEMPRE DI {charNameOne}!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Sarò noiosa, ma tu arriverai ai quindici anni più ansioso di un pinscher, nanetto.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed

            + [Mi metterei a piangere {player_pronouns has him:terrorizzato|{player_pronouns has her:terrorizzata|terrorizzatə}} in un angolino.]
                    -> color_variation_management(FirstCharacter, greenC)->
                    -> color_variation_management(SecondCharacter, greenC)->
                    
                Come i bambini piccoli. No no no.#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_melanchonic
                Mi ci riconosco, totale.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate

            + [Spero per loro che non mi leggano nella mente o se ne pentirebbero.]
                -> color_variation_management(FirstCharacter, blueC)->
                -> color_variation_management(SecondCharacter, yellowC)->
                
                Sarebbe divertentissimo!#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondChar_InkLevel)} #inkB:{ink_tag_b(secondChar_InkLevel)}  #inkC:{ink_tag_c(secondChar_InkLevel)}  #inkD:{ink_tag_d(secondChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:riccio_energy
                Ora provo a pensare tantissimo alla cacca!
                La mia mente è limpida e innocente.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                Non come quella di un bambino, ascoltando le cose che dice il nanerottolo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                
            + [Magari mi dicono qual è il senso della vita.]
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

    //{charNameOne}, non potrai essere felice fintanto che non sai goderti ciò che hai.
    
        + [{mentorName}, tu parli di arrendersi.]
            -> color_variation_management(FirstCharacter, redC)->
            -> color_variation_management(Mentor, blueC)->
            
        + [{mentorName}, razionalmente la felicità ha una natura temporanea.]
            -> color_variation_management(FirstCharacter, blueC)->
            -> color_variation_management(Mentor, blueC)->
        
        + [Risposta gialla.]
            -> color_variation_management(FirstCharacter, yellowC)->
            -> color_variation_management(Mentor, blueC)->
        
        + [Risposta verde.]
            -> color_variation_management(FirstCharacter, greenC)->    
            -> color_variation_management(Mentor, blueC)->

            
        + [Risposta viola.]
            -> color_variation_management(FirstCharacter, purpleC)->
            -> color_variation_management(Mentor, blueC)->
        -
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

    S: Crediamo che {mentorName} stia facendo un buon lavoro.
    S: Così come l'acqua che si raccoglie tra le mani per dissetarci.
    S: Ma così come l'acqua non può essere incendio, così {mentorName} non può essere qualcosa che non è.
    S: O portare nomi che non sa.

        + [Metà delle cose che la voce dice sono illogiche.]
                -> color_variation_management(Mentor, blueC)->
            S: {player_name} non vede, e quindi decide che qualcosa non esiste.
            S: Ma quella cosa esiste anche se {player_name} non vede.
            Uh, peccato.
            Ma ci sta: questo luogo è così insolito, immagino sia inevitabile non capirlo fino in fondo.
            
        + [Dice che stai facendo un buon lavoro.]
                -> color_variation_management(Mentor, greenC)->
            Oh, ma sicuramente esagera.
            Prendi prima: ho scoperto che per via della mia incuria sta crescendo del muschio sotto la panchina.
            Però.
            Ringrazia la voce da parte mia.
            S: Dire una mezza verità porta su una mezza strada.
        
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
            S: La frusta che cade senza motivo non porta alcun insegnamento.
            Oh.
            Forse potrei chiedere scusa in qualche modo a...
            Ma a chi?
            Come?
            Ho deciso: pulisco il tronco.
            Potrebbe apprezzare, immagino.
            S: Noi non abbiamo bisogno di pulizia, il nostro sporco è nido per funghi e insetti.    
        -
    Immagino sia faticoso, avere una voce in testa, così.
    O magari ti fa sentire meno {player_pronouns has him:solo|{player_pronouns has her:sola|solə}}.
    Ho qualcosa su cui riflettere, immagino.
       
        ~ firstChar_pauseTalking = firstChar_pauseDuration
        ~ mentor_pauseTalking = mentor_pauseDuration


-> main