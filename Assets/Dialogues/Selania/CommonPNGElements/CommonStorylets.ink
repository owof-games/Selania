=== first_second_chit_chat
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    {charTag(FirstCharacter, "curious")}:                       Quindi anche tu non ricordi come sei arrivato qui?
    {charTag(SecondCharacter, "melanchonic")}:                  Sì no boh.
    {charTag(SecondCharacter, "neutral")}:                      No.
    {
        - are_two_entities_together(Franco, PG):
        {charTag(Franco, "neutral")}:                           Neanche io so come sono arrivato qua.
        {charTag(Franco, "party")}:                             Ma so come sono arrivato craaack!
    }
    {charTag(SecondCharacter, "neutral")}:                      A un certo punto ero alla stazione.
                                                                E avevo voglia di caramelle.
    {charTag(SecondCharacter, "energy")}:                       Ma voglio sempre le caramelle.
    {charTag(FirstCharacter, "neutral")}:                       Pensi ci abbiano rapito?
    {charTag(SecondCharacter, "energy")}:                       Sarebbe DIVERTENTISSIMO!
    {charTag(FirstCharacter, "annoyed")}:                       Bimbo, dobbiamo rivedere la tua idea di divertente!
    {charTag(FirstCharacter, "affectionate")}:                  E poi che senso ha rapirci e lasciarci in un posto figo, così a caso?
    {
        - are_two_entities_together(Mentor, PG):
        {charTag(FifthCharacter, "hurry")}:                     Sono felice che apprezzi questi luoghi, {charNameOne}.
    }
    {charTag(SecondCharacter, "energy")}:                       Io voglio capire TUTTO di questo posto. Tutto!
                                                                Capire cosa si può mangiare e cosa no.
                                                                E dove portano tutti quei posti chiusi.
                                                                E...
    {charTag(FirstCharacter, "annoyed")}:                       Uh, bimbo, respira!
    {charTag(FirstCharacter, "neutral")}:                       Perché non partiamo da una cosa più tranquilla?
    {charTag(FirstCharacter, "affectionate")}:                  Tipo che ne so, dormircela un attimo?
                                                                Sai quante occasioni ti capiteranno per dormire a modo dopo le elementari?
    {charTag(FirstCharacter, "annoyed")}:                       Zero.
    {charTag(SecondCharacter, "neutral")}:                      No no no.
                                                                Che noia.
    {charTag(SecondCharacter, "energy")}:                       Forse posso arrampicarmi sugli alberi della foresta e vedere se ci sono scoiattoli!
    {charTag(FirstCharacter, "annoyed")}:                       E io inizio a pregare che da qualche parte ci sia un'infermeria.
        
    {
        - are_two_entities_together(Mentor, PG):
        {charTag(FifthCharacter, "neutral")}:                   Fammi vedere se ho dei cerotti da qualche parte.
                                                                E delle garze.
        {charTag(FifthCharacter, "sad")}:                       Avrò del disinfettante?
        {charTag(FifthCharacter, "hurry")}:                     Non è mai servito del disinfettante!
                                                                Devo controllare, subito!
        ~ change_entity_place(Mentor)
    }

    {charTag(FirstCharacter, "neutral")}:                       E tu cosa vorresti fare invece {player_name}?     
    {charTag(SecondCharacter, "energy")}:                       O cosa fai se ci hanno rapito gli alieni?
    
        + \ {charTag(PG, "neutral")}:                           Concordo con {charNameOne}: dormiamocela!
                -> glyph_choice_manager(false, earthC)->
        {charTag(SecondCharacter, "neutral")}:                  Voi persone vecchie siete noiose.
                                                                Nemmeno la nonna pensa così tanto a dormire!
        {charTag(FirstCharacter, "annoyed")}:                   Perché tua nonna è in pensione e non deve pensare costantemente a PRODURRE!

        + \ {charTag(PG, "neutral")}:                           Voglio capire tutto, come {charNameTwo}.
            -> glyph_choice_manager(false, airC)->
        {charTag(SecondCharacter, "energy")}:                   Sìì! E il nostro team batte il team SIAMO NOIOSI E DORMIAMO SEMPRE DI {charNameOne}!
        {charTag(FirstCharacter, "annoyed")}:                   Sarò noiosa, ma tu arriverai ai quindici anni più ansioso di un pinscher, piccoletto.

        + \ {charTag(PG, "neutral")}:                           Alieni? Mi metto a piangere {player_pronoun has him:terrorizzato|{player_pronoun has her:terrorizzata|terrorizzatə}} in un angolino.
                -> glyph_choice_manager(false, waterC)->
        {charTag(SecondCharacter, "melanchonic")}:              Come i bambini piccoli. No no no.
        {charTag(FirstCharacter, "affectionate")}:              Mi ci riconosco, totale.

        + \ {charTag(PG, "neutral")}:                           Se gli alieni mi leggono la mente penso a cose assurdissime!
            -> glyph_choice_manager(false, fireC)->
        {charTag(SecondCharacter, "energy")}:                   Sarebbe divertentissimo!
                                                                Ora provo a pensare tantissimo alla cacca!
        {charTag(FirstCharacter, "affectionate")}:              La mia mente è limpida e innocente.
        {charTag(FirstCharacter, "neutral")}:                   Non come quella di un bambino, ascoltando le cose che dice il piccoletto.
            
        + \ {charTag(PG, "neutral")}:                           Chiederei agli alieni qual'è il senso della vita.
            -> glyph_choice_manager(false, aetherC)->
        {charTag(SecondCharacter, "neutral")}:                  Te lo dico io: caramelle!
                                                                E vedere i pinguini.
        {charTag(FirstCharacter, "affectionate")}:              Ma sarebbe una risposta che mi risolverebbe una marea di problemi.
        -    
    {charTag(FirstCharacter, "neutral")}:                       Bene, direi che abbiamo tutt3 qualcosa a cui pensare.
    {charTag(FirstCharacter, "affectionate")}:                  Tipo, dove schiacciarmi quel pisolino.

        -> second_char_closing_storylet ->
        -> first_char_closing_storylet ->
        ->->    

=== about_violence_and_peace
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    
    {charTag(SecondCharacter, "neutral")}:                              Non hai detto "Ti devo chiedere scusa {charNameTwo}?
                                                                        Perché mica l'hai ancora fatto!
    {charTag(FifthCharacter, "sad")}:                                   Sì, ma è importante che anche tu ragioni sulla tua violenza.
    {charTag(SecondCharacter, "angry")}:                                Non sono io che ti ho picchiato.
    {charTag(FifthCharacter, "bored")}:                                 In realtà.
    {charTag(FifthCharacter, "neutral")}:                               No.
                                                                        Respira {charNameFive}, respira.
    {charTag(FifthCharacter, "sad")}:                                   Hai ragione.
    {charTag(FifthCharacter, "neutral")}:                               Sono qui per chiederti scusa, {charNameTwo}.
                                                                        Non avrei dovuto farti male.
    {charTag(FifthCharacter, "sorry")}:                                 Mi dispiace.
    {charTag(SecondCharacter, "neutral")}:                              Ok.
    {charTag(FifthCharacter, "neutral")}:                               Ok?
    {charTag(SecondCharacter, "neutral")}:                              Sì, non ho mica altro da dirti.
    {charTag(FifthCharacter, "sad")}:                                   Ma io.
    {charTag(SecondCharacter, "neutral")}:                              I grandi chiedono sempre scusa per tutte le cose ma poi le rifanno.
                                                                        Poi piangono e chiedono scusa.
    {charTag(SecondCharacter, "angry")}:                                E poi le rifanno.
        {
        - are_two_entities_together(ThirdCharacter, PG):
        {charTag(ThirdCharacter, "neutral")}:                           Ma guarda quanto è saggio questo Ricciolino.
        }
    {charTag(FifthCharacter, "hurry")}:                                 Ma io ci credo davvero, {charNameTwo}!
                                                                        Non ti voglio più far del male.
    {charTag(SecondCharacter, "neutral")}:                              Ok.
                                                                        Però va bene così.
    {charTag(SecondCharacter, "neutral")}:                              Ora ho voglia solo di cercare qualcosa da mangiare.
            ~ change_entity_place(SecondCharacter)
        {
                - are_two_entities_together(FirstCharacter, PG):
        {charTag(FirstCharacter, "sad")}:                                   Povero piccolo.
        {charTag(FirstCharacter, "affectionate")}:                          Però è stato molto coraggioso, vero?
        }
    {charTag(FifthCharacter, "sad")}:                                   Non mi perdonerà mai, vero {player_name}?


        + \ {charTag(PG, "neutral")}:                                   Temo che gli adulti non siano la sua cosa preferita.
                -> glyph_choice_manager(Mentor, waterC)->
        {charTag(FifthCharacter, "sad")}:                               Lo temo anche io.
                                                                        E questo significa che devo fare il doppio del lavoro per avere la sua  fiducia.
        {charTag(FifthCharacter, "hurry")}:                             Ma la avrò!
                                                                        E capirà che anche gli adulti sono persone di cui potersi fidare.                                               
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "neutral")}:                       Sai che non è una gara, vero?
                }

        + \ {charTag(PG, "neutral")}:                                   Tu ti sei perdonata, per quello che hai fatto?
                -> glyph_choice_manager(Mentor, aetherC)->
        {charTag(FifthCharacter, "sad")}:                               Non.
                                                                        No.
                                                                        Non credo di aver capito ancora fino in fondo cosa è successo.
                                                                        E sono troppo tesa ora per capire cosa mi passi per la testa.
                                                                        Sono una pessima {charNameFive}, vero?
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "affectionate")}:                      Al massimo sei umana, ama.
                }
        
        + \ {charTag(PG, "neutral")}:                                   Ha bisogno di spazio per sé, {charNameFive}.
                -> glyph_choice_manager(Mentor, earthC)->
        {charTag(FifthCharacter, "sad")}:                               Ma io...
                                                                        Uh.
                                                                        Non ci so stare nelle situazioni così.
                                                                        Senza sapere se la persona mi odia o meno.
                                                                        È faticosissimo, {player_name}.
            
        + \ {charTag(PG, "neutral")}:                                   C'è qualcosa che hai imparato da questa situazione, {charNameFive}?
                -> glyph_choice_manager(Mentor, airC)->
        {charTag(FifthCharacter, "sad")}:                               Che sono un disastro?
                                                                        Che come provo a fare un passo deciso, ferisco qualcuno?
                                                                        Che forse non sono un granché come {charNameFive}?
        
        + \ {charTag(PG, "neutral")}:                                   L'hai ferito, cosa ti aspettavi?
                -> glyph_choice_manager(Mentor, fireC)->
        {charTag(FifthCharacter, "sad")}:                               Un po' di comprensione.
                                                                        Di ascolto.
                                                                        Delle mie ragioni.
                                                                        Oh cavoletti.
                                                                        L'ho fatto per me, vero?
                                                                        Ho chiesto scusa per me, non per lui.
        -
    {charTag(FifthCharacter, "neutral")}:                               Grazie per le tue parole, {player_name}.
            -> mentor_closing_storylet ->
            -> second_char_closing_storylet ->
            ->->

