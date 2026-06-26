=== first_second_chit_chat
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

        //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FirstCharacter
        ~ list_currentActors += SecondCharacter

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
        {
        - are_two_entities_together(ThirdCharacter, PG):
        {charTag(ThirdCharacter, "jester")}:                    Per questo esistono le sbronze!
        }
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
    
        + \ {charTag(PG, "neutral")}:                           Concordo con {charNameOne}: è bello faticare, ma è ancora più bello riposare.
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

        + \ {charTag(PG, "neutral")}:                           Se gli alieni mi leggono la mente penso cose che li fanno scappare dalla paura!
            -> glyph_choice_manager(false, fireC)->
        {charTag(SecondCharacter, "energy")}:                   Sarebbe divertentissimo!
                                                                Ora provo a pensare tantissimo alla cacca!
                                                                Mamma si spaventa sempre con la cacca!
        {charTag(FirstCharacter, "affectionate")}:              La mia mente è limpida e innocente.
        {charTag(FirstCharacter, "neutral")}:                   Non come quella di un bambino, ascoltando le cose che dice il piccoletto.
            
        + \ {charTag(PG, "neutral")}:                           Chiederei agli alieni se hanno scoperto il fine ultimo della coscienza.
            -> glyph_choice_manager(false, aetherC)->
        {charTag(SecondCharacter, "neutral")}:                  Te lo dico io: caramelle!
                                                                E vedere i pinguini.
                                                                Viviamo per poter guardare i pinguini!
        {charTag(FirstCharacter, "affectionate")}:              Forse la risposta mi spaventerebbe, ma potrebbe rendermi la vita più facile.
        -    
    {charTag(FirstCharacter, "neutral")}:                       Bene, direi che abbiamo tuttə qualcosa a cui pensare.
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

        //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FifthCharacter
        ~ list_currentActors += SecondCharacter

    
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
        {charTag(ThirdCharacter, "neutral")}:                           Ma guarda quanto è saggio il mio fratellino!
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


        + \ {charTag(PG, "neutral")}:                                   Temo che tu sia stata l'ennesima persona adulta che l'ha ferito.
                -> glyph_choice_manager(Mentor, waterC)->
        {charTag(FifthCharacter, "sad")}:                               Lo temo anche io.
                                                                        E questo significa che devo fare il doppio del lavoro per avere la sua fiducia.
        {charTag(FifthCharacter, "hurry")}:                             Ma la avrò!
                                                                        E capirà che anche gli adulti sono persone di cui potersi fidare.                                               
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "neutral")}:                       Sai che non è una gara, vero?
                }

        + \ {charTag(PG, "neutral")}:                                   Quello che puoi fare è cercare di perdonare te stessa: ne trarrete entrambə beneficio.
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
        
        + \ {charTag(PG, "neutral")}:                                   L'hai ferito, cosa ti aspettavi? Ora però puoi rimediare.
                -> glyph_choice_manager(Mentor, fireC)->
        {charTag(FifthCharacter, "sad")}:                               Speravo in un po' di comprensione.
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

        //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FifthCharacter
        ~ list_currentActors += FirstCharacter

    
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
        {
        - are_two_entities_together(ThirdCharacter, PG):
        {charTag(ThirdCharacter, "jester")}:                            Rompermi le balle.
        }
    {charTag(FifthCharacter, "hurry")}:                                 Un po' lo scoprirai da te, parlando con {player_name}.
    {charTag(FifthCharacter, "neutral")}:                               Ma una cosa è certa: se non saprai trovare il bello in ciò che già hai, non sarai felice nemmeno quando avrai un nuovo nome.
    {charTag(FifthCharacter, "hurry")}:                                 La felicità non è un luogo da raggiungere, ma qualcosa che si ha dentro.
        {
        - are_two_entities_together(ThirdCharacter, PG):
        {charTag(ThirdCharacter, "bored")}:                             Gesù licantropo che rottura di balle.
        ~ change_entity_place(ThirdCharacter)
        }
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
    
        + \ {charTag(PG, "neutral")}:                                   Penso che {charNameFive} dica <i>felicità</i> ma intenda </i>arrendersi</i>.
            -> glyph_choice_manager(false, fireC)->
        {charTag(FifthCharacter, "neutral")}:                           Non arrendersi, {player_name}, ma accogliere quello che si ha.
        {charTag(FirstCharacter, "sad")}:                               E non vedo differenza, {charNameFive}.
            
        + \ {charTag(PG, "neutral")}:                                   Non è qualcosa di temporaneo per definizione?
            -> glyph_choice_manager(false, airC)->
        {charTag(FirstCharacter, "affectionate")}:                      Oh, che bello sentire qualcun{player_pronoun has him:o|{player_pronoun has her:a|ə}} che matcha la mia gioia di vivere.
        {charTag(FifthCharacter, "neutral")}:                           Il fatto che sia temporanea non nega la mia teoria.

        + \ {charTag(PG, "neutral")}:                                   La felicità è la soddisfazione di una giornata di duro lavoro.
            -> glyph_choice_manager(false, earthC)->
        {charTag(FirstCharacter, "annoyed")}:                           Credo tu intenda "una boccia di rosso il sabato sera".
        {charTag(FifthCharacter, "sad")}:                               Con un linguaggio meno colorito, direi comunque che sì, ha ragione {charNameOne}.

        + \ {charTag(PG, "neutral")}:                                   Non credo nella felicità, ma nel conforto dato dall'avere vicine le persone care.
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



        -> first_char_closing_storylet ->
        -> mentor_closing_storylet ->
        ->->


