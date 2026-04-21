=== first_second_chit_chat
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    Quindi anche tu non ricordi come sei arrivato qui?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
    {charTag(SecondCharacter, "melanchonic")}:    Sì no boh.
    {charTag(SecondCharacter, "neutral")}:        No.
        {
            - are_two_entities_together(Franco, PG):
                {charTag(Franco, "{portrait_Franco()}")}:       Neanche io.
                                                                Ma so come sono arrivato cra, vale?
        }
    {charTag(SecondCharacter, "neutral")}:        A un certo punto ero alla stazione.
    E avevo voglia di caramelle.
    {charTag(SecondCharacter, "energy")}:       Ma voglio sempre le caramelle.
    Pensi ci abbiano rapito?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
    {charTag(SecondCharacter, "energy")}:       Sarebbe DIVERTENTISSIMO!
    Bimbo, dobbiamo rivedere la tua idea di divertente!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
    E poi che senso ha rapirci e lasciarci in un posto figo, così a caso?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
    
        {
            - are_two_entities_together(Mentor, PG):
                {charTag(Mentor, "hurry")}:             Sono felice che apprezzi questi luoghi, {charNameOne}.
        }
        
    {charTag(SecondCharacter, "energy")}:       Io voglio capire TUTTO di questo posto. Tutto!
    Capire cosa si può mangiare e cosa no.
    E dove portano tutti quei posti chiusi.
    E...
    Uh, bimbo, respira!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
    Perché non partiamo da una cosa più tranquilla?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
    Tipo che ne so, dormircela un attimo?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
    Sai quante occasioni ti capiteranno per dormire a modo dopo le elementari?
    Zero.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
    {charTag(SecondCharacter, "neutral")}:        No no no.
    Che noia.
    {charTag(SecondCharacter, "energy")}:       Forse posso arrampicarmi sugli alberi della foresta e vedere se ci sono scoiattoli!
    E io inizio a pregare che da qualche parte ci sia un'infermeria.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
        
        {
            - are_two_entities_together(Mentor, PG):
                {charTag(Mentor, "neutral")}:           Fammi vedere se ho dei cerotti da qualche parte.
                                                        E delle garze.
                {charTag(Mentor, "sad")}:               Avrò del disinfettante?
                {charTag(Mentor, "hurry")}:             Non è mai servito del disinfettante!
                                                        Devo controllare, subito!
                    ~ change_entity_place(Mentor)
        }
        
    {charTag(SecondCharacter, "energy")}:       Tu cosa fai se ci hanno rapito gli alieni?
    
            + \ {charTag(PG, "neutral")}:         Dormiamo qualche giorno, siii!
                 -> glyph_modifier_variation_management(FirstCharacter, earthC)->

                {charTag(SecondCharacter, "neutral")}:        Voi persone vecchie siete noiose.
                Nemmeno la nonna pensa così tanto a dormire!
                Perché tua nonna è in pensione e non deve pensare costantemente a PRODURRE!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed

            + \ {charTag(PG, "neutral")}:         Anche io voglio studiarmi tutto!
                -> glyph_modifier_variation_management(FirstCharacter, airC)->
                 
                {charTag(SecondCharacter, "energy")}:       Sìì! E il nostro team batte il team SIAMO NOIOSI E DORMIAMO SEMPRE DI {charNameOne}!
                Sarò noiosa, ma tu arriverai ai quindici anni più ansioso di un pinscher, piccoletto.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed

            + \ {charTag(PG, "neutral")}:         Mi metterei a piangere {player_pronouns has him:terrorizzato|{player_pronouns has her:terrorizzata|terrorizzatə}} in un angolino.
                    -> glyph_modifier_variation_management(FirstCharacter, waterC)->
                    
                {charTag(SecondCharacter, "melanchonic")}:    Come i bambini piccoli. No no no.
                Mi ci riconosco, totale.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate

            + \ {charTag(PG, "neutral")}:         Mentre mi leggono la mente penso a cose assurdissime!
                -> glyph_modifier_variation_management(FirstCharacter, fireC)->
               
                {charTag(SecondCharacter, "energy")}:       Sarebbe divertentissimo!
                Ora provo a pensare tantissimo alla cacca!
                La mia mente è limpida e innocente.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
                Non come quella di un bambino, ascoltando le cose che dice il piccoletto.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                
            + \ {charTag(PG, "neutral")}:         Magari conoscono il senso della vita.
                -> glyph_modifier_variation_management(FirstCharacter, aetherC)->
                
                {charTag(SecondCharacter, "neutral")}:        Te lo dico io: caramelle!
                E vedere i pinguini.
                Ma sarebbe una risposta che mi risolverebbe una marea di problemi.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate

            -    
    Bene, direi che abbiamo tutt3 qualcosa a cui pensare.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
    Tipo, dove schiacciarmi quel pisolino.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
 
        -> second_char_closing_storylet ->
        -> first_char_closing_storylet ->
        ->->    

