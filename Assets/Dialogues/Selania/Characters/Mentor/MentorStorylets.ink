=== knowing_mentor_character

    = one
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    

        {charTag(FifthCharacter, "neutral")}:                               Ehi {player_name}!
                                                                            Stavo pensando a una cosa sciocca.
        {charTag(FifthCharacter, "neutral")}:                               Che forse non è giusto avere delle preferenze, ma la serra è il mio posto preferito.
        {
            - LIST_COUNT(greenhouse_backupCultivable) < 12:
                                                                            E immagino piaccia anche te, visto che hai già coltivato diverse piante.
            - else:
                                                                            Forse per te non è lo stesso, perché vedo che non hai coltivato molte piante.
        }
        {charTag(FifthCharacter, "hurry")}:                                 C'è qualcosa nel vedere crescere piante, fiori, funghi che mi fa sentire appagata.
        {charTag(FifthCharacter, "neutral")}:                               Non è solo l'odore della terra, o l'umidità nell'aria nei giorni più caldi.
                                                                            Ma quella sensazione che con le tue mani puoi permettere a un altro corpo di crescere al meglio.
            {
                - are_two_entities_together(SecondCharacter, PG): 
                    {charTag(SecondCharacter, "energy")}:                   Un po' come quando con le mie mani pasticcio con i fili elettrici!
            }
            {
                - are_two_entities_together(FirstCharacter, PG): 
                    {charTag(FirstCharacter, "affectionate")}:              A me succede quando posso suonare.
                    E mente e corpo creano qualcosa di nuovo.
            } 

            + \ {charTag(PG, "neutral")}:                                   Preferisco la stazione dei treni, è ordinata e precisa.
                    -> glyph_choice_manager(Mentor, airC)->
                {charTag(FifthCharacter, "neutral")}:                       Sì, ne capisco il fascino.
                                                                            A volte mi siedo lì e mi godo per qualche istante l'attesa.
                                                                            Il nulla che accade.
                                                                            Ma poi le mani fremono, mi supplicano di sistemare qualcosa.
                                                                            Fatico a stare tranquilla.
                
            + \ {charTag(PG, "neutral")}:                                   Lo stagno è divertente, gli insetti fanno tantissime cose.
                    -> glyph_choice_manager(Mentor, earthC)->
                {charTag(FifthCharacter, "bored")}:                         Forse ne fanno troppe.
                {charTag(FifthCharacter, "neutral")}:                       Sembrano non pensare a nulla.
                                                                            E l'acqua è lì e lascia che tutto accada, senza pensare al domani.
                
            + \ {charTag(PG, "neutral")}:                                   La foresta domina: è lotta, è potenza!
                    -> glyph_choice_manager(Mentor, fireC)->
                {charTag(FifthCharacter, "bored")}:                         E disordinata, sporca.
                {charTag(FifthCharacter, "sorry")}:                         Posso capirne il fascino, ma non è un luogo dove resto con piacere.
                {
                    - player_accessiblePlaces has Library:
                                                                            Però per lo meno ora porta alla biblioteca, che sto imparando ad apprezzare.
                                                                            Anche se è estremamente incasinata.
                    
                    - else:
                        {charTag(FifthCharacter, "bored")}:                 E tutte quelle foglie da raccogliere!
                        {charTag(FifthCharacter, "neutral")}:               Una cosa davvero fastidiosa.
                }
                
            + \ {charTag(PG, "neutral")}:                                   Un po' come prendersi cura delle persone qui.
                    -> glyph_choice_manager(Mentor, waterC)->
                {charTag(FifthCharacter, "neutral")}:                       Sì, anche se con meno pressioni.
                                                                            Le persone a volte fanno cose che non ci aspettiamo.
                                                                            Un <i>Lichene degli abissi</i> con le giuste condizioni invece cresce sempre allo stesso modo.
  
            + \ {charTag(PG, "neutral")}:                                   Fortunatamente invece crescono a prescindere da me.
                    -> glyph_choice_manager(Mentor, aetherC)->
                {charTag(FifthCharacter, "sorry")}:                         Senza di te?
                {charTag(FifthCharacter, "hurry")}:                         Dobbiamo bagnare il terreno, prepararlo, seminare.
                                                                            Non ci sarebbe nulla senza il nostro lavoro.
                                                                            Non saprebbero resistere alle erbacce, al freddo.
                {charTag(FifthCharacter, "neutral")}:                       No, non sono d'accordo, scusa.
            -
        {
            - player_accessiblePlaces has Kitchen:
                                                                            Ma ora vorrei pensare un attimo a come rendere più carino l'accesso alla cucina.
            - else:
                {charTag(FifthCharacter, "hurry")}:                         Ma a proposito di questo posto: mi conviene dare una pulita all'acqua dello stagno.
        }

        {charTag(FifthCharacter, "neutral")}:                               Grazie per la chiacchierata, {player_name}.

            -> mentor_closing_storylet ->
            -> main
    
    = two
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    

             

        {charTag(FifthCharacter, "neutral")}:                               La storia di {charNameOne} mi ha colpita.
        {charTag(FifthCharacter, "hurry")}:                                 Così giovane.
                                                                            Così tante possibilità.
        {charTag(FifthCharacter, "sad")}:                                   Eppure invece di vedere la cosa come un vantaggio, si è ritrovata bloccata.
        {charTag(FifthCharacter, "hurry")}:                                 Quando avevo la sua età...
        {charTag(FifthCharacter, "neutral")}:                               No, queste sono frasi da vecchia.
        {charTag(FifthCharacter, "hurry")}:                                 E forse mi sono dimenticata di quanto possa essere facile perdere sé stesse quando si è giovani.
            {
                - are_two_entities_together(FirstCharacter, PG): 
                    {charTag(FirstCharacter, "curious")}:                   Vuol dire che questa confusione prima o poi finisce?
                    {charTag(FirstCharacter, "neutral")}:                   Perché la cosa mi rincuora mooolto.
            }
        
            + \ {charTag(PG, "neutral")}:                                   Numeri come l'età sono indicatori, non fatti assoluti.
                    -> glyph_choice_manager(Mentor, airC)->
                                                                            Su questo hai ragione, {player_name}.
                {charTag(FifthCharacter, "sad")}:                           Eppure posso assicurarti che i miei cinquanta e rotti anni si portano addosso anche un bel po' di fatti scricchiolanti e ricordi.
                   
            + \ {charTag(PG, "neutral")}:                                   Quando un gioco ha tantissime regole non è più divertente.
                    -> glyph_choice_manager(Mentor, earthC)->
                {charTag(FifthCharacter, "bored")}:                         Eppure non sono così tante regole.
                {charTag(FifthCharacter, "neutral")}:                       Forse è solo una: non puoi avere tutto.
                                                                            Se vedi la vita come un gioco, ti aspetti di avere almeno un modo per vincere.
                                                                            Ma non credo proprio che funzioni così.
                {charTag(FifthCharacter, "sad")}:                           Giochi, e il più delle volte perdi senza nemmeno sapere perché.
                
            + \ {charTag(PG, "neutral")}:                                   Nel dubbio si agisce. Fare male è meglio che non fare.
                    -> glyph_choice_manager(Mentor, fireC)->
                {charTag(FifthCharacter, "sad")}:                           Ma con questo principio, non c'è una azione mirata, consapevole.
                                                                            Poi succede che ci feriamo, o feriamo chi amiamo.
                                                                            E a quel punto non siamo nemmeno pronte a capire il perché.
                
            + \ {charTag(PG, "neutral")}:                                   E tu sei molto ricettiva verso le altre persone.
                    -> glyph_choice_manager(Mentor, waterC)->
                {charTag(FifthCharacter, "sorry")}:                         Forse non <i>molto</i>.
                {charTag(FifthCharacter, "neutral")}:                       Ma indubbiamente quello che hanno da dire e quello che provano, conta.
                                                                            Una mentore è una guida, ma per imparare a guidare deve capire chi ha dall'altra parte.
                                                                            Di cosa abbia bisogno.
                                                                            Dove voglia andare.
                
            + \ {charTag(PG, "neutral")}:                                   Per vedere le cose in modo ampio, è importante perdersi.
                    -> glyph_choice_manager(Mentor, aetherC)->
                {charTag(FifthCharacter, "neutral")}:                       E in questo luogo in fondo arrivano solo persone che si sono perse.
                                                                            E che se ne vanno più serene.
                                                                            Avrebbero scoperto quella serenità, senza un po' di smarrimento?
                
            -

        {charTag(FifthCharacter, "neutral")}:                               Questo luogo continua a stupirmi.
                                                                            Sei qui per aiutare le altre persone, e finisci per scoprire cose di te.
        {charTag(FifthCharacter, "hurry")}:                                 Ma ora è il momento di svuotare lo stagno dalle sue cose più schifose.
            {
                - are_two_entities_together(SecondCharacter, PG): 
                    {charTag(SecondCharacter, "neutral")}:                  Non togliere i girini però!
            } 
        {charTag(FifthCharacter, "neutral")}:                               Prega per me, {player_name}.

            -> mentor_closing_storylet ->
            -> main

    = three
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    
    
             
         
        {charTag(FifthCharacter, "sad")}:                                   A volte un po' mi pesa, tutto questo via vai.
        {charTag(FifthCharacter, "neutral")}:                               Ci sono persone a cui mi sono affezionata che non rivedrò più.
                                                                            Persone che ho aiutato e ora vorrei sentire più spesso.
                                                                            Ma poi le loro lettere non arrivano, o arrivano sempre meno.
        {charTag(FifthCharacter, "sad")}:                                   E allora mi chiedo se ho sbagliato qualcosa.
        {charTag(FifthCharacter, "neutral")}:                               Non mi fraintendere: sono felice di quello che faccio, di quello che ho fatto.
        {charTag(FifthCharacter, "hurry")}:                                 E per me è una gioia tenere tutto questo in piedi, giorno per giorno.
                                                                            Ma a volte vorresti una conferma esplicita, sapere che stai facendo tutto quello che puoi fare.
        {charTag(FifthCharacter, "sad")}:                                   Che nessuno ce l'ha con te.

            + \ {charTag(PG, "neutral")}:                                   Ogni lavoro ha la sua quota di sacrificio.
                    -> glyph_choice_manager(Mentor, airC)->
                {charTag(FifthCharacter, "sad")}:                           Vero.
                {charTag(FifthCharacter, "neutral")}:                       Il valore di qualcosa viene da quanto ci è costata.
                                                                            E la maggior parte delle volte non paghiamo in denaro.
                
            + \ {charTag(PG, "neutral")}:                                   Forse le volpi si mangiano le lettere!
                    -> glyph_choice_manager(Mentor, earthC)->
                {charTag(FifthCharacter, "neutral")}:                       La fantasia è un modo piacevole di affrontare la realtà, {player_name}.
                {charTag(FifthCharacter, "sad")}:                           Ma alla lunga rende difficile capire cosa sia vero e cosa no.
                    
            + \ {charTag(PG, "neutral")}:                                   Fregatene: il mondo è pieno di ingrati.
                    -> glyph_choice_manager(Mentor, fireC)->
                {charTag(FifthCharacter, "sorry")}:                         No.
                {charTag(FifthCharacter, "neutral")}:                       Direi che il mondo è pieno di persone distratte.
                                                                            Le cose da fare sono infinite, e finiamo per dimenticarci di chi non vediamo tutti i giorni.
                                                                            Non è ingratitudine, è una vita che scorre troppo veloce.
                
            + \ {charTag(PG, "neutral")}:                                   Ti prometto che ti scriverò ogni giorno.
                    -> glyph_choice_manager(Mentor, waterC)->
                {charTag(FifthCharacter, "neutral")}:                       Oh, {player_pronouns has him: caro|{player_pronouns has her: cara|carə}}, è una bella promessa.
                                                                            Una promessa che ho sentito decine di volte.
                    
            + \ {charTag(PG, "neutral")}:                                   Esiste un confine tra {charNameFive} e questo luogo?
                    -> glyph_choice_manager(Mentor, aetherC)->
                {charTag(FifthCharacter, "sad")}:                           A volte mi sento <i>solo</i> questo luogo.
                                                                            Non mi chiedo spesso se andarmene o meno.
                                                                            O dove.
 
            -
            {charTag(FifthCharacter, "neutral")}:                           Ma basta con questo spirito malinconico!
                                                                            Mi sono appena ricordata che ci sono delle erbacce fastidiose dietro la serra.
                                                                            Devo inventarmi un modo per liberarmene!
                {
                    - are_two_entities_together(SecondCharacter, PG):
                            {charTag(SecondCharacter, "energy")}:           Chissà se {charNameOne} mi manderà una lettera!
                        
                }
                {
                    - are_two_entities_together(FirstCharacter, PG):
                            {charTag(FirstCharacter, "curious")}:           Quindi {charNameTwo} mi manderà una lettera?
                } 

                -> mentor_closing_storylet ->
                -> main
    
    = four
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)
    

             

        {charTag(FifthCharacter, "sorry")}:                                 Mi sto chiedendo se non sia stata troppo dura col piccolo {charNameTwo} appena arrivato qui.
        {charTag(FifthCharacter, "neutral")}:                               Ma questo non è un luogo per un bimbo.
                                                                            Anzi: questo è un luogo dove non dovrebbe <b>mai</b> arrivare un bimbo.
                                                                            Ti immagini cosa possa significare essere un genitore e renderti conto che tuo figlio, così piccolo, ha già perso la strada?
                                                                            Che già non sappia più cosa fare del suo futuro?
        {charTag(FifthCharacter, "sad")}:                                   Che cosa terribile per entrambi.
                                                                            E tutta quella responsabilità.
                                                                            Quella paura per il futuro e per l'ambiente.
        {charTag(FifthCharacter, "neutral")}:                               Non dovrebbe pensare al pallone, a giocare con gli amici, a studiare?
        
            + \ {charTag(PG, "neutral")}:                                   {charNameTwo} ama studiare, e qui ha trovato il suo posto.
                    -> glyph_choice_manager(Mentor, airC)->
                {charTag(FifthCharacter, "bored")}:                         No!
                {charTag(FifthCharacter, "neutral")}:                       Questo è un posto spirituale.
                                                                            Di crescita, di esplorazione.
                {charTag(FifthCharacter, "bored")}:                         Non un laboratorio.
                                                                            Non il piccolo chimico.
                    
            + \ {charTag(PG, "neutral")}:                                   Giocare è comunque un modo per capire il mondo, {charNameFive}.
                    -> glyph_choice_manager(Mentor, earthC)->
                {charTag(FifthCharacter, "neutral")}:                       Ma un modo controllato, adatto per i bambini.
                                                                            Con meno violenza possibile.
                {charTag(FifthCharacter, "sad")}:                           Senza le cose terribili che ci circondano.
                                                                            Se non voglio vederle io a cinquant'anni, perché deve vederle un bimbo?
                
            + \ {charTag(PG, "neutral")}:                                   Alla sua età avevo anche io rabbia e paura. Si è bambini, non idioti.
                    -> glyph_choice_manager(Mentor, fireC)->
                {charTag(FifthCharacter, "bored")}:                         Non serve che usi quel linguaggio con me, {player_name}.
                {charTag(FifthCharacter, "neutral")}:                       E non sono d'accordo.
                                                                            Nemmeno a vent'anni puoi sapere davvero cosa vuoi.
                {
                    - are_two_entities_together(FirstCharacter, PG):
                        {charTag(FirstCharacter, "annoyed")}:               Ehm, confermo.     
                } 
                {charTag(FifthCharacter, "neutral")}:                       Cosa conta a questo mondo.
                                                                            Per questo i genitori ci sono.
                                                                            Per proteggerti.

            + \ {charTag(PG, "neutral")}:                                   Mi spiace che tu ti senta in colpa, {charNameFive}.
                    -> glyph_choice_manager(Mentor, waterC)->
                {charTag(FifthCharacter, "sad")}:                           Ma non hai detto che non ho sbagliato.
                {charTag(FifthCharacter, "sorry")}:                         Scusa, non è quello il tuo ruolo.
                                                                            Sennò non sarei io la mentore, ma tu.
                {charTag(FifthCharacter, "neutral")}:                       Spero che almeno lui prima o poi mi perdoni.
                    

            + \ {charTag(PG, "neutral")}:                                   Come si dice? Crescere unə figliə dovrebbe essere il lavoro di una comunità.
                    -> glyph_choice_manager(Mentor, aetherC)->
                {charTag(FifthCharacter, "neutral")}:                       Dovrebbe.
                                                                            Ma non è.
                                                                            E si dovrebbe ragionare con quello che si ha.
                                                                            Due persone.
                                                                            Con vite complesse.
                {charTag(FifthCharacter, "sad")}:                           E senza il diritto di sbagliare.
            -

        {charTag(FifthCharacter, "neutral")}:                               Forse mi sono concentrata sulla cosa sbagliata.
                                                                            Il problema non è quello che è accaduto.
        {charTag(FifthCharacter, "sorry")}:                                 Il problema è che mi sono fatta coinvolgere.
        {charTag(FifthCharacter, "neutral")}:                               Una mentore deve mantenere un certo distacco per guidarti.
                                                                            Non può essere emotiva.
        {charTag(FifthCharacter, "hurry")}:                                 Vado a riordinare in ordine di data i libri in biblioteca.

            -> mentor_closing_storylet ->
            -> main

    = five
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    
    
             

        {charTag(FifthCharacter, "sorry")}:                                 Mi sento più stanca del solito.
                                                                            E fa caldo.
        {charTag(FifthCharacter, "bored")}:                                 Ma l'idea di stendermi non mi piace.
                                                                            C'è molto da fare.
        {charTag(FifthCharacter, "hurry")}:                                 Eppure continuo a pensare a una cosa stupida.
                                                                            Al mio primo bacio.
        {
            - are_two_entities_together(FirstCharacter, PG):
            {charTag(FirstCharacter, "curious")}:                           Uuuuh, sono pronta per il thè, ama.
        } 
        {
            - are_two_entities_together(SecondCharacter, PG):
            {charTag(SecondCharacter, "angry")}:                            Bleah!
        }        
        {charTag(FifthCharacter, "neutral")}:                               Dall'uomo che poi ho sposato.
                                                                            E a cui ho dedicato il resto dei miei giorni.
                                                                            Fino a quando non sono arrivata qui.
        {charTag(FifthCharacter, "sad")}:                                   Già.
                                                                            Fino a quando non sono arrivata qui.
        {charTag(FifthCharacter, "neutral")}:                               {player_name}: secondo te cosa vuol dire amare un'altra persona?

            + \ {charTag(PG, "neutral")}:                                   Logico: progettare assieme, costruire fondamenta, accrescersi.
                    -> glyph_choice_manager(Mentor, airC)->
                {charTag(FifthCharacter, "neutral")}:                       Creare qualcosa che regga alla fine del desiderio.
                                                                            Quando il corpo perde il suo splendore.
                {charTag(FifthCharacter, "sad")}:                           E il letto è il luogo della stanchezza e della malattia.
                                                                            Quando invece di chiamarci "amore".
                                                                            Chiamiamo il nome dell'altro per sapere dove sono le chiavi della macchina.
                    
            + \ {charTag(PG, "neutral")}:                                   Un rifugio di stupore e gioia in un mondo grigio.
                    -> glyph_choice_manager(Mentor, earthC)->
                {charTag(FifthCharacter, "neutral")}:                       Mi piace la tua ingenuità {player_name}.
                                                                            Con questa logica ho amato solo una cosa:
                                                                            il mio giardino.
                                                                            Un posto sempre sorprendente, vivo.
                                                                            Pieno di musica.
                {charTag(FifthCharacter, "neutral")}:                       E forse è davvero così.
                    
            + \ {charTag(PG, "neutral")}:                                   Fondersi nella passione, a letto come in una protesta.
                    -> glyph_choice_manager(Mentor, fireC)->
                {charTag(FifthCharacter, "neutral")}:                       La passione si spegne, {player_name}.
                                                                            E a quel punto cosa rimane?
                                                                            Noia?
                {charTag(FifthCharacter, "sad")}:                           Rancore?
                {charTag(FifthCharacter, "bored")}:                         Odio?
                {charTag(FifthCharacter, "neutral")}:                       Passioni forti chiamano passioni ancora più forti.
                
            + \ {charTag(PG, "neutral")}:                                   Cura, ascolto, affetto.
                -> glyph_choice_manager(Mentor, waterC)->
                {charTag(FifthCharacter, "neutral")}:                       Già, ho pensato la stessa cosa a lungo.
                                                                            Ma a volte la cura diventa un lavoro.
                                                                            L'ascolto un dovere.
                                                                            L'affetto un'abitudine.
                                                                            Eppure resti.
                {charTag(FifthCharacter, "sad")}:                           Vuol dire che è finito l'amore?
                    
            + \ {charTag(PG, "neutral")}:                                   Raggiungersi l'anima a vicenda, ricercando il divino che è noi.
                -> glyph_choice_manager(Mentor, aetherC)->
                {charTag(FifthCharacter, "neutral")}:                       Una visione mistica.
                                                                            Forse blasfema.
                {charTag(FifthCharacter, "sad")}:                           Qualcosa che non ho mai conosciuto, se non nei romanzi.
                                                                            O nell'amicizia.
                {charTag(FifthCharacter, "neutral")}:                       E a volte, se resto in silenzio e ferma a lungo, in questo luogo.
            -
             ~ mentor_pauseTalking = mentor_pauseDuration
        
        {charTag(FifthCharacter, "sorry")}:                                 Perdonami: a volte sono solo una sciocca romantica.
                                                                            E mi dimentico che l'amore è ovunque.
                                                                            Anche qui.
                                                                            Soprattutto qui.
        {charTag(FifthCharacter, "hurry")}:                                 Amore per noi.
        {charTag(FifthCharacter, "neutral")}:                               Vado a recuperare del terriccio dal sottobosco, {player_name}.
                                                                            Parleremo più tardi.

            -> mentor_closing_storylet ->
            -> main
    
    
    = six
    
    //Non mettere cose TW qui
    
    // -> si parla esplicitamente di responsabilità personale (in antitesi anche con la visione del fungo)? Questa è una visione di RABBIA.

                 
        
        Non è che hai visto passare di qui una persona?
            + \ {charTag(PG, "neutral")}:            Dammi dettagli più concreti.
                    -> glyph_choice_manager(Mentor, airC)->
                
            + \ {charTag(PG, "neutral")}:            Sicuro che il violino ha bisogno di un tamburo per tornare.
                    -> glyph_choice_manager(Mentor, earthC)->
                
            + \ {charTag(PG, "neutral")}:            Seguiamo le sue tracce! Fiutiamo il suo odore.
                -> glyph_choice_manager(Mentor, fireC)->

                
            + \ {charTag(PG, "neutral")}:            Se ti senti sola, sono qui ad ascoltarti.
                -> glyph_choice_manager(Mentor, waterC)->
  
        
            + \ {charTag(PG, "neutral")}:            Tu sei sempre con ləi, ləi è sempre con te.
                -> glyph_choice_manager(Mentor, aetherC)->
 
            -

            -> mentor_closing_storylet ->
            -> main
    
    
    = seven
    
    //Non mettere cose TW qui
    
        //Presentazione.
                 
        
        Non è che hai visto passare di qui una persona?
            + \ {charTag(PG, "neutral")}:            Dammi dettagli più concreti.
                    -> glyph_choice_manager(Mentor, airC)->
                
            + \ {charTag(PG, "neutral")}:            Sicuro che il violino ha bisogno di un tamburo per tornare.
                    -> glyph_choice_manager(Mentor, earthC)->
                
            + \ {charTag(PG, "neutral")}:            Seguiamo le sue tracce! Fiutiamo il suo odore.
                -> glyph_choice_manager(Mentor, fireC)->

                
            + \ {charTag(PG, "neutral")}:            Se ti senti sola, sono qui ad ascoltarti.
                -> glyph_choice_manager(Mentor, waterC)->
  
                
            + \ {charTag(PG, "neutral")}:            Tu sei sempre con ləi, ləi è sempre con te.
                -> glyph_choice_manager(Mentor, aetherC)->
 
            -
            
            -> mentor_closing_storylet ->
            -> main        
            
            
    = eight
    
    
        //Presentazione.
                 
        
        Non è che hai visto passare di qui una persona?
            + \ {charTag(PG, "neutral")}:            Dammi dettagli più concreti.
                    -> glyph_choice_manager(Mentor, airC)->
                
            + \ {charTag(PG, "neutral")}:            Sicuro che il violino ha bisogno di un tamburo per tornare.
                    -> glyph_choice_manager(Mentor, earthC)->
                
            + \ {charTag(PG, "neutral")}:            Seguiamo le sue tracce! Fiutiamo il suo odore.
                -> glyph_choice_manager(Mentor, fireC)->

                
            + \ {charTag(PG, "neutral")}:            Se ti senti sola, sono qui ad ascoltarti.
                -> glyph_choice_manager(Mentor, waterC)->
  
                
            + \ {charTag(PG, "neutral")}:            Tu sei sempre con ləi, ləi è sempre con te.
                -> glyph_choice_manager(Mentor, aetherC)->
 
            -

            -> mentor_closing_storylet ->
            -> main    
    
    
    = nine
    
    
        //Presentazione.
                 
        
        Non è che hai visto passare di qui una persona?
            + \ {charTag(PG, "neutral")}:            Dammi dettagli più concreti.
                    -> glyph_choice_manager(Mentor, airC)->
                
            + \ {charTag(PG, "neutral")}:            Sicuro che il violino ha bisogno di un tamburo per tornare.
                    -> glyph_choice_manager(Mentor, earthC)->
                
            + \ {charTag(PG, "neutral")}:            Seguiamo le sue tracce! Fiutiamo il suo odore.
                -> glyph_choice_manager(Mentor, fireC)->

                
            + \ {charTag(PG, "neutral")}:            Se ti senti sola, sono qui ad ascoltarti.
                -> glyph_choice_manager(Mentor, waterC)->
  
                
            + \ {charTag(PG, "neutral")}:            Tu sei sempre con ləi, ləi è sempre con te.
                -> glyph_choice_manager(Mentor, aetherC)->
 
            -

            -> mentor_closing_storylet ->
            -> main    
    
    = ten
    
    
        //Presentazione.
                 
        
        Non è che hai visto passare di qui una persona?
            + \ {charTag(PG, "neutral")}:            Dammi dettagli più concreti.
                    -> glyph_choice_manager(Mentor, airC)->
                
            + \ {charTag(PG, "neutral")}:            Sicuro che il violino ha bisogno di un tamburo per tornare.
                    -> glyph_choice_manager(Mentor, earthC)->
                
            + \ {charTag(PG, "neutral")}:            Seguiamo le sue tracce! Fiutiamo il suo odore.
                -> glyph_choice_manager(Mentor, fireC)->

                
            + \ {charTag(PG, "neutral")}:            Se ti senti sola, sono qui ad ascoltarti.
                -> glyph_choice_manager(Mentor, waterC)->
  
                
            + \ {charTag(PG, "neutral")}:            Tu sei sempre con ləi, ləi è sempre con te.
                -> glyph_choice_manager(Mentor, aetherC)->
 
            -

            -> mentor_closing_storylet ->
            -> main    
    
    = eleven
    
    
        //Presentazione.
                 
        
        Non è che hai visto passare di qui una persona?
            + \ {charTag(PG, "neutral")}:            Dammi dettagli più concreti.
                    -> glyph_choice_manager(Mentor, airC)->
                
            + \ {charTag(PG, "neutral")}:            Sicuro che il violino ha bisogno di un tamburo per tornare.
                    -> glyph_choice_manager(Mentor, earthC)->
                
            + \ {charTag(PG, "neutral")}:            Seguiamo le sue tracce! Fiutiamo il suo odore.
                -> glyph_choice_manager(Mentor, fireC)->

                
            + \ {charTag(PG, "neutral")}:            Se ti senti sola, sono qui ad ascoltarti.
                -> glyph_choice_manager(Mentor, waterC)->
  
                
            + \ {charTag(PG, "neutral")}:            Tu sei sempre con ləi, ləi è sempre con te.
                -> glyph_choice_manager(Mentor, aetherC)->
 
            -

            -> mentor_closing_storylet ->
            -> main

    = twelve
    
    
        //Presentazione.
                 
        
        Non è che hai visto passare di qui una persona?
            + \ {charTag(PG, "neutral")}:            Dammi dettagli più concreti.
                    -> glyph_choice_manager(Mentor, airC)->
                
            + \ {charTag(PG, "neutral")}:            Sicuro che il violino ha bisogno di un tamburo per tornare.
                    -> glyph_choice_manager(Mentor, earthC)->
                
            + \ {charTag(PG, "neutral")}:            Seguiamo le sue tracce! Fiutiamo il suo odore.
                -> glyph_choice_manager(Mentor, fireC)->

                
            + \ {charTag(PG, "neutral")}:            Se ti senti sola, sono qui ad ascoltarti.
                -> glyph_choice_manager(Mentor, waterC)->
  
                
            + \ {charTag(PG, "neutral")}:            Tu sei sempre con ləi, ləi è sempre con te.
                -> glyph_choice_manager(Mentor, aetherC)->
 
            -

            -> mentor_closing_storylet ->
            -> main            
            
        