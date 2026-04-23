=== first_second_chit_chat
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {charTag(FirstCharacter, "curious")}:               Quindi anche tu non ricordi come sei arrivato qui?
    {charTag(SecondCharacter, "melanchonic")}:          Sì no boh.
    {charTag(SecondCharacter, "neutral")}:              No.
    {
        - are_two_entities_together(Franco, PG):
    {charTag(Franco, "{portrait_Franco()}")}:           Neanche io.
                                                        Ma so come sono arrivato cra, vale?
    }
    {charTag(SecondCharacter, "neutral")}:              A un certo punto ero alla stazione.
                                                        E avevo voglia di caramelle.
    {charTag(SecondCharacter, "energy")}:               Ma voglio sempre le caramelle.
    {charTag(FirstCharacter, "neutral")}:               Pensi ci abbiano rapito?
    {charTag(SecondCharacter, "energy")}:               Sarebbe DIVERTENTISSIMO!
    {charTag(FirstCharacter, "annoyed")}:               Bimbo, dobbiamo rivedere la tua idea di divertente!
    {charTag(FirstCharacter, "affectionate")}:          E poi che senso ha rapirci e lasciarci in un posto figo, così a caso?
    {
        - are_two_entities_together(Mentor, PG):
        {charTag(Mentor, "hurry")}:                     Sono felice che apprezzi questi luoghi, {charNameOne}.
    }
    {charTag(SecondCharacter, "energy")}:               Io voglio capire TUTTO di questo posto. Tutto!
                                                        Capire cosa si può mangiare e cosa no.
                                                        E dove portano tutti quei posti chiusi.
                                                        E...
    {charTag(FirstCharacter, "annoyed")}:               Uh, bimbo, respira!
    {charTag(FirstCharacter, "neutral")}:               Perché non partiamo da una cosa più tranquilla?
    {charTag(FirstCharacter, "affectionate")}:          Tipo che ne so, dormircela un attimo?
                                                        Sai quante occasioni ti capiteranno per dormire a modo dopo le elementari?
    {charTag(FirstCharacter, "annoyed")}:               Zero.
    {charTag(SecondCharacter, "neutral")}:              No no no.
                                                        Che noia.
    {charTag(SecondCharacter, "energy")}:               Forse posso arrampicarmi sugli alberi della foresta e vedere se ci sono scoiattoli!
    {charTag(FirstCharacter, "annoyed")}:               E io inizio a pregare che da qualche parte ci sia un'infermeria.
        
    {
        - are_two_entities_together(Mentor, PG):
        {charTag(Mentor, "neutral")}:                   Fammi vedere se ho dei cerotti da qualche parte.
                                                        E delle garze.
        {charTag(Mentor, "sad")}:                       Avrò del disinfettante?
        {charTag(Mentor, "hurry")}:                     Non è mai servito del disinfettante!
                                                        Devo controllare, subito!
        ~ change_entity_place(Mentor)
    }
        
    {charTag(SecondCharacter, "energy")}:               E tu cosa fai se ci hanno rapito gli alieni?
    
        + \ {charTag(PG, "neutral")}:                   Dormiamo qualche giorno, siii!
                -> glyph_modifier_variation_management(FirstCharacter, earthC)->
        {charTag(SecondCharacter, "neutral")}:          Voi persone vecchie siete noiose.
                                                        Nemmeno la nonna pensa così tanto a dormire!
        {charTag(FirstCharacter, "annoyed")}:           Perché tua nonna è in pensione e non deve pensare costantemente a PRODURRE!

        + \ {charTag(PG, "neutral")}:                   Anche io voglio studiarmi tutto!
            -> glyph_modifier_variation_management(FirstCharacter, airC)->
        {charTag(SecondCharacter, "energy")}:           Sìì! E il nostro team batte il team SIAMO NOIOSI E DORMIAMO SEMPRE DI {charNameOne}!
        {charTag(FirstCharacter, "annoyed")}:           Sarò noiosa, ma tu arriverai ai quindici anni più ansioso di un pinscher, piccoletto.

        + \ {charTag(PG, "neutral")}:                   Mi metterei a piangere {player_pronouns has him:terrorizzato|{player_pronouns has her:terrorizzata|terrorizzatə}} in un angolino.
                -> glyph_modifier_variation_management(FirstCharacter, waterC)->
        {charTag(SecondCharacter, "melanchonic")}:      Come i bambini piccoli. No no no.
        {charTag(FirstCharacter, "affectionate")}:      Mi ci riconosco, totale.

        + \ {charTag(PG, "neutral")}:                   Mentre mi leggono la mente penso a cose assurdissime!
            -> glyph_modifier_variation_management(FirstCharacter, fireC)->
        {charTag(SecondCharacter, "energy")}:           Sarebbe divertentissimo!
                                                        Ora provo a pensare tantissimo alla cacca!
        {charTag(FirstCharacter, "affectionate")}:      La mia mente è limpida e innocente.
        {charTag(FirstCharacter, "neutral")}:           Non come quella di un bambino, ascoltando le cose che dice il piccoletto.
            
        + \ {charTag(PG, "neutral")}:                   Gli chiederei qual'è il senso della vita.
            -> glyph_modifier_variation_management(FirstCharacter, aetherC)->
        {charTag(SecondCharacter, "neutral")}:          Te lo dico io: caramelle!
                                                        E vedere i pinguini.
        {charTag(FirstCharacter, "affectionate")}:      Ma sarebbe una risposta che mi risolverebbe una marea di problemi.
        -    
    {charTag(FirstCharacter, "neutral")}:               Bene, direi che abbiamo tutt3 qualcosa a cui pensare.
    {charTag(FirstCharacter, "affectionate")}:          Tipo, dove schiacciarmi quel pisolino.
 
        -> second_char_closing_storylet ->
        -> first_char_closing_storylet ->
        ->->    