=== about_violence_and_peace
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    {charTag(SecondCharacter, "neutral")}:        Non hai detto "Ti devo chiedere scusa {charNameTwo}?
    Perché mica l'hai ancora fatto!
    {charTag(Mentor, "sad")}:               Sì, ma è importante che anche tu ragioni sulla tua violenza.
    {charTag(SecondCharacter, "angry")}:        Non sono io che ti ho picchiato.
    {charTag(Mentor, "bored")}:             In realtà.
    {charTag(Mentor, "neutral")}:           No.
                                            Respira {mentorName}, respira.
    {charTag(Mentor, "sad")}:               Hai ragione.
    {charTag(Mentor, "neutral")}:           Sono qui per chiederti scusa, {charNameTwo}.
                                            Non avrei dovuto farti male.
    {charTag(Mentor, "sorry")}:             Mi dispiace.
    {charTag(SecondCharacter, "neutral")}:        Ok.
    {charTag(Mentor, "neutral")}:           Ok?
    {charTag(SecondCharacter, "neutral")}:        Sì, non ho mica altro da dirti.
    {charTag(Mentor, "sad")}:               Ma io.
    {charTag(SecondCharacter, "neutral")}:        I grandi chiedono sempre scusa per tutte le cose ma poi le rifanno.
    Poi piangono e chiedono scusa.
    {charTag(SecondCharacter, "angry")}:        E poi le rifanno.
    {charTag(Mentor, "hurry")}:             Ma io ci credo davvero, {charNameTwo}!
    Non ti voglio più far del male.
    {charTag(SecondCharacter, "neutral")}:        Ok.
    Però va bene così.
    {charTag(SecondCharacter, "neutral")}:        Ora ho voglia solo di cercare qualcosa da mangiare.
            {
                - are_two_entities_together(FirstCharacter, PG):
                    Povero piccolo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
                    Però è stato molto coraggioso, vero?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
            }

            + \ {charTag(PG, "neutral")}:                    Scelta acqua
                    -> glyph_modifier_variation_management(Mentor, waterC)->
                
                
            + \ {charTag(PG, "neutral")}:                      Scelta spirito
                    -> glyph_modifier_variation_management(Mentor, aetherC)->
                
            
            + \ {charTag(PG, "neutral")}:                    Scelta terra
                    -> glyph_modifier_variation_management(Mentor, earthC)->
                
            
            + \ {charTag(PG, "neutral")}:                   Scelta aria
                    -> glyph_modifier_variation_management(Mentor, airC)->
                
            
            + \ {charTag(PG, "neutral")}:                  Scelta fuoco
                    -> glyph_modifier_variation_management(Mentor, fireC)-> 
                
            -

        -> mentor_closing_storylet ->
        -> second_char_closing_storylet ->
        ->->

    