=== first_mentor_about_third_char ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

        //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FifthCharacter
        ~ list_currentActors += FirstCharacter

        {charTag(FirstCharacter, "annoyed")}:                                   Dai, {thirdChar_storyStatus == story_storyRemote: sei stata|sei} sottona totale con lui.
        {charTag(FifthCharacter, "sad")}:                                               Ma non è vero {charNameOne}.
                                                                                Solo, mi spiace per {charNameThree}.
        {charTag(FirstCharacter, "annoyed")}:                                   Ti spiace per cosa?
                                                                                Di quanto {thirdChar_storyStatus == story_storyRemote: fosse|sia} idiota?
        {charTag(FifthCharacter, "neutral")}:                                           No, c'è qualcosa...
        {charTag(FifthCharacter, "sad")}:                                               Non ci sono cose del tuo passato che avresti voluto cambiare?
                                                                                Ma non puoi più farlo?
        {charTag(FirstCharacter, "sad")}:                                       A voglia.
        {charTag(FirstCharacter, "annoyed")}:                                   Ma nessuna che abbia a che fare con un quarantaquattrenne che {thirdChar_storyStatus == story_storyRemote: ha passato|passa} il tempo a parlarmi di merda della sua ex.
                {
                -thirdChar_storyStatus == story_storyRemote: 
                {charTag(FirstCharacter, "annoyed")}:                           E poi prende, sbrocca, e se ne va così, fregandosene del lavoro tuo o di quello di {player_name}.
                {charTag(FifthCharacter, "neutral")}:                                   Non tutti gli scatti di rabbia sono contro gli altri, {charNameOne}.
                }
                {
                - fifthChar_slurDetector > 3:
                {charTag(FifthCharacter, "sad")}:                                       Certo, {thirdChar_storyStatus == story_storyRemote: mi avrebbe fatto piacere mi avesse ascoltato|mi farebbe piacere mi ascoltasse} quando gli {thirdChar_storyStatus == story_storyRemote: chiedevo|ho chiesto} di non dire parolacce.
                                                                                Che {charNameTwo} {thirdChar_storyStatus == story_storyPostal: era|è} un pappagallo.
                        {
                        - are_two_entities_together(SecondCharacter, PG):
                        {charTag(SecondCharacter, "energy")}:                   Hanno una memoria supermegagigantissima!
                        {charTag(FirstCharacter, "affectionate")}:              Non penso fosse quello il punto, piccoletto. 
                        }
                }                                                                        

        {charTag(FifthCharacter, "neutral")}:                                           A volte una persona dice o fa cose orribili perché ha conosciuto solo un tipo di mondo.
                                                                                Un tipo di storie.
                                                                                Anche per questo siamo qui, no?
                                                                                Per guardare non solo la nostra, la vostra storia in modo diverso.
                                                                                Ma anche per proporvi un modo diverso di guardare il mondo.
        {charTag(FifthCharacter, "sad")}:                                               Le due cose forse non sono così diverse.
        {charTag(TheWitch, "{witch_state()}")}:                                 <i>Concordiamo.</i>
        {charTag(FirstCharacter, "annoyed")}:                                   Col risultato che chi sta male per i comportamenti di questi figuri debba anche prendersi il carico di tenere a bada la propria rabbia e passare del tempo ad educarli?
        {charTag(TheWitch, "{witch_state()}")}:                                 <i>Non educare ma mostrare.</i>
        {charTag(FifthCharacter, "neutral")}:                                           Non è quello che facciamo coi bambini?
                                                                                Partire dalla nostra conoscenza ed esperienza e istruirli per far sì che non debbano ripetere gli stessi errori da capo?
                {
                - are_two_entities_together(SecondCharacter, PG):
                {charTag(SecondCharacter, "angry")}:                            E metterci in castigo quando non capiamo.        
                }                                                                
        {charTag(FirstCharacter, "neutral")}:                                   {charNameFive}, giuro che ti voglio bene.                                                                        
                                                                                Ma qui non si tratta di un bambino.
                                                                                E se devo spendere le mie energie, preferisco farlo con chi è vittima di questo sistema, non con chi ci guadagna.
                                                                                Dare loro speranza, energie, possibilità di vivere una vita diversa.
        {charTag(FifthCharacter, "neutral")}:                                           E non pensi che {charNameThree} sia vittima di questo "sistema"?                                                                     
        {charTag(FirstCharacter, "neutral")}:                                   {player_name}!
        {charTag(FirstCharacter, "curious")}:                                   Visto che è un po' che non vieni coinvolt{player_pronoun has him:o|{player_pronoun has her:a|ə}} in qualche battibecco, dicci la tua.
                                                                                Cosa dovremmo farne di {charNameThree}, e di quelli come lui?                                                                        
    

        + \ {charTag(PG, "neutral")}:                                           La curiosità è un'alleata potente: perché non portare {charNameThree} a farsi domande, invece di criticarlo costantemente?
                -> glyph_choice_manager(false, airC)->
        {charTag(FifthCharacter, "hurry")}:                                             Esatto!
                                                                                Notavo che ad esempio ama il calcio, e sta provando da ore a spiegare il fantacalcio a Franco.
                                                                                Magari puoi usare il fantacalcio per spiegargli le cose che ti stanno a cuore, {charNameOne}?
                {
                - are_two_entities_together(Franco, PG):
                {charTag(Franco, "reading")}:                                   Franco sta studiando la sua formazione, ma è molto confuso.
                {charTag(Franco, "question")}:                                  {charNameThree} mi ha suggerito di mettere delle ali veloci.
                {charTag(Franco, "neutral")}:                                   Ma ora ho il terrore di dover chiamare di nuovo l'airone.
                                                                                Zio Gracco ha ancora gli incubi.
                }                                                                  
        {charTag(FirstCharacter, "annoyed")}:                                   Dimmi che non sei seria.
        {charTag(FifthCharacter, "neutral")}:                                           Perché?
        {charTag(FirstCharacter, "affectionate")}:                              Perché visto che questa idea magnifica è di {player_name}, sono sicura che sarà felice di farlo {player_pronoun has him:lui|{player_pronoun has her:lei|ləi}}!
        {charTag(FirstCharacter, "neutral")}:                                   Io posso continuare a criticarlo, così lo aiutiamo su due fronti.
        
        + \ {charTag(PG, "neutral")}:                                           Abbiamo energie limitate: è vitale decidere cosa le merita e cosa no.
                -> glyph_choice_manager(false, earthC)->
        {charTag(FirstCharacter, "neutral")}:                                   Esatto.
                                                                                Anche se ora che lo dici mi sale un po' il senso di colpa.
        {charTag(FifthCharacter, "neutral")}:                                           Alla fine anche tu ci tieni a {charNameThree}.
        {charTag(FirstCharacter, "annoyed")}:                                   Non esageriamo ora, ama!

                
        + \ {charTag(PG, "neutral")}:                                           Le informazioni per cambiare sono ovunque: a un certo punto uno deve anche farsi il mazzo e smetterla con le scuse.
                -> glyph_choice_manager(false, fireC)->
        {charTag(FirstCharacter, "neutral")}:                                   La parte stanca di me ti dà ragione, ama.
                                                                                Ma non è una cosa per tuttə.
                                                                                Devi sapere dove cercare, capire quali sono cazzate scritte da bot AI e quali risposte invece sono sensate.
        {charTag(FifthCharacter, "neutral")}:                                           Devi superare la paura di farti domande che possono capovolgere il tuo mondo.
        {charTag(TheWitch, "{witch_state()}")}:                                 <i>E sapere che quella domanda esiste, visto che potrebbe non fare proprio parte del tuo mondo, del tuo quotidiano.</i>                                                                         

        + \ {charTag(PG, "neutral")}:                                           Abbandonare {charNameThree} vuol dire aprire alla possibilità di abbandonare chiunque. Piuttosto, condividiamo tra noi la fatica.
                -> glyph_choice_manager(false, aetherC)->
        {charTag(FirstCharacter, "curious")}:                                   Ed è subito: FONDIAMO UN COLLETTIVO!
        {charTag(FirstCharacter, "neutral")}:                                   Emotivamente ti do ragione ama.
                                                                                Ma emotivamente c'è questa parte di me che continua a dirsi: perché mi devo prendere l'accollo di chi crea il problema, e dei problemi che ha creato?
        {charTag(FifthCharacter, "sad")}:                                               Perché non farlo vuol dire dimenticarci che non sono idee, ma persone.
        {charTag(TheWitch, "{witch_state()}")}:                                 <i>Vicini di casa, colleghi, gente che condivide i nostri luoghi, le nostre paure, i nostri futuri.</i>                                                                                                                                             

        + \ {charTag(PG, "neutral")}:                                           Capisco {charNameOne}, ma non me la sento di abbandonare una persona solo perché non ce la fa a capire.
                -> glyph_choice_manager(false, waterC)->
        {charTag(FirstCharacter, "affectionate")}:                              TI ODIO.
                                                                                Ma con amore.
                                                                                Ma capisco cosa intendi.
        {charTag(FifthCharacter, "neutral")}:                                           Grazie per la tua saggezza, {player_name}.
                                                                                Mi rincuora.
        {charTag(TheWitch, "{witch_state()}")}:                                 <i>Ci rincuora.</i>                                                                                                                                                             
        -

        {charTag(FirstCharacter, "neutral")}:                                   Forse posso arrivare a una quadra con questa cosa, {charNameFive}.
                                                                                Quando incontrerò un uomo come {charNameThree}, ma che non sia {charNameThree} perché già non lo tollero più.
                                                                                Quando incontrerò un uomo come lui, mi prenderò del tempo per spiegargli perché il suo comportamento è pericoloso.
                                                                                Una volta.
                                                                                Se non mi ascolta.
                                                                                Se accampa scuse.
                                                                                Se dice: "Eh, ma voi".
                                                                                A quel punto per me è finita, e fa parte dei nemici.
                                                                                Bona.
        {charTag(FifthCharacter, "sad")}:                                               Il tuo mondo allora sarà pieno di nemici, {charNameOne}.
        {charTag(FirstCharacter, "neutral")}:                                   Ma saprò anche distinguere tra chi ha voglia davvero di cambiare le cose e chi no.

        -> first_char_closing_storylet ->
        -> mentor_closing_storylet ->
        ->->



