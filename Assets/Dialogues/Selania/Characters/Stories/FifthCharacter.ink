=== fifth_character ===
~ temp charNameFive = translator(fifthCharacterState)

//SPAZIO PER VERIFICARE SE STORIA IN CORSO O CONCLUSA
        //Chiacchiera normale
        + {are_two_entities_together(Mentor, PG)}[Mentor]
            -> talk_with_mentor
        
        //Chiacchiera a fine storia
        + {are_two_entities_together(Mentor, PG) && fifthStory == Ended} [Mentor]
            -> fifth_char_story_ended
        + ->
    
        -> DONE
    
=== talk_with_mentor
~ temp charNameOne = translator(firstCharacterState)
~ temp charNameTwo = translator(secondCharacterState)
~ temp charNameThree = translator(thirdCharacterState)
~ temp charNameFour= translator(fourthCharacterState)
~ temp charNameFive = translator(fifthCharacterState)

    -> mentor_and_first_char_storylets
    //-> mentor_and_second_char_storylets
    //-> fifth_character_storylets

    = talk
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    Come posso esserti utile, {pronouns has him: amico mio|{pronouns has her: amica mia|amicə miə}}?#speaker:{fifthChar_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState
    
        + [Avrei bisogno di una mano.]
            -> support
        
        + {somethingStrange > 0 or (firstCharacterInkLevel has High && not little_storylets.infoImpo)}[Mi è successa una cosa strana.]
            -> little_storylets
            
        + {knowing_second_character && fifthPauseTalking == 0}[Vorrei conoscerti meglio.]
            // {
            //     - fifthPauseTalking == 0:
                    -> talk_with_fifth_character
                
            //     - else:
            //         {~ Ora non mi va, ma non mi chiedi aiuto da un po', tutto ok?|Ho bisogno di una pausa, ma se serve aiuto sono qui.|Devo decidere cosa sistemare poi, ma se ti serve aiuto invece, chiedi pure.}
            //         -> talk_with_mentor
            // }
            
        + [Ho cambiato idea.]
            -> main
        -
-> main

=== talk_with_fifth_character ===
~ temp charNameFive = translator(fifthCharacterState)
<i>C'è qualcosa che ti frulla nella testa.</i>

            + [Ti va di raccontarmi qualcosa di te?]
                -> knowing_fifth_character
                
            //Per la mentore: dono solo dopo la fine della quarta storia, per questo metto un knot come differenziatore.
            + {knowing_fifth_character.seven && findedGifts != () && fourthStory == Ended} [Ti vorrei donare questa cosa.]
                    -> second_story_gift
        
            //Dono fatto ma non ho avviato la main story
            + {fifth_story_gift.ink_outcome && not main_story_fifth_character} [Ti va di riscrivere la tua storia con me?]
                    -> fifth_story_chech_trigger
    
            //SE ESCO DALLA MAIN STORY E VOGLIO TORNARCI CLICCO QUI. POI Lì DENTRO IN BASE AGLI STEP IN CUI SIAMO, MI MANDERà AL POSTO GIUSTO            
            + {fifth_story_gift.ink_outcome && main_story_fifth_character} [Riprendiamo quella storia?]
                -> main_story_fifth_character
            
            + [Lascio il dialogo.]
                -> main
            -
                -> talk_with_fifth_character