=== first_mentor_chit_chat
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    
    {charTag(FirstCharacter, "affectionate")}:                          No, non scherzo, {charNameFive}, ti invidio un sacco.
    {charTag(FirstCharacter, "neutral")}:                               Hai uno scopo chiaro.
                                                                        E fai qualcosa di buono per le altre persone.
    {charTag(FirstCharacter, "affectionate")}:                          Mi sembra la cosa migliore che possa capitare nella vita.
    {
        - are_two_entities_together(Franco, PG):
        {charTag(Franco, "party")}:                                     La cosa migliore che ti possa capitare è il karaoke di cugina Sputt.
        {charTag(Franco, "neutral")}:                                   Ma è meglio non starle troppo vicino.
    }
    {charTag(FifthCharacter, "hurry")}:                                 Anche tu hai uno scopo, {charNameOne}.
                                                                        Tutti l'abbiamo.
    {charTag(FirstCharacter, "sad")}:                                   E quale sarebbe il mio?
    {charTag(FifthCharacter, "hurry")}:                                 Un po' lo scoprirai da te, parlando con {player_name}.
    {charTag(FifthCharacter, "neutral")}:                               Ma una cosa è certa: se non saprai trovare il bello in ciò che già hai, non sarai felice nemmeno quando avrai un nuovo nome.
    {charTag(FifthCharacter, "hurry")}:                                 La felicità non è un luogo da raggiungere, ma qualcosa che si ha dentro.
    {charTag(FirstCharacter, "neutral")}:                               Mmm.
                                                                        Certo.
    {charTag(FirstCharacter, "annoyed")}:                               Scusa {charNameFive}, però un po' mi viene da dirti che è facile dirlo, quando fai già quello che ami.
                                                                        È una posizione privilegiata.
    {charTag(FifthCharacter, "neutral")}:                               È un privilegio che mi sono creata, accogliendo il bello anche nelle cose difficili.
    {charTag(FirstCharacter, "curious")}:                               {player_name}, tu cosa pensi?
                                                                        La felicità è questa roba che dice {charNameFive}?
    {charTag(FirstCharacter, "annoyed")}:                               Che te la ritrovi se ti fai andare bene quello che hai?
    {charTag(FifthCharacter, "neutral")}:                               O quello che dice {charNameOne}.
    {charTag(FifthCharacter, "sad")}:                                   Qualcosa che è sempre altrove e quindi irraggiungibile?
    
        + \ {charTag(PG, "neutral")}:                                   Penso che {charNameFive} confonda felicità e resa.
            -> glyph_choice_manager(false, fireC)->
        {charTag(FifthCharacter, "neutral")}:                           Non arrendersi, {player_name}, ma accogliere quello che si ha.
        {charTag(FirstCharacter, "sad")}:                               E non vedo differenza, {charNameFive}.
            
        + \ {charTag(PG, "neutral")}:                                   Non è qualcosa di temporaneo per definizione?
            -> glyph_choice_manager(false, airC)->
        {charTag(FirstCharacter, "affectionate")}:                      Oh, che bello sentire qualcun{player_pronoun has him:o|{player_pronoun has her:a|ə}} che matcha la mia gioia di vivere.
        {charTag(FifthCharacter, "neutral")}:                           Il fatto che sia temporanea non nega la mia teoria.
        
        //più terra
        + \ {charTag(PG, "neutral")}:                                   La felicità è una coperta morbida dopo una giornata di duro lavoro.
            -> glyph_choice_manager(false, earthC)->
        {charTag(FirstCharacter, "annoyed")}:                           Credo che quello si chiami "abuso di sostanze".
        {charTag(FifthCharacter, "sad")}:                               Con un linguaggio meno colorito, direi comunque che sì, ha ragione {charNameOne}.

        + \ {charTag(PG, "neutral")}:                                   Non credo nella felicità, ma credo nel piacere dato dalle persone vicine.
            -> glyph_choice_manager(false, waterC)->    
        {charTag(FifthCharacter, "neutral")}:                           Questa è una lettura che potrei apprezzare.
        {charTag(FirstCharacter, "curious")}:                           Woah!
        {charTag(FirstCharacter, "affectionate")}:                      Vuol dire che {player_name} ha trovato un punto di contatto tra noi in questa discussione?
        {charTag(FifthCharacter, "hurry")}:                             Eh sì, mi sa proprio di sì.
            
        + \ {charTag(PG, "neutral")}:                                   La felicità è qualcosa che cresce nelle pieghe del quotidiano.
            -> glyph_choice_manager(false, aetherC)->
            {charTag(FifthCharacter, "hurry")}:                         Sono contenta che la vediamo allo stesso modo.
            {charTag(FirstCharacter, "annoyed")}:                       Le cose che crescono nelle pieghe di solito sono sporche.
                                                                        Infestanti.
                                                                        E indesiderate.
        -
    {charTag(FirstCharacter, "neutral")}:                               Comunque spero tu abbia imparato la lezione, {charNameFive}.
    {charTag(FifthCharacter, "neutral")}:                               Lezione?
    {charTag(FirstCharacter, "affectionate")}:                          Sì: che se una persona ti dice che ti ammira, è meglio portarsi a casa il complimento e goderselo.
    {charTag(FirstCharacter, "annoyed")}:                               Non sono vecchia come te, ma so che non sono tanti gli elogi che ci vengono dati in vita.
            {
                - are_two_entities_together(ThirdCharacter, PG):
                {
                - grimoire_thirdChar has grimFirstThirdChar:
                        {charTag(ThirdCharacter, "angry")}:                     Commento infastidito di Boccale.

                - else:
                        {charTag(ThirdCharacter, "neutral")}:                   Commento neutro/positivo di Boccale.    
                }
        }  


        -> first_char_closing_storylet ->
        -> mentor_closing_storylet ->
        ->->