=== frog_and_mentor_chit_chat
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

        //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FifthCharacter


        {charTag(FifthCharacter, "neutral")}:                                   Però non ti ho mai visto in giro.
        {charTag(Franco, "neutral")}:                                           Però sono sempre stato cra!
        {charTag(FifthCharacter, "neutral")}:                                   Ma non ti ho mai mai visto in giro.
                                                                                E ogni giorno vengo a sistemare il sentiero e pulire la serra.
        {charTag(Franco, "neutral")}:                                           Forse allora non sei venuta ogni giorno.
                                                                                O forse mi hai scambiato per Tullio?
                                                                                A volte succede.
        {charTag(Franco, "question")}:                                          O forse non è che hai proprio proprio proprio tutto sotto il tuo controllo.
                                                                                Un po' come zio Gracco e il suo problema con l'alcool.
                                                                                E i combustibili in generale.
        {charTag(FifthCharacter, "neutral")}:                                   Impossibile.
                                                                                Controllo tutto, è il mio lavoro.
        {charTag(Franco, "neutral")}:                                           Eppure eccoci cra, con io che so dove sono stato, e tu mi dici che non ricordo bene.
        {charTag(FifthCharacter, "sad")}:                                       Non ho detto che non ricordi bene.
        {charTag(Franco, "neutral")}:                                           Ma dici che hai tutto sotto il tuo controllo e che non mi hai visto, quindi o non ricordo bene, o mento.
                                                                                E io sono una rana e una rana non ha un collo e quindi non mento.
        {charTag(FifthCharacter, "sorry")}:                                     Non mi permetterei mai di dirlo.
        {charTag(Franco, "neutral")}:                                           Infatti non l'hai detto, l'hai implicato.
        {charTag(Franco, "question")}:                                          Questa me l'ha insegnata stamani mio figlio Euforbo.
        {charTag(Franco, "neutral")}:                                           Ma mi ha chiesto di non usare "stazampe" invece di stamani.
        {charTag(FifthCharacter, "neutral")}:                                   Non mi piace il tuo tono, rana.
        {charTag(Franco, "neutral")}:                                           Ma non cambia il fatto che mi stai dando o del bugiardo o dello smemorato.
        {charTag(FifthCharacter, "bored")}:                                     Io non l'ho detto!
        {charTag(Franco, "neutral")}:                                           Ma l'hai implicato.
                                                                                Che non è ampilato, perché i lati non sono ampi.
        {charTag(Franco, "party")}:                                             Questo lo dice sempre Euforbo.
        {charTag(FifthCharacter, "bored")}:                                     AAAAAAAARG!
                                                                                SEI INSOPPORTABILE!
                ~ change_entity_place(Mentor)
        {charTag(Franco, "neutral")}:                                           No, sono Franco La Rana.
                                                                                Non mi ha molto ascoltato.
                {
                - are_two_entities_together(ThirdCharacter, PG):
                {charTag(ThirdCharacter, "jester")}:                            Adoro questa rana, è completamente suonata.
                                                                                Completamente!
                }                                                                   
        {charTag(Franco, "question")}:                                          E comunque io non me lo ricordo una Mentore da queste parti.
                                                                                E neanche un Nasore o un Orecchiore se è per questo.
        {
        - are_two_entities_together(FirstCharacter, PG):
        {charTag(FirstCharacter, "curious")}:                                   In che senso, scusa?
        {charTag(Franco, "party")}:                                             {charNameOne}!
                                                                                Prima è passata zia Graaak e ti voleva parlare!
        {charTag(Franco, "neutral")}:                                           Tullio dice che ha una cotta per te.
                                                                                Però non ho visto dove si è bruciata.
        {charTag(Franco, "question")}:                                          O se ti deve bruciare.
        {charTag(Franco, "neutral")}:                                           Non sarebbe molto gentile però, vero?
        {charTag(FirstCharacter, "neutral")}:                                   Ooook
        {charTag(FirstCharacter, "annoyed")}:                                   No, non è vero: non ce la posso fare.
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

        //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FifthCharacter

    {charTag(FifthCharacter, "neutral")}:                                       Quindi puoi parlare con, con questo pozzo?
                                                                                Perché mi piacerebbe.
    {charTag(FifthCharacter, "sorry")}:                                         Oh, è una cosa vanitosa.
    {charTag(FifthCharacter, "neutral")}:                                       Ma mi piacerebbe sapere cosa ne pensa di me.
                                                                                Del mio lavoro.
    {charTag(FifthCharacter, "hurry")}:                                         Se sto facendo un buon lavoro.
    {charTag(FifthCharacter, "neutral")}:                                       Visto che vede e sente tutto.
    {charTag(TheWitch, witch_state())}:                                         <i>Crediamo che {charNameFive} stia facendo un buon lavoro.</i>
                                                                                <i>Così come l'acqua che si raccoglie tra le mani per dissetarci.</i>
                                                                                <i>Ma così come l'acqua non può essere incendio, così {charNameFive} non può essere qualcosa che non è.</i>
                                                                                <i>O portare nomi che non sa.</i>


    + \ {charTag(PG, "neutral")}:                                               Forse stai cercando di essere qualcosa che non sei, {charNameFive}.
            -> glyph_choice_manager(Mentor, aetherC)->
        {charTag(FifthCharacter, "sad")}:                                       Quindi non sono adatta a fare da Mentore?
        {charTag(FifthCharacter, "neutral")}:                                   Ma io adoro aiutare le persone!
                                                                                Sono bravissima nel farlo!
        {charTag(TheWitch, witch_state())}:                                     <i>A volte la verità va mediata, ritagliata sulla forma delle orecchie di chi ascolta.</i>
                                                                                <i>Ma apprezziamo la sincerità di {player_name}.</i>    

    + \ {charTag(PG, "neutral")}:                                               Sente quanto impegno stai mettendo nel prenderti cura di questo luogo.
            -> glyph_choice_manager(Mentor, waterC)->
    {charTag(FifthCharacter, "hurry")}:                                         Oh, ma sicuramente esagera.
    {charTag(FifthCharacter, "sad")}:                                           Prendi prima: ho scoperto che per via della mia incuria sta crescendo del muschio tra le pietre del pozzo.
                                                                                Però.
    {charTag(FifthCharacter, "neutral")}:                                       Ringrazia la voce da parte mia.
    {charTag(TheWitch, witch_state())}:                                         <i>Dire una mezza verità porta su una mezza strada.</i>
    
    + \ {charTag(PG, "neutral")}:                                               Ha parlato di incendi e acqua: hai bruciato qualcosa?
            -> glyph_choice_manager(Mentor, earthC)->
    {charTag(FifthCharacter, "sad")}:                                           Non è che ho dimenticato qualcosa di acceso in cucina?
                                                                                No dai, si vedrebbe il fumo da qui, sicuro.
    {charTag(FifthCharacter, "neutral")}:                                       Magari è qualcosa di simbolico.
    {charTag(FifthCharacter, "sorry")}:                                         Spero di non aver distrutto nulla.
    
    + \ {charTag(PG, "neutral")}:                                               Non è più importante il tuo di giudizio sul tuo lavoro, {charNameFive}?
            -> glyph_choice_manager(Mentor, airC)->
    {charTag(FifthCharacter, "neutral")}:                                       Credo di sì.
                                                                                Ma uno sguardo esterno ci può aiutare, immagino.
    {charTag(FifthCharacter, "sad")}:                                           Oh, non lo so.
    {charTag(FifthCharacter, "neutral")}:                                       Sì.
                                                                                Credo di star facendo un buon lavoro.

    + \ {charTag(PG, "neutral")}:                                               In soldoni: no.
            -> glyph_choice_manager(Mentor, fireC)->
    {charTag(TheWitch, witch_state())}:                                         <i>La frusta che cade senza motivo non porta alcun insegnamento.</i>
    {charTag(FifthCharacter, "sad")}:                                           Oh.
                                                                                Forse potrei chiedere scusa in qualche modo a...
                                                                                Ma a chi?
                                                                                Come?
    {charTag(FifthCharacter, "hurry")}:                                         Ho deciso: spazzolo gli spazi tra le pietre.
    {charTag(FifthCharacter, "neutral")}:                                       Potrebbe apprezzare, immagino.
    {charTag(TheWitch, witch_state())}:                                         <i>Noi non abbiamo bisogno di pulizia, il nostro sporco è nido per funghi e insetti.</i> 
    -
    {charTag(FifthCharacter, "sad")}:                                           Immagino sia faticoso, avere una voce in testa, così.
    {charTag(FifthCharacter, "neutral")}:                                       O magari ti fa sentire meno {player_pronoun has him:solo|{player_pronoun has her:sola|solə}}?
                                                                                Ho qualcosa su cui riflettere, immagino.

        -> witch_closing_storylet ->
        -> mentor_closing_storylet ->
        ->->


=== the_witch_and_the_men
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

        {charTag(ThirdCharacter, "bored")}:                             Certo che la vista da qui fa abbastanza cagare.
        {charTag(ThirdCharacter, "melanchonic")}:                       Mi ricorda casa.
        {charTag(ThirdCharacter, "neutral")}:                           C'è un fiume, un bel fiume.
                                                                        Era bello, quando ero piccolo.
                                                                        Ma ormai è diventato una merda, tra le schifezze che buttano fuori le vecchie fabbriche e la gente che lo usa come una discarica.
        {charTag(ThirdCharacter, "melanchonic")}:                       Un po' come qui.
                                                                        E ormai le fabbriche le hanno chiuse quasi tutte, per cui c'è solo il brutto.
                                                                        E niente lavoro.                                                                 
        {charTag(TheWitch, witch_state())}:                             <i>Ringraziamo {player_name} per essere qui.</i>
                                                                        <i>Pensiamo sia importante dire una cosa a {charNameThree}.</i>
                                                                        <i>Soprattutto perché stiamo notando che {charNameOne} tollera sempre meno {charNameThree}.</i>
                                                                        <i>Ma noi non possiamo parlare direttamente con lui.</i>
                                                                        <i>Ci rendiamo conto di chiederti qualcosa di spiacevole, ma possiamo usare un attimo la voce e il corpo di {player_name} per parlare {charNameThree}?</i>

        - (top)
        * \ {charTag(PG, "neutral")}:                                   Farà male?
        {charTag(TheWitch, witch_state())}:                             <i>La sensazione sarà più vicina a una leggera ebbrezza.</i>
                                                                        <i>E {player_name} ricorderà tutto quello che è stato detto.</i>
                -> top

        * \ {charTag(PG, "neutral")}:                                   Va bene.
                -> forward

        * \ {charTag(PG, "neutral")}:                                   Non me la sento.
        {charTag(ThirdCharacter, "jester")}:                            Ehi {player_name}, non mi ero accordo che eri qui!    
        {charTag(TheWitch, witch_state())}:                             <i>Uh.</i>
                                                                        <i>Capiamo.</i>
                                                                        <i>Grazie comunque per averci ascoltate.</i>
        {charTag(ThirdCharacter, "jester")}:                            La smetto di appesantire l'aria e vado a farmi due passi.                                                                      
                -> end     

        = forward
        ~ temp charNameOne = translator(firstChar_ActualName)
        ~ temp charNameTwo = translator(secondChar_ActualName)
        ~ temp charNameThree = translator(thirdChar_ActualName)
        ~ temp charNameFour = translator(fourthChar_ActualName)
        ~ temp charNameFive = translator(fifthChar_ActualName)

        {charTag(TheWitch, witch_state())}:                             <i>Ringraziamo {player_name}.</i>
                                                                        <i>Saremo veloci.</i>
        {charTag(PG, "neutral")}:                                       <i>{charNameThree}, piacere di conoscerti, noi siamo {witch_actualName}.</i>
        {charTag(ThirdCharacter, "jester")}:                            No, tu sei {player_name}!
                                                                        Che ti sei bevut{thirdChar_recordedPlayerPronoun has him:o|{thirdChar_recordedPlayerPronoun has her:a|ə}}?!?                                              
        {charTag(PG, "neutral")}:                                       <i>No, noi siamo {witch_actualName}, abbiamo chiesto a {player_name} il suo corpo per poter parlare con {charNameThree}.</i>
        {charTag(ThirdCharacter, "jester")}:                            Come in <i>Ghost</i>?
                                                                        Perché non sono molto dell'umore per una scena romantica, zero.
        {charTag(ThirdCharacter, "neutral")}:                           I tuoi occhi.
                                                                        Ma è una cosa seria.
                                                                        Oh merda, è una cosa seria.
        {charTag(PG, "neutral")}:                                       <i>Non abbiamo molto tempo, {charNameThree}, essere una sola cosa è molto faticoso per noi.</i>
        {charTag(ThirdCharacter, "neutral")}:                           Me ne sto zitto, promesso.
                                                                        Zitto.
        {charTag(PG, "neutral")}:                                       <i>Ti osserviamo dal tuo arrivo, giovane uomo.
                                                                        <i>Sentiamo che la persona che sei ti sta stretta.</i>
                                                                        <i>Che il tuo cuore batte forte ogni volta che intravedi le cose che puoi essere.</i>
                                                                        <i>Per poi rinchiudersi nella paura.</i>
        {charTag(ThirdCharacter, "jester")}:                            Ah no, quella è la pressione alta, zia.
        {charTag(ThirdCharacter, "bored")}:                             Un altro regalo di mio padre.                                                             
        {charTag(PG, "neutral")}:                                       <i>Senti che potresti provare ad essere qualcosa di diverso, ma non sai cosa.</i>
                                                                        <i>E ti spaventa, perché i tuoi amici, gli amici del calcetto, te lo ricordano ogni giorno: o sei come loro, o sei fuori.</i>
        {charTag(PG, "neutral")}:                                       <i>Solo.</i>
        {charTag(ThirdCharacter, "neutral")}:                           Non esageriamo.
        {charTag(PG, "neutral")}:                                       <i>E ci sono altre persone, persone come {charNameOne} a cui potresti chiedere una mano.</i>
                                                                        <i>Ma che vedono solo quello che sei stato, non quello che puoi diventare.</i>
        {charTag(ThirdCharacter, "bored")}:                             Tutto questo è molto da froci {witch_actualName} o quel che sei.                               
        {charTag(PG, "neutral")}:                                       <i>E così vedi un'unica strada: schiacciarti ancora di più in qualcosa che ti sta facendo del male, guadagnandoti l'odio di chi ti potrebbe mostrare una vita diversa.</i>
                                                                        <i>Ma sono qui per dirti che le tue strade sono infinite, {charNameThree}.</i>
                                                                        <i>Tante quante le persone che puoi immaginare.</i>
                                                                        <i>E anche se ora non ti sembra possibile, c'è sempre qualcuno che vorrà bene a una persona che è totalmente sé stessa, senza maschere o menzogne.</i>
                                                                        <i>Come è stato con il signor Poggi.</i>
        {charTag(ThirdCharacter, "bored")}:                             Decisamente frocio.                                                                
                                                                        <i>Noi ci abbiamo messo una vita per fare questo passo, e ora siamo tuttə.</i>
                                                                        <i>E {charNameThree} può essere chiunque voglia essere.</i>
        {charTag(ThirdCharacter, "jester")}:                            Anche Elon Musk?
                                                                        Mi farebbero comodo tutti i suoi soldi!                                                                
        {charTag(PG, "neutral")}:                                       <i>Ora usciamo da questo corpo, ma sappi, anima bella, che siamo qui, sempre a proteggerti.</i>
        {charTag(TheWitch, witch_state())}:                             <i>Ringraziamo {player_name}.</i>
                                                                        <i>La sensazione di confusione e ebbrezza dovrebbe finire in pochi secondi.</i>
        {charTag(ThirdCharacter, "jester")}:                            Sei di nuovo tu {player_name}, vero?
                                                                        Che roba assurda.
        {charTag(ThirdCharacter, "bored")}:                             E che marea di cazzate, vah.
                                                                        Cazzate enormi.
                                                                        Vero?                                                                

        + [<i>Vorrei rispondere ma</i>]
        + [<i>la mia bocca è intorpidita</i>]
        + [<i>la mente limpida</i>]
        + [<i>e tutto ciò che mi spaventa</i>]
        + [<i>scomparso.<i/>]
        -
        {charTag(ThirdCharacter, "jester")}:                            Ma che faccia c'hai?!?
        {charTag(ThirdCharacter, "bored")}:                             Che posto di matti.
                                                                        In che posto di matti che sono finito!                                                                

        -> end

        
        = end
        -> witch_closing_storylet ->
        -> third_char_closing_storylet ->
        ->->

=== frog_and_first_char_chit_chat
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

        //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FirstCharacter


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

        + \ {charTag(PG, "neutral")}:                                   Franco, il legame che hai con la tua famiglia sembra davvero profondo.
                -> glyph_choice_manager(false, waterC)->
        {charTag(Franco, "neutral")}:                                   No, nessuno è stato legato, non oggi per lo meno!
        {charTag(Franco, "party")}:                                     Quello è successo solo alla festa di laurea di zio Gracco.
                                                                        Ma ho ripetuto tutto il tempo che non era colpa mia.
                                                                        E non mi hanno creduto.
        {charTag(Franco, "neutral")}:                                   Mi era solo rimasta una spoletta di filo nella tasca.
                                                                        Che si è attaccata alla porta.
                                                                        E poi al lavandino.
                                                                        E poi a zia Graaak.
        {charTag(Franco, "party")}:                                     E da lì a tutte le altre rane.    
            
        + \ {charTag(PG, "neutral")}:                                   L'irrazionalità di Franco sembra divina, un pozzo diritto verso l'inconscio.
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

        + \ {charTag(PG, "neutral")}:                                   Se parlasse meno e facesse di più, Franco cambierebbe il mondo.
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

        //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += SecondCharacter


    {charTag(Franco, "neutral")}:                                       E Franco ti dice che non è vero, {charNameTwo}.
    {charTag(SecondCharacter, "angry")}:                                Ma è IM-POS-SI-BI-LE!
    {charTag(Franco, "neutral")}:                                       No no no, impossibile è un bambino che sa parlare.
        {
        - are_two_entities_together(ThirdCharacter, PG):
        {charTag(ThirdCharacter, "jester")}:                            Oh Franchì, purtroppo parlano, e tanto!
        }
    {charTag(SecondCharacter, "melanchonic")}:                          Ma io so parlare!
    {charTag(Franco, "neutral")}:                                       E sei un bambino? Dimostralo!
    {charTag(SecondCharacter, "neutral")}:                              Sono basso.
    {charTag(Franco, "party")}:                                         Anche io.
    {charTag(SecondCharacter, "neutral")}:                              E vado a scuola.
        {
                - second_char_main_storylets.six.tortura:
                {charTag(SecondCharacter, "neutral")}:                  Che {player_name} dice che è una tortura.
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
    {charTag(Franco, "neutral")}:                                       Io no.
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

        + \ {charTag(PG, "neutral")}:                                   L'unico che può ascoltare la sua vera natura è {charNameTwo}, per cui sta a lui trovare la sua risposta.
                -> glyph_choice_manager(false, aetherC)->
        {charTag(Franco, "question")}:                                  E cosa ne pensa {charNameTwo}?
        {charTag(SecondCharacter, "energy")}:                           Mi sembrava una cosa bellissima essere una rana.
        {charTag(SecondCharacter, "angry")}:                            Ma poi ho scoperto che i girini hanno la scuola, BLEAH!
        {charTag(SecondCharacter, "melanchonic")}:                      Però questo è vero anche se resto bambino.
        {charTag(SecondCharacter, "neutral")}:                          Però Franco ricorda tutti i compleanni dei suoi girini.
                                                                        Questo è un punto a favore per dire che sono una rana!
                                                                        Ci devo ancora pensare.
    
        + \ {charTag(PG, "neutral")}:                                   Siamo ciò che mangiamo, e le rane mangiano i lombrichi, per cui {charNameTwo} deve mangiarne uno!
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
        
        + \ {charTag(PG, "neutral")}:                                   Meno teoria e più muscoli: vediamo quanto salti in alto {charNameTwo}!
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

        //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += ThirdCharacter

        {charTag(ThirdCharacter, "bored")}:                                     No no no Franco, seguimi, Gesù licantropo!
                                                                                        //Check parolacce da parte di Mentore
                                                                                        ~ fifthChar_slurDetectorFunction()
        {charTag(ThirdCharacter, "neutral")}:                                   Prima cosa: ci si trova e si fa un'asta per comprare i giocatori.
                {
                - are_two_entities_together(SecondCharacter, PG): 
                {charTag(SecondCharacter, "neutral")}:                          Basta calcioooooooooooooooooooooooo!
                     ~ change_entity_place(SecondCharacter)     
                }
        {charTag(ThirdCharacter, "neutral")}:                                   Partiamo da un euro e andiamo a salire.
        {charTag(Franco, "question")}:                                          Quindi i soldi vanno al giocatore?
                                                                                Glieli mando con la carpa della sera?
        {charTag(ThirdCharacter, "bored")}:                                     No, vanno alla cassa per il premio finale, te l'ho detto anche prima!
        {charTag(Franco, "party")}:                                             Mi piacciono i premi!
        {charTag(ThirdCharacter, "neutral")}:                                   Anche a me, per questo se segui i miei consigli c'hai di sicuro una squadra vincente.
        {charTag(Franco, "question")}:                                          E se non vince?
        {charTag(ThirdCharacter, "bored")}:                                     Se non vince perdi il premio.
        {charTag(Franco, "question")}:                                          Quindi paghi per perdere?
                {
                - are_two_entities_together(FirstCharacter, PG): 
                {charTag(FirstCharacter, "curious")}:                           Questa non me la perdo!
                }
        {charTag(ThirdCharacter, "neutral")}:                                   No, paghi per giocare.
        {charTag(Franco, "party")}:                                             E dare dei soldi ai tuoi amici.
        {charTag(Franco, "question")}:                                          Ma non fai prima a darglieli direttamente se ne hanno bisogno?
        {charTag(ThirdCharacter, "jester")}:                                    Vecio, ma hai mai giocato a qualcosa?
                                                                                Perché il bello è la competizione!
        {charTag(Franco, "neutral")}:                                           No perché le gare fanno stare male chi perde.
        {charTag(ThirdCharacter, "jester")}:                                    Ma dai, è un gioco, chi ci sta male?
        {charTag(Franco, "question")}:                                          Quindi a te va bene se perdi?
        {charTag(ThirdCharacter, "jester")}:                                    Io non perdo, Franchì, non ti preoccupare!
        {charTag(ThirdCharacter, "bored")}:                                     Anche se da quando c'è il Merlo, quello si compra i giocatori migliori.
                                                                                L'anno scorso quella merda ha speso un mese del mio stipendio per comprarsi il mondo.
                                                                                        //Check parolacce da parte di Mentore
                                                                                        ~ fifthChar_slurDetectorFunction()
        {charTag(ThirdCharacter, "bored")}:                                     C'aveva Lautaro Martinez e Douvikas, maledetto.
        {charTag(Franco, "neutral")}:                                           Quindi non ti piace perdere.
        {charTag(Franco, "party")}:                                             Allora io non compro nessun giocatore e prendo una pizza per tutti.
        {charTag(ThirdCharacter, "bored")}:                                     Ma che c'entra la pizza?
        {charTag(Franco, "party")}:                                             La pizza rende le persone felici!
        {charTag(Franco, "neutral")}:                                           Ma senza salumi o cose del genere, l'ho promesso alle formiche.
        {charTag(ThirdCharacter, "bored")}:                                     Le formiche?
                                                                                Dio mio Franchì, dio mio.
                                                                                Ma sai che non ci si ragiona con te, ma proprio proprio zero?
        {charTag(ThirdCharacter, "neutral")}:                                   {player_name}!
                                                                                Dimmi che almeno tu te la godi un po' di sana competizione!
                                                                        

        + \ {charTag(PG, "neutral")}:                                           Quindi per te {charNameThree} un gioco è un gioco solo se c'è competizione?
                -> glyph_choice_manager(false, airC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != him:
                {charTag(ThirdCharacter, "neutral")}:                           Lo dici come se fossi un idiota.
                                                                                Ma.          
                }        
        {charTag(ThirdCharacter, "neutral")}:                                   ESATTO!
        {charTag(ThirdCharacter, "jester")}:                                    Un punto per {player_name}!
        {charTag(ThirdCharacter, "neutral")}:                                   Che poi non è che è per forza contro gli altri.
                                                                                A lavoro se non c'è gente mi ammazzo di sudoku.
                                                                                La soddisfazione quando batto i miei record, {player_name}!
        {charTag(ThirdCharacter, "neutral")}:                                   Mentre col calcio o il fantacalcio c'è anche un'altra cosa divertente.
        {charTag(ThirdCharacter, "jester")}:                                    Prendere in giro i perdenti!                                                                


        + \ {charTag(PG, "neutral")}:                                           La competizione è una cosa tra pari, ma il Merlo si è comprato la vittoria.
                -> glyph_choice_manager(false, earthC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "neutral")}:                           E dai vecio!
                - else:
                {charTag(ThirdCharacter, "neutral")}:                           Sapevo non avresti capito.                       
                }         
        {charTag(ThirdCharacter, "bored")}:                                     Non sono io a doverti dire che la vita è ingiusta, vero {player_name}?
        {charTag(Franco, "neutral")}:                                           Le regole sono ingiuste, non la vita.
                                                                                E le onde.
                                                                                Le onde sono ingiuste.
                                                                                Mi bagnano tutte le zampine quando prendo il sole!

        + \ {charTag(PG, "neutral")}:                                           Si gioca per vincere!
                -> glyph_choice_manager(false, fireC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != him:
                {charTag(ThirdCharacter, "neutral")}:                           Mi fai quasi sentire stupido.                 
                }        
        {charTag(Franco, "party")}:                                             E per la pizza.
        {charTag(ThirdCharacter, "jester")}:                                    Franchì fa parte di un campionato tutto suo, {player_name}!
                {
                - are_two_entities_together(FirstCharacter, PG): 
                {charTag(FirstCharacter, "affectionate")}:                      A me il campionato di Franco piace!
                }
        {charTag(ThirdCharacter, "neutral")}:                                   Ma sono contento che noi due ci capiamo!
        {
        - thirdChar_recordedPlayerPronoun == him:
        {charTag(ThirdCharacter, "jester")}:                                    Sintonia tra veci!
        - thirdChar_recordedPlayerPronoun == her:
        {charTag(ThirdCharacter, "jester")}:                                    E sei pure una ragazza, pensa te!
        - else:
        {charTag(ThirdCharacter, "jester")}:                                    Alla fine unə può essere non binariə ed essere competitiva!        
        }                                                        
        
        + \ {charTag(PG, "neutral")}:                                           Sono più a mio agio con le situazioni in cui si collabora.
                -> glyph_choice_manager(false, waterC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != him:
                {charTag(ThirdCharacter, "neutral")}:                           Nessun ragazzo avrebbe detto una cosa del genere!
                - else:
                {charTag(ThirdCharacter, "neutral")}:                           Ma che risposta è, vecio?                     
                }        
        {charTag(ThirdCharacter, "neutral")}:                                   Allora ti piacerebbe la parte amministrativa, immagino.
                                                                                Nella lega nostra ci sono tre persone che si aiutano per tenere l'app aggiornata e i vari punteggi.
        {charTag(ThirdCharacter, "bored")}:                                     Ognuno si fa male come gli pare.


        + \ {charTag(PG, "neutral")}:                                           Franco sta dicendo che se le regole danneggiano chi ha meno potere allora vanno distrutte.
                -> glyph_choice_manager(false, aetherC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == they:
                {charTag(ThirdCharacter, "neutral")}:                           Rieccoci con tutte le tue cose queer.                    
                }        
        {charTag(Franco, "party")}:                                             Craaa!
                                                                                Come mi capisci tu non mi capisce nessuno, {player_name}!
                                                                                A parte i miei mariti.
                                                                                E i gemelli.
        {charTag(Franco, "neutral")}:                                           Quasi tutti.
                                                                                Euforbo è spesso confuso.
        {charTag(ThirdCharacter, "bored")}:                                     Non solo Euforbo.
        {charTag(ThirdCharacter, "neutral")}:                                   Le regole servono per tenere un minimo di ordine.
                                                                                Meglio una regola stupida ma che non fa creare casini, che nessuna regola e solo casini.
                {
                - are_two_entities_together(Mentor, PG): 
                {charTag(FifthCharacter, "hurry")}:                                     Sono d'accordo con te, {charNameThree}.
                {charTag(ThirdCharacter, "jester")}:                            Per fortuna che ci sei tu, zia, a capirmi!           
                }
                {
                - are_two_entities_together(FirstCharacter, PG): 
                {charTag(FirstCharacter, "bored")}:                             Io qui sono per Team Franco.
                {charTag(Franco, "party")}:                                     E io sono Franco!
                }                                                                                                                                        
        -
        {charTag(ThirdCharacter, "neutral")}:                                   Franchì, riprendiamo!
                                                                                Allora, ti consiglio almeno due ali decenti.


    -> third_char_closing_storylet ->
    ->->



