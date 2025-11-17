/* ---------------------------------

    Mentore utile: diramazioni dialoghi
       
 ----------------------------------*/
 === support
    ~ temp charNameFive = translator(fifthCharacterState)
    - (top)
    Hai bisogno dei miei consigli?#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_hurry
        + {about_ink_usage}[Mi ripeteresti cosa devo fare?]
            -> to_do
        + [Ho una domanda su un luogo.]
            -> tutorial
        + [C'è una cosa che mi riguarda.]
            -> myself
        + [Vorrei consigli su come stare meglio.]
            -> mindfulness -> support
        + {secondStory == story_storyEnded && firstStory == story_storyEnded} [Mi ridaresti il codice della demo?]
            -> ending_demo.repeat
        + [Vorrei parlare d'altro.]
            -> talk_with_mentor
        -
            -> top   

    = myself
    ~ temp charNameFive = translator(fifthCharacterState)
    C'è qualcosa che posso fare per aiutarti?#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
        + [Vorrei cambiare il mio nome.]
                -> name_choice -> support
        + [Vorrei cambiare i miei pronomi.]
                -> gender -> support
        + [Sono a posto così, grazie.]
                -> talk_with_mentor
 
 

/* ---------------------------------

    Mentore utile: contenuti
       
 ----------------------------------*/

=== tutorial
~ temp charNameOne = translator(firstCharacterState)
~ temp charNameTwo = translator(secondCharacterState)
~ temp charNameThree = translator(thirdCharacterState)
~ temp charNameFour= translator(fourthCharacterState)
~ temp charNameFive = translator(fifthCharacterState)

//Strutturare come wave sintetica?
    Ecco i luoghi che puoi visitare in questo momento.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
    Su quali vorresti avere informazioni?

- (top)
    + [Sulla stazione.]
            Intendi il luogo dove passo ore a spalare neve?#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_hurry
            La stazione, ad est della foresta, è il posto dove approdano le nuove persone.
            È anche il luogo attraverso cui potrai raggiungerci.
            O da cui andartene, quando vorrai.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_sorry
                -> top

    + {greenhouse_entry_check}[Sulla serra.]
            La serra è il mio posto preferito: ho sempre amato coltivare fiori e piante!#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_hurry
            Anche se lì dentro cresce della roba molto strana.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_sorry
            La serra è un piccolo posto di meditazione.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
            Se non sta crescendo nulla, puoi provare a seguire le sue suggestioni.
            Col tempo qualcosa crescerà, e a quel punto forse avrai anche una risposta a una domanda che non sapevi di doverti fare.
            Tipo: come fa {charNameFive} a tenere i vetri sempre così puliti?#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_hurry
                -> top

    + {forest}[Sulla foresta.]
            La foresta è un po' il nostro posto di passaggio.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
            Non ho idea di chi abbia messo la panchina, sinceramente.
            E tenerla pulita tutti i giorni è una gran fatica.
            E quella pianta, quella cosa che è nel mezzo, non ho ancora capito come farla rifiorire.
            E questo mi lascia molto frustrata.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_bored
            -> top
    
    + {pond}[Sullo stagno.]
            Informazioni sullo stagno.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
            -> top    
            
    + {(player_accessiblePlaces has Library) or (player_accessiblePlaces has Kitchen) or (player_accessiblePlaces has Nest)}[Sono altri i luoghi di cui vorrei parlare.]
        -> second_top
    
    + [Voglio parlare d'altro.]
        -> talk_with_mentor  

    
- (second_top)    
    + {player_accessiblePlaces has Library}[Sulla biblioteca.]
            La biblioteca è un posto... un posto.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
            Ci sono molti racconti, ma chi ha il tempo di leggerli?#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_hurry
            Con tutta quella polvere che raccolgono, poi.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_sad
            Però un paio di volte ho usato la poltrona per fare del body scan, e non è stato male.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
            Mi sono quasi addormentata.
            Quasi.
                -> second_top
            
    + {player_accessiblePlaces has Kitchen}[Sulla cucina.]
            La cucina è un posto poco igienico.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_bored
            No, ricominciamo.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_sorry
            La cucina è un posto dove condividere un po' di intimità con una persona.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
            Provare a conoscerla meglio, provare a farti conoscere meglio, mentre cucinate qualcosa.
            E, magari, scoprire cosa stai sbagliando a dirle, e riuscire a conquistare prima la sua fiducia.
                -> second_top

    + {player_accessiblePlaces has Nest}[Sul nido.]
            Il nido non mi piace.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_bored
            Quello che accade lì è manipolazione, comunque tu la voglia mettere.
            E quindi è qualcosa di sbagliato.
            Non è un caso che sia l'unico luogo senza istruzioni, no?
                -> second_top
    
    + [Vorrei parlare di un altro luogo.]
            -> top
    
    + [Vorrei parlare di qualcosa di diverso.]
        -> talk_with_mentor
    -

    -> talk_with_mentor

=== to_do
~ temp charNameFive = translator(fifthCharacterState)

        {about_ink_usage:La prima cosa da fare è: conquistare la <b><i>fiducia</b></i> della persona che devi aiutare.}#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
        {about_ink_usage:Ci <b><i>parli</b></i>, cerchi di capire di cosa ha bisogno e quali sono le risposte che le piacciono.}
        {questions: Fino a quando non è pronta per una <b><i>riscrittura</b></i>}
        {questions: A quel punto inizi i tuoi <b><i>riscritture</b></i>: riprendi eventi della sua storia e la aiuti a guardarli sotto una luce diversa.}
        {questions: Più inchiostro hai, più riscritture puoi fare.}
        {about_greenhouse: Per aumentare l'inchiostro puoi fare cose diverse. Come il giusto dono.}
        {about_kitchen: E se mangiate qualcosa assieme, magari riesci anche a capire se stai o meno conquistando la fiducia di quella persona.}
        {questions: Così, a fine riscrittura, in base alle cose che avrai detto, la persona sceglierà il suo <b><i>nuovo nome</b></i>.}
        {questions: E poi si ricomincia.}
           -> talk_with_mentor


 === mindfulness
 //Randomizzo i contenuti e nel caso posso usare anche qui i trigger warning.
 LIST actualMindfulness = firstMind, secondMind, thirdMind, fourthMind, fifthMind
 VAR lastMindfulness = 0
 VAR pauseMindfulness = 10
 
 {
    - lastMindfulness > 0:
        {
            - actualMindfulness has firstMind:
                -> one
            - actualMindfulness has secondMind:
                -> two
            - actualMindfulness has thirdMind:
                -> three
            - actualMindfulness has fourthMind:
                -> four
            - actualMindfulness has fifthMind:
                -> five
        }
    
    - else:
        ~ lastMindfulness = pauseMindfulness
        ~ actualMindfulness = ()
        
         {shuffle:
            - 
                ~  actualMindfulness += firstMind
                -> one
            - 
                ~  actualMindfulness += secondMind
                -> two
            - 
                ~  actualMindfulness += thirdMind
                -> three
            - 
                ~  actualMindfulness += fourthMind
                -> four
            - 
                ~  actualMindfulness += fifthMind
                -> five               
         }
 
 }
 
    = one
     ~ temp charNameFive = translator(fifthCharacterState)
     
        Quando inizio a pensare molto, ma molto molto, una cosa che mi aiuta è concentrarmi su quello che mi circonda.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
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
     ~ temp charNameFive = translator(fifthCharacterState)
     
        Ci sono volte in cui mi focalizzo solo sulle cose che non vanno.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
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
     ~ temp charNameFive = translator(fifthCharacterState)
     
         Un tempo conoscevo una ragazza che soffriva di attacchi d'ansia e che mi ha dato una dritta che puoi applicare ovunque.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral 
         Se il pensiero si inceppa su qualcosa, prova a stringere con forza degli oggetti che hai vicino.
         Può essere il bracciolo di una sedia.
         Il tavolo.
         Il palo sull'autobus.
         Stringi e concentrati sulla sensazione.
         Questo ti permette di tornare in contatto col tuo corpo.
            ->->
    
    = four
     ~ temp charNameFive = translator(fifthCharacterState)
     
        Il mio migliore amico è il body scan.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
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
     ~ temp charNameFive = translator(fifthCharacterState)
     
        Non so se ti capita di avere l'addome contratto.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthChar_InkLevel)} #inkB:{ink_tag_b(fifthChar_InkLevel)}  #inkC:{ink_tag_c(fifthChar_InkLevel)}  #inkD:{ink_tag_d(fifthChar_InkLevel)} #portrait:mentore_neutral
        Per molte persone quell'area, e il diaframma in particolare, accumula un sacco di tensione e preoccupazione.
        Un modo per allentarla è prendere un suono che ti piace, una vocale, un <i>Aum</i>, tutte le vocali, e iniziare a ripeterle, con calma.
        Lasciando che quel suono scenda e scenda e scenda dalla gola al petto, dal petto al diaframma.
        Aiutandoti così a rilassare l'area.
        E a respirare meglio.
            ->->     