=== first_mentor_about_third_char ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

        {charTag(FirstCharacter, "annoyed")}:                                   Dai, {thirdChar_storyStatus == story_storyRemote: sei stata|sei} sottona totale con lui.
        {charTag(Mentor, "sad")}:                                               Ma non è vero {charNameOne}.
                                                                                Solo, mi spiace per lui.
        {charTag(FirstCharacter, "annoyed")}:                                   Ti spiace per cosa?
                                                                                Di quanto {thirdChar_storyStatus == story_storyRemote: fosse|sia} idiota?
        {charTag(Mentor, "neutral")}:                                           No, c'è qualcosa...
        {charTag(Mentor, "sad")}:                                               Non ci sono cose del tuo passato che avresti voluto cambiare?
                                                                                Ma non puoi più farlo?
        {charTag(FirstCharacter, "sad")}:                                       A voglia.
        {charTag(FirstCharacter, "annoyed")}:                                   Ma nessuna che ha abbia a che fare con un quarantaquattrenne che dice di stare bene a ruota e {thirdChar_storyStatus == story_storyRemote: ha passato|passa} il tempo a parlare di merda della sua ex.
                {
                -thirdChar_storyStatus == story_storyRemote: 
                {charTag(FirstCharacter, "annoyed")}:                           E poi prende, sbrocca, e se ne va così, fregandosene del lavoro tuo o di {player_name}.
                {charTag(Mentor, "neutral")}:                                   Non tutti gli scatti di rabbia sono contro gli altri, {charNameOne}.
                }
                {
                - fifthChar_slurDetector > 3:
                {charTag(Mentor, "sad")}:                                       Certo, {thirdChar_storyStatus == story_storyRemote: mi avrebbe fatto piacere mi avesse ascoltato|mi farebbe piacere mi ascoltasse} quando gli {thirdChar_storyStatus == story_storyRemote: chiedevo|ho chiesto} di non dire parolacce.
                                                                                Che {charNameTwo} {thirdChar_storyStatus == story_storyPostal: era|è} un pappagallo.
                        {
                        - are_two_entities_together(SecondCharacter, PG):
                        {charTag(SecondCharacter, "energy")}:                   Hanno una memoria supermegagigantissima!
                        {charTag(FirstCharacter, "affectionate")}:              Non penso fosse quello il punto, piccoletto. 
                        }
                }                                                                        

        {charTag(Mentor, "neutral")}:                                           A volte una persona dice o fa cose orribili perché ha conosciuto solo un tipo di mondo.
                                                                                Un tipo di storie.
                                                                                Anche per questo siamo qui, no?
                                                                                Per guardare non solo la nostra, la vostra storia in modo diverso.
                                                                                Ma anche il modo in cui guardate il mondo.
        {charTag(Mentor, "sad")}:                                               Le due cose forse non sono così diverse.
        {charTag(TheWitch, "{witch_state()}")}:                                 Concordiamo.
        {charTag(FirstCharacter, "annoyed")}:                                   Ma questo significa alla fin della fiera che chi sta male per i comportamenti di questi figuri debba anche prendersi il carico di tenere a bada la propria rabbia e passare del tempo ad educarli?
        {charTag(TheWitch, "{witch_state()}")}:                                 Non educare, mostrare.
        {charTag(Mentor, "neutral")}:                                           Non è quello che facciamo coi bambini?
                                                                                Partire dalla nostra conoscenza ed esperienza e istruirli per far sì che non debbano ripetere gli stessi errori da capo?
        {charTag(FirstCharacter, "neutral")}:                                   {charNameFive}, giuro che ti voglio bene.                                                                        
                                                                                Ma qui non si tratta di un bambino.
                                                                                E se devo spendere le mie energie, preferisco farlo per chi sta male.
                                                                                Per dare speranze ed energie a loro.
                                                                                No, {player_name}?
        {charTag(FirstCharacter, "curious")}:                                   Dai, che è un po' che non vieni coinvolt{player_pronoun has him:o|{player_pronoun has her:a|ə}} in qualche battibecco, vero?
                                                                                Tu che ne pensi di {charNameThree}, e di quello che dovremmo fare con lui?                                                                        
    

        + \ {charTag(PG, "neutral")}:                                           La curiosità è un'arma potente: potremmo portare {charNameThree} a farsi domande, invece di criticarlo?
                -> glyph_choice_manager(false, airC)->

        + \ {charTag(PG, "neutral")}:                                           Le nostre energie sono limitate, è importante scegliere verso cosa le indirizziamo.
                -> glyph_choice_manager(false, earthC)->
                
        + \ {charTag(PG, "neutral")}:                                           Le informazioni sono ovunque, sta a lui fare il lavoro, se vuole farlo.
                -> glyph_choice_manager(false, fireC)->
        
        + \ {charTag(PG, "neutral")}:                                           Posso sia provare dispiacere per {charNameThree}, sia riconoscere che non ho le energie per aiutarlo.
                -> glyph_choice_manager(false, waterC)->
                
        + \ {charTag(PG, "neutral")}:                                           Credo vadano aiutate tutte le persone, ma serve un lavoro di gruppo, non di una sola persona.
                -> glyph_choice_manager(false, aetherC)->
        -

                                                                                Forse posso arrivare a una quadra con questa cosa, {charNameFive}.
                                                                                Quando incontrerò un uomo come {charNameThree}, mi prenderò del tempo per spiegargli perché il suo comportamento è pericoloso.
                                                                                Una volta.
                                                                                Se non mi ascolta.
                                                                                Se accampa scuse.
                                                                                Se dice: "Eh, ma voi".
                                                                                A quel punto per me è finita, e fa parte dei nemici.
                                                                                Bona.
                                                                                M: Il mondo allora sarà pieno di nemici, {charNameOne}.
                                                                                Ma saprò anche distinguere tra chi ha voglia davvero di cambiare, e chi no.
        -> first_char_closing_storylet ->
        -> mentor_closing_storylet ->
        ->->