=== third_mentor_chit_chat ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
        
        //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += FifthCharacter
        ~ list_currentActors += ThirdCharacter

        {charTag(FifthCharacter, "sad")}:                                               Oh povera stella!
                                                                                Ma quindi Donatella ti ha lasciato all'altare?
                {
                - are_two_entities_together(FirstCharacter, PG):
                        {
                        - grimoire_firstChar has grimFirstThirdChar or grimFirstThirdChar has grimFirstCharMentorAboutThirdChar or thirdChar_firstCharRage == true:
                        {charTag(FirstCharacter, "annoyed")}:                   No.
                                                                                Basta con questa storia.
                                ~ change_entity_place(FirstCharacter)     
                        }
                }                                                                
        {charTag(ThirdCharacter, "melanchonic")}:                               Sì.
        {charTag(ThirdCharacter, "neutral")}:                                   Cioè, non proprio.
                                                                                Quando stavamo ancora preparando il matrimonio.
                                                                                Mancavano sei mesi.
                                                                                Mia sorella c'aveva già aiutati a trovare il fotografo.
                                                                                Mio cognato c'aveva trovato uno sconto per i fiori con gente del teatro.
                                                                                E mia suocera, la mia futura suocera, aveva aiutato Dona a trovare il vestito.
        {charTag(ThirdCharacter, "melanchonic")}:                               Un vestito da principessa.
        {charTag(FifthCharacter, "sad")}:                                               Devi starci ancora malissimo.
        {charTag(ThirdCharacter, "neutral")}:                                   Già.
                                                                                Ma si va avanti, no?
                                                                                Però è brutto: a volte certe cose non le vedi quando sei innamorato.
        {charTag(FifthCharacter, "sorry")}:                                             Ma i tuoi amici avevano notato qualcosa?
        {charTag(ThirdCharacter, "neutral")}:                                   Su di lei dici?
        {charTag(FifthCharacter, "neutral")}:                                           Sì, cose che magari non andavano.
                                                                                Hanno provato a metterti in guardia?
        {charTag(ThirdCharacter, "jester")}:                                    E che sono, i miei babysitter?
        {charTag(FifthCharacter, "sorry")}:                                             No, intendo che...
        {charTag(ThirdCharacter, "bored")}:                                     Sono stato uno stronzo io, a credere che una così poteva innamorarsi di me, che c'entrano loro, no?
                
                {
                - fifthChar_slurDetector > 3:
                {charTag(FifthCharacter, "hurry")}:                                     {charNameThree}, non serve che tu sia sempre così oppositivo, su.
                {charTag(FifthCharacter, "neutral")}:                                   Sono qui solo per aiutare.
                {charTag(ThirdCharacter, "bored")}:                             Come quando mi rompi i coglioni per due parolacce?
                }

        {charTag(ThirdCharacter, "bored")}:                                     Sai una cosa, {charNameFive}?
                                                                                Forse ho capito il problema di questo posto, il tuo problema.
        {charTag(ThirdCharacter, "neutral")}:                                   Vi sentite tutte ferite dal mondo.
                                                                                "Buaaaah, il mondo è cattivo con me, buaaaah!"
        {charTag(ThirdCharacter, "bored")}:                                     Fate come se qualcuno vi deve qualcosa.
                                                                                Beh: sveglia.
        {charTag(ThirdCharacter, "jester")}:                                    Non vi è dovuto nulla!
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "annoyed")}:                           Serio?
                }  
        {charTag(FifthCharacter, "neutral")}:                                           {charNameThree}, respira un attimo.
        {charTag(ThirdCharacter, "angry")}:                                     Non mi dire cosa fare, zia!
        {charTag(FifthCharacter, "bored")}:                                             BASTA!
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "curious")}:                           Ma guarda un po' come perde la pazienza {charNameFive}!
                }     
        {charTag(FifthCharacter, "neutral")}:                                           Ti ho fatto questa domanda perché ho vissuto momenti in cui le persone vicine mi hanno detto "Ma è ovvio che questa cosa ti stava facendo male" solo quando ho avuto il coraggio di venirne fuori da sola.
                                                                                E volevo capire se i tuoi amici ci sono stati per te <i>prima</i> della fine della relazione con Dona, o solo quando la bomba è scoppiata.
                                                                                Perché in quel caso ho imparato a mie spese che quella roba lì non è amicizia.
        {charTag(ThirdCharacter, "bored")}:                                     Questo vale per te, zia.
        {charTag(ThirdCharacter, "neutral")}:                                   Magari lo capisco anche il tuo punto di vista.
                                                                                E mi spiace se mi sono incazzato.
                                                                                Ma te lo dico a te e lo dico a {player_name}.
                                                                                Io esco con le persone per distrarmi, non per pensare alle cose che non vanno.
                                                                                E se uno mi viene a giudicare cose sulla mia vita senza che gliel'abbia chiesto, quello non è un mio amico.
        {charTag(ThirdCharacter, "bored")}:                                     Punto.
                {
                - are_two_entities_together(Franco, PG):
                {charTag(Franco, "neutral")}:                                   E virgola!
                }

        + \ {charTag(PG, "neutral")}:                                           Cosa ti hanno detto i tuoi amici quando gli hai raccontato che era finita con Donatella?
                -> glyph_choice_manager(false, airC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == him:
                {charTag(ThirdCharacter, "jester")}:                            Il vecio e le domande serie.                      
                }        
        {charTag(ThirdCharacter, "bored")}:                                     Non è che gliel'ho esattamente raccontato.
                                                                                È più una cosa che hanno sentito in giro.
        {charTag(ThirdCharacter, "neutral")}:                                   A parte il Poggi.
                                                                                Che però c'è stato solo per dirmi due cose e bona.
                                                                                Rocco mi ha stupito però.
                                                                                Si è preso la sera libera dopo la partita e mi ha portato a ubriacarmi.
        {charTag(ThirdCharacter, "jester")}:                                    Abbiamo parlato di Inter tutta la sera.
        {charTag(ThirdCharacter, "neutral")}:                                   Ci voleva.


        + \ {charTag(PG, "neutral")}:                                           Anche con le migliori intenzioni, ogni esperienza è personale, ogni consiglio è un giudizio.
                -> glyph_choice_manager(false, earthC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != him:
                {charTag(ThirdCharacter, "neutral")}:                           Mi sembra più un ragionamento da ragazzo.                 
                }        
        {charTag(ThirdCharacter, "neutral")}:                                   Grazie {player_name}, grazie.
                                                                                Sono uno che si fa i cazzi suoi, {charNameFive}.
                                                                                Per cui non poi pensare che sai davvero qualcosa di me.
                                                                                E quindi quando uno apre bocca per darmi un consiglio sta solo dicendo una cosa su di lui, non su di me.
        {charTag(ThirdCharacter, "bored")}:                                     E quella cosa se la può tenere per sé e bona.

                
        + \ {charTag(PG, "neutral")}:                                           Fare invece che parlare, come il Poggi che ha tirato su il gruppo di calcetto quando stavi male.
                -> glyph_choice_manager(false, fireC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != him:
                {charTag(ThirdCharacter, "neutral")}:                           Mi sembra più un ragionamento da ragazzo.                    
                }        
        {charTag(ThirdCharacter, "neutral")}:                                   Esatto, {player_name}!
                                                                                {charNameFive}, io non voglio che pensi che i miei amici sono degli idioti.
                                                                                Ci sono a modo loro.
                                                                                Magari non il modo perfetto per te, ma per me lo è.
        {charTag(FifthCharacter, "neutral")}:                                           Non sono sicura di poterti credere fino in fondo, scusa.
                                                                                Ma mi fiderò di te.                                                                        

        + \ {charTag(PG, "neutral")}:                                           Se le persone care non ci dicono le cose scomode, su cosa si basa allora la fiducia che gli diamo?
                -> glyph_choice_manager(false, waterC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == her:
                {charTag(ThirdCharacter, "neutral")}:                           Si vede che sei una ragazza, madonna se si vede!                    
                }        
        {charTag(ThirdCharacter, "neutral")}:                                   Perché ci sono, sono lì a distrarci e farci ridere quando le cose non vanno.
                                                                                O tirano su la cornetta quando li chiami e vengono a farsi una birretta con te.
        {charTag(ThirdCharacter, "bored")}:                                     E poi la fiducia è una cosa esagerata.
                                                                                Niente e nessuno c'è per sempre, e alla fine ognuno pensa ai cazzi propri.
                
        + \ {charTag(PG, "neutral")}:                                           Se siamo vulnerabili, le relazioni ci accrescono. Altrimenti ristagniamo mentre il mondo cambia.
                -> glyph_choice_manager(false, aetherC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == they:
                {charTag(ThirdCharacter, "neutral")}:                           Magari funziona per voi non binary questa cosa.
                                                                                Ma poi, mi dico.
                }        
        {charTag(ThirdCharacter, "bored")}:                                     In 'sto posto deve essere tutto un lavoro?
                                                                                Anche l'amicizia?
        {charTag(ThirdCharacter, "neutral")}:                                   Sul campo di calcetto si impara a lavorare di squadra.
                                                                                A capire le intenzioni dell'altro senza una sola parola.
                                                                                Ad ascoltare il proprio corpo.
        {charTag(ThirdCharacter, "bored")}:                                     Si può crescere anche senza tirarsi i pipponi.
        -

        {charTag(FifthCharacter, "neutral")}:                                           Mi permetto però di dirti una cosa, {charNameThree}.
                                                                                Le cose che proviamo esistono, a prescindere che le comunichiamo o meno.
                                                                                E se non le tiriamo fuori volontariamente, troveranno il loro modo di uscire.
        {charTag(FifthCharacter, "sad")}:                                               Spesso facendo o facendoci del gran male.


    -> mentor_closing_storylet ->
    -> third_char_closing_storylet ->
    ->->