=== about_violence_and_peace
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    {charTag(SecondCharacter, "neutral")}:              Non hai detto "Ti devo chiedere scusa {charNameTwo}?
                                                        Perché mica l'hai ancora fatto!
    {charTag(Mentor, "sad")}:                           Sì, ma è importante che anche tu ragioni sulla tua violenza.
    {charTag(SecondCharacter, "angry")}:                Non sono io che ti ho picchiato.
    {charTag(Mentor, "bored")}:                         In realtà.
    {charTag(Mentor, "neutral")}:                       No.
                                                        Respira {mentorName}, respira.
    {charTag(Mentor, "sad")}:                           Hai ragione.
    {charTag(Mentor, "neutral")}:                       Sono qui per chiederti scusa, {charNameTwo}.
                                                        Non avrei dovuto farti male.
    {charTag(Mentor, "sorry")}:                         Mi dispiace.
    {charTag(SecondCharacter, "neutral")}:              Ok.
    {charTag(Mentor, "neutral")}:                       Ok?
    {charTag(SecondCharacter, "neutral")}:              Sì, non ho mica altro da dirti.
    {charTag(Mentor, "sad")}:                           Ma io.
    {charTag(SecondCharacter, "neutral")}:              I grandi chiedono sempre scusa per tutte le cose ma poi le rifanno.
                                                        Poi piangono e chiedono scusa.
    {charTag(SecondCharacter, "angry")}:                E poi le rifanno.
    {charTag(Mentor, "hurry")}:                         Ma io ci credo davvero, {charNameTwo}!
                                                        Non ti voglio più far del male.
    {charTag(SecondCharacter, "neutral")}:              Ok.
                                                        Però va bene così.
    {charTag(SecondCharacter, "neutral")}:              Ora ho voglia solo di cercare qualcosa da mangiare.
            ~ change_entity_place(SecondCharacter)
    {
        - are_two_entities_together(FirstCharacter, PG):
    {charTag(FirstCharacter, "sad")}:                   Povero piccolo.
    {charTag(FirstCharacter, "affectionate")}:          Però è stato molto coraggioso, vero?
    }
    {charTag(Mentor, "sad")}:                           Non mi perdonerà mai, vero {player_name}?


        + \ {charTag(PG, "neutral")}:                   Temo che gli adulti non siano la sua cosa preferita.
                -> glyph_modifier_variation_management(Mentor, waterC)->
        {charTag(Mentor, "sad")}:                       Lo temo anche io.
                                                        E questo significa che devo fare il doppio del lavoro per avere la sua  fiducia.
        {charTag(Mentor, "hurry")}:                     Ma la avrò!
                                                        E capirà che anche gli adulti sono persone di cui potersi fidare.                                               
        {
            - are_two_entities_together(FirstCharacter, PG):
            {charTag(FirstCharacter, "neutral")}:       Sai che non è una gara, vero?
        }

        + \ {charTag(PG, "neutral")}:                   Tu ti sei perdonata, per quello che hai fatto?
                -> glyph_modifier_variation_management(Mentor, aetherC)->
        {charTag(Mentor, "sad")}:                       Non.
                                                        No.
                                                        Non credo di aver capito ancora fino in fondo cosa è successo.
                                                        E sono troppo tesa ora per capire cosa mi passi per la testa.
                                                        Sono una pessima {mentorName}, vero?
        {
        - are_two_entities_together(FirstCharacter, PG):
        {charTag(FirstCharacter, "affectionate")}:       Al massimo sei umana, ama.
        }
        
        + \ {charTag(PG, "neutral")}:                    Ha bisogno di spazio per sé, {mentorName}.
                -> glyph_modifier_variation_management(Mentor, earthC)->
        {charTag(Mentor, "sad")}:                       Ma io...
                                                        Uh.
                                                        Non ci so stare nelle situazioni così.
                                                        Senza sapere se la persona mi odia o meno.
                                                        È faticosissimo, {player_name}.
            
        + \ {charTag(PG, "neutral")}:                   Hai imparato qualcosa, da questa situazione?
                -> glyph_modifier_variation_management(Mentor, airC)->
        {charTag(Mentor, "sad")}:                       Che sono un disastro?
                                                        Che come provo a fare un passo deciso, ferisco qualcuno?
                                                        Che forse non sono un granché come {mentorName}?
        
        + \ {charTag(PG, "neutral")}:                    L'hai ferito, cosa ti aspettavi?
                -> glyph_modifier_variation_management(Mentor, fireC)->
        {charTag(Mentor, "sad")}:                       Un po' di comprensione.
                                                        Di ascolto.
                                                        Delle mie ragioni.
                                                        Oh cavoletti.
                                                        L'ho fatto per me, vero?
                                                        Ho chiesto scusa per me, non per lui.
        -
    {charTag(Mentor, "neutral")}:                       Grazie per le tue parole, {player_name}.
            -> mentor_closing_storylet ->
            -> second_char_closing_storylet ->
            ->->

