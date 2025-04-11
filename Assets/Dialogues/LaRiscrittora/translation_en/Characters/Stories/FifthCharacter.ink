=== fifth_character ===
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)

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
~ temp charNameOne = uppercaseTranslator(firstCharacterState)
~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
~ temp charNameThree = uppercaseTranslator(thirdCharacterState)
~ temp charNameFour= uppercaseTranslator(fourthCharacterState)
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)

    -> mentor_and_first_char_storylets
    //-> mentor_and_second_char_storylets
    //-> fifth_character_storylets

    = talk
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameThree = uppercaseTranslator(thirdCharacterState)
    ~ temp charNameFour= uppercaseTranslator(fourthCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
    {charNameFive}: Come posso esserti utile, {pronouns has him: amico mio|{pronouns has her: amica mia|amicə miə}}?
    
        + [Avrei bisogno di una mano.]
            -> support
        
        + {(pre_test && not little_storylets.voices) or (firstCharacterInkLevel has High && not little_storylets.infoImpo) or (talking_fungus.first_story_ended_check && not little_storylets.talkingFungus) or (the_frog.frog && not little_storylets.talkingFrog)}[Mi è successa una cosa strana.]
            -> little_storylets
            
        + {knowing_second_character && fifthPauseTalking == 0}[Vorrei conoscerti meglio.]
            // {
            //     - fifthPauseTalking == 0:
                    -> talk_with_fifth_character
                
            //     - else:
            //         {charNameFive}: {~ Ora non mi va, ma non mi chiedi aiuto da un po', tutto ok?|Ho bisogno di una pausa, ma se serve aiuto sono qui.|Devo decidere cosa sistemare poi, ma se ti serve aiuto invece, chiedi pure.}
            //         -> talk_with_mentor
            // }
            
        + [Ho cambiato idea.]
            -> main
        -
-> main

=== talk_with_fifth_character ===
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
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
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
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
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        ~ fifthStoryQuestCount ++
        //Amore per il giardinaggio e la possibilità, per la giocatrice, di esprimere qualcosa che poi si potrebbe avvicinare ai possibili finali.
        {charNameFive}: Non è giusto avere delle preferenze, ma la serra è il mio posto preferito.
        {charNameFive}: C'è qualcosa nel vedere crescere piante, fiori, funghi che mi fa sentire appagata.
        {charNameFive}: Non è solo l'odore della terra, o l'umidità nell'aria nei giorni più caldi.
        {charNameFive}: Ma quella sensazione che con le tue mani puoi permettere a un altro corpo di crescere al meglio.

            + (fiveBlue) [Preferisco la stazione dei treni, è ordinata, precisa.]
                    ~ fifthBlue ++
                {charNameFive}: Sì, ne capisco il fascino.
                {charNameFive}: A volte mi siedo lì e mi godo per qualche istante l'attesa.
                {charNameFive}: Il nulla che accade.
                {charNameFive}: Ma poi le mani fremono, mi supplicano di sistemare qualcosa fuori posto.
                
            + (fiveYellow) [Lo stagno è divertente, succede di tutto.]
                    ~ fifthYellow ++
                {charNameFive}: Forse succede <i>di troppo</i>.
                {charNameFive}: Non sembra pensare a nulla.
                {charNameFive}: L'acqua è lì e lascia che tutto accada, senza pensare al domani.
                
            + (fiveRed) [La foresta domina: è lotta, è potenza!]
                    ~ fifthRed ++
                {charNameFive}: E disordinata, sporca.
                {charNameFive}: Posso capirne il fascino, ma non è un luogo dove resto con piacere.
                {charNameFive}: E quel tronco al centro non vuole saperne né di crescere né di morire.
                {charNameFive}: Una cosa davvero fastidiosa.
                    
                
            + (fiveGreen) [Un po' come prendersi cura delle persone, qui.]
                    ~ fifthGreen ++
                {charNameFive}: Sì, anche se con meno aspettative.
                {charNameFive}: Le persone a volte fanno cose che non ci aspettiamo.
                {charNameFive}: Un <i>Lichene degli abissi</i> con le giuste condizioni cresce sempre allo stesso modo.
  
            + (fivePurple) [Invece sono felice che crescano a prescidere da me.]
                    ~ fifthPurple ++
                {charNameFive}: Senza di te? Dobbiamo bagnare il terreno, prepararlo, seminare.
                {charNameFive}: Non ci sarebbe nulla senza il nostro lavoro.
                {charNameFive}: Non saprebbero resistere alle erbacce, al freddo.
                {charNameFive}: No, non sono d'accordo, scusa.
                    
 
            -
        {firstStory hasnt Ended: {charNameFive}: Ma a proposito di questo posto: devo ancora capire come sgomberare quell'ammasso di mobili rotti che blocca il sentiero a ovest della foresta.|{charNameFive}: Ma a proposito di questo posto: devo ancora liberare il sentiero da quei fiori enormi vicino alla serra.}
        {charNameFive}: È arrivato il momento di capire dove possa portare.
        {charNameFive}: Grazie per la chiacchierata, {name}.
             ~ fifthPauseTalking = fifthCharPauseDurantion
            -> main
    
    = two
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    ~ change_entity_place(SecondCharacter)
    ~ fifthStoryQuestCount ++
        
        //Partendo dalla prima personaggia, dipendenza dai rapporti (circa)
        {charNameFive}: La storia di {charNameOne} mi ha colpita.
        {are_two_entities_together(FirstCharacter, PG): {charNameOne}: E {charNameOne} di sicuro non vuole sentire le tue opinioni in merito.}
            ~ change_entity_place(FirstCharacter)
        {charNameFive}: Non tanto il suo blocco, quello è una cosa comune a quell'età.
        {charNameFive}: Quanto invece fosse consapevole delle opinioni di tutte le persone care.
        {charNameFive}: Senza però perdere sé stessa.
        {charNameFive}: Questa è una cosa difficile anche alla mia età.
        
            + [I numeri sono indicatori, non fatti assoluti.]
                    ~ fifthBlue ++
                {charNameFive}: Su questo hai ragione, {name}.
                {charNameFive}: Eppure posso assicurarti che i miei cinquanta e rotti anni si portano addosso anche un bel po' di fatti scricchiolanti e ricordi.
                   
                
            + [{charNameOne} sapeva ridere, giocare, e questo l'ha resa libera.]
                    ~ fifthYellow ++
                {charNameFive}: E la libertà può farti perdere ancora di più.
                {charNameFive}: A volte non c'è maggiore libertà di essere stabili e felici nel proprio ruolo.
                
                
            + [Non c'è vera azione senza consapevolezza.]
                    ~ fifthRed ++
                {charNameFive}: Allora la maggior parte di noi non agisce mai veramente.
                {charNameFive}: Eppure riusciamo a farci del male, e a farci del bene.
                {charNameFive}: Qualcosa deve sempre cambiare.

                
            + [E tu sei molto ricettiva verso le altre persone.]
                    ~ fifthGreen ++
                {charNameFive}: Forse non <i>molto</i>.
                {charNameFive}: Ma indubbiamente quello che hanno da dire e quello che provano, conta.
                {charNameFive}: Una mentore è una guida, ma per imparare a guidare deve capire chi ha dall'altra parte.
                {charNameFive}: Di cosa abbia bisogno.
                {charNameFive}: Dove voglia andare.
                
                
            + [Ci sono momenti in cui è necessario anche perdersi.]
                    ~ fifthPurple ++
                {charNameFive}: E in questo luogo in fondo arrivano solo persone che si sono perse.
                {charNameFive}: E che se ne vanno più serene.
                {charNameFive}: Avrebbero scoperto quella serenità, senza un po' di smarrimento?
                
            -
        {charNameFive}: Questo luogo continua a stupirmi.
        {charNameFive}: Sei qui per aiutare le altre persone, e finisci per scoprire cose di te.
        {charNameFive}: Ma ora è il momeno di svuotare lo stagno dalle sue cose più schifose.
        {charNameFive}: Prega per me, {name}.
             ~ fifthPauseTalking = fifthCharPauseDurantion
                -> main


    
    = three
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        //Questo è un riferimento indiretto anche ai figli che ora non la chiamano molto.
        ~ fifthStoryQuestCount ++
         
        {charNameFive}: A volte un po' mi pesa, tutto questo via vai.
        {charNameFive}: Ci sono persone a cui mi sono affezionata, che non rivedrò più.
        {charNameFive}: Persone che ho aiutato e ora vorrei sentire più spesso.
        {charNameFive}: Ma poi le loro lettere non arrivano, o arrivano sempre meno.
        {charNameFive}: E allora mi chiedo se ho sbagliato qualcosa.
        {charNameFive}: Non mi fraintendere: sono felice di quello che faccio, di quello che ho fatto.
        {charNameFive}: E per me è una gioia tenere tutto questo in piedi, giorno per giorno.

            + [Ogni lavoro ha la sua quota di sacrificio.]
                {charNameFive}: Vero.
                {charNameFive}: Il valore di qualcosa viene da quanto ci è costata.
                {charNameFive}: E la maggior parte delle volte non paghiamo in denaro.
                    ~ fifthBlue ++
                
            + [Forse le volpi si mangiano le lettere!]
                {charNameFive}: La fantasia è un modo piacevole di affrontare la realtà, {name}.
                {charNameFive}: Ma alla lunga rende difficile capire cosa sia vero e cosa no.
                    ~ fifthYellow ++
                
            + [Il mondo è pieno di ingrati.]
                {charNameFive}: No.
                {charNameFive}: Direi che il mondo è pieno di persone distratte.
                {charNameFive}: Le cose da fare sono infinite, e finiamo per dimenticarci di chi non vediamo tutti i giorni.
                {charNameFive}: Non è ingratitudine, è una vita che scorre troppo veloce.
                    ~ fifthRed ++

                
            + [Ti prometto che ti scriverò ogni giorno.]
                {charNameFive}: Oh, {pronouns has him: caro|{pronouns has her: cara|carə}}, è una bella promessa.
                {charNameFive}: Una promessa che ho sentito decine di volte.
                    ~ fifthGreen ++
  
                
            + [Esiste un confine tra {charNameFive} e questo luogo?]
                {charNameFive}: A volte mi sento <i>solo</i> questo luogo.
                {charNameFive}: Non mi chiedo spesso se andarmene o meno.
                {charNameFive}: O dove.
                    ~ fifthPurple ++
 
            -
            {charNameFive}: Ma basta con questo spirito malinconico!
            {charNameFive}: Mi sono appena ricordata che ci sono delle erbacce fastidiose sotto la poltrona della biblioteca,
            {charNameFive}: Devo inventarmi un modo per liberarmene!
                ~ fifthPauseTalking = fifthCharPauseDurantion
                    -> main
    
    
    
    
    = four
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ change_entity_place(SecondCharacter)
        //Responsabilità
        ~ fifthStoryQuestCount ++
        {charNameFive}: Mi sto chiedendo se non sia stata troppo dura col piccolo {charNameTwo} appena arrivato qui.
        {charNameFive}: Ero sinceramente spaventata, ma forse ho reagito con violenza.
        {charNameFive}: Ma questo non è un luogo per un bimbo.
        {charNameFive}: Ti immagini cosa significhi essere un genitore, e renderti conto che tuo figlio, così piccolo, ha già perso la strada?
        {charNameFive}: Che già non sappia più cosa fare del suo futuro?
        {charNameFive}: Che cosa terribile per entrambi.
        {charNameFive}: E tutta quella responsabilità.
        {charNameFive}: Quella paura per il futuro e per l'ambiente.
        {charNameFive}: Non dovrebbe pensare al pallone, a giocare con gli amici, a studiare?
        
            + [{charNameTwo} ama studiare, e infatti questo è il posto per lui.]
                {charNameFive}: No!
                {charNameFive}: Questo è un posto spirituale.
                {charNameFive}: Di crescita, di esplorazione.
                {charNameFive}: Non un laboratorio.
                {charNameFive}: Non il piccolo chimico.
                    ~ fifthBlue ++
                
            + [Giocare è comunque un modo per capire il mondo, {charNameFive}.]
                {charNameFive}: Ma un modo controllato, adatto per i bambini.
                {charNameFive}: Con meno violenza possibile.
                {charNameFive}: Senza le cose terribili che ci circondano.
                {charNameFive}: Se non voglio vederle io a cinquant'anni, perché deve vederle un bimbo?
                    ~ fifthYellow ++
                
            + [Alla sua età avevo anche io idee e paure. Si è bambini, non idioti.]
                {charNameFive}: Non serve che usi quel linguaggio con me, {name}.
                {charNameFive}: E non sono d'accordo.
                {charNameFive}: Nemmeno a vent'anni puoi sapere davvero cosa vuoi.
                {charNameFive}: Cosa conta a questo mondo.
                {charNameFive}: Per questo i genitori ci sono.
                {charNameFive}: Per proteggerti.
                    ~ fifthRed ++

            + [Mi spiace che tu ti senta in colpa.]
                {charNameFive}: Ma non hai detto che non ho sbagliato.
                {charNameFive}: Scusa, non è quello il tuo ruolo.
                {charNameFive}: Sennò non sarei io la mentore, ma tu.
                {charNameFive}: Spero che almeno lui prima o poi mi perdoni.
                    ~ fifthGreen ++
  
            + [Il genitore dovrebbe essere il lavoro di una comunità.]
                {charNameFive}: Non dire castronerie, {name}.
                {charNameFive}: Si fa così dai tempi dei tempi, due persone.
                {charNameFive}: Una se manca.
                {charNameFive}: Però dovrebbero avere il diritto di sbagliare.
                    ~ fifthPurple ++
            -
        
        {charNameFive}: Forse mi sono concentrata sulla cosa sbagliata.
        {charNameFive}: Il problema non è quello che è accaduto.
        {charNameFive}: Il problema è che mi sono fatta coinvolgere.
        {charNameFive}: Una mentore deve mantenere un certo distacco per guidarti.
        {charNameFive}: Non può essere emotiva.
        {charNameFive}: Vado a riordinare in ordine di data i libri in biblioteca.
        
             ~ fifthPauseTalking = fifthCharPauseDurantion
            -> main
    = five
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        {charNameFive}: Mi sento più stanca del solito.
        {charNameFive}: E fa caldo.
        {charNameFive}: Ma l'idea di stendermi sotto quell'albero non mi piace.
        {charNameFive}: E c'è molto da fare.
        {charNameFive}: Però quella panchina mi ricorda un'altra panchina, sai?
        {charNameFive}: Dove in un'altra vita ho ricevuto il mio primo bacio.
        {charNameFive}: Dall'uomo che poi ho sposato.
        {charNameFive}: E a cui ho dedicato il resto dei miei giorni.
        {charNameFive}: Fino a quando non sono arrivata qui.
        {charNameFive}: Già.
        {charNameFive}: Fino a quando non sono arrivata qui.
        {charNameFive}: {name}: secondo te cosa vuol dire amare un'altra persona?

            + [Progettare assieme, costruire fondamenta, accrescersi.]
                {charNameFive}: Già.
                {charNameFive}: Creare qualcosa che regga alla fine del desiderio.
                {charNameFive}: Quando il corpo perde il suo splendore.
                {charNameFive}: E il letto è il luogo della stanchezza e della malattia.
                {charNameFive}: Quando invece di chiamarci "amore".
                {charNameFive}: Ci chiediamo dove sono le chiavi della macchina.
                    ~ fifthBlue ++
                
            + [Un rifugio di stupore e gioia in un mondo grigio.]
                {charNameFive}: Mi piace la tua ingenuità {name}.
                {charNameFive}: Con questa logica ho amato solo una cosa:
                {charNameFive}: il mio giardino.
                {charNameFive}: Un posto sempre sorprendente, vivo.
                {charNameFive}: Pieno di musica.
                {charNameFive}: E forse è davvero così.
                    ~ fifthYellow ++
                
            + [Fondersi nella passione, a letto come in una protesta.]
                {charNameFive}: La passione si spegne, {name}.
                {charNameFive}: E a quel punto cosa rimane?
                {charNameFive}: Noia?
                {charNameFive}: Rancore?
                {charNameFive}: Odio?
                {charNameFive}: Passioni forti chiamano passioni ancora più forti.
                    ~ fifthRed ++

                
            + [Cura, ascolto, affetto.]
                {charNameFive}: Già, ho pensato la stessa cosa a lungo.
                {charNameFive}: Ma a volte la cura diventa un lavoro.
                {charNameFive}: L'ascolto un dovere.
                {charNameFive}: L'affetto un'abitudine.
                {charNameFive}: Eppure resti.
                {charNameFive}: Vuol dire che è finito l'amore?
                    ~ fifthGreen ++
  
                
            + [Raggiungersi l'anima a vicenda, ricercando il divino che è noi.]
                {charNameFive}: Una visione mistica.
                {charNameFive}: Forse blasfema.
                {charNameFive}: Qualcosa che non ho mai conosciuto, se non nei romanzi.
                {charNameFive}: O nell'amicizia.
                {charNameFive}: E a volte, se resto in silenzio e ferma a lungo, in questo luogo.
                
                    ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDurantion
        
        {charNameFive}: A volte sono solo una sciocca romantica.
        {charNameFive}: E mi dimentico che l'amore è ovunque.
        {charNameFive}: Anche qui.
        {charNameFive}: Soprattutto qui.
        {charNameFive}: Amore per noi.
        {charNameFive}: Vado a recuperare del terriccio dal sottobosco, {name}.
        {charNameFive}: Parleremo più tardi.
        ~ fifthPauseTalking = fifthCharPauseDurantion
            -> main
    
    
    = six
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
    // -> si parla esplicitamente di responsabilità personale (in antitesi anche con la visione del fungo)? Questa è una visione di RABBIA.

        ~ fifthStoryQuestCount ++
        
        {charNameFive}Placeholder
            + [Placeholder]
                    ~ fifthBlue ++
                
            + [Placeholder]
                    ~ fifthYellow ++
                
            + [Placeholder]
                ~ fifthRed ++

                
            + [Placeholder]
                ~ fifthGreen ++
  
                
            + [Placeholder]
                ~ fifthPurple ++
 
            -
            //Qui potrebbe aver senso ridurre i tempi di attesa tra un dialogo e l'altro.
             ~  fifthCharPauseDurantion = 5
             ~ fifthPauseTalking = fifthCharPauseDurantion
            -> main
    = seven
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        {charNameFive}Placeholder
            + [Placeholder]
                    ~ fifthBlue ++
                
            + [Placeholder]
                    ~ fifthYellow ++
                
            + [Placeholder]
                ~ fifthRed ++

                
            + [Placeholder]
                ~ fifthGreen ++
  
                
            + [Placeholder]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDurantion
            -> main        
            
            
    = eight
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        {charNameFive}Placeholder
            + [Placeholder]
                    ~ fifthBlue ++
                
            + [Placeholder]
                    ~ fifthYellow ++
                
            + [Placeholder]
                ~ fifthRed ++

                
            + [Placeholder]
                ~ fifthGreen ++
  
                
            + [Placeholder]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDurantion
            -> main    
    
    
    = nine
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        {charNameFive}Placeholder
            + [Placeholder]
                    ~ fifthBlue ++
                
            + [Placeholder]
                    ~ fifthYellow ++
                
            + [Placeholder]
                ~ fifthRed ++

                
            + [Placeholder]
                ~ fifthGreen ++
  
                
            + [Placeholder]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDurantion
            -> main    
    
    = ten
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        {charNameFive}Placeholder
            + [Placeholder]
                    ~ fifthBlue ++
                
            + [Placeholder]
                    ~ fifthYellow ++
                
            + [Placeholder]
                ~ fifthRed ++

                
            + [Placeholder]
                ~ fifthGreen ++
  
                
            + [Placeholder]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDurantion
            -> main    
    
    = eleven
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        {charNameFive}Placeholder
            + [Placeholder]
                    ~ fifthBlue ++
                
            + [Placeholder]
                    ~ fifthYellow ++
                
            + [Placeholder]
                ~ fifthRed ++

                
            + [Placeholder]
                ~ fifthGreen ++
  
                
            + [Placeholder]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDurantion
            -> main    
    = twelve
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
        //Presentazione.
        ~ fifthStoryQuestCount ++
        
        {charNameFive}Placeholder
            + [Placeholder]
                    ~ fifthBlue ++
                
            + [Placeholder]
                    ~ fifthYellow ++
                
            + [Placeholder]
                ~ fifthRed ++

                
            + [Placeholder]
                ~ fifthGreen ++
  
                
            + [Placeholder]
                ~ fifthPurple ++
 
            -
             ~ fifthPauseTalking = fifthCharPauseDurantion
            -> main            
            
            



        


=== fifth_story_gift ===
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
Placeholder
        + {findedGifts != ()} [Placeholder]
            ~ currentReceiver += Mentor
            -> inventory_management -> ink_outcome 
        + {findedGifts == ()} Placeholder
            ->main
        
    
        = ink_outcome    
            Placeholder
                 -> talk_with_fifth_character
            //queste opzioni poi non saranno scelte dirette, ma risultati delle scelte fatte durante il gioco

=== fifth_story_chech_trigger
      ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
      //In questa storia non ci sono trigger, lascio la struttura perché non si sa mai.
      
        //{
        //- loneliness == false:
        //    -> loneliness_trigger
        //- else:
        //    -> main_story_first_character
        //}
            -> main_story_fifth_character
        
        = loneliness_trigger
        Placeholder
            * [Placeholder]
                -> main_story_fifth_character
            * [Placeholder]
            //FUTURA SOLUZIONE A QUESTA SITUAZIONE
                -> main
        -
        -> END

=== main_story_fifth_character
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
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
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        {charNameFive}Placeholder
            -> secondAffinityCalc ->
        {
        - firstPurple && firstYellow > firstBlue: {charNameFive}Placeholder
        Placeholder
        
        -firstPurple or firstYellow > firstBlue:{charNameFive}Placeholder
        
        Placeholder
        
        - firstPurple && firstYellow < firstBlue: {charNameFive}Placeholder
        
        Placeholder
        
        
        - else: Placeholder
        
        Placeholder
        
        }
        {charNameFive}Placeholder
            
            + [Placeholder]
                -> statement
            + [Placeholder]
                -> main


    = statement
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        Placeholder
        //Sopra ho già aggiornato il livello di inchiostro e quindi di affinità.
            ~ inkLevel(secondCharacterInkLevel)
        + [Placeholder]
            -> secondNaming -> 
            -> one
        + [Placeholder]
            -> main

    = one
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    {name}Placeholder
        
        + [Placeholder]
            {name}Placeholder
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Placeholder {firstCharacterPossibleStates }}
                }            
        
        + [Placeholder]
  
        
        + [Placeholder]
     
            
        + [Placeholder]
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Placeholder {firstCharacterPossibleStates }}
                }
        + [Placeholder]
           
                {
                	- firstCharacterPossibleStates hasnt Chitarra:
    		            ~ firstCharacterPossibleStates --
    		           {debugChangeName: Placeholder {firstCharacterPossibleStates }}
                }
            
        -
 
        {
        - secondCharacterInkLevel == Empty:
            -> ending
        - else: 
            -> two
        }        
        
    = two
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)

        + [Placeholder]
            {name}Placeholder
            {name}Placeholder
            
                    
        + [Placeholder]
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Placeholder {firstCharacterPossibleStates }}
                }
    
            
        + [Placeholder]
   
            
        + [Placeholder]
 
                {
                	- firstCharacterPossibleStates hasnt Chitarra:
    		            ~ firstCharacterPossibleStates --
    		           {debugChangeName: Placeholder {firstCharacterPossibleStates }}
                }
                
        + [Placeholder]
 
                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Placeholder {firstCharacterPossibleStates }}
                }
                    
        -
        {
        - fifthCharacterInkLevel == Low:
            -> ending
        - else: 
            -> three
        }
        
    = three
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
            
        + [Placeholder]
         
                {
	                - fifthCharacterPossibleStates hasnt Violino:
		                ~ fifthCharacterPossibleStates ++
	                    {debugChangeName: Placeholder {fifthCharacterPossibleStates }}
                }
        
        + [Placeholder]
                {
                	- fifthCharacterPossibleStates hasnt Chitarra:
    		            ~ fifthCharacterPossibleStates --
    		           {debugChangeName: Placeholder {fifthCharacterPossibleStates }}
                }
                
        + [Placeholder]
 
                {
	                - fifthCharacterPossibleStates hasnt Violino:
		                ~ fifthCharacterPossibleStates ++
	                    {debugChangeName: Placeholder {fifthCharacterPossibleStates }}
                }
            
        
        + [Placeholder]

                
        + [Placeholder]
     
        -
        {
        - fifthCharacterInkLevel == Normal:
            -> ending
        - else: 
            -> four
        }
    
    = four
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)

        + [Placeholder]

                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Placeholder {firstCharacterPossibleStates }}
                }            
         
        
        + [Placeholder]

        
        + [Placeholder]

                {
	                - firstCharacterPossibleStates hasnt Violino:
		                ~ firstCharacterPossibleStates ++
	                    {debugChangeName: Placeholder {firstCharacterPossibleStates }}
                }    
            
        + [Placeholder]
 
                {
                	- firstCharacterPossibleStates hasnt Chitarra:
    		            ~ firstCharacterPossibleStates --
    		           {debugChangeName: Placeholder {firstCharacterPossibleStates }}
                }            
        
        + [Placeholder]
 
            
        -
        
        -> ending

    = ending
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
     Placeholder
        + {fifthRed > 0} [Placeholder]
        
        + {fifthPurple > 0} [Placeholder]
        
        + {fifthYellow > 0} [Placeholder]
                
        + {fifthGreen > 0} [Placeholder]
                
        + {fifthBlue > 0} [Placeholder]
                
        
                
        -     
        
    {charNameFive}Placeholder
    {charNameFive}Placeholder
    {charNameFive}Placeholder
    {charNameFive}Placeholder

        {
            - firstCharacterPossibleStates has Chitarra:
                {charNameFive}Placeholder
            
            - firstCharacterPossibleStates has Triangolo:
                {charNameFive}Placeholder
                    ~ fifthCharacterState = ()
                    ~ fifthCharacterState += Triangolo
            
            - firstCharacterPossibleStates has RagazzaOrchestra:
                {charNameFive}Placeholder
                    ~ fifthCharacterState = ()
                    ~ fifthCharacterState += RagazzaOrchestra
            
            - firstCharacterPossibleStates has FlautoDolce:
                {charNameFive}Placeholder
                    ~ fifthCharacterState = ()
                    ~ fifthCharacterState += FlautoDolce                
            
            - firstCharacterPossibleStates has Ocarina:
                {charNameFive}Placeholder
                    ~ fifthCharacterState = ()
                    ~ fifthCharacterState += Ocarina
            
            - firstCharacterPossibleStates has Violino:
                {charNameFive}Placeholder
                    ~ fifthCharacterState = ()
                    ~ fifthCharacterState += Violino
        }
        
            
        
        {
        - fifthCharacterSpecialEvent == true:
            -> secret_ending
        - else:
            -> exit
        }
    
    
    = secret_ending
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        {charNameFive}Placeholder
        {charNameFive}Placeholder

            ~ fifthStory = Ended
            ~ movementsCounter = 0
            ~ PG_advace_management(fifthStoryPG)
                -> main
            
    = exit
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        {charNameFive}Placeholder
            ~ fifthStory = Ended
            ~ movementsCounter = 0
            ~ PG_advace_management(fifthStoryPG)
        -> main  
    