=== knowing_fifth_character
~ temp charNameFive = translator(fifthCharacterState)
    //Qui man mano faccio avanzare i temi toccati dalla personaggia
        {
            - not one:
                -> one
            - not two && firstStory == Ended:
                -> two
            - not three && firstStory == Ended:
                -> three
            - not four && secondStory == Ended:
                -> four
            - not five && secondStory == Ended:
                -> five
            //Forse solo una di queste, perché con la terza storia avremo degli storylets ad hoc.    
            - not six && thirdStory == Ended:
                -> six
            //Metà delle storie della mentore sono disponibili sostanzialmente da subito, le altre dopo che le condizioni per attivare la storia a tutti gli effetti sono state raggiunte.      
            - not seven && fifthStory == Active:
                -> seven
            - not eight && fifthStory == Active:
                -> eight
            - not nine && fifthStory == Active:
                -> nine
            - not ten && fifthStory == Active:
                -> ten
            - not eleven && fifthStory == Active:
                -> eleven
            - not twelve && fifthStory == Active:
                -> twelve
            - else:
                -> fifth_character_opinions
        }

    = one
    ~ temp charNameFive = translator(fifthCharacterState)
        ~ fifthStoryQuestCount ++
        //Amore per il giardinaggio e la possibilità, per la giocatrice, di esprimere qualcosa che poi si potrebbe avvicinare ai possibili finali.
        Non è giusto avere delle preferenze, ma la serra è il mio posto preferito.#speaker:{fifthChar_tag()} 
        C'è qualcosa nel vedere crescere piante, fiori, funghi che mi fa sentire appagata.
        Non è solo l'odore della terra, o l'umidità nell'aria nei giorni più caldi.
        Ma quella sensazione che con le tue mani puoi permettere a un altro corpo di crescere al meglio.

            + (fiveBlue) [Preferisco la stazione dei treni, è ordinata, precisa.]
                    ~ fifthBlue ++
                Sì, ne capisco il fascino.
                A volte mi siedo lì e mi godo per qualche istante l'attesa.
                Il nulla che accade.
                Ma poi le mani fremono, mi supplicano di sistemare qualcosa fuori posto.
                
            + (fiveYellow) [Lo stagno è divertente, succede di tutto.]
                    ~ fifthYellow ++
                Forse succede <i>di troppo</i>.
                Non sembra pensare a nulla.
                L'acqua è lì e lascia che tutto accada, senza pensare al domani.
                
            + (fiveRed) [La foresta domina: è lotta, è potenza!]
                    ~ fifthRed ++
                E disordinata, sporca.
                Posso capirne il fascino, ma non è un luogo dove resto con piacere.
                E quel tronco al centro non vuole saperne né di crescere né di morire.
                Una cosa davvero fastidiosa.
                    
                
            + (fiveGreen) [Un po' come prendersi cura delle persone, qui.]
                    ~ fifthGreen ++
                Sì, anche se con meno aspettative.
                Le persone a volte fanno cose che non ci aspettiamo.
                Un <i>Lichene degli abissi</i> con le giuste condizioni cresce sempre allo stesso modo.
  
            + (fivePurple) [Invece sono felice che crescano a prescidere da me.]
                    ~ fifthPurple ++
                Senza di te? Dobbiamo bagnare il terreno, prepararlo, seminare.
                Non ci sarebbe nulla senza il nostro lavoro.
                Non saprebbero resistere alle erbacce, al freddo.
                No, non sono d'accordo, scusa.
                    
 
            -
        {firstStory hasnt Ended: Ma a proposito di questo posto: devo ancora capire come sgomberare quell'ammasso di mobili rotti che blocca il sentiero a ovest della foresta.|Ma a proposito di questo posto: devo ancora liberare il sentiero da quei fiori enormi vicino alla serra.}
        È arrivato il momento di capire dove possa portare.
        Grazie per la chiacchierata, {name}.
             ~ fifthPauseTalking = fifthCharPauseDuration
            -> main
    
    = two
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    ~ change_entity_place(SecondCharacter)
    ~ fifthStoryQuestCount ++
        
        //Partendo dalla prima personaggia, dipendenza dai rapporti (circa)
        La storia di {charNameOne} mi ha colpita.#speaker:{fifthChar_tag()} 
        {are_two_entities_together(FirstCharacter, PG): {charNameOne}: E {charNameOne} di sicuro non vuole sentire le tue opinioni in merito.}
            ~ change_entity_place(FirstCharacter)
        Non tanto il suo blocco, quello è una cosa comune a quell'età.#speaker:{fifthChar_tag()} 
        Quanto invece fosse consapevole delle opinioni di tutte le persone care.
        Senza però perdere sé stessa.
        Questa è una cosa difficile anche alla mia età.
        
            + [I numeri sono indicatori, non fatti assoluti.]
                    ~ fifthBlue ++
                Su questo hai ragione, {name}.
                Eppure posso assicurarti che i miei cinquanta e rotti anni si portano addosso anche un bel po' di fatti scricchiolanti e ricordi.
                   
                
            + [{charNameOne} sapeva ridere, giocare, e questo l'ha resa libera.]
                    ~ fifthYellow ++
                E la libertà può farti perdere ancora di più.
                A volte non c'è maggiore libertà di essere stabili e felici nel proprio ruolo.
                
                
            + [Non c'è vera azione senza consapevolezza.]
                    ~ fifthRed ++
                Allora la maggior parte di noi non agisce mai veramente.
                Eppure riusciamo a farci del male, e a farci del bene.
                Qualcosa deve sempre cambiare.

                
            + [E tu sei molto ricettiva verso le altre persone.]
                    ~ fifthGreen ++
                Forse non <i>molto</i>.
                Ma indubbiamente quello che hanno da dire e quello che provano, conta.
                Una mentore è una guida, ma per imparare a guidare deve capire chi ha dall'altra parte.
                Di cosa abbia bisogno.
                Dove voglia andare.
                
                
            + [Ci sono momenti in cui è necessario anche perdersi.]
                    ~ fifthPurple ++
                E in questo luogo in fondo arrivano solo persone che si sono perse.
                E che se ne vanno più serene.
                Avrebbero scoperto quella serenità, senza un po' di smarrimento?
                
            -
        Questo luogo continua a stupirmi.
        Sei qui per aiutare le altre persone, e finisci per scoprire cose di te.
        Ma ora è il momeno di svuotare lo stagno dalle sue cose più schifose.
        Prega per me, {name}.
             ~ fifthPauseTalking = fifthCharPauseDuration
                -> main


    
    = three
    ~ temp charNameFive = translator(fifthCharacterState)
        //Questo è un riferimento indiretto anche ai figli che ora non la chiamano molto.
        ~ fifthStoryQuestCount ++
         
        A volte un po' mi pesa, tutto questo via vai.#speaker:{fifthChar_tag()} 
        Ci sono persone a cui mi sono affezionata, che non rivedrò più.
        Persone che ho aiutato e ora vorrei sentire più spesso.
        Ma poi le loro lettere non arrivano, o arrivano sempre meno.
        E allora mi chiedo se ho sbagliato qualcosa.
        Non mi fraintendere: sono felice di quello che faccio, di quello che ho fatto.
        E per me è una gioia tenere tutto questo in piedi, giorno per giorno.

            + [Ogni lavoro ha la sua quota di sacrificio.]
                Vero.
                Il valore di qualcosa viene da quanto ci è costata.
                E la maggior parte delle volte non paghiamo in denaro.
                    ~ fifthBlue ++
                
            + [Forse le volpi si mangiano le lettere!]
                La fantasia è un modo piacevole di affrontare la realtà, {name}.
                Ma alla lunga rende difficile capire cosa sia vero e cosa no.
                    ~ fifthYellow ++
                
            + [Il mondo è pieno di ingrati.]
                No.
                Direi che il mondo è pieno di persone distratte.
                Le cose da fare sono infinite, e finiamo per dimenticarci di chi non vediamo tutti i giorni.
                Non è ingratitudine, è una vita che scorre troppo veloce.
                    ~ fifthRed ++

                
            + [Ti prometto che ti scriverò ogni giorno.]
                Oh, {pronouns has him: caro|{pronouns has her: cara|carə}}, è una bella promessa.
                Una promessa che ho sentito decine di volte.
                    ~ fifthGreen ++
  
                
            + [Esiste un confine tra {charNameFive} e questo luogo?]
                A volte mi sento <i>solo</i> questo luogo.
                Non mi chiedo spesso se andarmene o meno.
                O dove.
                    ~ fifthPurple ++
 
            -
            Ma basta con questo spirito malinconico!
            Mi sono appena ricordata che ci sono delle erbacce fastidiose sotto la poltrona della biblioteca,
            Devo inventarmi un modo per liberarmene!
                ~ fifthPauseTalking = fifthCharPauseDuration
                    -> main
    
    
    
    
    = four
    ~ temp charNameFive = translator(fifthCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ change_entity_place(SecondCharacter)
        //Responsabilità
        ~ fifthStoryQuestCount ++
        Mi sto chiedendo se non sia stata troppo dura col piccolo {charNameTwo} appena arrivato qui.#speaker:{fifthChar_tag()} 
        Ero sinceramente spaventata, ma forse ho reagito con violenza.
        Ma questo non è un luogo per un bimbo.
        Ti immagini cosa significhi essere un genitore, e renderti conto che tuo figlio, così piccolo, ha già perso la strada?
        Che già non sappia più cosa fare del suo futuro?
        Che cosa terribile per entrambi.
        E tutta quella responsabilità.
        Quella paura per il futuro e per l'ambiente.
        Non dovrebbe pensare al pallone, a giocare con gli amici, a studiare?
        
            + [{charNameTwo} ama studiare, e infatti questo è il posto per lui.]
                No!
                Questo è un posto spirituale.
                Di crescita, di esplorazione.
                Non un laboratorio.
                Non il piccolo chimico.
                    ~ fifthBlue ++
                
            + [Giocare è comunque un modo per capire il mondo, {charNameFive}.]
                Ma un modo controllato, adatto per i bambini.
                Con meno violenza possibile.
                Senza le cose terribili che ci circondano.
                Se non voglio vederle io a cinquant'anni, perché deve vederle un bimbo?
                    ~ fifthYellow ++
                
            + [Alla sua età avevo anche io idee e paure. Si è bambini, non idioti.]
                Non serve che usi quel linguaggio con me, {name}.
                E non sono d'accordo.
                Nemmeno a vent'anni puoi sapere davvero cosa vuoi.
                Cosa conta a questo mondo.
                Per questo i genitori ci sono.
                Per proteggerti.
                    ~ fifthRed ++

            + [Mi spiace che tu ti senta in colpa.]
                Ma non hai detto che non ho sbagliato.
                Scusa, non è quello il tuo ruolo.
                Sennò non sarei io la mentore, ma tu.
                Spero che almeno lui prima o poi mi perdoni.
                    ~ fifthGreen ++
  
            + [Il genitore dovrebbe essere il lavoro di una comunità.]
                Non dire castronerie, {name}.
                Si fa così dai tempi dei tempi, due persone.
                Una se manca.
                Però dovrebbero avere il diritto di sbagliare.
                    ~ fifthPurple ++
            -
        
        Forse mi sono concentrata sulla cosa sbagliata.
        Il problema non è quello che è accaduto.
        Il problema è che mi sono fatta coinvolgere.
        Una mentore deve mantenere un certo distacco per guidarti.
        Non può essere emotiva.
        Vado a riordinare in ordine di data i libri in biblioteca.
        
             ~ fifthPauseTalking = fifthCharPauseDuration
            -> main
    = five
    ~ temp charNameFive = translator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        Mi sento più stanca del solito.#speaker:{fifthChar_tag()} 
        E fa caldo.
        Ma l'idea di stendermi sotto quell'albero non mi piace.
        E c'è molto da fare.
        Però quella panchina mi ricorda un'altra panchina, sai?
        Dove in un'altra vita ho ricevuto il mio primo bacio.
        Dall'uomo che poi ho sposato.
        E a cui ho dedicato il resto dei miei giorni.
        Fino a quando non sono arrivata qui.
        Già.
        Fino a quando non sono arrivata qui.
        {name}: secondo te cosa vuol dire amare un'altra persona?

            + [Progettare assieme, costruire fondamenta, accrescersi.]
                Già.
                Creare qualcosa che regga alla fine del desiderio.
                Quando il corpo perde il suo splendore.
                E il letto è il luogo della stanchezza e della malattia.
                Quando invece di chiamarci "amore".
                Ci chiediamo dove sono le chiavi della macchina.
                    ~ fifthBlue ++
                
            + [Un rifugio di stupore e gioia in un mondo grigio.]
                Mi piace la tua ingenuità {name}.
                Con questa logica ho amato solo una cosa:
                il mio giardino.
                Un posto sempre sorprendente, vivo.
                Pieno di musica.
                E forse è davvero così.
                    ~ fifthYellow ++
                
            + [Fondersi nella passione, a letto come in una protesta.]
                La passione si spegne, {name}.
                E a quel punto cosa rimane?
                Noia?
                Rancore?
                Odio?
                Passioni forti chiamano passioni ancora più forti.
                    ~ fifthRed ++

                
            + [Cura, ascolto, affetto.]
                Già, ho pensato la stessa cosa a lungo.
                Ma a volte la cura diventa un lavoro.
                L'ascolto un dovere.
                L'affetto un'abitudine.
                Eppure resti.
                Vuol dire che è finito l'amore?
                    ~ fifthGreen ++
  
                
            + [Raggiungersi l'anima a vicenda, ricercando il divino che è noi.]
                Una visione mistica.
                Forse blasfema.
                Qualcosa che non ho mai conosciuto, se non nei romanzi.
                O nell'amicizia.
                E a volte, se resto in silenzio e ferma a lungo, in questo luogo.
                
                    ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDuration
        
        A volte sono solo una sciocca romantica.
        E mi dimentico che l'amore è ovunque.
        Anche qui.
        Soprattutto qui.
        Amore per noi.
        Vado a recuperare del terriccio dal sottobosco, {name}.
        Parleremo più tardi.
        ~ fifthPauseTalking = fifthCharPauseDuration
            -> main
    
    
    = six
    ~ temp charNameFive = translator(fifthCharacterState)
    
    // -> si parla esplicitamente di responsabilità personale (in antitesi anche con la visione del fungo)? Questa è una visione di RABBIA.

        ~ fifthStoryQuestCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fifthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fifthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fifthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fifthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fifthPurple ++
 
            -
            //Qui potrebbe aver senso ridurre i tempi di attesa tra un dialogo e l'altro.
             ~  fifthCharPauseDuration = 5
             ~ fifthPauseTalking = fifthCharPauseDuration
            -> main
    = seven
    ~ temp charNameFive = translator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fifthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fifthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fifthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fifthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDuration
            -> main        
            
            
    = eight
    ~ temp charNameFive = translator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fifthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fifthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fifthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fifthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDuration
            -> main    
    
    
    = nine
    ~ temp charNameFive = translator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fifthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fifthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fifthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fifthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDuration
            -> main    
    
    = ten
    ~ temp charNameFive = translator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fifthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fifthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fifthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fifthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDuration
            -> main    
    
    = eleven
    ~ temp charNameFive = translator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fifthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fifthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fifthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fifthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDuration
            -> main    
    = twelve
    ~ temp charNameFive = translator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        Non è che hai visto passare di qui una persona?
            + [Dammi dettagli più concreti.]
                    ~ fifthBlue ++
                
            + [Sicuro che il violino ha bisogno di un tamburo per tornare.]
                    ~ fifthYellow ++
                
            + [Seguiamo le sue tracce! Fiutiamo il suo odore.]
                ~ fifthRed ++

                
            + [Se ti senti sola, sono qui ad ascoltarti.]
                ~ fifthGreen ++
  
                
            + [Tu sei sempre con ləi, ləi è sempre con te.]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDuration
            -> main            
            
            



        


=== fifth_story_gift ===
~ temp charNameFive = translator(fifthCharacterState)
<i> Stai per donare qualcosa a {charNameFive}.</i> #speaker:{fungus_tag()}
        + {findedGifts != ()} [Scelgo il dono.]
            ~ currentReceiver += Mentor
            -> inventory_management -> ink_outcome 
        + {findedGifts == ()} <i> Il tuo inventario è vuoto.</i>
            ->main
        
    
        = ink_outcome    
            <i>Dopo il tuo dono {inkTranslator(secondCharacterInkLevel)}.
                 -> talk_with_fifth_character
            //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco

=== fifth_story_chech_trigger
      ~ temp charNameFive = translator(fifthCharacterState)
      //In questa storia non ci sono trigger, lascio la struttura perché non si sa mai.
      
        //{
        //- loneliness == false:
        //    -> loneliness_trigger
        //- else:
        //    -> main_story_first_character
        //}
            -> main_story_fifth_character
        
        = loneliness_trigger
        Info
            * [Voglio comunque approfondire la storia di questa personaggia.]
                -> main_story_fifth_character
            * [Salto.]
            //FUTURA SOLUZIONE A QUESTA SITUAZIONE
                -> main
        -
        -> END

=== main_story_fifth_character
~ temp charNameFive = translator(fifthCharacterState)
//Così se decido di uscire dalla conversazione, posso riprendere da dove eravamo rimaste.
    {
        - not confession:
            -> confession
        - not one:
            -> statement
        - else:
            -> one
    }
    = confession
    ~ temp charNameFive = translator(fifthCharacterState)
        Ho realizzato una cosa, una cosa su noi due.
            -> secondAffinityCalc ->
        {
        - firstPurple && firstYellow > firstBlue: Sento ancora la mancanza di Talco, ma con te mi sento come se fossimo parte da sempre della stessa band.
        <i>{charNameFive} vede {name} come una persona amica e fidata.</i>
        
        -firstPurple or firstYellow > firstBlue:Ci sono momenti in cui cantiamo all'unisono, ed è bello. Mi sento ascoltata.
        
        <i>{charNameFive} si trova bene con {name}.</i>
        
        - firstPurple && firstYellow < firstBlue: Facciamo parte di due cori diversi, vero? Non credo tu abbia preso una sola delle mie note.
        
        <i>{charNameFive} non si è sentita capita da {name}.</i>
        
        
        - else: A volte siamo sullo stesso brano, altre no. E non ho ancora capito chi tra noi stia ignorando l'altra parte.
        
        <i>{charNameFive} non riesce a capire che rapporto sta costruendo con {name}.</i>
        
        }
        E credo di aver capito perché il mio nome
            
            + [Credo di sapere come aiutarti.]
                -> statement
            + [Capisco il tuo dolore, ma ho bisogno di riflettere un attimo.]
                -> main


    = statement
    ~ temp charNameFive = translator(fifthCharacterState)
        <i>A seguito del rapporto che {name} ha creato con {charNameFive} {firstPurple && firstYellow > firstBlue: l'inchiostro è aumentato di due unità.|{firstPurple or firstYellow > firstBlue: l'inchiostro è aumentato di una unità|l'inchiostro non ha subito variazioni}}.</i>
        //Sopra ho già aggiornato il livello di inchiostro e quindi di affinità.
            ~ inkLevel(secondCharacterInkLevel)
        + [Voglio cominciare la riscrittura.]
            -> secondNaming -> 
            -> one
        + [Preferisco prendermi del tempo.]
            -> main

    = one
    ~ temp charNameFive = translator(fifthCharacterState)
    {name}: Prima hai detto che hai il terrore di fare una scelta.
        
        + [Qui hai accettato il tuo nuovo nome.]
            {name}: E ammettere una propria paura, una scelta enorme.
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }            
        
        + [Eppure hai deciso di costruire una famiglia con l3 tu3 amic3.]
  
        
        + [Dimenticando che per finire gli studi hai lottato per anni.]
     
            
        + [Ma hai più volte accettato il rischio di suonare sul]
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
        + [Però da che sei qui hai esplorato tutto questo luogo.]
           
                {
                	- firstCharacterPossibleStates hasnt Chitarra:
    		            ~ firstCharacterPossibleStates --
    		           {debugChangeName: Diminuisco lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
            
        -
 
        {
        - secondCharacterInkLevel == Empty:
            -> ending
        - else: 
            -> two
        }        
        
    = two
    ~ temp charNameFive = translator(fifthCharacterState)

        + [Con Talco puoi litigare, eppure siete legatissim3.]
            {name}: Pensi davvero che ti accuserebbe di tradimento solo perché hai deciso di decidere per te stessa?
            {name}: Il Talco che hai raccontato si arrabbierebbe di più se tu facessi una scelta per te pensando a ləi.
            
                    
        + [La paura di tradire è un'altra faccia dell'ego.]
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
    
            
        + [Il tuo cuore si preoccupa molto di loro, e poco di te.]
   
            
        + [Forse accadrà, ma non è un tuo problema.]
 
                {
                	- firstCharacterPossibleStates hasnt Chitarra:
    		            ~ firstCharacterPossibleStates --
    		           {debugChangeName: Diminuisco lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
                
        + [Tradiamo la fiducia rompendo le regole a nostro vantaggio.]
 
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }
                    
        -
        {
        - fifthCharacterInkLevel == Low:
            -> ending
        - else: 
            -> three
        }
        
    = three
    ~ temp charNameFive = translator(fifthCharacterState)
            
        + [Se non tiri nessun dado, non c'è storia da far avanzare.]
         
                {
	                - fifthCharacterPossibleStates hasnt Violino:
		                ~ fifthCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {fifthCharacterPossibleStates }}
                }
        
        + [Ma ogni persona ha immaginato sorti diverse per Jonah.]
                {
                	- fifthCharacterPossibleStates hasnt Chitarra:
    		            ~ fifthCharacterPossibleStates --
    		           {debugChangeName: Diminuisco lo stato della prima personaggia, che ora è {fifthCharacterPossibleStates }}
                }
                
        + [Eppure la prima cosa che hai visto qui sono otto sentieri.]
 
                {
	                - fifthCharacterPossibleStates hasnt Violino:
		                ~ fifthCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {fifthCharacterPossibleStates }}
                }
            
        
        + [La storia di Jonah è un successo.]

                
        + [Ragioni come se fossi sola se dovessi cadere.]
     
        -
        {
        - fifthCharacterInkLevel == Normal:
            -> ending
        - else: 
            -> four
        }
    
    = four
    ~ temp charNameFive = translator(fifthCharacterState)

        + [Giocare è bello perché puoi sempre Chitarrare a farlo.]

                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }            
         
        
        + [Quando Anna ha Chitarrato all'ex, ha scoperto la sicurezza.]

        
        + [Un infinito più piccolo resta comunque infinito.]

                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Aumento lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }    
            
        + [Chitarrando a cercare Talco ti sei tutelata.]
 
                {
                	- firstCharacterPossibleStates hasnt Chitarra:
    		            ~ firstCharacterPossibleStates --
    		           {debugChangeName: Diminuisco lo stato della prima personaggia, che ora è {firstCharacterPossibleStates }}
                }            
        
        + [C'è più coraggio nella Chitarra che nel compromesso.]
 
            
        -
        
        -> ending

    = ending
    ~ temp charNameFive = translator(fifthCharacterState)
     Per questo ti dico...
        + {fifthRed > 0} [Prendi una strada e se non ti piace cambiala!]
        
        + {fifthPurple > 0} [Dai alla tua vita uno scopo più grande.]
        
        + {fifthYellow > 0} [Ogni gioco richiede una pausa, e tu hai bisogno di ascoltarti.]
                
        + {fifthGreen > 0} [Non deluderai i tuoi amici: loro saranno sempre con te.]
                
        + {fifthBlue > 0} [Questa non è la tua strada. Succede. Ora puoi cambiare.]
                
        
                
        -     
        
    Grazie, {name}.
    Mentre parlavi mi è nata una nuova canzone in testa.
    Qualcosa di fresco, di pronto a cambiare.
    La canzone del mio vero nome.

        {
            - firstCharacterPossibleStates has Chitarra:
                Che <b>resterà Chitarra</b>, perché l'unica cosa che posso fare, è far sì che altr3 scelgano per me.
            
            - firstCharacterPossibleStates has Triangolo:
                E il mio vero nome è <b>Triangolo</b>, perché pensavo di essere uno strumento, e invece ho solo fallito.
                    ~ fifthCharacterState = ()
                    ~ fifthCharacterState += Triangolo
            
            - firstCharacterPossibleStates has RagazzaOrchestra:
                Mi chiamerò <b>Ragazza Orchestra</b>: nel non saper Chitarrare sono diventata l'ornitorinco della musica.
                    ~ fifthCharacterState = ()
                    ~ fifthCharacterState += RagazzaOrchestra
            
            - firstCharacterPossibleStates has FlautoDolce:
                Il mio nome è <b>Flauto Dolce</b>: perché semplice, elementare, ma apprezzata da chi ha buon cuore.
                    ~ fifthCharacterState = ()
                    ~ fifthCharacterState += FlautoDolce                
            
            - firstCharacterPossibleStates has Ocarina:
                Mi chiamerò <b>Ocarina</b>: perché il suo suono è gioco e festa.
                    ~ fifthCharacterState = ()
                    ~ fifthCharacterState += Ocarina
            
            - firstCharacterPossibleStates has Violino:
                Io sono <b>Violino</b>: perché anche se suono bene da sola, do il meglio di me stessa suonando con e per gli altri.
                    ~ fifthCharacterState = ()
                    ~ fifthCharacterState += Violino
        }
        
        
        ~ saturationVar ++
        ~ growing ++   
        ~ move_entity(fifthCharPaint, Bedroom)
        
        {
        - fifthCharacterSpecialEvent == true:
            -> secret_ending
        - else:
            -> exit
        }
    
        
    = secret_ending
    ~ temp charNameFive = translator(fifthCharacterState)
        C'è una cosa che vorrei dirti, {name}.
        Riguarda Il mentore.

            ~ fifthStory = Ended
            ~ movementsCounter = 0
            ~ PG_advace_management(fifthStoryPG)
                -> main
            
    = exit
    ~ temp charNameFive = translator(fifthCharacterState)
        Credo rimarrò ancora in giro per un poco, in attesa del prossimo bus.
            ~ fifthStory = Ended
            ~ movementsCounter = 0
            ~ PG_advace_management(fifthStoryPG)
        -> main  
    
=== fifth_char_story_ended
~ temp charNameFive = translator(fifthCharacterState)
//Con questa formula dopo un tot di scambi la personaggia se ne va salutandoci.
//In alcune situazioni questa cosa non c'è, in altre c'è solo se ho determinati status (es: socievole). In altri non c'è la possibilità che la personaggia se ne vada senza averci salutate (e quindi non c'è l'opzione in story_start)

    {
        - fifthCharEndingDialogue < 4:
            -> top
        - else:
            -> goodbye
    }
    
        - (top)
        {~ Mi chiedo se le cose sarebbero andate diversamente, se Talco fosse arrivatə qui con me.|Sono sicura di aver visto un'altra persona alla fermata del bus, ma quando ho cercato di raggiungerla è scomparsa.|Ogni tanto te la prendi una pausa da questo posto, vero?|Sapevi che a volte c'è una rana nello stagno che circonda la serra?}
                ~ fifthCharEndingDialogue ++
        -> main
        
        = goodbye
        ~ temp charNameFive = translator(fifthCharacterState)
        {name}, per me è arrivato il momento di tornare a casa.
        {firstCharacterPossibleStates hasnt Chitarra: Non so di preciso cosa mi accadrà ora, ma in un certo senso so che sono più pronta.}
        {firstCharacterPossibleStates hasnt Chitarra: Grazie per quello che hai fatto, davvero.}
        {firstCharacterPossibleStates has Chitarra: Vedremo cosa mi accadrà.}
            ~ move_entity(Mentor, Safekeeping)
            //Abbiamo accesso alle note solo se è cambiata. Sennò lei se ne va abbastanza arresa da tutto.
            {
                - fifthCharacterPossibleStates hasnt Chitarra:
                    ~ move_entity(FifthCharacterNotes, TrainStop)
            }    
            
        -> main




=== fifth_character_opinions
~ temp charNameFive = translator(fifthCharacterState)
        {   
            //Opinioni dopo la fine della terza storia
            - fourthTier == true:
                -> four
            //Opinioni dopo la fine della seconda storia    
            - thirdTier == true:
                -> three
            //Opinioni dopo la fine della prima storia      
            - secondTier == true:
                -> two
            //Opinioni presenti da inizio gioco    
            - else:
                -> one
        }

   = one
   ~ temp charNameFive = translator(fifthCharacterState)
    {~ Sinceramente, non so che ne sarebbe di questo luogo senza tutta la manutenzione che devo fare.|Hai notato la bacheca alla stazione dei treni? Anche se è da molto che non arrivano lettere.|A volte vorrei che le cose in serra crescessero più velocemente, così da sapere subito se ho sbagliato qualcosa.|A ovest dello stagno c'è spesso un grande baccano, ma fiori e fieno sono troppo alti per poter vedere cosa ci sia da quelle parti.}
            ~ fifthPauseTalking = fifthCharPauseDuration
            -> main
    
    = two
    ~ temp charNameFive = translator(fifthCharacterState)
    {~ Da piccola amavo leggere, ma dove vivevo non c'erano biblioteche, e per molto tempo avevamo a malapena i soldi per mangiare.|A volte ho questo timore: posso davvero essere una buona mentore, anche se sono poco istruita?|Sono contenta di aver aperto la biblioteca, ma quella poltrona mi invita troppo a riposare, quando invece ci sono mille cose da fare.}
            ~ fifthPauseTalking = fifthCharPauseDuration
            -> main
            
    = three
    ~ temp charNameFive = translator(fifthCharacterState)
    {~ xxx|yyy}
            ~ fifthPauseTalking = fifthCharPauseDuration
            -> main
            
    = four
    ~ temp charNameFive = translator(fifthCharacterState)
    {~ xxx|yyy}
            ~ fifthPauseTalking = fifthCharPauseDuration
            -> main        













    