=== first_mentor_chit_chat
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    {charTag(FirstCharacter, "affectionate")}:          No, non scherzo, {mentorName}, ti invidio un sacco.
    {charTag(FirstCharacter, "neutral")}:               Hai uno scopo chiaro.
                                                        E fai qualcosa di buono per le altre persone.
    {charTag(FirstCharacter, "affectionate")}:          Mi sembra la cosa migliore che possa capitare nella vita.
    {
        - are_two_entities_together(Franco, PG):
        {charTag(Franco, "{portrait_Franco()}")}:       La cosa migliore che ti possa capitare è il karaoke di cugina Sputt.
                                                        Ma è meglio non starle troppo vicino.
    }
    {charTag(Mentor, "hurry")}:                         Anche tu hai uno scopo, {charNameOne}.
                                                        Tutti l'abbiamo.
    {charTag(FirstCharacter, "sad")}:                   E quale sarebbe il mio?
    {charTag(Mentor, "hurry")}:                         Un po' lo scoprirai da te, parlando con {player_name}.
    {charTag(Mentor, "neutral")}:                       Ma una cosa è certa: se non saprai trovare il bello in ciò che già hai, non sarai felice nemmeno quando avrai un nuovo nome.
    {charTag(Mentor, "hurry")}:                         La felicità non è un luogo da raggiungere, ma qualcosa che si ha dentro.
    {charTag(FirstCharacter, "neutral")}:               Mmm.
                                                        Certo.
    {charTag(FirstCharacter, "annoyed")}:               Scusa {mentorName}, però un po' mi viene da dirti che è facile dirlo, quando fai già quello che ami.
                                                        È una posizione privilegiata.
    {charTag(Mentor, "neutral")}:                       È un privilegio che mi sono creata, accogliendo il bello anche nelle cose difficili.
    {charTag(FirstCharacter, "curious")}:               {player_name}, tu cosa pensi?
                                                        La felicità è questa roba che dice {mentorName}?
    {charTag(FirstCharacter, "annoyed")}:               Che te la ritrovi se ti fai andare bene quello che hai?
    {charTag(Mentor, "neutral")}:                       O quello che dice {charNameOne}.
    {charTag(Mentor, "sad")}:                           Qualcosa che è sempre altrove e quindi irraggiungibile?
    
        + \ {charTag(PG, "neutral")}:                   {mentorName}, tu parli di arrendersi.
            -> glyph_modifier_variation_management(FirstCharacter, fireC)->
        {charTag(Mentor, "neutral")}:                   Non arrendersi, {player_name}, ma accogliere quello che si ha.
        {charTag(FirstCharacter, "sad")}:               E non vedo differenza, {mentorName}.
            
        + \ {charTag(PG, "neutral")}:                   {mentorName}, razionalmente la felicità ha una natura temporanea.
            -> glyph_modifier_variation_management(FirstCharacter, airC)->
        {charTag(FirstCharacter, "affectionate")}:      Oh, che bello sentire qualcun{player_pronouns has him:o|{player_pronouns has her:a|ə}} che matcha la mia gioia di vivere.
        {charTag(Mentor, "neutral")}:                   Il fatto che sia temporanea non nega la mia teoria.
        
        //più terra
        + \ {charTag(PG, "neutral")}:                   La felicità è una coperta morbida dopo una giornata di duro lavoro.
            -> glyph_modifier_variation_management(FirstCharacter, earthC)->
        {charTag(FirstCharacter, "annoyed")}:           Credo che quello si chiami "abuso di sostanze".
        {charTag(Mentor, "sad")}:                       Con un linguaggio meno colorito, direi comunque che sì, ha ragione {charNameOne}.

        + \ {charTag(PG, "neutral")}:               Non credo nella felicità, ma credo nel piacere dato dalle persone vicine.
            -> glyph_modifier_variation_management(FirstCharacter, waterC)->    
        {charTag(Mentor, "neutral")}:               Questa è una lettura che potrei apprezzare.
        {charTag(FirstCharacter, "curious")}:       Woah!
        {charTag(FirstCharacter, "affectionate")}:  Vuol dire che {player_name} ha trovato un punto di contatto tra noi in questa discussione?
        {charTag(Mentor, "hurry")}:                 Eh sì, mi sa proprio di sì.
            
        + \ {charTag(PG, "neutral")}:               La felicità è qualcosa che cresce nelle pieghe del quotidiano.
            -> glyph_modifier_variation_management(FirstCharacter, aetherC)->
            {charTag(Mentor, "hurry")}:             Sono contenta che la vediamo allo stesso modo.
            {charTag(FirstCharacter, "annoyed")}:   Le cose che crescono nelle pieghe di solito sono sporche.
                                                    Infestanti.
                                                    E indesiderate.
        -
    {charTag(FirstCharacter, "neutral")}:           Comunque spero tu abbia imparato la lezione, {mentorName}.
    {charTag(Mentor, "neutral")}:                   Lezione?
    {charTag(FirstCharacter, "affectionate")}:      Sì: che se una persona ti dice che ti ammira, è meglio portarsi a casa il complimento e goderselo.
    {charTag(FirstCharacter, "annoyed")}:           Non sono vecchia come te, ma so che non sono tanti gli elogi che ci vengono dati in vita.
        -> first_char_closing_storylet ->
        -> mentor_closing_storylet ->
        ->->

