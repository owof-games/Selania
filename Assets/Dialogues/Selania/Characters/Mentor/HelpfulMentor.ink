=== helping_mentor
{debug: passo da helping_mentor}
~ temp charNameOne = translator(firstChar_ActualName)
~ temp charNameTwo = translator(secondChar_ActualName)
~ temp charNameThree = translator(thirdChar_ActualName)
~ temp charNameFour= translator(fourthChar_ActualName)
~ temp mentorName = translator(mentor_ActualName)


{charTag(Mentor, "neutral")}:                  {player_name}!
- (saluto)
{shuffle:
    //Sulla cucina
    - {player_accessiblePlaces has Kitchen:Non sono mai stata una grande cuoca. Ma amo mangiare.|->saluto}
    - {player_accessiblePlaces has Kitchen:Il cibo è un momento di unione anche con l'essere che l'ha generato.|->saluto}
    - {player_accessiblePlaces has Kitchen:La luce che si riflette sull'acqua della cucina è appagante.|->saluto}
    - {player_accessiblePlaces has Kitchen:Gli alberi della cucina sono diversi da quelli della foresta, sono più ampi e muschiosi.|->saluto}
    - {player_accessiblePlaces has Kitchen:Dalla cucina arrivano sempre profumi insoliti. Ve la cavate tutt3 molto bene!|->saluto}

    //Sulla biblioteca
    - {player_accessiblePlaces has Library:Da piccola amavo leggere, ma dove vivevo non c'erano biblioteche, e per molto tempo avevamo a malapena i soldi per mangiare.|->saluto}
    - {player_accessiblePlaces has Library:A volte ho questo timore: posso davvero essere una buona mentore, anche se sono poco istruita?|->saluto}
    - {player_accessiblePlaces has Library:Sono contenta di aver aperto la biblioteca, ma quella poltrona mi invita troppo a riposare, quando invece ci sono mille cose da fare.|->saluto}
    - {player_accessiblePlaces has Library:All'inizio l'idea di avere anche una biblioteca da mantenere mi innervosiva, ma ora ne sono felice.|->saluto}

    //Sul nido
    - {player_accessiblePlaces has Nest:C'è qualcosa di rilassante nella pioggia costante del nido, non trovi?|->saluto}
    - {player_accessiblePlaces has Nest:Quella tenda al nido è uguale a quella dei miei figli da piccoli.|->saluto}
    - {player_accessiblePlaces has Nest:A volte son tentata di toccare le pietre al nido, ma poi mi ricordo che non è mio compito.|->saluto}

    //Sulla discarica
    - {player_accessiblePlaces has Dump:Una parte di me soffre tantissimo all'idea che ci sia una discarica qui, in questo luogo magnifico.|->saluto}
    - {player_accessiblePlaces has Dump:Fa strano vedere quel complesso industriale. Ha qualcosa di troppo vero.|->saluto}
    - {player_accessiblePlaces has Dump:Mi sto chiedendo se c'è modo di sistemare quell'anfora alla discarica.|->saluto}
    - {player_accessiblePlaces has Dump && thirdChar_storyStatus == story_storyStarted:Sarei tentata di chiedere una mano a {charNameThree} e sgomberare quel casino alla discarica.|->saluto}

    //Sempre disponibili
    - I cespugli della foresta credo nascondano qualche animaletto, ma per ora non ne ho preso nessuno.
    - Qualcosa nello stagno sta cambiando molto dal tuo arrivo.
    - La serra è così florida e viva ora.
    - Sinceramente, non so che ne sarebbe di questo luogo senza tutta la manutenzione che devo fare.
    - Hai notato la mappa alla stazione dei treni?
    - A volte vorrei che le cose in serra crescessero più velocemente, così da sapere subito se ho sbagliato qualcosa.

}


- (top)
    Come posso esserti utile, {player_pronouns has him: amico mio|{player_pronouns has her: amica mia|amicə miə}}?
    
        + \ {charTag(PG, "neutral")}:                                           Avrei bisogno di una mano.
            -> support
        
        + {player_somethingStrange != ()}\ {charTag(PG, "neutral")}:            Mi è successa una cosa strana.
            -> little_storylets
    
        + \ {charTag(PG, "neutral")}:                                           Ho cambiato idea.
            -> notification_system ->
            -> main

/* ---------------------------------

    Mentore utile: diramazioni dialoghi
       
 ----------------------------------*/
 
 === support
    ~ temp mentorName = translator(mentor_ActualName)
    - (top)
    Hai bisogno dei miei consigli?
    
        + {tutorial_mentorInkAndYouAreARewriter}\ {charTag(PG, "neutral")}:     Mi ripeteresti cosa devo fare?
            -> to_do
        
        + \ {charTag(PG, "neutral")}:                                           C'è una cosa che mi riguarda.
            -> myself
        
        + \ {charTag(PG, "neutral")}:                                           Vorrei consigli su come stare meglio.
            -> mindfulness -> support
    
        + \ {charTag(PG, "neutral")}:                                           Vorrei parlare d'altro.
            -> helping_mentor.top
        -
            -> top   

    = myself
    ~ temp mentorName = translator(mentor_ActualName)
        Di cosa senti il bisogno?
            
            + \ {charTag(PG, "neutral")}:                                       Vorrei cambiare il mio nome.
                    -> name_choice -> support
            
            + \ {charTag(PG, "neutral")}:                                       Vorrei cambiare i miei pronomi.
                    -> gender -> support
            
            + \ {charTag(PG, "neutral")}:                                       A dire il vero sono a posto così.
                    -> helping_mentor.top
 
 

/* ---------------------------------

    Mentore utile: contenuti
       
 ----------------------------------*/
=== to_do
~ temp mentorName = translator(mentor_ActualName)

        {
            - grimoire_appendices has grimChoicesMentor:
                {charTag(Mentor, "neutral")}:       La prima cosa da fare è: conquistare la <b><i>fiducia</b></i> della persona che devi aiutare.
                                                    Ci <b><i>parli</b></i>, cerchi di capire di cosa ha bisogno e quali sono le risposte che le piacciono.

        }

        {
            - grimoire_appendices has grimInkMentor:
                {charTag(Mentor, "hurry")}:         Fino a quando non è pronta per una <b><i>riscrittura</b></i>
                {charTag(Mentor, "neutral")}:       A quel punto inizi i tuoi <b><i>riscritture</b></i>: riprendi eventi della sua storia e la aiuti a guardarli sotto una luce diversa.
                                                    Più inchiostro hai, più riscritture puoi fare.

        }

        {
            - grimoire_appendices has grimGreenhouseMentor && grimoire_appendices has grimInkMentor:
                {charTag(Mentor, "hurry")}:         Per aumentare l'inchiostro puoi fare cose diverse.
                                                    Come dare il giusto dono.
                                                    E i doni migliori crescono nella serra.

        }

        {
            - grimoire_appendices has grimFirstOpenKitchen:
                {charTag(Mentor, "neutral")}:       E se mangiate qualcosa assieme, magari riesci anche a capire se stai o meno conquistando la fiducia di quella persona.
                
        }

        {
            - grimoire_appendices has grimRewritingMentor:
                {charTag(Mentor, "hurry")}:         A fine riscrittura, in base alle cose che avrai detto, la persona sceglierà il suo <b><i>nuovo nome</b></i>.
                {charTag(Mentor, "neutral")}:       E poi si ricomincia.
                
        }

           -> helping_mentor.top



=== little_storylets
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp mentorName = translator(mentor_ActualName)
    

    {charTag(PG, "neutral")}:                       Vorrei raccontarti una cosa strana.

        * (voices) {player_somethingStrange has strangeVoice}\ {charTag(PG, "neutral")}:         C'è una voce che mi racconta cose.
            
            {charTag(Mentor, "neutral")}:           Voce?
            {charTag(PG, "neutral")}:               Sì.
                                                    Ad esempio mi descrive le piante della serra.
                                                    O i luoghi in cui entro.
            {charTag(Mentor, "neutral")}:           Riscrivere la storie di altre persone richiede una forte empatia.
                                                    Sicuramente quella voce è il tuo modo di capire questo luogo.
            {charTag(Mentor, "hurry")}:             Un intuito latente che ora è più forte.
            {charTag(Mentor, "sad")}:               Meglio della stanchezza dell'essere mentore, fidati.

                ~ player_somethingStrange -= strangeVoice
                -> helping_mentor.top
        
        * (talkingWitch) {player_somethingStrange has strangeVase} \ {charTag(PG, "neutral")}:   Prima ho parlato con un pozzo, in una discarica.
            {charTag(PG, "neutral")}:               Sembra che veda e senta tutto quello che accade qui.
            {charTag(PG, "neutral")}:               E mi ha, anzi, mi hanno chiesto come stavo dopo aver concluso la prima riscrittura.
            {
                - voices:
                {charTag(Mentor, "sad")}:           Stellina, di nuovo con questa voce?
                
                - else:
                {charTag(Mentor, "sad")}:           Senti le voci, stellina?
            }
            {charTag(Mentor, "neutral")}:           Sono in questo posto da non so quanto e non ho mai parlato vasi o altre cose senza occhi e bocca.
            {charTag(Mentor, "bored")}:             E l'idea che qualcosa mi stia spiando mi indispone molto.
            {charTag(TheWitch, witch_state())}: Noi non spiamo, noi siamo.
            {charTag(Mentor, "neutral")}:           L'unica cosa che ha voce sono le persone che arrivano per chiedere il nostro aiuto.
                                                    Il tuo aiuto.
            {charTag(Mentor, "sad")}:               Se senti ancora una volte delle voci, prenditi un po' di riposo.

                ~ player_somethingStrange -= strangeVase
                -> helping_mentor.top
        
        * {player_somethingStrange has strangeFrog} \ {charTag(PG, "neutral")}:  C'è una rana blu, e parla.
            {
                - are_entities_together_in(Mentor, PG, Pond):
                {charTag(Mentor, "bored")}:         L'ho notata.

                    {
                        - grimoire_fifthChar has grimMentorFranco: 
                                                    E dopo averci parlato, non mi ispira molta fiducia.
                    {
                        - are_two_entities_together(Franco, PG):
                            {charTag(Franco, "{portrait_Franco()}")}:       Hai provata ad espirarla?
                                                                            Una volta ho espirato un insetto così grosso che ha fatto un rumore come di botto.
                                                                            E mi sono spaventato per il rumore.
                                                                            E a quel punto l'insetto si è spaventato a sua volta ed è finito nel naso di Tullio.
                                                                            Credo sia ancora lì dentro.
                            {charTag(Mentor, "neutral")}:                   Appunto.
                    }
                    }

                {charTag(Mentor, "sad")}:           Quando ne ho sentito parlare da {charNameTwo}, ho pensato fosse un'altra bugia.
                    
                {
                    - are_two_entities_together(SecondCharacter, PG):
                    {charTag(SecondCharacter, "angry")}:     Ehi!
                }

                {charTag(Mentor, "neutral")}:       Invece me ne sono ricreduta.
                
                - else:
                    {
                        - grimoire_fifthChar has grimMentorFranco:
                        {charTag(Mentor, "neutral")}: Ci ho parlato prima. E non mi ispira molta fiducia.
                        - else: 
                        {charTag(Mentor, "neutral")}:  Ho notato.    
                    }
                    {charTag(Mentor, "neutral")}:       Molte cose qui stanno cambiando dal tuo arrivo.
                    {charTag(Mentor, "sad")}:           Immagino che una rana parlante non sia la cosa più assurda che potesse capitarci, vero?  
            }
                ~ player_somethingStrange -= strangeFrog
                -> helping_mentor.top
        
        * {player_somethingStrange has strangeGrimoire}\ {charTag(PG, "neutral")}:  Il libro che mi hai dato si aggiorna da solo.

            {charTag(PG, "neutral")}:                   E raccoglie informazioni su questo posto.
            {
                - grimoire_witch has grimWitchBook:
                                                        E {witch_actualName} dice che è per via di una magia.
                    {
                        - not talkingWitch:
                        {charTag(Mentor, "sad")}:       E chi sarebbe {witch_actualName}?
                        {charTag(Mentor, "bored")}:     No anzi, non voglio saperlo.
                    } 
            }

            {charTag(Mentor, "sad")}:                   E cosa dice di me?
            {charTag(Mentor, "neutral")}:               No, non voglio saperlo.
                                                        O dovrei?
            {charTag(Mentor, "bored")}:                 E se sa cosa che io no so?
            {charTag(Mentor, "sad")}:                   O che non voglio sapere?                                            
            {charTag(Mentor, "neutral")}:               Usalo con saggezza, {player_name}.
            {charTag(Mentor, "hurry")}:                 E fidati solo di me.

                ~ player_somethingStrange -= strangeGrimoire
                -> helping_mentor.top

   
        * (mentor) {player_somethingStrange has strangeMentor}\ {charTag(PG, "neutral")}:         Prima Franco ha detto di non aver mai incontrato nessun mentore da queste parti.
            
            {charTag(Mentor, "neutral")}:           Franco?
                                                    Franco è anche convinto che la luna gli parli!
                                            {
                                                - grimoire_fifthChar has grimMentorWitchOne:
                                                    {charTag(Mentor, "sorry")}:           Cosa che poi non si è rivelata così assurda.
                                                
                                                - else:
                                                        {
                                                        - are_two_entities_together(Franco, PG):
                                                            {charTag(Franco, "{portrait_Franco()}")}:      Ma è vero!

                                                            - else:
                                                            {charTag(TheWitch, "{witch_state()}")}:          <i>E Franco ha ragione.</i>
                                                        }    
                                            }            
            {charTag(PG, "sad")}:                   Non mi fraintendere, ma ricordati chi ti sta aiutando dal tuo arrivo.
                                                    Chi ti ha aperto la serra.
                                                    Chi è qui ad ascoltare le cose strane che racconti.
            {charTag(Mentor, "neutral")}:           Farei tutto questo, se fossi una persona diversa?
                                                    Se il mio unico scopo non fosse quello di aiutarti?
            {charTag(Mentor, "sad")}:               Mi prenderei tutta questa stanchezza senza motivo?

                ~ player_somethingStrange -= strangeMentor
                -> helping_mentor.top

                    
        + \ {charTag(PG, "neutral")}:            Ripensandoci, non ho nulla di nuovo da dire.
            -> helping_mentor.top    

 === mindfulness
 //Randomizzo i contenuti e nel caso posso usare anche qui i trigger warning.
 LIST mentor_actualMindfulness = firstMind, secondMind, thirdMind, fourthMind, fifthMind
 VAR mentor_lastMindfulness = 0
 VAR mentor_pauseMindfulness = 10
 
 {
    - mentor_lastMindfulness > 0:
        {
            - mentor_actualMindfulness has firstMind:
                -> one
            - mentor_actualMindfulness has secondMind:
                -> two
            - mentor_actualMindfulness has thirdMind:
                -> three
            - mentor_actualMindfulness has fourthMind:
                -> four
            - mentor_actualMindfulness has fifthMind:
                -> five
        }
    
    - else:
        ~ mentor_lastMindfulness = mentor_pauseMindfulness
        ~ mentor_actualMindfulness = ()
        
         {shuffle:
            - 
                ~  mentor_actualMindfulness += firstMind
                -> one
            - 
                ~  mentor_actualMindfulness += secondMind
                -> two
            - 
                ~  mentor_actualMindfulness += thirdMind
                -> three
            - 
                ~  mentor_actualMindfulness += fourthMind
                -> four
            - 
                ~  mentor_actualMindfulness += fifthMind
                -> five               
         }
 
 }
 
    = one
     ~ temp mentorName = translator(mentor_ActualName)
     
        {charTag(Mentor, "neutral")}:           Quando inizio a pensare molto, ma molto molto, una cosa che mi aiuta è concentrarmi su quello che mi circonda.
                                                Inizio ad osservare un oggetto e a dirmi dentro la testa cosa è.
                                                Una sedia, uno sgabello, un frigorifero, un tostapane, una lavatrice.
                                                Se la confusione è molta, cerco di partire con il generico, come <i>elettrodomestico</i>, e poi man mano che divento più concentrata inizio a scendere nel dettaglio.
                                                Se ci sono poche cose, provo a descrivere le parti di un oggetto.
                                                O del mio corpo.
                                                Cosa che evito nei giorni in cui non mi piaccio.
                                                Questa cosa funziona benissimo anche con gli odori, o i suoni, o il tatto, o persino il gusto.
                                                Ti aiuta a tornare coi piedi per terra.
            ->->
    
    = two
     ~ temp mentorName = translator(mentor_ActualName)
     
        {charTag(Mentor, "neutral")}:           Ci sono volte in cui mi focalizzo solo sulle cose che non vanno.
                                                Una cosa che mi aiuta in queste situazioni è puntare una sveglia ogni due ore.
                                                E quando la sveglia suona provo a chiedermi:
                                                Come mi sto sentendo?
                                                Cosa sto facendo?
                                                Perché mi fa sentire così?
                                                Se mi rendo conto di star provando una emozione negativa, posso capire meglio cosa l'ha scatenata.
                                                Ma spesso mi rendo conto di essere serena in quel momento, o per lo meno tranquilla.
                                                E a quel punto capisco che non è vero che sto male tutto il giorno, ma che ci sono delle cose che non mi fanno stare bene.
        ->->
    
    = three
     ~ temp mentorName = translator(mentor_ActualName)
     
        {charTag(Mentor, "neutral")}:           Un tempo conoscevo una ragazza che soffriva di attacchi d'ansia e che mi ha dato una dritta che puoi applicare ovunque. 
                                                Se il pensiero si inceppa su qualcosa, prova a stringere con forza degli oggetti che hai vicino.
                                                Può essere il bracciolo di una sedia.
                                                Il tavolo.
                                                Il palo sull'autobus.
                                                Stringi e concentrati sulla sensazione.
                                                Questo ti permette di tornare in contatto col tuo corpo.
            ->->
    
    = four
     ~ temp mentorName = translator(mentor_ActualName)
     
        {charTag(Mentor, "neutral")}:           Il mio migliore amico è il body scan.
                                                Lo faccio al risveglio tra gli arbusti della foresta.
                                                Prima di tutto mi stendo, comoda, e faccio qualche respiro profondo.
                                                Poi inizio a concentrarmi sulla punta di uno dei piedi, e da lì sposto la concentrazione lungo tutto il piede, la caviglia, il polpaccio, il ginocchio, il quadricipite.
                                                Poi faccio la stessa cosa con l'altra gamba.
                                                E a quel punto mi sposto sul ventre, i glutei, i muscoli lombari, i dorsali, le spalle e via di seguito fino alla testa.
                                                Anche se conosco persone che preferiscono partire dalla testa e arrivare ai piedi.
                                                L'importante è che per tutto il processo ascolti quella parte del corpo senza giudicare, senza cercare di cambiarla.
                                                Respiri, accogli dolori e morbidezze, e quando te la senti, cambi area.
                                                Anche solo a parlarne mi sento già più rilassata.
            ->->
        
    = five
     ~ temp mentorName = translator(mentor_ActualName)
     
        {charTag(Mentor, "neutral")}:           Non so se ti capita di avere l'addome contratto.
                                                Per molte persone quell'area, e il diaframma in particolare, accumula un sacco di tensione e preoccupazione.
                                                Un modo per allentarla è prendere un suono che ti piace, una vocale, un <i>Aum</i>, tutte le vocali, e iniziare a ripeterle, con calma.
                                                Lasciando che quel suono scenda e scenda e scenda dalla gola al petto, dal petto al diaframma.
                                                Aiutandoti così a rilassare l'area.
                                                E a respirare meglio.
            ->->     