=== frog_and_mentor_chit_chat
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


        {charTag(FifthCharacter, "neutral")}:                               Però non ti ho mai visto in giro.
        {charTag(Franco, "neutral")}:                                       Però sono sempre stato cra!
        {charTag(FifthCharacter, "neutral")}:                               Ma non ti ho mai mai visto in giro.
                                                                                E ogni giorno vengo a sistemare il sentiero e pulire la serra.
        {charTag(Franco, "neutral")}:                                       Forse allora non sei venuta ogni giorno.
                                                                                O forse mi hai scambiato per Tullio? A volte succede.
        {charTag(Franco, "question")}:                                     O forse non è che hai proprio proprio proprio tutto sotto il tuo controllo.
                                                                                Un po' come zio Gracco e il suo problema con l'alcool.
                                                                                E i combustibili in generale.
        {charTag(FifthCharacter, "neutral")}:                               Impossibile.
                                                                                Controllo tutto, è il mio lavoro.
        {charTag(Franco, "neutral")}:                                       Eppure eccoci cra, con io che so dove sono stato, e tu mi dici che non ricordo bene.
        {charTag(FifthCharacter, "sad")}:                                   Non ho detto che non ricordi bene.
        {charTag(Franco, "neutral")}:                                       Ma dici che hai tutto sotto il tuo controllo e che non mi hai visto, quindi o non ricordo bene, o mento.
                                                                                E io sono una rana e una rana non ha un collo e quindi non mento.
        {charTag(FifthCharacter, "sorry")}:                                 Non mi permetterei mai di dirlo.
        {charTag(Franco, "neutral")}:                                       Infatti non l'hai detto, l'hai implicato.
        {charTag(Franco, "question")}:                                      Questa me l'ha insegnata stamani mio figlio Euforbo.
        {charTag(Franco, "neutral")}:                                       Ma mi ha chiesto di non usare "stazampe" invece di stamani.
        {charTag(FifthCharacter, "neutral")}:                               Non mi piace il tuo tono, rana.
        {charTag(Franco, "neutral")}:                                       Ma non cambia il fatto che mi stai dando o del bugiardo o dello smemorato.
        {charTag(FifthCharacter, "bored")}:                                 Io non l'ho detto!
        {charTag(Franco, "neutral")}:                                       Ma l'hai implicato.
                                                                                Che non è ampilato, perché i lati non sono ampi.
        {charTag(Franco, "party")}:                                        Questo lo dice sempre Euforbo.
        {charTag(FifthCharacter, "bored")}:                                 AAAAAAAARG!
                                                                                SEI INSOPPORTABILE!
                ~ change_entity_place(Mentor)
        {charTag(Franco, "neutral")}:                                       No, sono Franco La Rana.
                                                                                Non mi ha molto ascoltato.
                {
                - are_two_entities_together(ThirdCharacter, PG):
                {charTag(ThirdCharacter, "jester")}:                    Adoro questa rana, è completamente suonata.
                                                                        Completamente!
                }                                                                   
        {charTag(Franco, "question")}:                                     E comunque io non me lo ricordo un Mentore da queste parti.
                                                                                E neanche un Nasore o un Orecchiore se è per questo.
        {
        - are_two_entities_together(FirstCharacter, PG):
        {charTag(FirstCharacter, "curious")}:                               In che senso, scusa?
        {charTag(Franco, "party")}:                                         {charNameOne}!
                                                                                Prima è passata zia Graaak e ti voleva parlare!
        {charTag(Franco, "neutral")}:                                       Tullio dice che ha una cotta per te.
                                                                                Però non ho visto dove si è bruciata.
        {charTag(Franco, "question")}:                                      O se ti deve bruciare.
        {charTag(Franco, "neutral")}:                                       Non sarebbe molto gentile però, vero?
        {charTag(FirstCharacter, "neutral")}:                               Ooook
        {charTag(FirstCharacter, "annoyed")}:                               No, non è vero: non ce la posso fare.
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


    {charTag(FifthCharacter, "neutral")}:                               Quindi puoi parlare con, con questo pozzo?
                                                                        Perché mi piacerebbe.
    {charTag(FifthCharacter, "sorry")}:                                 Oh, è una cosa vanitosa.
    {charTag(FifthCharacter, "neutral")}:                               Ma mi piacerebbe sapere cosa ne pensa di me.
                                                                        Del mio lavoro.
    {charTag(FifthCharacter, "hurry")}:                                 Se sto facendo un buon lavoro.
    {charTag(FifthCharacter, "neutral")}:                               Visto che vede e sente tutto.
    {charTag(TheWitch, witch_state())}:                                 <i>Crediamo che {charNameFive} stia facendo un buon lavoro.</i>
                                                                        <i>Così come l'acqua che si raccoglie tra le mani per dissetarci.</i>
                                                                        <i>Ma così come l'acqua non può essere incendio, così {charNameFive} non può essere qualcosa che non è.</i>
                                                                        <i>O portare nomi che non sa.</i>

        //Da riscrivere, prima era aria.
    + \ {charTag(PG, "neutral")}:                                       Metà delle cose che la voce dice sono illogiche.
            -> glyph_choice_manager(Mentor, aetherC)->
    {charTag(TheWitch, witch_state())}:                                 <i>{player_name} non vede, e quindi decide che qualcosa non esiste.</i>
                                                                        <i>Ma quella cosa esiste anche se {player_name} non vede.</i>
    {charTag(FifthCharacter, "sad")}:                                   Uh, peccato.
    {charTag(FifthCharacter, "neutral")}:                               Ma ci sta: questo luogo è così insolito, immagino sia inevitabile non capirlo fino in fondo.
        
    + \ {charTag(PG, "neutral")}:                                       Dice che stai facendo un buon lavoro.
            -> glyph_choice_manager(Mentor, waterC)->
    {charTag(FifthCharacter, "hurry")}:                                 Oh, ma sicuramente esagera.
    {charTag(FifthCharacter, "sad")}:                                   Prendi prima: ho scoperto che per via della mia incuria sta crescendo del muschio tra le pietre del pozzo.
                                                                        Però.
    {charTag(FifthCharacter, "neutral")}:                               Ringrazia la voce da parte mia.
    {charTag(TheWitch, witch_state())}:                                 <i>Dire una mezza verità porta su una mezza strada.</i>
    
    + \ {charTag(PG, "neutral")}:                                       Ha parlato di incendi e acqua, forse hai bruciato qualcosa?
            -> glyph_choice_manager(Mentor, earthC)->
    {charTag(FifthCharacter, "sad")}:                                   Non è che ho lasciato qualcosa di acceso in cucina?
                                                                        No dai, si vedrebbe il fumo da qui, sicuro.
    {charTag(FifthCharacter, "neutral")}:                               Magari è qualcosa di simbolico.
    {charTag(FifthCharacter, "sorry")}:                                 Spero di non aver distrutto nulla.
    
    + \ {charTag(PG, "neutral")}:                                       Non è più importante il tuo di giudizio sul tuo lavoro, {charNameFive}?
            -> glyph_choice_manager(Mentor, airC)->
    {charTag(FifthCharacter, "neutral")}:                               Credo di sì.
                                                                        Ma uno sguardo esterno ci può aiutare, immagino.
    {charTag(FifthCharacter, "sad")}:                                   Oh, non lo so.
    {charTag(FifthCharacter, "neutral")}:                               Sì.
                                                                        Credo di star facendo un buon lavoro.

    + \ {charTag(PG, "neutral")}:                                       Ha detto tante cose ma la risposta è: no.
            -> glyph_choice_manager(Mentor, fireC)->
    {charTag(TheWitch, witch_state())}:                                 <i>La frusta che cade senza motivo non porta alcun insegnamento.</i>
    {charTag(FifthCharacter, "sad")}:                                   Oh.
                                                                        Forse potrei chiedere scusa in qualche modo a...
                                                                        Ma a chi?
                                                                        Come?
    {charTag(FifthCharacter, "hurry")}:                                 Ho deciso: pulisco il tronco.
    {charTag(FifthCharacter, "neutral")}:                               Potrebbe apprezzare, immagino.
    {charTag(TheWitch, witch_state())}:                                 <i>Noi non abbiamo bisogno di pulizia, il nostro sporco è nido per funghi e insetti.</i> 
    -
    {charTag(FifthCharacter, "sad")}:                                   Immagino sia faticoso, avere una voce in testa, così.
    {charTag(FifthCharacter, "neutral")}:                               O magari ti fa sentire meno {player_pronoun has him:solo|{player_pronoun has her:sola|solə}}?
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


    {charTag(FirstCharacter, "annoyed")}:                               Credo di avere il mal di testa.
    {charTag(Franco, "neutral")}:                                       Lo dice sempre anche Giulio.
    {charTag(FirstCharacter, "neutral")}:                               Che è tuo figlio.
    {charTag(Franco, "neutral")}:                                       No, che è uno dei miei mariti.
                {
                - are_two_entities_together(ThirdCharacter, PG):
                {charTag(ThirdCharacter, "jester")}:                    Ammazza Franco, non te ne bastava uno?
                {charTag(Franco, "question")}:                          E perché?
                                                                        E poi come li gestiamo tutti questi girini cra in due?
                }
    {charTag(Franco, "neutral")}:                                       I miei figli sono Abaco, Aimone, Altobrando, Appasilarco, Azzolino, Borci, Clodoveo, Comunardo
    {charTag(FirstCharacter, "neutral")}:                               No aspetta aspetta, ti avevo solo chiesto di.
    {charTag(Franco, "neutral")}:                                       Emerenzio, Etelbero, Euforbo, Fulco, Matteo.
    {charTag(FirstCharacter, "curious")}:                               Matteo?
                                                                        Un nome così normale?
    {charTag(Franco, "neutral")}:                                       L'abbiamo adottato.
                                                                        Poi c'è Giosafatta, Gondio, Grimildo, Pierpietro, Piersabato.
    {charTag(FirstCharacter, "annoyed")}:                               Ti ho solo chiesto dove si trova del vino!
    {charTag(Franco, "neutral")}:                                       Zelinda, Veneranda, Uga, Torlonia, Tamatta, Ruslana e Ruslanina.
    {charTag(FirstCharacter, "annoyed")}:                               Qualcuno mi soffochi, ora.
    {charTag(Franco, "neutral")}:                                       Piccarda, Perlita, Macrina, Gliceria, Gianbrunilde, Eulalia,    Ermenegigia...
    {charTag(FirstCharacter, "neutral")}:                               {player_name} dimmi che non sto impazzendo solo io!

        + \ {charTag(PG, "neutral")}:                                   Franco, sembri davvero legato alla tua famiglia.
                -> glyph_choice_manager(false, waterC)->
        {charTag(Franco, "neutral")}:                                   No, non legato.
        {charTag(Franco, "party")}:                                     Quello è successo solo alla festa di laurea di zio Gracco.
                                                                        Ma ho ripetuto tutto il tempo che non era colpa mia.
                                                                        E non mi hanno creduto.
        {charTag(Franco, "neutral")}:                                   Mi era solo rimasta una spoletta di filo nella tasca.
                                                                        Che si è attaccata alla porta.
                                                                        E poi al lavandino.
                                                                        E poi a zia Graaak.
        {charTag(Franco, "party")}:                                     E da lì a tutte le altre rane.    
            
        + \ {charTag(PG, "neutral")}:                                   C'è qualcosa nell'illogicità di Franco che è quasi divina.
                -> glyph_choice_manager(false, aetherC)->
        {charTag(Franco, "party")}:                                     Quindi posso esaudire i desideri delle persone?
        {charTag(Franco, "neutral")}:                                   {charNameOne}!
                                                                        Che cosa desideri?
        {charTag(FirstCharacter, "annoyed")}:                           Che questa conversazione finisca?
        {charTag(Franco, "neutral")}:                                   Fatto!
                                                                        Chiamatemi come il dio egiziano.
        {charTag(Franco, "party")}:                                     C-Ra.                                                
        
        + \ {charTag(PG, "neutral")}:                                   "Non sto impazzendo solo io.""
                -> glyph_choice_manager(false, earthC)->
        {charTag(FirstCharacter, "annoyed")}:                           Questa sarebbe stata brutta anche in bocca a Franco.
        {charTag(Franco, "question")}:                                  Cosa ho in bocca?
                                                                        Cos'è questa cosa?
                                                                        Aargh.
        {charTag(Franco, "neutral")}:                                   Ah.
                                                                        La mia lingua.
        
        + \ {charTag(PG, "neutral")}:                                   Mi spieghi da dove vengono tutti questi nomi brutti, Franco?
                -> glyph_choice_manager(false, airC)->
        {charTag(Franco, "neutral")}:                                   Non sono brutti, sono nomi di famiglia.
                                                                        Li abbiamo iniziati ad usare sei generazioni fa.
        {charTag(Franco, "question")}:                                  Perché chiamarci "Ehi tu!" era davvero scomodo.
        {charTag(Franco, "neutral")}:                                   Il primo nome che abbiamo scoperto è stato Franco.
                                                                        E per un po' ci siamo chiamati tutti Franco.
        {charTag(Franco, "question")}:                                  Ma questo creava un po' di confusione.
                                                                        Ti svegli la mattina e ti dici: ma sarò io-Franco oggi, o cugino-Franco?
        {charTag(Franco, "neutral")}:                                   E così.    
        {charTag(FirstCharacter, "annoyed")}:                           BASTAAAAAAAAAAAAAAAAAAAAAAAAAAAAA!

        + \ {charTag(PG, "neutral")}:                                   Se usasse quella lingua per cose intelligenti, Franco salverebbe il mondo.
            -> glyph_choice_manager(false, fireC)-> 
        {charTag(FirstCharacter, "annoyed")}:                           Non esageriamo.
        {charTag(FirstCharacter, "curious")}:                           Però i suoi deliri hanno del fascino.
                                                                        Se presi a piccole dosi.
        {charTag(Franco, "neutral")}:                                   Un po' come i pollini.
        {charTag(FirstCharacter, "curious")}:                           In che senso?
        {charTag(Franco, "neutral")}:                                   A piccole dosi ti commuovono.
        {charTag(Franco, "party")}:                                     Ma a grandi dosi voli via.
        {charTag(FirstCharacter, "annoyed")}:                           Eh?!?                                            
        {charTag(Franco, "party")}:                                     Ehi {charNameOne}! Che bello vederti!
                                                                        Ti ho mai parlato degli studi al Conservatorio di Etelbero?
        {charTag(FirstCharacter, "annoyed")}:                           Uccidetemi.

                {
                - are_two_entities_together(ThirdCharacter, PG):
                {
                - thirdChar_firstCharRage == true or grimoire_thirdChar has grimFirstThirdChar:
                {charTag(ThirdCharacter, "jester")}:                    Io io!
                                                                        Posso farlo io?                                 
                }
                }    
        -
        -> first_char_closing_storylet ->
        ->->

=== frog_and_second_char_chit_chat
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


    {charTag(Franco, "neutral")}:                                       E Franco ti dice che non è vero, {charNameTwo}.
    {charTag(SecondCharacter, "angry")}:                                Ma è IM-POS-SI-BI-LE!
    {charTag(Franco, "neutral")}:                                       No no no, impossibile è un bambino che sa parlare.
    {charTag(SecondCharacter, "melanchonic")}:                          Ma io so parlare!
    {charTag(Franco, "neutral")}:                                       E sei un bambino? Dimostralo!
    {charTag(SecondCharacter, "neutral")}:                              Sono basso.
    {charTag(Franco, "party")}:                                         Anche io.
    {charTag(SecondCharacter, "neutral")}:                              E vado a scuola.
        {
                - second_char_main_storylets.six.tortura:
                {charTag(SecondCharacter, "neutral")}:                          Che {player_name} dice che è una tortura.
        }   
    {charTag(Franco, "question")}:                                      Quello lo fanno i girini, non i bambini.
    {charTag(SecondCharacter, "neutral")}:                              E non sono un girino?
    {charTag(Franco, "neutral")}:                                       Hai delle braccia, i girini non le hanno.
    {charTag(SecondCharacter, "energy")}:                               Quindi sono una rana?
    {charTag(Franco, "question")}:                                      Può darsi.
                                                                        Sai fare CRAAAAAAC?
    {charTag(SecondCharacter, "energy")}:                               CRAAAAAAC!
    {charTag(Franco, "question")}:                                      E sai saltare?
    {charTag(SecondCharacter, "energy")}:                               Sìì!
    {charTag(Franco, "question")}:                                      E hai uno zio che si chiama Gracco?
    {charTag(SecondCharacter, "melanchonic")}:                          No.
    {charTag(Franco, "neutral")}:                                       Forse però non è così importante.
                                                                        Quindi sì: non sei un bambino, sei una rana!
    {charTag(Franco, "question")}:                                      E sai nuotare?
    {charTag(SecondCharacter, "neutral")}:                              Sì no boh.
    {charTag(SecondCharacter, "melanchonic")}:                          No.
    {charTag(Franco, "neutral")}:                                       Visto?
                                                                        Come ti dicevo prima: le rane non sanno nuotare.
    {charTag(Franco, "party")}:                                         Logico, no?
    {charTag(SecondCharacter, "neutral")}:                              Mmm.
                                                                        Non sono mica tanto convinto.
    {
    - are_two_entities_together(FirstCharacter, PG):
    {charTag(FirstCharacter, "neutral")}:                               Beeeene!
                                                                        E anche questa roba tra qualche anno si trasformerà in un lunghissimo percorso di psicoterapia.
    }
    {charTag(Franco, "party")}:                                         Però possiamo chiedere alle foglie.
                                                                        Tullio dice sempre che nuotano nell'aria.
    {
    - are_two_entities_together(Mentor, PG):
    {charTag(FifthCharacter, "neutral")}:                               Comincio a sospettare che questa rana farà più danni di quanti ne potrò risolvere.
    }
    
    {charTag(Franco, "question")}:                                      Secondo te {player_name} come facciamo a capire se {charNameTwo} è una rana?

        + \ {charTag(PG, "neutral")}:                                   Vediamo come se la cava a cantare.
                -> glyph_choice_manager(false, waterC)->
        {charTag(Franco, "party")}:                                     Geniale!
                                                                        {charNameTwo}: ti portiamo al karaoke di cugina Sputt.
                                                                        E se sai tutte le parole di <i>(You Drive Me)Craaazy</i> sei una rana!
        {charTag(SecondCharacter, "neutral")}:                          Le parole di cosa?!?

        + \ {charTag(PG, "neutral")}:                                   Dato che è un mistero irrisolvibile, sta a {charNameTwo} decidere se lo è o meno.
                -> glyph_choice_manager(false, aetherC)->
        {charTag(Franco, "question")}:                                  E cosa ne pensa {charNameTwo}?
        {charTag(SecondCharacter, "energy")}:                           Mi sembrava una cosa bellissima essere una rana.
        {charTag(SecondCharacter, "angry")}:                            Ma poi ho scoperto che i girini hanno la scuola, BLEAH!
        {charTag(SecondCharacter, "melanchonic")}:                      Però questo è vero anche se resto bambino.
        {charTag(SecondCharacter, "neutral")}:                          Però Franco ricorda tutti i compleanni dei suoi girini.
                                                                        Questo è un punto a favore per dire che sono una rana!
                                                                        Ci devo ancora pensare.
    
        + \ {charTag(PG, "neutral")}:                                   Proviamo a fargli piace mangiare i lombrichi.
                -> glyph_choice_manager(false, earthC)->
        {charTag(SecondCharacter, "angry")}:                            Questa è la cosa più BLEAH che potessi dire!
        {charTag(Franco, "neutral")}:                                   Ma poi non ha senso!
                                                                        Io sono vegetariano per esempio.
        {charTag(Franco, "question")}:                                  E sono sempre una rana, no?
                                                                        O non lo sono più?
                                                                        Non è che sono diventato un airone?
        {charTag(Franco, "party")}:                                     Forse so volare?
        
        + \ {charTag(PG, "neutral")}:                                   Franco: tu non sai nuotare, e nemmeno {charNameTwo}: non è che tu sei un bambino?
                -> glyph_choice_manager(false, airC)->
        {charTag(SecondCharacter, "energy")}:                           Siii!
                                                                        Ha moooolto più senso!
        {charTag(Franco, "question")}:                                  Ma se sono un bambino vuol dire che non devo più lavorare?
        {charTag(SecondCharacter, "neutral")}:                          Perché, tu lavori?
        {charTag(Franco, "neutral")}:                                   Certo! Sono istruttore di nuoto per i girini!
        {charTag(SecondCharacter, "energy")}:                           Ma non sai nuotare!
        {charTag(Franco, "neutral")}:                                   E infatti li istruisco a non nuotare.
                                                                        Così non annegano.
        {charTag(Franco, "party")}:                                     Logico, no?                                      
        
        + \ {charTag(PG, "neutral")}:                                   La risposta è nel corpo: vediamo quanto salta in alto!
                -> glyph_choice_manager(false, fireC)-> 
        {charTag(SecondCharacter, "angry")}:                            Io oooooooodio lo sport!
                                                                        E odio saltare!
        {charTag(Franco, "neutral")}:                                   E io non so saltare.
                                                                        Questa cosa non ha senso {player_name}!                                                
        -

        {charTag(Franco, "party")}:                                     Non ti preoccupare {charNameTwo}, arriveremo a capo di questo mistero!
    
    -> second_char_closing_storylet ->
    ->->



=== frog_and_third_char_chit_chat ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

        {charTag(ThirdCharacter, "bored")}:                                     No no no Franco, seguimi, mannaggia a te!
        {charTag(ThirdCharacter, "neutral")}:                                   Prima cosa: ci si trova e si fa un'asta per comprare i giocatori.
                                                                                Partiamo da un euro e andiamo a salire.
        {charTag(Franco, "question")}:                                          Quindi i soldi vanno al giocatore?
                                                                                Glieli mando con la carpa della sera?
        {charTag(ThirdCharacter, "bored")}:                                     No, vanno alla cassa per il premio finale, te l'ho detto anche prima!
        {charTag(Franco, "party")}:                                             Mi piacciono i premi!
        {charTag(ThirdCharacter, "neutral")}:                                   Anche a me, per questo se segui i miei consigli c'hai di sicuro una squadra vincente.
        {charTag(Franco, "question")}:                                          E se non vince?
        {charTag(ThirdCharacter, "bored")}:                                     Se non vince perdi il premio.
        {charTag(Franco, "question")}:                                          Quindi paghi per perdere?
        {charTag(ThirdCharacter, "neutral")}:                                   No, paghi per giocare.
        {charTag(Franco, "party")}:                                             E dare dei soldi ai tuoi amici.
        {charTag(Franco, "question")}:                                          Ma non fai prima a darglieli direttamente se ne hanno bisogno?
        {charTag(ThirdCharacter, "jester")}:                                    Vecio, ma l'hai mai fatta una gara a qualcosa?
        {charTag(Franco, "neutral")}:                                           No perché le gare fanno stare male chi perde.
        {charTag(ThirdCharacter, "jester")}:                                    Ma dai, è un gioco, non ci stai male.
        {charTag(Franco, "question")}:                                          Quindi a te va bene se perdi?
        {charTag(ThirdCharacter, "jester")}:                                    Io non perdo, Franchì, non ti preoccupare!
        {charTag(ThirdCharacter, "bored")}:                                     Anche se da quando c'è il Merlo, quello si compra i giocatori migliori.
                                                                                L'anno scorso quella merda ha speso un mese del mio stipendio per comprarsi il mondo.
                                                                                C'aveva Lautaro Martinez e Douvikas, la merda.
        {charTag(Franco, "neutral")}:                                           Quindi non ti piace perdere.
        {charTag(Franco, "party")}:                                             Allora io non compro nessun giocatore e prendo una pizza per tutti.
        {charTag(ThirdCharacter, "bored")}:                                     Ma che c'entra la pizza?
        {charTag(Franco, "party")}:                                             La pizza fa felice tutti!
        {charTag(Franco, "neutral")}:                                           Ma senza salumi o cose del genere, l'ho promesso alle formiche.
        {charTag(ThirdCharacter, "bored")}:                                     Le formiche?
                                                                                Dio mio Franchì, dio mio.
                                                                                Ma sai che non ci si ragiona con te, ma proprio proprio zero?
        {charTag(ThirdCharacter, "neutral")}:                                   {player_name}!
                                                                                Dimmi che almeno tu te la godi un po' di sana competizione!
                                                                        

        NOTA: una di queste scelte deve essere inutilmente e ridicolmente lunga.

        + \ {charTag(PG, "neutral")}:         Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                -> glyph_choice_manager(false, airC)->

        + \ {charTag(PG, "neutral")}:         Cosa ti renderà più stabile? Da quali fondamenta parti?
                -> glyph_choice_manager(false, earthC)->
                
        + \ {charTag(PG, "neutral")}:                                   Sì: ti dà la spinta a migliorarti!
                -> glyph_choice_manager(false, fireC)->
        
        + \ {charTag(PG, "neutral")}:         Cosa senti/hai sentito davvero (”davvero” è importante, è un andare in fondo alle emozioni)?
                -> glyph_choice_manager(false, waterC)->
                
        + \ {charTag(PG, "neutral")}:                                   Credo che il punto di Franco sia: se le regole fanno schifo, vanno cambiate.
                -> glyph_choice_manager(false, aetherC)->

    -
        {
                - are_two_entities_together(FirstCharacter, PG):
                {
                - grimoire_firstChar has grimFirstThirdChar:
                        {charTag(FirstCharacter, "annoyed")}:                   Commento infastidito di Chitarra.

                - else:
                        {charTag(FirstCharacter, "neutral")}:                   Commento empatico di Chitarra.    
                }
        }
    -> third_char_closing_storylet ->
    ->->



=== third_mentor_chit_chat ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

        {charTag(Mentor, "sad")}:                                               Oh povera stella!
                                                                                Ma quindi ti ha lasciato all'altare?
        {charTag(ThirdCharacter, "melanchonic")}:                               Sì.
        {charTag(ThirdCharacter, "neutral")}:                                   Cioè, non proprio.
                                                                                Quando stavamo ancora preparando il matrimonio.
                                                                                Mancavano sei mesi.
                                                                                Mia sorella ci aveva già aiutati a trovare il fotografo.
                                                                                Mio cognato c'aveva trovato uno sconto per i fiori con gente del teatro.
                                                                                E mia suocera, la mia futura suocera, aveva aiutato Dona a trovare il vestito.
        {charTag(ThirdCharacter, "melanchonic")}:                               Un vestito da principessa.
        {charTag(Mentor, "sad")}:                                               Devi starci ancora malissimo.
        {charTag(ThirdCharacter, "neutral")}:                                   Già.
                                                                                Ma si va avanti, no?
                                                                                Però è brutto: a volte certe cose non le vedi quando sei innamorato.
        {charTag(Mentor, "sorry")}:                                             Ma i tuoi amici avevano notato qualcosa?
        {charTag(ThirdCharacter, "neutral")}:                                   Su di lei dici?
        {charTag(Mentor, "neutral")}:                                           Sì, cose che magari non andavano.
                                                                                Hanno provato a metterti in guardia?
        {charTag(ThirdCharacter, "jester")}:                                    E che sono, i miei babysitter?
        {charTag(Mentor, "sorry")}:                                             No, intendo che...
        {charTag(ThirdCharacter, "bored")}:                                     Sono stato uno stronzo io, a credere che una così poteva innamorarsi di me, che c'entrano loro, no?
                
                {
                - fifthChar_slurDetector > 3:
                {charTag(Mentor, "hurry")}:                                     {charNameThree}, non serve che tu sia sempre così oppositivo, su.
                {charTag(Mentor, "neutral")}:                                   Sono qui solo per aiutare.
                {charTag(ThirdCharacter, "bored")}:                             Come quando mi rompi i coglioni per due parolacce?
                }

        {charTag(ThirdCharacter, "bored")}:                                     Sai una cosa, {charNameFive}?
                                                                                Forse ho capito il problema di questo posto, il tuo problema.
        {charTag(ThirdCharacter, "neutral")}:                                   Vi sentite tutte ferite dal mondo.
        {charTag(ThirdCharacter, "bored")}:                                     Fate come se il mondo vi dovesse qualcosa.
                                                                                Beh: sveglia.
        {charTag(ThirdCharacter, "jester")}:                                    Non vi è dovuto nulla!
        {charTag(Mentor, "neutral")}:                                           {charNameThree}, respira un attimo.
        {charTag(ThirdCharacter, "angry")}:                                     Non mi dire cosa fare, vecia!
        {charTag(Mentor, "bored")}:                                             BASTA!
        {charTag(Mentor, "neutral")}:                                           Ti ho fatto questa domanda perché ho vissuto omenti in cui le persone vicine mi hanno detto "Ma è ovvio che questa cosa ti stava facendo male" solo quando ho avuto il coraggio di venirne fuori da sola.
                                                                                E volevo capire se i tuoi amici ci sono stati per te <i>prima</i> della fine della relazione con Dona, o solo quando la bomba è scoppiata.
                                                                                Perché in quel caso ho imparato a mie spese che quella roba lì non è amicizia.
        {charTag(ThirdCharacter, "bored")}:                                     Questo vale per te, vecia.
        {charTag(ThirdCharacter, "neutral")}:                                   Magari lo capisco anche il tuo punto di vista.
                                                                                E mi spiace se mi sono incazzato.
                                                                                Ma te lo dico a te e lo dico a {player_name}.
                                                                                Io esco con le persone per distrarmi, non per pensare alle cose che non vanno.
                                                                                E se uno mi viene a giudicare cose sulla mia vita senza che gliel'abbia chiesto, quello non è un mio amico.
        {charTag(Mentor, "bored")}:                                             Punto.


        + \ {charTag(PG, "neutral")}:                                           Cosa pensi? Qual è la verità intellettuale dietro questa cosa? Cosa significa veramente?
                -> glyph_choice_manager(false, airC)->

        + \ {charTag(PG, "neutral")}:                                           Cosa ti renderà più stabile? Da quali fondamenta parti?
                -> glyph_choice_manager(false, earthC)->
                
        + \ {charTag(PG, "neutral")}:                                           Fare invece che parlare, come il Poggi che ha tirato su il gruppo di calcetto quando stavi male.
                -> glyph_choice_manager(false, fireC)->
                                                                                Esatto, {player_name}!

        + \ {charTag(PG, "neutral")}:                                           Se le persone care non ci dicono le cose scomode, su cosa si basa allora la fiducia che gli diamo?
                -> glyph_choice_manager(false, waterC)->
                                                                                Sull'esserci.
                                                                                E poi la fiducia è una cosa esagerata.
                                                                                Niente e nessuno c'è per sempre, e alla fine ognuno pensa ai cazzi propri.
                
        + \ {charTag(PG, "neutral")}:                                           Diamogli fastidio.
                -> glyph_choice_manager(false, aetherC)->
-
        {charTag(Mentor, "neutral")}:                                           Mi permetto però di dirti una cosa, {charNameFive}.
                                                                                Le cose che proviamo esistono, a prescindere che le comunichiamo o meno.
                                                                                E se non le tiriamo fuori volontariamente, troveranno il loro modo di uscire.
        {charTag(Mentor, "sad")}:                                               Spesso facendo o facendoci del gran male.
{
        - are_two_entities_together(FirstCharacter, PG):
        {
        - grimoire_firstChar has grimFirstThirdChar:
                {charTag(FirstCharacter, "annoyed")}:                           Commento infastidito di Chitarra.

        - else:
                {charTag(FirstCharacter, "neutral")}:                           Commento empatico di Chitarra.    
        }
}   

    -> mentor_closing_storylet ->
    -> third_char_closing_storylet ->
    ->->

=== third_second_chit_chat ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


        {charTag(ThirdCharacter, "neutral")}:                                   No no credimi: Lautaro Martinez è uno dei migliori di sempre.
                                                                                Altro che Ronaldo.
        {charTag(SecondCharacter, "neutral")}:                                  Mh mh.
        {charTag(ThirdCharacter, "neutral")}:                                   Dai, tuo papà ti ci avrà portato allo stadio ogni tanto!
        {charTag(SecondCharacter, "neutral")}:                                  Ci andava coi suoi amici.
                                                                                Ora sta a casa e si arrabbia con la tv.
        {charTag(ThirdCharacter, "neutral")}:                                   E tuo fratello?
        {charTag(SecondCharacter, "neutral")}:                                  Non gli piace il calcio.
        {charTag(SecondCharacter, "energy")}:                                   Però è bravissimo coi videogiochi.
                                                                                A te piacciono i videogiochi?
        {charTag(ThirdCharacter, "jester")}:                                    Allora ti ci porto io quando usciamo da qui, che dici?
                                                                                Ci spariamo il derby!
                                                                                Ci portiamo anche il Franchì, così ci si fa una giornata tra ragazzi.
        {charTag(SecondCharacter, "neutral")}:                                  Mh mh.
        {charTag(ThirdCharacter, "neutral")}:                                   Ma ce l'hai una fidanzatina, Ricciolino?
        {charTag(ThirdCharacter, "jester")}:                                    Alla tua età ero un latin lover, sai?
        {charTag(SecondCharacter, "neutral")}:                                  No.
        {charTag(ThirdCharacter, "jester")}:                                    Le ragazza fanno sempre le preziose, vero?
        {charTag(SecondCharacter, "neutral")}:                                  No, è che a me mi piacciono di più gli animali.
        {charTag(ThirdCharacter, "neutral")}:                                   Quali? Gli orsi? I lupi? I leoni?
        {charTag(SecondCharacter, "neutral")}:                                  No, preferisco quelli strani, come l'ornitorinco o l'aye-aye o l'uacari.
        {charTag(ThirdCharacter, "neutral")}:                                   Uacari?
        {charTag(SecondCharacter, "energy")}:                                   Ha la faccia tutta rossa.
                                                                                Sembra sempre arrabbiato anche quando è tranquillo.
                                                                                Un po' come te.
        {charTag(ThirdCharacter, "jester")}:                                    Ehi, io non sono arrabbiato!                                                                       
        {charTag(SecondCharacter, "energy")}:                                   Però il mio preferito l'ho inventato io, ed è il prociorso.
                                                                                Ti protegge da un sacco di cose.
                                                                                Sa camminare sulla luna.
                                                                                Conosce tutti i numeri primi fino al milletrecentoventuno.
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "neutral")}:                           È una competenza molto specifica.
                {charTag(SecondCharacter, "emotional")}:                        Gli servono per contare le stelle.
                }  

        {charTag(SecondCharacter, "emotional")}:                                Dormire col prociorso è bellissimo.
        {charTag(ThirdCharacter, "neutral")}:                                   Uh, immagino.
                                                                                Ma non sei un po' grande per queste fantasie?
        {charTag(SecondCharacter, "neutral")}:                                  Uh.
                                                                                {player_name}!
                                                                        

                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "jester")}:                            L'uomo giusto al momento giusto!

                - thirdChar_recordedPlayerPronoun == her:
                {charTag(ThirdCharacter, "jester")}:                            Sentiamo l'opinione di una ragazza!

                - else:
                {charTag(ThirdCharacter, "jester")}:                            L'espertə in tutte quelle cose sul genere!
                
                }
                                                                        
        {charTag(ThirdCharacter, "neutral")}:                                   Dimmi: come aiutiamo questo giovanotto a diventare un uomo?
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "annoyed")}:                           Ma sei un meme?
                                                                                Ti prego dimmi che sei un meme.
                }
        
        
        + \ {charTag(PG, "neutral")}:                                           Con l'immaginazione che ha per me è già sulla giusta strada, no?
                -> glyph_choice_manager(false, airC)->

        + \ {charTag(PG, "neutral")}:                                           Portandogli degli esempi solidi, modelli affidabili da cui partire.
                -> glyph_choice_manager(false, earthC)->
                
        + \ {charTag(PG, "neutral")}:                                           Non deve <i>diventare un uomo</i>, ma sé stesso.
                -> glyph_choice_manager(false, fireC)->
        
        + \ {charTag(PG, "neutral")}:                                           Non me ne avere, ma credo che partirei dal capire che è a disagio con questo discorso.
                -> glyph_choice_manager(false, waterC)->
        {charTag(SecondCharacter, "emotional")}:                                Già.

        + \ {charTag(PG, "neutral")}:                                           Perché non mi dici cos'è un uomo per te, {charNameThree}?
                -> glyph_choice_manager(false, aetherC)->

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


        {charTag(ThirdCharacter, "angry")}:                                     Dio quanto odio te e questo cazzo di posto!
                                                                                Non ce la fai proprio a non farti i cazzi miei, vero?
                {
                - thirdChar_firstCharRage == true:                              
                {charTag(ThirdCharacter, "angry")}:                             Come quando prima stavo parlando a {player_name} di come mi ha trattato di merda Dona, e tu lì a farmi le pulci sull'età.
                {charTag(FirstCharacter, "annoyed")}:                           <i>Le pulci sull'età.</i>
                                                                                Ci sei uscito che era minorenne, te ne rendi conto!?!
                }
        {charTag(FirstCharacter, "annoyed")}:                                   E sono cazzi miei se vai in giro a dire stronzate che mi riguardano.
        {charTag(ThirdCharacter, "bored")}:                                     Ma cosa ti riguarda cosa, egocentrica del cazzo?
                                                                                Stavo solo parlando con Ricciolino!
        {charTag(FirstCharacter, "annoyed")}:                                   Sì, dicendogli sostanzialmente che tutte le donne sono delle, ah, non me lo far dire.
        {charTag(ThirdCharacter, "neutral")}:                                   Non ho detto quello.
        {charTag(FirstCharacter, "annoyed")}:                                   Ah no?
                                                                                E allora tutto quel discorso sulle ragazze che ti smollano appena ne trovano un più bono o ricco o famoso?
        {charTag(ThirdCharacter, "angry")}:                                     Dimmi che non è vero.
        {charTag(FirstCharacter, "neutral")}:                                   Non è vero.
        {charTag(ThirdCharacter, "bored")}:                                     Dona ha letteralmente fatto così.
        {charTag(FirstCharacter, "neutral")}:                                   Da quello che hai raccontato, Donatella ti ha lasciato perché aveva bisogno di capire chi fosse, non per andare con un altro tipo.
                                                                                Non è la stessa cosa, punto.
        {charTag(ThirdCharacter, "neutral")}:                                   Per te.
                                                                                Per me lo è stato.
        {charTag(ThirdCharacter, "melanchonic")}:                               È sparita dopo una vita assieme.
        {charTag(ThirdCharacter, "angry")}:                                     Mi ha trattato come spazzatura!
        {charTag(FirstCharacter, "neutral")}:                                   E quindi?
                                                                                Mettiamo pure che lei è stata stronza, non è che questo rende tutte le donne stronze.
        {charTag(ThirdCharacter, "bored")}:                                     Ma fate tutte così!
        {charTag(FirstCharacter, "bored")}:                                     Tutte chi?
        {charTag(FirstCharacter, "neutral")}:                                   Io non l'ho fatto.
                                                                                Mia madre non l'ha fatto.
                                                                                Tua madre?
        {charTag(ThirdCharacter, "angry")}:                                     Lascia fuori mia madre da questa roba.
        {charTag(FirstCharacter, "neutral")}:                                   Ce l'hai portata te nel momento in cui hai detto "Tutte le donne sono troie", no?
        {charTag(ThirdCharacter, "neutral")}:                                   E allora anche la roba di <i>Tutti gli uomini sono stupratori</i> che dite sempre voi, no?
                                                                                Tuo padre è uno stupratore?
        {charTag(FirstCharacter, "neutral")}:                                   Che sappia, no.
        {charTag(ThirdCharacter, "neutral")}:                                   Vedi che...
        {charTag(FirstCharacter, "neutral")}:                                   Ma so anche che quando i suoi amici fanno battute di merda sulle donne, battute tipo "Tutte le donne sono troie", lui se ne sta zitto e non dice nulla.
                                                                                E quindi magari mio padre non ha mai fatto male a una donna.
                                                                                Ma ha lasciato che qualcuno pensasse che fosse normale definirle <i>troie</i>.
                                                                                Che essere <i>troie</i> sia un problema.
                                                                                Un problema che rende una donna non più una persona ma una cosa da comperare.
                                                                                Qualcosa da usare.
        {charTag(ThirdCharacter, "neutral")}:                                   Io non ho mai trattato Dona come qualcosa da comprare.
        {charTag(FirstCharacter, "neutral")}:                                   Ma quando ha deciso che la vostra relazione non la faceva più stare bene, invece di accettare la cosa, ti sei solo incazzato.
                                                                                Come quando c'è la partita e il telecomando smette di funzionare.
                                                                                O come quando la macchina decide di non partire e sei in ritardo per il lavoro.
                                                                                Come con un oggetto.
        {charTag(ThirdCharacter, "bored")}:                                     Sei un dito in culo, {charNameOne}.
                                                                                Madonna se sei un dito in culo.
        {charTag(FirstCharacter, "curious")}:                                   Ma non hai detto che ho torto.

                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "jester")}:                            Vecio per favore, diglielo di lasciarmi in pace.
                {charTag(ThirdCharacter, "neutral")}:                           Diglielo che non siamo tutti come pensa lei.

                - thirdChar_recordedPlayerPronoun == her:                       
                {charTag(ThirdCharacter, "neutral")}:                           {player_name} ti prego, falla ragionare.
                                                                                Diglielo che non siamo tutti dei mostri come pensa lei.
                                                                                Che ci sono dei bravi ragazzi.

                - else:
                {charTag(ThirdCharacter, "neutral")}:                           {player_name}, te che stai fuori da queste cose tra donne e uomini, falla ragionare!
                }                                                                
                                                                                Diglielo che sono un bravo ragazzo.
                                                                                Un coglione magari, ma bravo.

        //In una delle risposte lui dice che "loro" però se ne possono andare e ricominciare, mentre gli uomini no.

        + \ {charTag(PG, "neutral")}:                                           Qual è la cosa che capisci meno della scelta di Donatella?
                -> glyph_choice_manager(false, airC)->
        {charTag(FirstCharacter, "annoyed")}:                                   Questa è la cosa più importante, {player_name}?        

        + \ {charTag(PG, "neutral")}:                                           In tutto questo ragionamento, la cosa per te importante è quindi essere un bravo ragazzo.
                -> glyph_choice_manager(false, earthC)->
                
        + \ {charTag(PG, "neutral")}:                                           Ma una volta che ti dico che sei un bravo ragazzo, cosa cambia?
                -> glyph_choice_manager(false, fireC)->                         
        
        + \ {charTag(PG, "neutral")}:                                           {charNameThree}: se il dolore che provi fosse solo tuo e non un problema universale, varrebbe meno?
                -> glyph_choice_manager(false, waterC)->
        {charTag(ThirdCharacter, "bored")}:                                     Ma perché non dovrebbe valere la stessa cosa per {charNameOne} e il suo odio verso gli uomini?
                                                                                Non è solo un suo dolore, una sua sfiga, invece di farne un problema personale?
        {charTag(FirstCharacter, "annoyed")}:                                   Porco il gatto!
                                                                                Perché tutte le donne uccise, violentate o malmenate dai compagni non sono un <i>mio</i> dolore, ma un problema strutturale.
                                                                                Lo sono i problemi sul lavoro, l'attacco ai diritti riproduttivi.
                                                                                Non è difficile, santissimo il cielo!                                                                          
                
        + (aether) \ {charTag(PG, "neutral")}:                                  Magari non te ne rendi conto {charNameThree}, ma stai ragionando da misogino.
                -> glyph_choice_manager(false, aetherC)->
        -

        {charTag(FirstCharacter, "neutral")}:                                   {charNameThree}: io non metto in discussione che tu sia ferito, e che la fine della relazione con Donatella sia stata dolorosa.
                                                                                Ma.
                {
                        - aether:
                                                                                E qui mi accodo a {player_name}.
                }
                                                                                Non serve trasformare un problema personale in un problema strutturale per meritare cura e supporto.
                                                                                Hai tutto il diritto di chiederlo.
        {charTag(FirstCharacter, "bored")}:                                     Non da me perché sinceramente fatico a sopportarti.
        {charTag(FirstCharacter, "neutral")}:                                   Ma chiedi aiuto.
                                                                                Ne hai bisogno.

    -> first_char_closing_storylet ->
    -> third_char_closing_storylet ->
    ->->