=== fifth_char_story_ended
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
//Con questa formula dopo un tot di scambi la personaggia se ne va salutandoci.
//In alcune situazioni questa cosa non c'è, in altre c'è solo se ho determinati status (es: socievole). In altri non c'è la possibilità che la personaggia se ne vada senza averci salutate (e quindi non c'è l'opzione in story_start)

    {
        - fifthCharEndingDialogue < 4:
            -> top
        - else:
            -> goodbye
    }
    
        - (top)
        {charNameFive}Placeholder
                ~ fifthCharEndingDialogue ++
        -> main
        
        = goodbye
        ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        {charNameFive}Placeholder
        {firstCharacterPossibleStates hasnt Chitarra: {charNameFive}Placeholder}
        {firstCharacterPossibleStates hasnt Chitarra: {charNameFive}Placeholder}
        {firstCharacterPossibleStates has Chitarra: {charNameFive}Placeholder}
            ~ move_entity(Mentor, Safekeeping)
            //Abbiamo accesso alle note solo se è cambiata. Sennò lei se ne va abbastanza arresa da tutto.
            {
                - fifthCharacterPossibleStates hasnt Chitarra:
                    ~ move_entity(FifthCharacterNotes, BusStop)
            }    
            
        -> main




=== fifth_character_opinions
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
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
   ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    {charNameFive}Placeholder
            ~ fifthPauseTalking = fifthCharPauseDurantion
            -> main
    
    = two
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    {charNameFive}Placeholder
            ~ fifthPauseTalking = fifthCharPauseDurantion
            -> main
            
    = three
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    {charNameFive}Placeholder
            ~ fifthPauseTalking = fifthCharPauseDurantion
            -> main
            
    = four
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    {charNameFive}Placeholder
            ~ fifthPauseTalking = fifthCharPauseDurantion
            -> main        













    