=== first_mentor_chit_chat
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    No, non scherzo, {mentorName}, ti invidio un sacco.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
    Hai uno scopo chiaro.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
    E fai qualcosa di buono per le altre persone.
    Mi sembra la cosa migliore che possa capitare nella vita.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
        {
            - are_two_entities_together(Franco, PG):
                {charTag(Franco, "{portrait_Franco()}")}:       La cosa migliore che ti possa capitare è il karaoke di cugina Sputt.
                                                                Ma è meglio non starle troppo vicino.
        }
    {charTag(Mentor, "hurry")}:             Anche tu hai uno scopo, {charNameOne}.
    Tutti l'abbiamo.
    E quale sarebbe il mio?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
    {charTag(Mentor, "hurry")}:             Un po' lo scoprirai da te, parlando con {player_name}.
    {charTag(Mentor, "neutral")}:           Ma una cosa è certa: se non saprai trovare il bello in ciò che già hai, non sarai felice nemmeno quando avrai un nuovo nome.
    {charTag(Mentor, "hurry")}:             La felicità non è un luogo da raggiungere, ma qualcosa che si ha dentro.
    Mmm.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
    Certo.
    Scusa {mentorName}, però un po' mi viene da dirti che è facile dirlo, quando fai già quello che ami.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
    È una posizione privilegiata.
    {charTag(Mentor, "neutral")}:           È un privilegio che mi sono creata, accogliendo il bello anche nelle cose difficili.
    {player_name}, tu cosa pensi?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
    La felicità è questa roba che dice {mentorName}?
    Che te la ritrovi se ti fai andare bene quello che hai?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
    {charTag(Mentor, "neutral")}:           O quello che dice {charNameOne}.
    {charTag(Mentor, "sad")}:               Qualcosa che è sempre altrove e quindi irraggiungibile?
    
        + \ {charTag(PG, "neutral")}:          {mentorName}, tu parli di arrendersi.
            -> glyph_modifier_variation_management(FirstCharacter, fireC)->
            {charTag(Mentor, "neutral")}:           Non arrendersi, {player_name}, ma accogliere quello che si ha.
            E non vedo differenza, {mentorName}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_sad
            
        + \ {charTag(PG, "neutral")}:          {mentorName}, razionalmente la felicità ha una natura temporanea.
            -> glyph_modifier_variation_management(FirstCharacter, airC)->
            Oh, che bello sentire qualcun{player_pronouns has him:o|{player_pronouns has her:a|ə}} che matcha la mia gioia di vivere.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
            {charTag(Mentor, "neutral")}:           Il fatto che sia temporanea non nega la mia teoria.
        
        + \ {charTag(PG, "neutral")}:         La felicità ce l'hai se trovi il gioco e l'assurdo ovunque.
            -> glyph_modifier_variation_management(FirstCharacter, earthC)->
            Credo che quello si chiami "abuso di sostanze".#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
            {charTag(Mentor, "sad")}:               Con un linguaggio meno colorito, direi comunque che sì, ha ragione {charNameOne}.

        + \ {charTag(PG, "neutral")}:         Non credo nella felicità, ma credo nel piacere dato dalle persone vicine.
            -> glyph_modifier_variation_management(FirstCharacter, waterC)->    
            {charTag(Mentor, "neutral")}:           Questa è una lettura che potrei apprezzare.
            Woah!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
            Vuol dire che {player_name} ha trovato un punto di contatto tra noi in questa discussione?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
            {charTag(Mentor, "hurry")}:             Eh sì, mi sa proprio di sì.
            
        + \ {charTag(PG, "neutral")}:         La felicità è qualcosa che cresce nelle pieghe del quotidiano.
            -> glyph_modifier_variation_management(FirstCharacter, aetherC)->
            {charTag(Mentor, "hurry")}:             Sono contenta che la vediamo allo stesso modo.
            Le cose che crescono nelle pieghe di solito sono sporche.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
            Infestanti.
            E indesiderate.
        -
    Comunque spero tu abbia imparato la lezione, {mentorName}.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
    {charTag(Mentor, "neutral")}:           Lezione?
    Sì: che se una persona ti dice che ti ammira, è meglio portarsi a casa il complimento e goderselo.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_affectionate
    Non sono vecchia come te, ma so che non sono tanti gli elogi che ci vengono dati in vita.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed

        -> first_char_closing_storylet ->
        -> mentor_closing_storylet ->
        ->->

