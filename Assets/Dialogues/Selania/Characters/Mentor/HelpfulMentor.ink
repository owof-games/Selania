=== helping_mentor
{debug: passo da helping_mentor}
~ temp charNameOne = translator(firstChar_ActualName)
~ temp charNameTwo = translator(secondChar_ActualName)
~ temp charNameThree = translator(thirdChar_ActualName)
~ temp charNameFour= translator(fourthChar_ActualName)


{
- thirdChar_storyStatus != story_storyRemote:
{charTag(FifthCharacter, "neutral")}:                  {player_name}!

- else:
{charTag(FifthCharacter, "bored")}:                     ...

}


- (saluto)

{
- thirdChar_storyStatus != story_storyRemote:
    {shuffle:
    //Sulla cucina
    - {player_accessiblePlaces has Kitchen:Non sono mai stata una grande cuoca. Ma amo mangiare.|->saluto}
    - {player_accessiblePlaces has Kitchen:Il cibo è un momento di unione anche con l'essere che l'ha generato.|->saluto}
    - {player_accessiblePlaces has Kitchen:La luce che si riflette sull'acqua della cucina è appagante.|->saluto}
    - {player_accessiblePlaces has Kitchen:Gli alberi della cucina sono diversi da quelli della foresta, sono più ampi e muschiosi.|->saluto}
    - {player_accessiblePlaces has Kitchen:Dalla cucina arrivano sempre profumi insoliti. Ve la cavate tuttə molto bene!|->saluto}

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
- else:
{charTag(FifthCharacter, "bored")}:                                                     ???
}




- (top)
    {
    - thirdChar_storyStatus != story_storyRemote:
    {charTag(FifthCharacter, "hurry")}:                                                 Come posso esserti utile, {player_pronoun has him: amico mio|{player_pronoun has her: amica mia|amicə miə}}?

    - else:
    {charTag(FifthCharacter, "bored")}:                                                 Dimmi.
    }


    
        + \ {charTag(PG, "neutral")}:                                                   Avrei bisogno di una mano.
            -> support
        
        + {player_somethingStrangeTalkable != ()}\ {charTag(PG, "neutral")}:            Mi è successa una cosa strana.
            -> little_storylets

        + {grimoire_fifthChar has grimMentorIntro}\ {charTag(PG, "neutral")}:           Mi è scomparso il grimorio, potresti riattivarmelo?
            ~ grimoire_isEnabled = true
        {charTag(FifthCharacter, "hurry")}:                                             Fatto.     
            -> top

        + \ {charTag(PG, "neutral")}:                                                   Ho cambiato idea.
            -> notification_system ->
            -> main
              

/* ---------------------------------

    Mentore utile: diramazioni dialoghi
       
 ----------------------------------*/
 
 === support
    
    - (top)
    {
    - thirdChar_storyStatus != story_storyRemote:
    {charTag(FifthCharacter, "hurry")}:                                         Hai bisogno dei miei consigli tesoro?

    - else:
    {charTag(FifthCharacter, "bored")}:                                         Vai.
    }
    
        + {tutorial_mentorInkAndYouAreARewriter && tutorial_MentorTutorial == true}\ {charTag(PG, "neutral")}:     Mi ripeteresti cosa devo fare?
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
    {
    - thirdChar_storyStatus != story_storyRemote:
    {charTag(FifthCharacter, "hurry")}:                                         Come posso aiutarti?

    - else:
    {charTag(FifthCharacter, "bored")}:                                         Vai.
    }
            
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


        {
            - grimoire_appendices has grimChoicesMentor:
                {charTag(FifthCharacter, "neutral")}:                                   La prima cosa da fare è: conquistare la <b><i>fiducia</b></i> della persona che devi aiutare.
                                                                                        Ci <b><i>parli</b></i>, cerchi di capire di cosa ha bisogno e quali sono le risposte che le piacciono.

        }

        {
            - grimoire_appendices has grimInkMentor:
                {charTag(FifthCharacter, "hurry")}:                                     Fino a quando non è pronta per una <b><i>riscrittura</b></i>
                {charTag(FifthCharacter, "neutral")}:                                   A quel punto inizi i tuoi <b><i>riscritture</b></i>: riprendi eventi della sua storia e la aiuti a guardarli sotto una luce diversa.
                                                                                        Più inchiostro hai, più riscritture puoi fare.

        }

        {
            - grimoire_appendices has grimGreenhouseMentor && grimoire_appendices has grimInkMentor:
                {charTag(FifthCharacter, "hurry")}:                                     Per aumentare l'inchiostro puoi fare cose diverse.
                                                                                        Come dare il giusto dono.
                                                                                        E i doni migliori crescono nella serra.

        }

        {
            - grimoire_appendices has grimFirstOpenKitchen:
                {charTag(FifthCharacter, "neutral")}:                                   E se mangiate qualcosa assieme, magari riesci anche a capire se stai o meno conquistando la fiducia di quella persona.
                
        }

        {
            - grimoire_appendices has grimRewritingMentor:
                {charTag(FifthCharacter, "hurry")}:                                     A fine riscrittura, in base alle cose che avrai detto, la persona sceglierà il suo <b><i>nuovo nome</b></i>.
                {charTag(FifthCharacter, "neutral")}:                                   E poi si ricomincia.
                
        }

           -> helping_mentor.top



=== little_storylets
    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    
    

    {charTag(PG, "neutral")}:                                                                       Vorrei raccontarti una cosa strana.


        * (fugaBoccale) {player_somethingStrangeTalkable has strangeBoccale}\ {charTag(PG, "neutral")}:     {charNameThree} se ne è andato arrabbiato e senza farsi riscrivere.
            {charTag(FifthCharacter, "bored")}:                                                     NON NOMINARLO MAI PIù!
                                                                                                    MAI PIù, CAPITO? 
                ~ player_somethingStrangeTalkable -= strangeBoccale
                -> helping_mentor.top

        * (voices) {player_somethingStrangeTalkable has strangeVoice}\ {charTag(PG, "neutral")}:            C'è una voce che mi dice cose nella mia testa.
            
            {charTag(FifthCharacter, "neutral")}:                                                   Voce?
            {charTag(PG, "neutral")}:                                                               Sì.
                                                                                                    Ad esempio mi descrive le piante della serra.
                                                                                                    O i luoghi in cui entro.
            {charTag(FifthCharacter, "neutral")}:                                                   Riscrivere la storie di altre persone richiede una forte empatia.
                                                                                                    Sicuramente quella voce è il tuo modo di capire questo luogo.
            {charTag(FifthCharacter, "hurry")}:                                                     Un intuito latente che ora è più forte.
            {charTag(FifthCharacter, "sad")}:                                                       Meglio della stanchezza dell'essere mentore, fidati.

                ~ player_somethingStrangeTalkable -= strangeVoice
                -> helping_mentor.top
        
        * (talkingWitch) {player_somethingStrangeTalkable has strangeVase} \ {charTag(PG, "neutral")}:      Prima ho parlato con un pozzo, in una discarica.
            {charTag(PG, "neutral")}:                                                               Sembra che veda e senta tutto quello che accade qui.
            {charTag(PG, "neutral")}:                                                               E mi ha, anzi, mi hanno chiesto come stavo dopo aver concluso la prima riscrittura.
            {
                - voices:
                {charTag(FifthCharacter, "sad")}:                                                   Stellina, di nuovo con questa voce?
                
                - else:
                {charTag(FifthCharacter, "sad")}:                                                   Senti le voci, stellina?
            }
            {charTag(FifthCharacter, "neutral")}:                                                   Sono in questo posto da non so quanto e non ho mai parlato vasi o altre cose senza occhi e bocca.
            {charTag(FifthCharacter, "bored")}:                                                     E l'idea che qualcosa mi stia spiando mi indispone molto.
            {charTag(TheWitch, witch_state())}:                                                     Noi non spiamo, noi siamo.
            {charTag(FifthCharacter, "neutral")}:                                                   L'unica cosa che ha voce sono le persone che arrivano per chiedere il nostro aiuto.
                                                                                                    Il tuo aiuto.
            {charTag(FifthCharacter, "sad")}:                                                       Se senti ancora una volte delle voci, prenditi un po' di riposo.

                ~ player_somethingStrangeTalkable -= strangeVase
                -> helping_mentor.top
        
        * {player_somethingStrangeTalkable has strangeFrog} \ {charTag(PG, "neutral")}:                     C'è una rana blu, e parla.
            {
                - are_entities_together_in(Mentor, PG, Pond):
                {charTag(FifthCharacter, "bored")}:                                                 L'ho notata.

                    {
                        - grimoire_fifthChar has grimMentorFranco: 
                                                                                                    E dopo averci parlato, non mi ispira molta fiducia.
                    {
                        - are_two_entities_together(Franco, PG):
                            {charTag(Franco, "neutral")}:                                           Hai provata ad espirarla?
                                                                                                    Una volta ho espirato un insetto così grosso che ha fatto un rumore come di botto.
                                                                                                    E mi sono spaventato per il rumore.
                                                                                                    E a quel punto l'insetto si è spaventato a sua volta ed è finito nel naso di Tullio.
                            {charTag(Franco, "question")}:                                          Credo sia ancora lì dentro.
                            {charTag(FifthCharacter, "neutral")}:                                   Appunto.
                    }
                    }

                {charTag(FifthCharacter, "sad")}:                                                   Quando ne ho sentito parlare da {charNameTwo}, ho pensato fosse un'altra bugia.
                    
                {
                    - are_two_entities_together(SecondCharacter, PG):
                    {charTag(SecondCharacter, "angry")}:                                            Ehi!
                }

                {charTag(FifthCharacter, "neutral")}:                                               Invece me ne sono ricreduta.
                
                - else:
                    {
                        - grimoire_fifthChar has grimMentorFranco:
                        {charTag(FifthCharacter, "neutral")}:                                       Ci ho parlato prima. E non mi ispira molta fiducia.
                        - else: 
                        {charTag(FifthCharacter, "neutral")}:                                       Ho notato.    
                    }
                    {charTag(FifthCharacter, "neutral")}:                                           Molte cose qui stanno cambiando dal tuo arrivo.
                    {charTag(FifthCharacter, "sad")}:                                               Immagino che una rana parlante non sia la cosa più assurda che potesse capitarci, vero?  
            }
                ~ player_somethingStrangeTalkable -= strangeFrog
                -> helping_mentor.top
        
        * {player_somethingStrangeTalkable has strangeGrimoire}\ {charTag(PG, "neutral")}:                  Il libro che mi hai dato si aggiorna da solo.

            {charTag(PG, "neutral")}:                                                               E raccoglie informazioni su questo posto.
            {
                - grimoire_witch has grimWitchBook:
                                                                                                    E {witch_actualName} dice che è per via di una magia.
                    {
                        - not talkingWitch:
                        {charTag(FifthCharacter, "sad")}:                                           E chi sarebbe {witch_actualName}?
                        {charTag(FifthCharacter, "bored")}:                                         No anzi, non voglio saperlo.
                    } 
            }

            {charTag(FifthCharacter, "sad")}:                                                       E cosa dice di me?
            {charTag(FifthCharacter, "neutral")}:                                                   No, non voglio saperlo.
                                                                                                    O dovrei?
            {charTag(FifthCharacter, "bored")}:                                                     E se sa cosa che io no so?
            {charTag(FifthCharacter, "sad")}:                                                       O che non voglio sapere?                                            
            {charTag(FifthCharacter, "neutral")}:                                                   Usalo con saggezza, {player_name}.
            {charTag(FifthCharacter, "hurry")}:                                                     E fidati solo di me.

                ~ player_somethingStrangeTalkable -= strangeGrimoire
                -> helping_mentor.top

   
        * (mentor) {player_somethingStrangeTalkable has strangeMentor}\ {charTag(PG, "neutral")}:           Prima Franco ha detto di non aver mai incontrato nessun mentore da queste parti.
            
            {charTag(FifthCharacter, "neutral")}:                                                   Franco?
                                                                                                    Franco è anche convinto che la luna gli parli!
            {
                - grimoire_fifthChar has grimMentorWitchOne:
                    {charTag(FifthCharacter, "sorry")}:                                             Cosa che poi non si è rivelata così assurda.
                
                - else:
                        {
                        - are_two_entities_together(Franco, PG):
                            {charTag(Franco, "neutral")}:                                           Ma è vero!

                            - else:
                            {charTag(TheWitch, "{witch_state()}")}:                                 <i>E Franco ha ragione.</i>
                        }    
            }            
            {charTag(PG, "sad")}:                                                                   Non mi fraintendere, ma ricordati chi ti sta aiutando dal tuo arrivo.
                                                                                                    Chi ti ha aperto la serra.
                                                                                                    Chi è qui ad ascoltare le cose strane che racconti.
            {charTag(FifthCharacter, "neutral")}:                                                   Farei tutto questo, se fossi una persona diversa?
                                                                                                    Se il mio unico scopo non fosse quello di aiutarti?
            {charTag(FifthCharacter, "sad")}:                                                       Mi prenderei tutta questa stanchezza senza motivo?

                ~ player_somethingStrangeTalkable -= strangeMentor
                -> helping_mentor.top

                    
        + \ {charTag(PG, "neutral")}:                                                               Ripensandoci, non ho nulla di nuovo da dire.
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
     
     
        {charTag(FifthCharacter, "neutral")}:           Quando inizio a pensare molto, ma molto molto, una cosa che mi aiuta è concentrarmi su quello che mi circonda.
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
     
     
        {charTag(FifthCharacter, "neutral")}:           Ci sono volte in cui mi focalizzo solo sulle cose che non vanno.
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
     
     
        {charTag(FifthCharacter, "neutral")}:           Un tempo conoscevo una ragazza che soffriva di attacchi d'ansia e che mi ha dato una dritta che puoi applicare ovunque. 
                                                        Se il pensiero si inceppa su qualcosa, prova a stringere con forza degli oggetti che hai vicino.
                                                        Può essere il bracciolo di una sedia.
                                                        Il tavolo.
                                                        Il palo sull'autobus.
                                                        Stringi e concentrati sulla sensazione.
                                                        Questo ti permette di tornare in contatto col tuo corpo.
            ->->
    
    = four
     
     
        {charTag(FifthCharacter, "neutral")}:           Il mio migliore amico è il body scan.
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
     
     
        {charTag(FifthCharacter, "neutral")}:           Non so se ti capita di avere l'addome contratto.
                                                        Per molte persone quell'area, e il diaframma in particolare, accumula un sacco di tensione e preoccupazione.
                                                        Un modo per allentarla è prendere un suono che ti piace, una vocale, un <i>Aum</i>, tutte le vocali, e iniziare a ripeterle, con calma.
                                                        Lasciando che quel suono scenda e scenda e scenda dalla gola al petto, dal petto al diaframma.
                                                        Aiutandoti così a rilassare l'area.
                                                        E a respirare meglio.
            ->->     