=== frog_and_mentor_chit_chat
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {charTag(Mentor, "neutral")}:                   Però non ti ho mai visto in giro.
    {charTag(Franco, "{portrait_Franco()}")}:       Però sono sempre stato cra!
    {charTag(Mentor, "neutral")}:                   Ma non ti ho mai mai visto in giro.
                                                    E ogni giorno vengo a sistemare il sentiero e pulire la serra.
    {charTag(Franco, "{portrait_Franco()}")}:       Forse allora non sei venuta ogni giorno.
                                                    O forse mi hai scambiato per Tullio? A volte succede.
                                                    O forse non è che hai proprio proprio proprio tutto sotto il tuo controllo.
                                                    Un po' come zio Gracco e il suo problema con l'alcool.
                                                    E i combustibili in generale.
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
                                                    E comunque io non me lo ricordo un Mentore da queste parti.
                                                    E neanche un Nasore o un Orecchiore se è per questo.
    {
    - are_two_entities_together(FirstCharacter, PG):
    {charTag(FirstCharacter, "curious")}:           In che senso, scusa?
    {charTag(Franco, "{portrait_Franco()}")}:       {charNameOne}!
                                                    Prima è passata zia Graaak e ti voleva parlare!
                                                    Tullio dice che c'ha una cotta per te.
                                                    Però non ho visto dove si è bruciata.
                                                    O se ti deve bruciare.
                                                    Non sarebbe molto gentile però, vero?
    {charTag(FirstCharacter, "neutral")}:           Ooook
    {charTag(FirstCharacter, "annoyed")}:           No, non è vero: non ce la posso fare.
            ~ change_entity_place(FirstCharacter)
    }
            -
        -> mentor_closing_storylet ->
        ->->