=== frog_and_mentor_chit_chat
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    TODO: rendere Franco più dubitante della cosa, non ne è così certo.

    {charTag(Mentor, "neutral")}:                   Però non ti ho mai visto in giro.
    {charTag(Franco, "{portrait_Franco()}")}:       Però sono sempre stato cra!
    {charTag(Mentor, "neutral")}:                   Ma non ti ho mai mai visto in giro.
                                                    E ogni giorno vengo a sistemare il sentiero e pulire la serra.
    {charTag(Franco, "{portrait_Franco()}")}:       Forse allora non sei venuta ogni giorno.
                                                    O forse mi hai scambiato per Tullio? A volte succede.
                                                    O forse non è che hai proprio proprio proprio tutto sotto il tuo controllo.
                                                    Un po' come zio Gracco e il suo problema con l'alcool. E i combustibili in generale.
    {charTag(Mentor, "neutral")}:                   Impossibile.
                                                    Controllo tutto, è il mio lavoro.
    {charTag(Franco, "{portrait_Franco()}")}:       Eppure eccoci cra, con io che so dove sono stato, e tu mi dici che non ricordo bene.
    {charTag(Mentor, "sad")}:                       Non ho detto che non ricordi bene.
    {charTag(Franco, "{portrait_Franco()}")}:       Ma dici che hai tutto sotto il tuo controllo e che non mi hai visto, quindi o non ricordo bene, o mento.
                                                    E io sono una rana e una rana non ha un collo e quindi non mento.
    {charTag(Mentor, "sorry")}:                     Non mi permetterei mai di dirlo.
    {charTag(Franco, "{portrait_Franco()}")}:       Infatti non l'hai detto, l'hai implicato.
                                                    Questa me l'ha insegnata stamani mio figlio Euforbo.
                                                    Ma mi ha chiesto di non usare "stazampe" invece di stamani.
    {charTag(Mentor, "neutral")}:                   Non mi piace il tuo tono, rana.
    {charTag(Franco, "{portrait_Franco()}")}:       Ma non cambia il fatto che mi stai dando o del bugiardo o dello smemorato.
    {charTag(Mentor, "bored")}:                     Io non l'ho detto!
    {charTag(Franco, "{portrait_Franco()}")}:       Ma l'hai implicato.
                                                    Che non è ampilato, perché i lati non sono ampi.
                                                    Questo lo dice sempre Euforbo.
    {charTag(Mentor, "bored")}:                     AAAAAAAARG!
                                                    SEI INSOPPORTABILE!
        ~ change_entity_place(Mentor)
    {charTag(Franco, "{portrait_Franco()}")}:       No, sono Franco La Rana.
                                                    Non mi ha molto ascoltato.    
                                                    E comunque non ricordo l'esistenza di nessun mentore da queste parti.
        {
            - are_two_entities_together(FirstCharacter, PG):
                In che senso, scusa?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
                {charTag(Franco, "{portrait_Franco()}")}:       {charNameOne}!
                                                                Prima è passata zia Graaak e ti voleva parlare!
                                                                Tullio dice che c'ha una cotta per te.
                                                                Però non ho visto dove si è bruciata.
                                                                O se ti deve bruciare.
                                                                Non sarebbe molto gentile però, vero?
                Ooook#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                No, non è vero: non ce la posso fare.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
                    ~ change_entity_place(FirstCharacter)
        }


        Facciamo domande anche sul "in che senso non hai mai visto nessun mnentore?", con reazione da parte altre png.
            + \ {charTag(PG, "neutral")}:                   Scelta acqua
                    -> glyph_modifier_variation_management(Mentor, waterC)->
                
                
            + \ {charTag(PG, "neutral")}:                     Scelta spirito
                    -> glyph_modifier_variation_management(Mentor, aetherC)->
                
            
            + \ {charTag(PG, "neutral")}:                    Scelta terra
                    -> glyph_modifier_variation_management(Mentor, earthC)->
                
            
            + \ {charTag(PG, "neutral")}:                       Scelta aria
                    -> glyph_modifier_variation_management(Mentor, airC)->
                
            
            + \ {charTag(PG, "neutral")}:                       Scelta fuoco
                    -> glyph_modifier_variation_management(Mentor, fireC)-> 
                
            -
        -> mentor_closing_storylet ->
        ->->