=== third_second_chit_chat ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

        //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += SecondCharacter
        ~ list_currentActors += ThirdCharacter


        {charTag(ThirdCharacter, "neutral")}:                                   No no credimi: Lautaro Martinez è uno dei migliori di sempre.
                                                                                Altro che Ronaldo.
        {charTag(SecondCharacter, "neutral")}:                                  Mh mh.
        {charTag(ThirdCharacter, "neutral")}:                                   Dai, tuo papà ti c'avrà portato allo stadio ogni tanto!
        {charTag(SecondCharacter, "neutral")}:                                  Ci andava coi suoi amici.
                                                                                Ora sta a casa e si arrabbia con la tv.
        {charTag(ThirdCharacter, "neutral")}:                                   E tuo fratello?
        {charTag(SecondCharacter, "neutral")}:                                  Non gli piace il calcio.
        {charTag(SecondCharacter, "energy")}:                                   Però è bravissimo coi videogiochi.
                                                                                A te piacciono i videogiochi?
        {charTag(ThirdCharacter, "neutral")}:                                   Fratellino, il mondo non è nei videogiochi, è fuori!
        {charTag(ThirdCharacter, "jester")}:                                    E poi ero una schiappa a FIFA 2000!                                                               
        {charTag(ThirdCharacter, "jester")}:                                    Senti a me: allo stadio ti ci porto io quando usciamo da qui, che dici?
                                                                                Ci spariamo il derby!
                                                                                Immagina: tu, io e il Franchì a urlare contro i milanisti.
                {
                - are_two_entities_together(Franco, PG):
                {charTag(Franco, "neutral")}:                           Inizio a prepararmi l'ugola!
                {charTag(Franco, "question")}:                                  Ma cos'è un milanista?
                                                                                È qualcosa che si mangia?
                {charTag(ThirdCharacter, "jester")}:                            Sì Franchì, ce li mangeremo tutti!                                                                
                }                                                                
        {charTag(ThirdCharacter, "jester")}:                                    E poi ci facciamo una scorpacciata di patatine fritte al ritorno, per festeggiare.
                                                                                Perché vinciamo di sicuro!
        {charTag(SecondCharacter, "neutral")}:                                  Ti piacciono le patatine?                                                                        
        {charTag(SecondCharacter, "neutral")}:                                  Mh mh.
                {
                - are_two_entities_together(Mentor, PG):
                {charTag(FifthCharacter, "neutral")}:                                   {charNameThree}, questo bambino è palesemente a disagio.
                        {
                        - are_two_entities_together(FirstCharacter, PG):
                        {charTag(FirstCharacter, "annoyed")}:                   Ma il nostro grande uomo non sembra rendersene conto.
                        }
                - else:
                        {
                        - are_two_entities_together(FirstCharacter, PG):
                        {charTag(FirstCharacter, "annoyed")}:                   {charNameThree}: non ci vuole un genio per capire che {charNameTwo} è a disagio in questa conversazione.
                        }                                                                        
                }
        {charTag(ThirdCharacter, "neutral")}:                                   Allora conosco un posto perfetto, con trenta salse tra cui scegliere!
                                                                                C'è anche un laghetto per la pesca, ti ci porto assieme al Franchì.
                                                                                Sempre che non ci spaventa tutti i pesci.
                {
                - are_two_entities_together(Franco, PG):
                {charTag(Franco, "neutral")}:                           È mio sacro dovere proteggerli tutti dai pescatori!
                                                                                E da zio Gracco.
                }                                                                  
         {charTag(ThirdCharacter, "neutral")}:                                  Sai pescare, fratellino?
        {charTag(SecondCharacter, "neutral")}:                                  No.
        {charTag(ThirdCharacter, "jester")}:                                    Sei proprio un ragazzo di città.
        {charTag(SecondCharacter, "neutral")}:                                  Io sto in periferia, non in città.
                                                                                E poi a me piacciono gli animali, non voglio fargli del male.
        {charTag(ThirdCharacter, "neutral")}:                                   Quali animali? 
                                                                                Gli orsi? I lupi? I leoni?
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
        {charTag(ThirdCharacter, "neutral")}:                                   Fratellino, ma non sei un po' grande per queste fantasie?
                                                                                Non è il momento di diventare un ometto?
        {charTag(SecondCharacter, "neutral")}:                                  Uh.
        {charTag(ThirdCharacter, "neutral")}:                                   {player_name}!
                                                                        

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
                - grimoire_thirdChar has grimWitchThirdChar:                    
                {charTag(ThirdCharacter, "bored")}:                             E dì alla tua amica medium pazza che c'hai nel cervello che non mi interessa la sua opinione.
                                                                                Loro opinione.
                                                                                Quel che è.                
                }
                
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "annoyed")}:                           Ma sei un meme?
                                                                                Ti prego dimmi che sei un meme.
                }
        
        
        + \ {charTag(PG, "neutral")}:                                           Ma cos'è un uomo per te, {charNameThree}?
                -> glyph_choice_manager(false, airC)->
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "annoyed")}:                           Hai preso la persona giusta per parlare di filosofia, proprio.
                }          
        {charTag(ThirdCharacter, "neutral")}:                                   Uno che sa tirarsi fuori dai suoi casini.
                                                                                Che non ha paura di sporcarsi le mani.
                                                                                Capace di sacrificarsi per il bene della propria famiglia.
        {charTag(ThirdCharacter, "jester")}:                                    E tirare un pugno quando serve.
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "neutral")}:                           Un paladino di D&D, non un essere umano.
                }       

        + \ {charTag(PG, "neutral")}:                                           Facciamogli fare qualcosa di pratico, come spalare un po' di fango in qualche rifugio per animali.
                -> glyph_choice_manager(false, earthC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != him:
                {charTag(ThirdCharacter, "neutral")}:                           Sei un maschiaccio te mi sa.               
                }        
        {charTag(SecondCharacter, "neutral")}:                                  Aiutiamo gli animali?
                                                                                Non mi piace il fango, ma per gli animali posso farlo.
        {charTag(ThirdCharacter, "jester")}:                                    Così mi hai fregato {player_name}!
                                                                                Finisce che sgobbo anche il giorno libero!                                                                                
                
        + \ {charTag(PG, "neutral")}:                                           Un po' di stadio e di vita vera ti fanno solo che bene {charNameTwo}. Vai a sentire la passione! Grida!
                -> glyph_choice_manager(false, fireC)->
                {
                - are_two_entities_together(Franco, PG):
                {charTag(Franco, "neutral")}:                                   CRAAAAAAAARGH!
                {charTag(ThirdCharacter, "jester")}:                            No Franco, {player_name} non diceva di gridare ora!
                } 
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != him:
                {charTag(ThirdCharacter, "neutral")}:                           Sei un maschiaccio te {player_name}!              
                } 
                {
                - are_two_entities_together(FirstCharacter, PG):
                {charTag(FirstCharacter, "neutral")}:                           Vi stupirò, ma l'idea di andare a vedere una partita non mi dispiace.
                                                                                Quando ero piccola ci andavo con papà ogni tanto, non era male.
                }  
        {charTag(ThirdCharacter, "jester")}:                                    Mi spiace {charNameTwo}, ma siamo <>
                {
                - are_two_entities_together(FirstCharacter, PG):
                                                                                in tre <>
                - else:
                                                                                in due <>                                                           
                }
                                                                                d'accordo sul piano!
                                                                                Appena finisce questa roba ci si organizza per il derbiiii!
        {charTag(SecondCharacter, "melanchonic")}:                              Posso darmi malato?                                                                        


        + \ {charTag(PG, "neutral")}:                                           A me l'idea del prociorso emoziona tantissimo. C'è posto anche per me sulla luna, {charNameTwo}?
                -> glyph_choice_manager(false, waterC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == her:
                {charTag(ThirdCharacter, "neutral")}:                           Ragazze.             
                }  
        {charTag(SecondCharacter, "energy")}:                                   Sìììì!
                                                                                E poi di faccio conoscere il cammaleo, un cammello con due teste di leone sulla schiena.
        {charTag(SecondCharacter, "neutral")}:                                  Sembra spaventoso ma in realtà vuole solo giocare.
        {charTag(SecondCharacter, "emotional")}:                                E se hai un laser lo inseguono lungo la casa in modo molto buffo.
        {charTag(ThirdCharacter, "bored")}:                                     Pensavo di avere a che fare con un bambino, invece ne ho due.
                                                                                Povero me.

        + \ {charTag(PG, "neutral")}:                                           Hai una certa fretta di mettere {charNameTwo} in una scatoletta, {charNameThree}.
                -> glyph_choice_manager(false, aetherC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == they:
                {charTag(ThirdCharacter, "bored")}:                             Mi scusi se non sono ancora decostruito.            
                } 
        {charTag(ThirdCharacter, "bored")}:                                     Non è una scatoletta.
                                                                                Ma il mondo là fuori è complicato.
                                                                                E se ci vuoi davvero bene a questo bimbetto non gli servono altre favole.
        {charTag(ThirdCharacter, "neutral")}:                                   Gli serve capire come fare squadra, come stare con gli altri ragazzi.
                                                                                Solo io mi rendo conto che 'sto ragazzino non ci sa stare con quelli della sua età?                                                                        
        -
        {charTag(SecondCharacter, "neutral")}:                                  Facciamo così.
                                                                                Io vengo alla partita, se tu vieni con me all'acquario.
        {charTag(SecondCharacter, "emotional")}:                                E ci facciamo spiegare dalle guida TUTTI i pesci.
                                                                                Anche quelli piccolini che nessuno guarda mai.
        {charTag(ThirdCharacter, "bored")}:                                     Nooo, i pesci piccoli nooo!
        {charTag(ThirdCharacter, "jester")}:                                    Scherzo fratellino!
        {charTag(ThirdCharacter, "neutral")}:                                   Affare fatto.
                                                                                Liberiamoci alla svelta di questo posto, e ci organizziamo!
        {charTag(SecondCharacter, "neutral")}:                                  Ma perché mi chiami sempre <i>fratellino</i>?
        {charTag(ThirdCharacter, "neutral")}:                                   Perché mi stai simpatico!
                                                                                E poi così sono il tuo fratellone, no?                                                                                                                                                                                                                                                  

    -> second_char_closing_storylet ->
    -> third_char_closing_storylet ->
    ->->