=== carla_and_second_char_chit_chat ===    
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


        {charTag(Carla, "neutral")}:                                    Per ogni chiarimento richiesto da un minore, è necessaria la presenza di un adulto.
        {charTag(SecondCharacter, "energy")}:                           Ecco ecco, ora c'è qui {player_name}!
                                                                        E {player_name} è un{player_pronoun has her:a|ə} adult{player_pronoun has him:o|{player_pronoun has her:a|ə}}.
                                                                        Quindi ora puoi rispondermi.
        {charTag(Carla, "neutral")}:                                    Mi ripeta la domanda.
        {charTag(SecondCharacter, "energy")}:                           È vero che le capre recitano?
        {charTag(Carla, "bored")}:                                      Decreto legislativo 134/2022, sezione 65.
        {charTag(Carla, "neutral")}:                                    "È previsto che ogni capra svezzata segua un corso di recitazione di anni tre presso la Royal Academy of Dramatic Art."
                                                                        "Il costo è a carico dell'allevatore, o di chi ne fa ne veci."
                                                                        "Il percorso sarà ritenuto concluso quando la suddetta capra avrà mangiato almeno una delle seguenti opere."
                                                                        "<i>Sogno di una capra di mezza estate.</i>"
                                                                        "<i>Gli allegri somari di Windsor.</i>"
                                                                        "<i>Beetello</i>."
                                                                        "Se entro tre anni non verrà consumata nessuna delle tre opere, la capra verrà privata del suo nome."
                                                                        "Da quel momento verrà considerata per sempre da tutte le persone come la cosa più fastidiosa del mondo."
                                                                        "Un riccio."
        {charTag(SecondCharacter, "melanchonic")}:                      Quindi mi stai prendendo in giro?
        {charTag(Carla, "happy")}:                                      Non ho forse recitato benissimo?
                {
                - are_two_entities_together(ThirdCharacter, PG):
                {charTag(ThirdCharacter, "jester")}:                    Ricciolino, ti sei fatto proprio fregare da una capra!
                {charTag(Carla, "bored")}:                              Le ricordo che sono io a sanzionarla quando romperà le regole di questo luogo.
                {charTag(ThirdCharacter, "bored")}:                     Non ho rotto nessunissima regola!
                {charTag(Carla, "bored")}:                              Non ancora.  
                }


    -> second_char_closing_storylet ->
    ->->