=== the_witch_and_the_mentor
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {charTag(Mentor, "neutral")}:                   Quindi puoi parlare con, con questo vaso?
                                                    Perché mi piacerebbe.
    {charTag(Mentor, "sorry")}:                     Oh, è una cosa vanitosa.
    {charTag(Mentor, "neutral")}:                   Ma mi piacerebbe sapere cosa ne pensa di me.
                                                    Del mio lavoro.
    {charTag(Mentor, "hurry")}:                     Se sto facendo un buon lavoro.
    {charTag(Mentor, "neutral")}:                   Visto che vede e sente tutto.

    {charTag(TheWitch, witch_state())}:             <i>Crediamo che {mentorName} stia facendo un buon lavoro.</i>
                                                    <i>Così come l'acqua che si raccoglie tra le mani per dissetarci.</i>
                                                    <i>Ma così come l'acqua non può essere incendio, così {mentorName} non può essere qualcosa che non è.</i>
                                                    <i>O portare nomi che non sa.</i>

    + \ {charTag(PG, "neutral")}:                   Metà delle cose che la voce dice sono illogiche.
            -> glyph_modifier_variation_management(Mentor, airC)->
    {charTag(TheWitch, witch_state())}:             <i>{player_name} non vede, e quindi decide che qualcosa non esiste.</i>
                                                    <i>Ma quella cosa esiste anche se {player_name} non vede.</i>
    {charTag(Mentor, "sad")}:                       Uh, peccato.
    {charTag(Mentor, "neutral")}:                   Ma ci sta: questo luogo è così insolito, immagino sia inevitabile non capirlo fino in fondo.
        
    + \ {charTag(PG, "neutral")}:                   Dice che stai facendo un buon lavoro.
            -> glyph_modifier_variation_management(Mentor, waterC)->
    {charTag(Mentor, "hurry")}:                     Oh, ma sicuramente esagera.
    {charTag(Mentor, "sad")}:                       Prendi prima: ho scoperto che per via della mia incuria sta crescendo del muschio sotto al suo vaso.
                                                    Però.
    {charTag(Mentor, "neutral")}:                   Ringrazia la voce da parte mia.
    {charTag(TheWitch, witch_state())}:             <i>Dire una mezza verità porta su una mezza strada.</i>
    
    + \ {charTag(PG, "neutral")}:                   Ha parlato di incendi e acqua, forse hai bruciato qualcosa?
            -> glyph_modifier_variation_management(Mentor, earthC)->
    {charTag(Mentor, "sad")}:                       Non è che ho lasciato qualcosa di acceso in cucina?
                                                    No dai, si vedrebbe il fumo da qui, sicuro.
    {charTag(Mentor, "neutral")}:                   Magari è qualcosa di simbolico.
    {charTag(Mentor, "sorry")}:                     Spero di non aver distrutto nulla.
    
    + \ {charTag(PG, "neutral")}:                   Non è più importante il tuo di giudizio sul tuo lavoro, {mentorName}?
            -> glyph_modifier_variation_management(Mentor, aetherC)->
    {charTag(Mentor, "neutral")}:                   Credo di sì.
                                                    Ma uno sguardo esterno ci può aiutare, immagino.
    {charTag(Mentor, "sad")}:                       Oh, non lo so.
    {charTag(Mentor, "neutral")}:                   Sì.
                                                    Credo di star facendo un buon lavoro.

    + \ {charTag(PG, "neutral")}:                   Ha detto tante cose ma la risposta è: no.
            -> glyph_modifier_variation_management(Mentor, fireC)->
    {charTag(TheWitch, witch_state())}:             <i>La frusta che cade senza motivo non porta alcun insegnamento.</i>
    {charTag(Mentor, "sad")}:                       Oh.
                                                    Forse potrei chiedere scusa in qualche modo a...
                                                    Ma a chi?
                                                    Come?
    {charTag(Mentor, "hurry")}:                     Ho deciso: pulisco il tronco.
    {charTag(Mentor, "neutral")}:                   Potrebbe apprezzare, immagino.
    {charTag(TheWitch, witch_state())}:             <i>Noi non abbiamo bisogno di pulizia, il nostro sporco è nido per funghi e insetti.</i> 
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
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {charTag(FirstCharacter, "annoyed")}:           Credo di avere il mal di testa.
    {charTag(Franco, "{portrait_Franco()}")}:       Lo dice sempre anche Giulio.
    {charTag(FirstCharacter, "neutral")}:           Che è tuo figlio.
    {charTag(Franco, "{portrait_Franco()}")}:       No, che è uno dei miei mariti.
                                                    I miei figli sono Abaco, Aimone, Altobrando, Appasilarco, Azzolino, Borci, Clodoveo, Comunardo
    {charTag(FirstCharacter, "neutral")}:           No aspetta aspetta, ti avevo solo chiesto di.
    {charTag(Franco, "{portrait_Franco()}")}:       Emerenzio, Etelbero, Euforbo, Fulco, Matteo.
    {charTag(FirstCharacter, "curious")}:           Matteo?
                                                    Un nome così normale?
    {charTag(Franco, "{portrait_Franco()}")}:       L'abbiamo adottato.
                                                    Poi c'è Giosafatta, Gondio, Grimildo, Pierpietro, Piersabato.
    {charTag(FirstCharacter, "annoyed")}:           Ti ho solo chiesto dove si trova del vino!
    {charTag(Franco, "{portrait_Franco()}")}:       Zelinda, Veneranda, Uga, Torlonia, Tamatta, Ruslana e Ruslanina.
    {charTag(FirstCharacter, "annoyed")}:           Qualcuno mi soffochi, ora.
    {charTag(Franco, "{portrait_Franco()}")}:       Piccarda, Perlita, Macrina, Gliceria, Gianbrunilde, Eulalia,    Ermenegigia...
    {charTag(FirstCharacter, "neutral")}:           {player_name} dimmi che non sto impazzendo solo io!

        + \ {charTag(PG, "neutral")}:               Franco, sembri davvero legato alla tua famiglia.
                -> glyph_modifier_variation_management(FirstCharacter, waterC)->
        {charTag(Franco, "{portrait_Franco()}")}:   No, non legato.
                                                    Quello è successo solo alla festa di laurea di zio Gracco.
                                                    Ma ho ripetuto tutto il tempo che non era colpa mia.
                                                    E non mi hanno creduto.
                                                    Mi era solo rimasta una spoletta di filo nella tasca.
                                                    Che si è attaccata alla porta.
                                                    E poi al lavandino.
                                                    E poi a zia Graaak.
                                                    E da lì a tutte le altre rane.    
            
        + \ {charTag(PG, "neutral")}:               C'è qualcosa nell'illogicità di Franco che è quasi divina.
                -> glyph_modifier_variation_management(FirstCharacter, aetherC)->
        {charTag(Franco, "{portrait_Franco()}")}:   Quindi posso esaudire i desideri delle persone?
                                                    {charNameOne}!
                                                    Che cosa desideri?
        {charTag(FirstCharacter, "annoyed")}:       Che questa conversazione finisca?
        {charTag(Franco, "{portrait_Franco()}")}:   Fatto!
                                                    Chiamatemi come il dio egiziano.
                                                    Cra.                                                
        
        + \ {charTag(PG, "neutral")}:               "Non sto impazzendo solo io.""
                -> glyph_modifier_variation_management(FirstCharacter, earthC)->
        {charTag(FirstCharacter, "annoyed")}:       Questa sarebbe stata brutta anche in bocca a Franco.
        {charTag(Franco, "{portrait_Franco()}")}:   Cosa ho in bocca?
                                                    Cos'è questa cosa?
                                                    Aargh.
                                                    Ah.
                                                    La mia lingua.
        
        + \ {charTag(PG, "neutral")}:               Mi spieghi da dove vengono tutti questi nomi brutti, Franco?
                -> glyph_modifier_variation_management(FirstCharacter, airC)->
        {charTag(Franco, "{portrait_Franco()}")}:   Non sono brutti, sono nomi di famiglia.
                                                    Li abbiamo iniziati ad usare sei generazioni fa.
                                                    Perché chiamarci "Ehi tu!" era davvero scomodo.
                                                    Il primo nome che abbiamo scoperto è stato Franco.
                                                    E per un po' ci siamo chiamati tutti Franco.
                                                    Ma questo creava un po' di confusione.
                                                    Ti svegli la mattina e ti dici: ma sarò io-Franco oggi, o cugino-Franco?
                                                    E così.    
        {charTag(FirstCharacter, "annoyed")}:       BASTAAAAAAAAAAAAAAAAAAAAAAAAAAAAA!

        + \ {charTag(PG, "neutral")}:               Se usasse quella lingua per cose intelligenti, Franco salverebbe il mondo.
            -> glyph_modifier_variation_management(FirstCharacter, fireC)-> 
        {charTag(FirstCharacter, "annoyed")}:       Non esageriamo.
        {charTag(FirstCharacter, "curious")}:       Però i suoi delirii hanno del fascino.
                                                    Se presi a piccole dosi.
        {charTag(Franco, "{portrait_Franco()}")}:   Un po' come i pollini.
        {charTag(FirstCharacter, "curious")}:       In che senso?
        {charTag(Franco, "{portrait_Franco()}")}:   A piccole dosi ti commuovono.
                                                    Ma a grandi dosi voli via.
        {charTag(FirstCharacter, "annoyed")}:       Eh?!?                                            
        {charTag(Franco, "{portrait_Franco()}")}:   Ehi {charNameOne}! Che bello vederti!
                                                    Ti ho mai parlato degli studi al Conservatorio di Etelbero?
        {charTag(FirstCharacter, "annoyed")}:       Uccidetemi.        
        -
        -> first_char_closing_storylet ->
        ->->

