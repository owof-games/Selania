=== knowing_mentor_character

    = one
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    ~ mentor_storyletsForRewritingCount ++
       
        Ehi {player_name}!
        Stavo pensando a una cosa sciocca.
        Che forse non è giusto avere delle preferenze, ma la serra è il mio posto preferito.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        {
            - LIST_COUNT(greenhouse_backupCultivable) < 12:
                E immagino piaccia anche te, visto che hai già coltivato diverse piante.
            - else:
                Forse per te non è lo stesso, perché vedo che non hai coltivato molte piante.
        }
        C'è qualcosa nel vedere crescere piante, fiori, funghi che mi fa sentire appagata.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Non è solo l'odore della terra, o l'umidità nell'aria nei giorni più caldi.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Ma quella sensazione che con le tue mani puoi permettere a un altro corpo di crescere al meglio.
            {
                - are_two_entities_together(SecondCharacter, PG): 
                    Un po' come quando con le mie mani pasticcio con i fili elettrici!
                    
            }
            {
                - are_two_entities_together(FirstCharacter, PG): 
                    A me succede quando posso suonare.
                    E mente e corpo creano qualcosa di nuovo.
                        
            } 

            + [Preferisco la stazione dei treni, è ordinata e precisa.]
                    -> color_variation_management(Mentor, blueC)->
                Sì, ne capisco il fascino.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                A volte mi siedo lì e mi godo per qualche istante l'attesa.
                Il nulla che accade.
                Ma poi le mani fremono, mi supplicano di sistemare qualcosa.
                Fatico a stare tranquilla.
                
            + [Lo stagno è divertente, succede di tutto.]
                    -> color_variation_management(Mentor, yellowC)->
                Forse succede <i>di troppo</i>.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
                Non sembra pensare a nulla.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                L'acqua è lì e lascia che tutto accada, senza pensare al domani.
                
            + [La foresta domina: è lotta, è potenza!]
                    -> color_variation_management(Mentor, redC)->
                E disordinata, sporca.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
                Posso capirne il fascino, ma non è un luogo dove resto con piacere.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                    {
                        - firstChar_storyStatus == story_storyEnded or secondChar_storyStatus == story_storyEnded:
                            Però per lo meno ora porta alla biblioteca, che sto imparando ad apprezzare.
                            Anche se è estremamente incasinata.
                        
                        - else:
                            E quel tronco al centro non vuole saperne né di crescere né di morire.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
                            Una cosa davvero fastidiosa.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    }
                
            + [Un po' come prendersi cura delle persone qui.]
                    -> color_variation_management(Mentor, greenC)->
                Sì, anche se con meno pressioni.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Le persone a volte fanno cose che non ci aspettiamo.
                Un <i>Lichene degli abissi</i> con le giuste condizioni invece cresce sempre allo stesso modo.
  
            + [Invece sono felice che crescano a prescindere da me.]
                    -> color_variation_management(Mentor, purpleC)->
                Senza di te?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                Dobbiamo bagnare il terreno, prepararlo, seminare.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                Non ci sarebbe nulla senza il nostro lavoro.
                Non saprebbero resistere alle erbacce, al freddo.
                No, non sono d'accordo, scusa.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            -
        {
            - player_accessiblePlaces has Kitchen:
                Ma ora vorrei pensare un attimo a come rendere più carino l'accesso alla cucina.
            - else:
                Ma a proposito di questo posto: mi conviene dare una pulita all'acqua dello stagno.
        }#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Grazie per la chiacchierata, {player_name}.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        
             ~ mentor_pauseTalking = mentor_pauseDuration
            @animation:RewriterBook
 
            -> main
    
    = two
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    ~ mentor_storyletsForRewritingCount ++

        La storia di {charNameOne} mi ha colpita.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Così giovane.
        Così tante possibilità.
        Eppure invece di vedere la cosa come un vantaggio, si è ritrovata bloccata.
        Quando avevo la sua età...
        No, queste sono frasi da vecchia.
        E forse mi sono dimenticata di quanto possa essere facile perdere sé stesse quando si è giovani.
            {
                - are_two_entities_together(FirstCharacter, PG): 
                    Vuol dire che questa confusione prima o poi finisce?
                    Perché la cosa mi rincuora mooolto.
            }
        
            + [Numeri come l'età sono indicatori, non fatti assoluti.]
                    -> color_variation_management(Mentor, blueC)->
                Su questo hai ragione, {player_name}.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Eppure posso assicurarti che i miei cinquanta e rotti anni si portano addosso anche un bel po' di fatti scricchiolanti e ricordi.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                   
            + [Quando un gioco ha tantissime regole, smette di essere divertente.]
                    -> color_variation_management(Mentor, yellowC)->
                Eppure non sono così tante regole.
                Forse è solo una: non puoi avere tutto.
                Se vedi la vita come un gioco, ti aspetti di avere almeno un modo per vincere.
                Ma non credo proprio che funzioni così.
                Giochi, e il più delle volte perdi senza nemmeno sapere perché.    
                
            + [Nel dubbio si agisce. Fare male è meglio che non fare.]
                    -> color_variation_management(Mentor, redC)->
                Ma con questo principio, non c'è una azione mirata, consapevole.
                Poi succede che ci feriamo, o feriamo chi amiamo.
                E a quel punto non siamo nemmeno pronte a capire il perché.
                
            + [E tu sei molto ricettiva verso le altre persone.]
                    -> color_variation_management(Mentor, greenC)->
                Forse non <i>molto</i>.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                Ma indubbiamente quello che hanno da dire e quello che provano, conta.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Una mentore è una guida, ma per imparare a guidare deve capire chi ha dall'altra parte.
                Di cosa abbia bisogno.
                Dove voglia andare.
                
            + [Per vedere le cose in modo ampio, è importante perdersi.]
                    -> color_variation_management(Mentor, purpleC)->
                E in questo luogo in fondo arrivano solo persone che si sono perse.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                E che se ne vanno più serene.
                Avrebbero scoperto quella serenità, senza un po' di smarrimento?
                
            -

        Questo luogo continua a stupirmi.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Sei qui per aiutare le altre persone, e finisci per scoprire cose di te.
        Ma ora è il momeno di svuotare lo stagno dalle sue cose più schifose.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
            {
                - are_two_entities_together(SecondCharacter, PG): 
                    Non togliere i girini però!
                    
            } 
        Prega per me, {player_name}.
                
             ~ mentor_pauseTalking = mentor_pauseDuration
             @animation:RewriterBook
             
                -> main

    = three
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    ~ mentor_storyletsForRewritingCount ++
         
        A volte un po' mi pesa, tutto questo via vai.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
        Ci sono persone a cui mi sono affezionata che non rivedrò più.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Persone che ho aiutato e ora vorrei sentire più spesso.
        Ma poi le loro lettere non arrivano, o arrivano sempre meno.
        E allora mi chiedo se ho sbagliato qualcosa.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
        Non mi fraintendere: sono felice di quello che faccio, di quello che ho fatto.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        E per me è una gioia tenere tutto questo in piedi, giorno per giorno.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Ma a volte vorresti una conferma esplicita, sapere che stai facendo tutto quello che puoi fare.
        Che nessuno ce l'ha con te.

            + [Ogni lavoro ha la sua quota di sacrificio.]
                    -> color_variation_management(Mentor, blueC)->
                Vero.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Il valore di qualcosa viene da quanto ci è costata.
                E la maggior parte delle volte non paghiamo in denaro.
                
            + [Forse le volpi si mangiano le lettere!]
                    -> color_variation_management(Mentor, yellowC)->
                La fantasia è un modo piacevole di affrontare la realtà, {player_name}.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Ma alla lunga rende difficile capire cosa sia vero e cosa no.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                    
            + [Fregatene: il mondo è pieno di ingrati.]
                    -> color_variation_management(Mentor, redC)->
                No.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                Direi che il mondo è pieno di persone distratte.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Le cose da fare sono infinite, e finiamo per dimenticarci di chi non vediamo tutti i giorni.
                Non è ingratitudine, è una vita che scorre troppo veloce.
                
            + [Ti prometto che ti scriverò ogni giorno.]
                    -> color_variation_management(Mentor, greenC)->
                Oh, {player_pronouns has him: caro|{player_pronouns has her: cara|carə}}, è una bella promessa.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Una promessa che ho sentito decine di volte.
                    
            + [Esiste un confine tra {mentorName} e questo luogo?]
                    -> color_variation_management(Mentor, purpleC)->
                A volte mi sento <i>solo</i> questo luogo.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Non mi chiedo spesso se andarmene o meno.
                O dove.
 
            -
            Ma basta con questo spirito malinconico!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            Mi sono appena ricordata che ci sono delle erbacce fastidiose dietro la serra.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            Devo inventarmi un modo per liberarmene!
                {
                    - are_two_entities_together(SecondCharacter, PG):
                            Chissà se {charNameOne} mi manderà una lettera!
                        
                }
                {
                    - are_two_entities_together(FirstCharacter, PG):
                            Quindi {charNameTwo} mi manderà una lettera?
                        
                } 
                ~ mentor_pauseTalking = mentor_pauseDuration
                @animation:RewriterBook
                            
                    -> main
    
    = four
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)

    ~ mentor_storyletsForRewritingCount ++

        Mi sto chiedendo se non sia stata troppo dura col piccolo {charNameTwo} appena arrivato qui.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry 
        Ero sinceramente spaventata, ma forse ho reagito con violenza.
        Ma questo non è un luogo per un bimbo.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Anzi: questo è un luogo dove non dovrebbe <b>mai</b> arrivare un bimbo.
        Ti immagini cosa possa significare essere un genitore e renderti conto che tuo figlio, così piccolo, ha già perso la strada?
        Che già non sappia più cosa fare del suo futuro?
        Che cosa terribile per entrambi.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
        E tutta quella responsabilità.
        Quella paura per il futuro e per l'ambiente.
        Non dovrebbe pensare al pallone, a giocare con gli amici, a studiare?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        
            + [{charNameTwo} ama studiare, e qui ha trovato il suo posto.]
                    -> color_variation_management(Mentor, blueC)->
                No!#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
                Questo è un posto spirituale.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Di crescita, di esplorazione.
                Non un laboratorio.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
                Non il piccolo chimico.
                    
            + [Giocare è comunque un modo per capire il mondo, {mentorName}.]
                    -> color_variation_management(Mentor, yellowC)->
                Ma un modo controllato, adatto per i bambini.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Con meno violenza possibile.
                Senza le cose terribili che ci circondano.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                Se non voglio vederle io a cinquant'anni, perché deve vederle un bimbo?
                
            + [Alla sua età avevo anche io rabbia e paura. Si è bambini, non idioti.]
                    -> color_variation_management(Mentor, redC)->
                Non serve che usi quel linguaggio con me, {player_name}.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
                E non sono d'accordo.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Nemmeno a vent'anni puoi sapere davvero cosa vuoi.
                    {
                        - are_two_entities_together(FirstCharacter, PG):
                           Ehm, confermo.     
                    } 
                Cosa conta a questo mondo.
                Per questo i genitori ci sono.
                Per proteggerti.

            + [Mi spiace che tu ti senta in colpa, {mentorName}.]
                    -> color_variation_management(Mentor, greenC)->
                Ma non hai detto che non ho sbagliato.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                Scusa, non è quello il tuo ruolo.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
                Sennò non sarei io la mentore, ma tu.
                Spero che almeno lui prima o poi mi perdoni.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    

            + [Il genitore dovrebbe essere il lavoro di una comunità.]
                    -> color_variation_management(Mentor, purpleC)->
                Dovrebbe.
                Ma non è.
                E si dovrebbe ragionare con quello che si ha.
                Due persone.
                Con vite complesse.
                E senza il diritto di sbagliare.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
            -
        
        Forse mi sono concentrata sulla cosa sbagliata.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Il problema non è quello che è accaduto.
        Il problema è che mi sono fatta coinvolgere.
        Una mentore deve mantenere un certo distacco per guidarti.
        Non può essere emotiva.
        Vado a riordinare in ordine di data i libri in biblioteca.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
    
             ~ mentor_pauseTalking = mentor_pauseDuration
             @animation:RewriterBook
             
            -> main
    = five
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    
    ~ mentor_storyletsForRewritingCount ++

        Mi sento più stanca del solito.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
        E fa caldo.
        Ma l'idea di stendermi non mi piace.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
        C'è molto da fare.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
            {
                - are_two_entities_together(PG, Bench):
                    Però quella panchina mi ricorda un'altra panchina, sai?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                - else:
                    Però stavo pensando alla panchina, quella della foresta, che mi ricorda un'altra panchina.    
            }
        Dove in un'altra vita ho ricevuto il mio primo bacio.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
            {
                - are_two_entities_together(FirstCharacter, PG):
                    Uuuuh, gossip!     
            } 
            {
                - are_two_entities_together(FirstCharacter, PG):
                    Bleah!  
            }        
        Dall'uomo che poi ho sposato.
        E a cui ho dedicato il resto dei miei giorni.
        Fino a quando non sono arrivata qui.
        Già.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
        Fino a quando non sono arrivata qui.
        {player_name}: secondo te cosa vuol dire amare un'altra persona?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral

            + [Logico: progettare assieme, costruire fondamenta, accrescersi.]
                    -> color_variation_management(Mentor, blueC)->
                Creare qualcosa che regga alla fine del desiderio.
                Quando il corpo perde il suo splendore.
                E il letto è il luogo della stanchezza e della malattia.
                Quando invece di chiamarci "amore".
                Chiamiamo il nome dell'altro per sapere dove sono le chiavi della macchina.
                    
            + [Un rifugio di stupore e gioia in un mondo grigio.]
                    -> color_variation_management(Mentor, yellowC)->
                Mi piace la tua ingenuità {player_name}.
                Con questa logica ho amato solo una cosa:
                il mio giardino.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
                Un posto sempre sorprendente, vivo.
                Pieno di musica.
                E forse è davvero così.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                    
            + [Fondersi nella passione, a letto come in una protesta.]
                    -> color_variation_management(Mentor, redC)->
                La passione si spegne, {player_name}.
                E a quel punto cosa rimane?
                Noia?
                Rancore?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                Odio?#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)}#ewWord:{em_state(Influenced)} #portrait:mentore_bored
                Passioni forti chiamano passioni ancora più forti.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                
            + [Cura, ascolto, affetto.]
                -> color_variation_management(Mentor, greenC)->
                Già, ho pensato la stessa cosa a lungo.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
                Ma a volte la cura diventa un lavoro.
                L'ascolto un dovere.
                L'affetto un'abitudine.
                Eppure resti.
                Vuol dire che è finito l'amore?
                    
            + [Raggiungersi l'anima a vicenda, ricercando il divino che è noi.]
                -> color_variation_management(Mentor, purpleC)->
                Una visione mistica.
                Forse blasfema.
                Qualcosa che non ho mai conosciuto, se non nei romanzi.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sad
                O nell'amicizia.
                E a volte, se resto in silenzio e ferma a lungo, in questo luogo.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
            -
             ~ mentor_pauseTalking = mentor_pauseDuration
        
        Perdonami: a volte sono solo una sciocca romantica.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_sorry
        E mi dimentico che l'amore è ovunque.
        Anche qui.
        Soprattutto qui.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_hurry
        Amore per noi.
        Vado a recuperare del terriccio dal sottobosco, {player_name}.#speaker:{mentor_tag()} #inkA:{ink_tag_a(fifthChar_InkLevel)}#inkB:{ink_tag_b(fifthChar_InkLevel)} #inkC:{ink_tag_c(fifthChar_InkLevel)} #inkD:{ink_tag_d(fifthChar_InkLevel)} #ewWord:{em_state(Influenced)} #portrait:mentore_neutral
        Parleremo più tardi.
        
        ~ mentor_pauseTalking = mentor_pauseDuration
        @animation:RewriterBook
        
            -> main
    
    
    = six
    ~ temp mentorName = translator(mentor_ActualName)
    //Non mettere cose TW qui
    
    // -> si parla esplicitamente di responsabilità personale (in antitesi anche con la visione del fungo)? Questa è una visione di RABBIA.

        ~ mentor_storyletsForRewritingCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    -> color_variation_management(Mentor, blueC)->
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    -> color_variation_management(Mentor, yellowC)->
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                -> color_variation_management(Mentor, redC)->

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                -> color_variation_management(Mentor, greenC)->
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                -> color_variation_management(Mentor, purpleC)->
 
            -
            //Qui potrebbe aver senso ridurre i tempi di attesa tra un dialogo e l'altro.
             ~  mentor_pauseDuration = 5
             ~ mentor_pauseTalking = mentor_pauseDuration
            -> main
    = seven
    ~ temp mentorName = translator(mentor_ActualName)
    //Non mettere cose TW qui
    
        //Presentazione.
        ~ mentor_storyletsForRewritingCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    -> color_variation_management(Mentor, blueC)->
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    -> color_variation_management(Mentor, yellowC)->
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                -> color_variation_management(Mentor, redC)->

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                -> color_variation_management(Mentor, greenC)->
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                -> color_variation_management(Mentor, purpleC)->
 
            -
             ~ mentor_pauseTalking = mentor_pauseDuration
            -> main        
            
            
    = eight
    ~ temp mentorName = translator(mentor_ActualName)
    
        //Presentazione.
        ~ mentor_storyletsForRewritingCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    -> color_variation_management(Mentor, blueC)->
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    -> color_variation_management(Mentor, yellowC)->
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                -> color_variation_management(Mentor, redC)->

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                -> color_variation_management(Mentor, greenC)->
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                -> color_variation_management(Mentor, purpleC)->
 
            -
             ~ mentor_pauseTalking = mentor_pauseDuration
            -> main    
    
    
    = nine
    ~ temp mentorName = translator(mentor_ActualName)
    
        //Presentazione.
        ~ mentor_storyletsForRewritingCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    -> color_variation_management(Mentor, blueC)->
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    -> color_variation_management(Mentor, yellowC)->
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                -> color_variation_management(Mentor, redC)->

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                -> color_variation_management(Mentor, greenC)->
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                -> color_variation_management(Mentor, purpleC)->
 
            -
             ~ mentor_pauseTalking = mentor_pauseDuration
            -> main    
    
    = ten
    ~ temp mentorName = translator(mentor_ActualName)
    
        //Presentazione.
        ~ mentor_storyletsForRewritingCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    -> color_variation_management(Mentor, blueC)->
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    -> color_variation_management(Mentor, yellowC)->
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                -> color_variation_management(Mentor, redC)->

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                -> color_variation_management(Mentor, greenC)->
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                -> color_variation_management(Mentor, purpleC)->
 
            -
             ~ mentor_pauseTalking = mentor_pauseDuration
            -> main    
    
    = eleven
    ~ temp mentorName = translator(mentor_ActualName)
    
        //Presentazione.
        ~ mentor_storyletsForRewritingCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    -> color_variation_management(Mentor, blueC)->
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    -> color_variation_management(Mentor, yellowC)->
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                -> color_variation_management(Mentor, redC)->

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                -> color_variation_management(Mentor, greenC)->
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                -> color_variation_management(Mentor, purpleC)->
 
            -
             ~ mentor_pauseTalking = mentor_pauseDuration
            -> main    
    = twelve
    ~ temp mentorName = translator(mentor_ActualName)
    
        //Presentazione.
        ~ mentor_storyletsForRewritingCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    -> color_variation_management(Mentor, blueC)->
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    -> color_variation_management(Mentor, yellowC)->
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                -> color_variation_management(Mentor, redC)->

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                -> color_variation_management(Mentor, greenC)->
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                -> color_variation_management(Mentor, purpleC)->
 
            -
             ~ mentor_pauseTalking = mentor_pauseDuration
            -> main            
            
        