=== the_witch_and_the_mentor
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {charTag(Mentor, "neutral")}:                   Quindi puoi parlare con, con questo vaso?
                                                    Perché mi piacerebbe.
    {charTag(Mentor, "sorry")}:                     Oh, è una cosa vanitosa.
    {charTag(Mentor, "neutral")}:                   Ma mi piacerebbe sapere cosa ne pensa di me.
                                                    Del mio lavoro.
    {charTag(Mentor, "hurry")}:                     Se sto facendo un buon lavoro.
    {charTag(Mentor, "neutral")}:                   Visto che vede e sente tutto.

    {charTag(TheWitch, witch_state())}:         <i>Crediamo che {mentorName} stia facendo un buon lavoro.</i>
                                                    <i>Così come l'acqua che si raccoglie tra le mani per dissetarci.</i>
                                                    <i>Ma così come l'acqua non può essere incendio, così {mentorName} non può essere qualcosa che non è.</i>
                                                    <i>O portare nomi che non sa.</i>

        + \ {charTag(PG, "neutral")}:         Metà delle cose che la voce dice sono illogiche.
                -> glyph_modifier_variation_management(Mentor, airC)->
            {charTag(TheWitch, witch_state())}:         <i>{player_name} non vede, e quindi decide che qualcosa non esiste.</i>
            <i>Ma quella cosa esiste anche se {player_name} non vede.</i>
            {charTag(Mentor, "sad")}:                       Uh, peccato.
            {charTag(Mentor, "neutral")}:                   Ma ci sta: questo luogo è così insolito, immagino sia inevitabile non capirlo fino in fondo.
            
        + \ {charTag(PG, "neutral")}:         Dice che stai facendo un buon lavoro.
                -> glyph_modifier_variation_management(Mentor, waterC)->
            {charTag(Mentor, "hurry")}:                     Oh, ma sicuramente esagera.
            {charTag(Mentor, "sad")}:                       Prendi prima: ho scoperto che per via della mia incuria sta crescendo del muschio sotto al suo vaso.
                                                            Però.
            {charTag(Mentor, "neutral")}:                   Ringrazia la voce da parte mia.
            {charTag(TheWitch, witch_state())}:         <i>Dire una mezza verità porta su una mezza strada.</i>
        
        + \ {charTag(PG, "neutral")}:         Boh, ha parlato di incendi e acqua, forse hai bruciato qualcosa?
                -> glyph_modifier_variation_management(Mentor, earthC)->
            {charTag(Mentor, "sad")}:                       Non è che ho lasciato qualcosa di acceso in cucina?
                                                            No dai, si vedrebbe il fumo da qui, sicuro.
            {charTag(Mentor, "neutral")}:                   Magari è qualcosa di simbolico.
            {charTag(Mentor, "sorry")}:                     Spero di non aver distrutto nulla.
        
        + \ {charTag(PG, "neutral")}:         Non è più importante il tuo di giudizio sul tuo lavoro, {mentorName}?
                -> glyph_modifier_variation_management(Mentor, aetherC)->
            {charTag(Mentor, "neutral")}:                   Credo di sì.
                                                            Ma uno sguardo esterno ci può aiutare, immagino.
            {charTag(Mentor, "sad")}:                       Oh, non lo so.#
            {charTag(Mentor, "neutral")}:                   Sì.
                                                            Credo di star facendo un buon lavoro.

        + \ {charTag(PG, "neutral")}:         Ha detto tante cose ma la risposta è: no.
                -> glyph_modifier_variation_management(Mentor, fireC)->
            {charTag(TheWitch, witch_state())}:         <i>La frusta che cade senza motivo non porta alcun insegnamento.</i>
            {charTag(Mentor, "sad")}:                       Oh.#
                                                            Forse potrei chiedere scusa in qualche modo a...
                                                            Ma a chi?
                                                            Come?
            {charTag(Mentor, "hurry")}:                     Ho deciso: pulisco il tronco.
            {charTag(Mentor, "neutral")}:                   Potrebbe apprezzare, immagino.
            {charTag(TheWitch, witch_state())}:         <i>Noi non abbiamo bisogno di pulizia, il nostro sporco è nido per funghi e insetti.</i> 
        -
    {charTag(Mentor, "sad")}:                       Immagino sia faticoso, avere una voce in testa, così.
    {charTag(Mentor, "neutral")}:                   O magari ti fa sentire meno {player_pronouns has him:solo|{player_pronouns has her:sola|solə}}?
                                                    Ho qualcosa su cui riflettere, immagino.

        -> witch_closing_storylet ->
        -> mentor_closing_storylet ->
        ->->