=== frog_and_second_char_chit_chat
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    {charTag(Franco, "{portrait_Franco()}")}:           E Franco ti dice che non è vero, {charNameTwo}.
    {charTag(SecondCharacter, "angry")}:                Ma è IM-POS-SI-BI-LE!
    {charTag(Franco, "{portrait_Franco()}")}:           No no no, impossibile è un bambino che sa parlare.
    {charTag(SecondCharacter, "melanchonic")}:          Ma io so parlare!
    {charTag(Franco, "{portrait_Franco()}")}:           E sei un bambino? Dimostralo!
    {charTag(SecondCharacter, "neutral")}:              Sono basso.
    {charTag(Franco, "{portrait_Franco()}")}:           Anche io.
    {charTag(SecondCharacter, "neutral")}:              E vado a scuola.
    {charTag(Franco, "{portrait_Franco()}")}:           Quello lo fanno i girini, non i bambini.
    {charTag(SecondCharacter, "neutral")}:              E non sono un girino?
    {charTag(Franco, "{portrait_Franco()}")}:           Hai delle braccia, i girini non le hanno.
    {charTag(SecondCharacter, "energy")}:               Quindi sono una rana?
    {charTag(Franco, "{portrait_Franco()}")}:           Può darsi.
                                                        Sai fare CRAAAAAAC?
    {charTag(SecondCharacter, "energy")}:               CRAAAAAAC!
    {charTag(Franco, "{portrait_Franco()}")}:           E sai saltare?
    {charTag(SecondCharacter, "energy")}:               Sìì!
    {charTag(Franco, "{portrait_Franco()}")}:           E hai uno zio che si chiama Gracco?
    {charTag(SecondCharacter, "melanchonic")}:          No.
    {charTag(Franco, "{portrait_Franco()}")}:           Forse però non è così importante.
                                                        Quindi sì: non sei un bambino, sei una rana!
                                                        E sai nuotare?
    {charTag(SecondCharacter, "neutral")}:              Sì no boh.
    {charTag(SecondCharacter, "melanchonic")}:          No.
    {charTag(Franco, "{portrait_Franco()}")}:           Visto?
                                                        Come ti dicevo prima: le rane non sanno nuotare.
                                                        Logico, no?
    {charTag(SecondCharacter, "neutral")}:              Mmm.
                                                        Non sono mica tanto convinto.
    {
    - are_two_entities_together(FirstCharacter, PG):
    {charTag(FirstCharacter, "neutral")}:               Beeeene!
                                                        E anche questa roba tra qualche anno si trasformerà in un lunghissimo percorso di psicoterapia.
    }
    {charTag(Franco, "{portrait_Franco()}")}:           Però possiamo chiedere alle foglie.
                                                        Tullio dice sempre che nuotano nell'aria.
    {
    - are_two_entities_together(Mentor, PG):
    {charTag(Mentor, "neutral")}:                       Comincio a sospettare che questa rana farà più danni di quanti ne potrò risolvere.
    }
    
    {charTag(Franco, "{portrait_Franco()}")}:           Secondo te {player_name} come facciamo a capire se {charNameTwo} è una rana?

        + \ {charTag(PG, "neutral")}:                   Vediamo come se la cava a cantare.
                -> glyph_modifier_variation_management(SecondCharacter, waterC)->
        {charTag(Franco, "{portrait_Franco()}")}:       Geniale!
                                                        {charNameTwo}: ti portiamo al karaoke di cugina Sputt.
                                                        E se sai tutte le parole di <i>(You Drive Me)Craaazy</i> sei una rana!
        {charTag(SecondCharacter, "neutral")}:          Le parole di cosa?!?

        + \ {charTag(PG, "neutral")}:                   Dato che è un mistero irrisolvibile, sta a {charNameTwo} decidere se lo è o meno.
                -> glyph_modifier_variation_management(SecondCharacter, aetherC)->
        {charTag(Franco, "{portrait_Franco()}")}:       E cosa ne pensa {charNameTwo}?
        {charTag(SecondCharacter, "energy")}:           Mi sembrava una cosa bellissima essere una rana.
        {charTag(SecondCharacter, "angry")}:            Ma poi ho scoperto che i girini hanno la scuola, BLEAH!
        {charTag(SecondCharacter, "melanchonic")}:      Però questo è vero anche se resto bambino.
        {charTag(SecondCharacter, "neutral")}:          Però Franco ricorda tutti i compleanni dei suoi girini.
                                                        Questo è un punto a favore per dire che sono una rana!
                                                        Ci devo ancora pensare.
    
        + \ {charTag(PG, "neutral")}:                    Proviamo a fargli piace mangiare i lombrichi.
                -> glyph_modifier_variation_management(SecondCharacter, earthC)->
        {charTag(SecondCharacter, "angry")}:            Questa è la cosa più BLEAH che potessi dire!
        {charTag(Franco, "{portrait_Franco()}")}:       Ma poi non ha senso!
                                                        Io sono vegetariano per esempio.
                                                        E sono sempre una rana, no?
                                                        O non lo sono più?
                                                        Non è che sono diventato un airone?
                                                        Forse so volare?
        
        + \ {charTag(PG, "neutral")}:                    Franco: tu non sai nuotare, e nemmeno {charNameTwo}: non è che tu sei un bambino?
                -> glyph_modifier_variation_management(SecondCharacter, airC)->
        {charTag(SecondCharacter, "energy")}:           Siii!
                                                        Ha moooolto più senso!
        {charTag(Franco, "{portrait_Franco()}")}:       Ma se sono un bambino vuol dire che non devo più lavorare?
        {charTag(SecondCharacter, "neutral")}:          Perché, tu lavori?
        {charTag(Franco, "{portrait_Franco()}")}:       Certo! Sono istruttore di nuoto per i girini!
        {charTag(SecondCharacter, "energy")}:           Ma non sai nuotare!
        {charTag(Franco, "{portrait_Franco()}")}:       E infatti gli istruisco a non nuotare.
                                                        Così non annegano.
                                                        Logico, no?                                      
        
        + \ {charTag(PG, "neutral")}:                   La risposta è nel corpo: vediamo quanto salta in alto!
                -> glyph_modifier_variation_management(SecondCharacter, fireC)-> 
        {charTag(SecondCharacter, "angry")}:            Io oooooooodio lo sport!
                                                        E odio saltare!
        {charTag(Franco, "{portrait_Franco()}")}:       E io non so saltare.
                                                        Questa cosa non ha senso {player_name}!                                                
        -

        {charTag(Franco, "{portrait_Franco()}")}:       Non ti preoccupare {charNameTwo}, arriveremo a capo di questo mistero!
    
    -> second_char_closing_storylet ->
    ->->