=== third_first_chit_chat ===
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour = translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

        //Aggiungiamo a lista list_currentActors
        ~ list_currentActors += ThirdCharacter
        ~ list_currentActors += FirstCharacter

        {charTag(ThirdCharacter, "angry")}:                                     Ma smettila di parlare come le influsceme su Instagram, Gesù licantropo!
                                                                                Ma ce l'hai una personalità tua {charNameOne}?!?!?
        {charTag(ThirdCharacter, "bored")}:                                     <i>E il patriarcato di qua, e il patriarcato di là.</i>
                                                                                Ma chi se ne fotte mannaggia al cazzo!                                  
        {charTag(ThirdCharacter, "angry")}:                                     E poi non ce la fai proprio a non farti i cazzi miei, vero?
                {
                - thirdChar_firstCharRage == true:                              
                {charTag(ThirdCharacter, "angry")}:                             Come quando prima stavo parlando a {player_name} di come mi ha trattato di merda Dona, e tu lì a farmi le pulci sull'età.
                {charTag(FirstCharacter, "annoyed")}:                           <i>Le pulci sull'età.</i>
                                                                                Ci sei uscito che era minorenne, te ne rendi conto!?!
                                                                                E so che il tuo cervellino non ci può arrivare, ma.
                }
        {charTag(FirstCharacter, "annoyed")}:                                   Sono cazzi miei se vai in giro a dire stronzate che mi riguardano.
        {charTag(ThirdCharacter, "bored")}:                                     Ma cosa ti riguarda cosa, egocentrica del cazzo?
                                                                                Stavo solo parlando con {charNameTwo}!
        {charTag(FirstCharacter, "annoyed")}:                                   Sì, dicendogli che tutte le donne sono delle troie.
                {
                - are_two_entities_together(Mentor, PG):
                {charTag(FifthCharacter, "sad")}:                                       {charNameOne}!
                        {
                        - fifthChar_slurDetector > 0:
                                                                                Almeno tu con queste parolacce no, per favore!        
                        }    
                }
        {charTag(ThirdCharacter, "neutral")}:                                   Non mettermi in bocca parole che non ho detto, {charNameOne}!
        {charTag(FirstCharacter, "annoyed")}:                                   Ah no?
                                                                                E allora tutto quel discorso sulle ragazze che ti smollano appena ne trovano un più bono o ricco o famoso?
        {charTag(ThirdCharacter, "angry")}:                                     Dimmi che non è vero.
        {charTag(FirstCharacter, "neutral")}:                                   Non è vero.
        {charTag(ThirdCharacter, "bored")}:                                     Dona ha letteralmente fatto così.
        {charTag(FirstCharacter, "neutral")}:                                   Ma mi hai detto che Donatella ti ha lasciato "per trovare sé stessa", non per andare con un altro tipo.
        {charTag(ThirdCharacter, "angry")}:                                     "Trovare sé stessa" seduta su un cazzo più grosso.
                                                                                        //Check parolacce da parte di Mentore
                                                                                        ~ fifthChar_slurDetectorFunction()
        {charTag(FirstCharacter, "neutral")}:                                   E anche se non fosse così.
        {charTag(ThirdCharacter, "melanchonic")}:                               È sparita dopo una vita assieme.
        {charTag(ThirdCharacter, "angry")}:                                     Mi ha trattato come spazzatura!
        {charTag(FirstCharacter, "neutral")}:                                   E quindi?
                                                                                Mettiamo pure che lei è stata stronza, non è che questo rende tutte le donne stronze.
        {charTag(ThirdCharacter, "bored")}:                                     Ma fate tutte così!
        {charTag(FirstCharacter, "annoyed")}:                                   Tutte chi?
        {charTag(FirstCharacter, "neutral")}:                                   Io non l'ho fatto.
                                                                                Mia madre non l'ha fatto.
                                                                                Tua madre?
        {charTag(ThirdCharacter, "angry")}:                                     Lascia fuori mia mamma da questa roba.
        {charTag(FirstCharacter, "neutral")}:                                   Ce l'hai portata te nel momento in cui hai detto "Tutte le donne sono troie", no?
        {charTag(ThirdCharacter, "neutral")}:                                   E allora anche la roba di "Tutti gli uomini sono stupratori" che dite sempre voi, no?
                                                                                Tuo padre è uno stupratore?
                {
                - are_two_entities_together(Mentor, PG):
                {charTag(FifthCharacter, "sad")}:                                       Siamo arrivate a questo?
                        ~ change_entity_place(Mentor)
                }
                {
                - are_two_entities_together(SecondCharacter, PG):
                {charTag(SecondCharacter, "angry")}:                            Sembrate mamma e papà!
                        ~ change_entity_place(SecondCharacter)
                }
                {
                - are_two_entities_together(Franco, PG):
                {charTag(Franco, "neutral")}:                                   Questo è troppo anche per Franco.
                        ~ move_entity(Franco, Safekeeping)
                }                                                                 
        {charTag(FirstCharacter, "neutral")}:                                   Che sappia, no.
        {charTag(ThirdCharacter, "neutral")}:                                   Vedi che...
        {charTag(FirstCharacter, "neutral")}:                                   Ma so anche che quando i suoi amici fanno battute di merda sulle donne, battute tipo "Tutte le donne sono troie", lui se ne sta zitto e non dice nulla.
                                                                                E quindi magari mio padre non ha mai fatto male a una donna.
                                                                                Ma ha lasciato che qualcuno pensasse che fosse normale definirle <i>troie</i>.
                                                                                Che essere <i>troie</i> sia un problema.
                                                                                Un problema che rende una donna non più una persona ma una cosa da comprare.
                                                                                Qualcosa da usare.
        {charTag(ThirdCharacter, "neutral")}:                                   Io non ho mai trattato Dona come qualcosa da comprare.
        {charTag(FirstCharacter, "neutral")}:                                   Ma quando ha deciso che la vostra relazione non la faceva più stare bene, invece di accettare la cosa e magari piangerci sopra, ti sei solo incazzato.
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
                                                                                Seriamente?
        {charTag(ThirdCharacter, "neutral")}:                                   A cosa ti serve trovare te stessa se c'hai accanto una persona che ti conosce da praticamente metà della tua vita?
                                                                                Non c'ha senso questa cosa.
                                                                                Io ero lì per lei, per aiutarla a capire, non serviva che se ne andasse in Spagna!
        {charTag(FirstCharacter, "neutral")}:                                   Il fatto che tu non capisca il perché mi fa provare quasi pena per te.
                                                                                E stima per lei che è stata capace di andarsene.                                                                        

        + \ {charTag(PG, "neutral")}:                                           {charNameOne}, stai parlando di cose astratte a una persona che ancora sta male.
                -> glyph_choice_manager(false, earthC)->
        {charTag(FirstCharacter, "neutral")}:                                   Io.
        {charTag(ThirdCharacter, "neutral")}:                                   No, lo dico io <i>io</i>.
                                                                                Magari tu c'hai pure ragione.
                                                                                Ma è come se in questo momento fossi su una barca che continua a prendere acqua.
                                                                                E tu invece di aiutarmi a svuotarla sei qui a dirmi: "Non dovevi partire".
                                                                                O "Forse era meglio se prima ci mettevi del catrame per coprire i buchi".
                                                                                Magari poi a riva ti do pure ragione.
        {charTag(ThirdCharacter, "bored")}:                                     Forse.
        {charTag(ThirdCharacter, "neutral")}:                                   Ma ora voglio solo togliere quella cazzo di acqua dalla barca. 

        
        + \ {charTag(PG, "neutral")}:                                           Bravo o cattivo conta poco: conta quello che fai.
                -> glyph_choice_manager(false, fireC)->                         
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != him:
                {charTag(ThirdCharacter, "neutral")}:                           Posso anche apprezzare un taglio pratico, anche se non sei un ragazzo, dai.            
                }              
        {charTag(ThirdCharacter, "bored")}:                                     Ad ascoltare la zia il mio inconscio o la carta astrale o Vanna Marchi o che ne so io mi hanno portato qui per farti fare a te questo lavoro, {player_name}, per capire che c'ho che non va.
        {charTag(FirstCharacter, "annoyed")}:                                   Ma sì, scarichiamo sempre su qualcun altro la colpa del lavoro che non stiamo facendo.
        {charTag(ThirdCharacter, "bored")}:                                     Sentila.
                                                                                Quella che passa il tempo a rompermi i maroni.                                   

        + (water) \ {charTag(PG, "neutral")}:                                           {charNameThree}: se il dolore che provi fosse solo tuo e non un problema universale, varrebbe meno?
                -> glyph_choice_manager(false, waterC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == her:
                {charTag(ThirdCharacter, "jester")}:                            Che domande pese, {player_name}!          
                } 
        {charTag(ThirdCharacter, "bored")}:                                     Ma perché non dovrebbe valere la stessa cosa per {charNameOne} e il suo odio verso gli uomini?
                                                                                Non è solo un suo dolore, una sua sfiga, invece di farne un problema personale?
        {charTag(FirstCharacter, "annoyed")}:                                   Ora tiro giù tutti i santi.
                                                                                Perché tutte le donne uccise, violentate o malmenate dai compagni non sono un <i>mio</i> dolore, ma un problema strutturale.
                                                                                Lo sono i problemi sul lavoro, l'attacco ai diritti riproduttivi.
                                                                                Non è difficile, ammasso di testosterone che non sei altro!                                                                        
                
        + (aether) \ {charTag(PG, "neutral")}:                                  {charNameOne} sta cercando di dirti che anche se non te ne rendi conto, ragioni come un misogino.
                -> glyph_choice_manager(false, aetherC)->
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun == they:
                {charTag(ThirdCharacter, "jester")}:                            Certo che per te è tutto politico, {player_name}!            
                } 
        {charTag(ThirdCharacter, "bored")}:                                     Eccola la vostra parola preferita.
                                                                                Quella che blocca tutte le conversazioni.
                                                                                Quella che rende tutti gli uomini colpevoli.
        {charTag(FirstCharacter, "annoyed")}:                                   Non la blocca, la apre!
                                                                                Perché se non ammetti di avere un problema, non farai nulla per cambiare la situazione!
        {charTag(ThirdCharacter, "bored")}:                                     Non ho nessun problema, signorina SonoMeglioDiTuttiVoi.
        {charTag(FirstCharacter, "annoyed")}:                                   Non di tutti voi, ma di sicuro di te.

        -

        {charTag(FirstCharacter, "neutral")}:                                   {charNameThree}: io non metto in discussione che tu sia ferito, e che la fine della relazione con Donatella sia stata dolorosa.
                                                                                Ma.
                {
                        - water:
                                                                                E qui mi accodo a {player_name}.
                }
                                                                                Non serve trasformare un problema personale in un problema strutturale per ricevere dalle altre persone cura e supporto.
                                                                                Hai tutto il diritto di chiederlo.
        {charTag(FirstCharacter, "annoyed")}:                                   Non da me perché sinceramente fatico a sopportarti.
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
                                                                        E {player_name} è adult{player_pronoun has him:o|{player_pronoun has her:a|ə}}!
                                                                        Quindi ora puoi rispondermi.
        {charTag(Carla, "neutral")}:                                    Mi ripeta la domanda.
        {charTag(SecondCharacter, "energy")}:                           È vero che le capre recitano?
        {charTag(Carla, "bored")}:                                      Decreto legislativo 134/2022, sezione 65.
        {charTag(Carla, "neutral")}:                                    "È previsto che ogni capra svezzata segua un corso di recitazione di anni tre presso la Royal Academy of Dramatic Art."
                                                                        "Il costo è a carico dell'allevatore, o di chi ne fa le veci."
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
                {charTag(ThirdCharacter, "jester")}:                    Fratellino, ti sei fatto proprio fregare da una capra!
                {charTag(Carla, "bored")}:                              Le ricordo che sono io a sanzionarla quando romperà le regole di questo luogo.
                {charTag(ThirdCharacter, "bored")}:                     Non ho rotto nessunissima regola!
                {charTag(Carla, "bored")}:                              Non ancora.  
                }


    -> second_char_closing_storylet ->
    ->->