=== frog_and_first_char_chit_chat
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    Credo di avere il mal di testa.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
    {charTag(Franco, "{portrait_Franco()}")}:       Lo dice sempre anche Giulio.
    Che è tuo figlio.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
    {charTag(Franco, "{portrait_Franco()}")}:       No, che è uno dei miei mariti.
                                                    I miei figli sono Abaco, Aimone, Altobrando, Appasilarco, Azzolino, Borci, Clodoveo, Comunardo
    No aspetta aspetta, ti avevo solo chiesto di.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
    {charTag(Franco, "{portrait_Franco()}")}:       Emerenzio, Etelbero, Euforbo, Fulco, Matteo.
    Matteo?#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_curious
    Un nome così normale?
    {charTag(Franco, "{portrait_Franco()}")}:       L'abbiamo adottato.
                                                    Poi c'è Giosafatta, Gondio, Grimildo, Pierpietro, Piersabato.
    Ti ho solo chiesto dove si trova del vino!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
    {charTag(Franco, "{portrait_Franco()}")}:       Zelinda, Veneranda, Uga, Torlonia, Tamatta, Ruslana e Ruslanina.
    Qualcuno mi soffochi, ora.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)}  #ewWord:{em_state(Influenced)} #portrait:chitarra_annoyed
        ~ change_entity_place(FirstCharacter)
    {charTag(Franco, "{portrait_Franco()}")}:       Piccarda, Perlita, Macrina, Gliceria, Gianbrunilde, Eulalia, Ermenegigia...

    Qualcosa tipo "{player_name} dimmi che non sto impazzendo solo io!"
            + \ {charTag(PG, "neutral")}:                     Scelta acqua
                    -> glyph_modifier_variation_management(FirstCharacter, waterC)->
                
                
            + \ {charTag(PG, "neutral")}:                     Scelta spirito
                    -> glyph_modifier_variation_management(FirstCharacter, aetherC)->
                
            
            + \ {charTag(PG, "neutral")}:                      Non sto impazzendo solo io.
                    -> glyph_modifier_variation_management(FirstCharacter, earthC)->
                
            
            + \ {charTag(PG, "neutral")}:                     Scelta aria
                    -> glyph_modifier_variation_management(FirstCharacter, airC)->
                
            
            + \ {charTag(PG, "neutral")}:                       Scelta fuoco
                    -> glyph_modifier_variation_management(FirstCharacter, fireC)-> 
                
            -
        -> first_char_closing_storylet ->
        ->->