=== frog_and_third_char_chit_chat ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
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
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
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
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
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
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
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
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

        {charTag(Carla, "neutral")}:                    Per ogni chiarimento richiesto da un minore, è necessaria la presenza di un adulto.
        {charTag(SecondCharacter, "energy")}:           Ecco ecco, ora c'è qui {player_name}!
                                                        E {player_name} è un{player_pronouns has her:a|ə} adult{player_pronouns has him:o|{player_pronouns has her:a|ə}}.
                                                        Quindi ora puoi rispondermi.
        {charTag(Carla, "neutral")}:                    Mi ripeta la domanda.
        {charTag(SecondCharacter, "energy")}:           È vero che le capre recitano?
        {charTag(Carla, "bored")}:                      Decreto legislativo 134/2022, sezione 65.
        {charTag(Carla, "neutral")}:                    "È previsto che ogni capra svezzata segua un corso di recitazione di anni tre presso la Royal Academy of Dramatic Art."
                                                        "Il costo è a carico dell'allevatore, o di chi ne fa ne veci."
                                                        "Il percorso sarà ritenuto concluso quando la suddetta capra avrà mangiato almeno una delle seguenti opere."
                                                        "<i>Sogno di una capra di mezza estate.</i>"
                                                        "<i>Gli allegri somari di Windsor.</i>"
                                                        "<i>Beetello</i>."
                                                        "Se entro tre anni non verrà consumata nessuna delle tre opere, la capra verrà privata del suo nome."
                                                        "Da quel momento verrà considerata per sempre da tutte le persone come la cosa più fastidiosa del mondo."
                                                        "Un riccio."
        {charTag(SecondCharacter, "melanchonic")}:      Quindi mi stai prendendo in giro?
        {charTag(Carla, "happy")}:                      Non ho forse recitato benissimo?


    -> second_char_closing_storylet ->
    ->->