=== frog_and_second_char_chit_chat
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {charTag(Franco, "{portrait_Franco()}")}:       E Franco ti dice che non è vero, {charNameTwo}.
    {charTag(SecondCharacter, "angry")}:        Ma è IM-POS-SI-BI-LE!
    {charTag(Franco, "{portrait_Franco()}")}:       No no no, impossibile è un bambino che sa parlare.
    {charTag(SecondCharacter, "melanchonic")}:    Ma io so parlare!
    {charTag(Franco, "{portrait_Franco()}")}:       E sei un bambino? Dimostralo!
    {charTag(SecondCharacter, "neutral")}:        Sono basso.
    {charTag(Franco, "{portrait_Franco()}")}:       Anche io.
    {charTag(SecondCharacter, "neutral")}:        E vado a scuola.
    {charTag(Franco, "{portrait_Franco()}")}:       Quello lo fanno i girini, non i bambini.
    {charTag(SecondCharacter, "neutral")}:        E non sono un girino?
    {charTag(Franco, "{portrait_Franco()}")}:       Hai delle braccia, i girini non le hanno.
    {charTag(SecondCharacter, "energy")}:       Quindi sono una rana?
    {charTag(Franco, "{portrait_Franco()}")}:       Può darsi.
    Sai fare CRAAAAAAC?
    {charTag(SecondCharacter, "energy")}:       CRAAAAAAC!
    {charTag(Franco, "{portrait_Franco()}")}:       E sai saltare?
    {charTag(SecondCharacter, "energy")}:       Sìì!
    {charTag(Franco, "{portrait_Franco()}")}:       E hai uno zio che si chiama Gracco?
    {charTag(SecondCharacter, "melanchonic")}:    No.
    {charTag(Franco, "{portrait_Franco()}")}:       Forse però non è così importante.
    Quindi sì: non sei un bambino, sei una rana!
    E sai nuotare?
    {charTag(SecondCharacter, "neutral")}:        Sì no boh.
    {charTag(SecondCharacter, "melanchonic")}:    No.
   {charTag(Franco, "{portrait_Franco()}")}:       Visto?
    Come ti dicevo prima: le rane non sanno nuotare.
    Logico, no?
    {charTag(SecondCharacter, "neutral")}:        Mmm.
    Non sono mica tanto convinto.
        {
            - are_two_entities_together(FirstCharacter, PG):
                Beeeene!#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstChar_InkLevel)} #inkB:{ink_tag_b(firstChar_InkLevel)}  #inkC:{ink_tag_c(firstChar_InkLevel)}  #inkD:{ink_tag_d(firstChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:chitarra_neutral
                E anche questa roba tra qualche anno si trasformerà in un lunghissimo percorso di psicoterapia.
        }
    {charTag(Franco, "{portrait_Franco()}")}:       Però possiamo chiedere alle foglie.
    Tullio dice sempre che nuotano nell'aria.
        {
            - are_two_entities_together(Mentor, PG):
                {charTag(Mentor, "neutral")}:                   Comincio a sospettare che questa rana farà più danni di quanti ne potrò risolvere.
        }
    

            + \ {charTag(PG, "neutral")}:                     Scelta acqua
                    -> glyph_modifier_variation_management(SecondCharacter, waterC)->
                
                
            + \ {charTag(PG, "neutral")}:                      Scelta spirito
                    -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
                
            
            + \ {charTag(PG, "neutral")}:                     Scelta terra
                    -> glyph_modifier_variation_management(SecondCharacter, earthC)->
                
            
            + \ {charTag(PG, "neutral")}:                      Scelta aria
                    -> glyph_modifier_variation_management(SecondCharacter, airC)->
                
            
            + \ {charTag(PG, "neutral")}:                      Scelta fuoco
                    -> glyph_modifier_variation_management(SecondCharacter, fireC)-> 
                
            -
        -> second_char_closing_storylet ->
        ->->



=== frog_and_third_char_chit_chat ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    Chiacchierata Franco e PNG3

        + \ {charTag(PG, "neutral")}:         Metà delle cose che la voce dice sono illogiche.
                -> glyph_modifier_variation_management(ThirdCharacter, airC)->
            
        + \ {charTag(PG, "neutral")}:         Dice che stai facendo un buon lavoro.
                -> glyph_modifier_variation_management(ThirdCharacter, waterC)->

        
        + \ {charTag(PG, "neutral")}:         Boh, ha parlato di incendi e acqua, forse hai bruciato qualcosa?
                -> glyph_modifier_variation_management(ThirdCharacter, earthC)->


        + \ {charTag(PG, "neutral")}:         Non è più importante il tuo di giudizio sul tuo lavoro, {mentorName}?
                -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->


        + \ {charTag(PG, "neutral")}:         Ha detto tante cose ma la risposta è: no.
                -> glyph_modifier_variation_management(ThirdCharacter, fireC)->

    -
    -> third_char_closing_storylet ->
    ->->



=== third_mentor_chit_chat ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    Chiacchierata Mentore e PNG3

        + \ {charTag(PG, "neutral")}:         Metà delle cose che la voce dice sono illogiche.
                -> glyph_modifier_variation_management(ThirdCharacter, airC)->
            
        + \ {charTag(PG, "neutral")}:         Dice che stai facendo un buon lavoro.
                -> glyph_modifier_variation_management(ThirdCharacter, waterC)->

        
        + \ {charTag(PG, "neutral")}:         Boh, ha parlato di incendi e acqua, forse hai bruciato qualcosa?
                -> glyph_modifier_variation_management(ThirdCharacter, earthC)->


        + \ {charTag(PG, "neutral")}:         Non è più importante il tuo di giudizio sul tuo lavoro, {mentorName}?
                -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->

        + \ {charTag(PG, "neutral")}:         Ha detto tante cose ma la risposta è: no.
                -> glyph_modifier_variation_management(ThirdCharacter, fireC)->
    -

    -> mentor_closing_storylet ->
    -> third_char_closing_storylet ->
    ->->

=== third_second_chit_chat ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    Chiacchierata Riccio e PNG3
    
         + \ {charTag(PG, "neutral")}:         Metà delle cose che la voce dice sono illogiche.
                -> glyph_modifier_variation_management(ThirdCharacter, airC)->

            
        + \ {charTag(PG, "neutral")}:         Dice che stai facendo un buon lavoro.
                -> glyph_modifier_variation_management(ThirdCharacter, waterC)->


        
        + \ {charTag(PG, "neutral")}:         Boh, ha parlato di incendi e acqua, forse hai bruciato qualcosa?
                -> glyph_modifier_variation_management(ThirdCharacter, earthC)->


        + \ {charTag(PG, "neutral")}:         Non è più importante il tuo di giudizio sul tuo lavoro?
                -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->


        + \ {charTag(PG, "neutral")}:         Ha detto tante cose ma la risposta è: no.
                -> glyph_modifier_variation_management(ThirdCharacter, fireC)->

    -
    -> second_char_closing_storylet ->
    -> third_char_closing_storylet ->
    ->->

=== third_first_chit_chat ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    Chiacchierata Chitarra e PNG3

        + \ {charTag(PG, "neutral")}:         Metà delle cose che la voce dice sono illogiche.
                -> glyph_modifier_variation_management(ThirdCharacter, airC)->

        + \ {charTag(PG, "neutral")}:         Dice che stai facendo un buon lavoro.
                -> glyph_modifier_variation_management(ThirdCharacter, waterC)->

        + \ {charTag(PG, "neutral")}:         Boh, ha parlato di incendi e acqua, forse hai bruciato qualcosa?
                -> glyph_modifier_variation_management(ThirdCharacter, earthC)->

        + \ {charTag(PG, "neutral")}:         Non è più importante il tuo di giudizio sul tuo lavoro?
                -> glyph_modifier_variation_management(ThirdCharacter, aetherC)->


        + \ {charTag(PG, "neutral")}:         Ha detto tante cose ma la risposta è: no.
                -> glyph_modifier_variation_management(ThirdCharacter, fireC)->


    -
    -> first_char_closing_storylet ->
    -> third_char_closing_storylet ->
    ->->


=== carla_and_second_char_chit_chat ===    
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    Chiacchierata Riccio e Carla, puramente di colore

    -> second_char_closing_storylet ->
    ->->