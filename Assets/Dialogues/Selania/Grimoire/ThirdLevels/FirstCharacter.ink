=== grimoire_first_character_conversation
    @grimoireText #style:character #icon:{translator(firstChar_ActualName)} #title:{translator(firstChar_ActualName)} #description:{grimoire_characterDescription(FirstCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


    //Main story
    {
        - grimoire_firstChar has grimFirstCharOne:
            C'è questa ragazza, si chiama {charNameOne}. Ha iniziato la conversazione chiedendo a {player_name} dove fosse lə suə migliore amə, Talco. Poi ha accennato al suo ragazzo, Ennio, e a un risotto allucinogeno coi funghi. E quando è {tutorial_mentorTalkingChoiceRelationship: è arrivata {charNameFive}|arrivato un fiore parlante} si è convinta che fosse un trip, e se ne è andata a cercare dell'acqua.
    }

    {
        - grimoire_firstChar has grimFirstCharTwo:
            {charNameOne} sta iniziando a godersi il silenzio di questo luogo. Ha smesso di credere che sia una allucinazione, e si sta chiedendo se le coinquiline siano preoccupate. O se le colleghe siano nella merda per la sua assenza. E poi ha detto che vorrebbe comporre qualcosa, approfittando della situazione, perché sono settimane che riesce a creare nulla.
    }

    {
        - grimoire_firstChar has grimFirstCharThree:
            {charNameOne} ha parlato di fiducia, e in particolare del rapporto con Talco, che lə ha permesso di uscire da un brutto film mentale per imparare a guardare il mondo in modo diverso, tipo stendendosi in piazza o facendo sentire le persone anziane, importanti e ascoltate.
    }

    {
        - grimoire_firstChar has grimFirstCharFour:
            {charNameOne} ha raccontato delle dinamiche a lavoro, e di quando con le sue colleghe si è rifiutata si servire al ristorante un tizio di una compagnia petrolifera. E che ora stanno provando a creare un sindacato, anche se la situazione è incasinata perché hanno contratti di merda, ma sente il bisogno di fare qualcosa di grande.
    } 

    {
        - grimoire_firstChar has grimFirstCharFive:
            {charNameOne} si è fatta delle domande su cosa sia casa, e sul suo rapporto con Ennio. Si chiede se Ennio, il fidanzato, possa essere il suo rifugio. Lo vede come un tipo ordinato, coi suoi ritmi un po' pedanti, e solido. Quando si è messa con lui, pensava che una persona così solida le avrebbe permesso di svolazzare dentro i suoi casini. Ora si chiede se lui non la stia ancorando a terra.
    } 

    {
        - grimoire_firstChar has grimFirstCharSix:
            {charNameOne} ha parlato della sua famiglia, quella d'adozione: le ragazze con cui vive. Hanno creato assieme un gruppo, La Rifugia, che praticamente è la sua casa dove ospitano persone che hanno bisogno di un tetto, fanno cose con associazioni migranti, proteste, raccolte fondi. E ha detto che l'arte può fare tanto per cambiare le cose. E che vorrebbe scrivere qualcosa così forte da spazzare tutta questa merda.
    }

    {
        - grimoire_firstChar has grimFirstCharSeven:
            Per la prima volta {charNameOne} ha parlato del suo litigio con Talco. Si erano ripromess3 di non aver figli, di non aver ostacoli al loro rapporto. Ma poi Talco è rimastə incintə, e ha deciso di trasferirsi in Islanda con il compagno, Thomas. E ha invitato {charNameOne} con ləi. Ma {charNameOne} è scappata a casa, ha fatto sesso con Ennio e pianto tutta la notte. Ma comunque, mesi dopo, Talco le ha inviato una foto dellə figliə con l'invito di nuovo a vivere con loro.
    } 

    {
        - grimoire_firstChar has grimFirstCharEight:
            {charNameOne} si trova molto bene con la sua famiglia, in particolare con suo padre, con cui può suonare e ubriacarsi. Tornare a vivere giù è una opzione, ma ha la sensazione di rischiare di viverla come un fallimento. E dice che teme di essere la persona che il contesto le permette di essere. Che le piace la persona che è ora, ma che non sa se le piacerebbe essere la persona che sarebbe se tornasse giù.
    }

    {
        - grimoire_firstChar has grimFirstCharNine:
            {charNameOne} ama scrivere comporre la notte, quando a casa tutt3 dormono. E sente la creatività come l'immergersi in un fiume, una "acqua antica" l'ha chiamata, che raccoglie tutte le storie del mondo. E quel posto, quell'acqua la rassicura, perché le dice che i problemi di tutti i giorni sono problemi che come persone abbiamo affrontato miliardi di volte, e siamo ancora qui. Questo le offre speranza.
    }

    {
        - grimoire_firstChar has grimFirstCharTen:
            {charNameOne} ha raccontato che l'amore non è come se lo aspettava. E soprattutto ora che le cose con Ennio si sono fatte solide, sembra un pane caldo, una cosa semplice. Lei ed Ennio passano molto tempo assieme, il sesso con lui è rassicurante. Lui ultimamente è più insofferente, sembra abbia bisogno di passare più tempo con lei. Ma {charNameOne} a volte si chiede se non stia rischiando di ritrovarsi su un treno fermo, senza sapere se sia fermo perché arrivato a destinazione, o perché non ripartirà più.
    }

    {
        - grimoire_firstChar has grimFirstCharEleven:
            Una delle paure di {charNameOne} all'idea di andare a vivere in Islanda con Talco, è che possa diventare una "amica da ricorrenza" per le persone a cui vuol bene. Quel tipo di persona a cui tieni, ma che finisci per sentire una volta ogni tanto, giusto per le feste e i compleanni. E teme che diventare grandi significhi rimanere soli. E lei non vuole stare da sola.
    }
    
    {
        - grimoire_firstChar has grimFirstCharTwelve:
            {charNameOne} ha parlato di sua mamma, e del fatto che litigano perché la madre pensa che lei non sappia accontentarsi. Ma {charNameOne} in realtà non si sente all'altezza delle sue aspettative. Soffre perché prova invidia verso chi ha raggiunto dei traguardi, e a volte vorrebbe avere la loro vita. Per questo si sente una delusione.
    }
    
    //Storylets speciali
    {
        - grimoire_firstChar has grimFirstCharNovel:
            Dopo aver letto <b>Luna vergine</b> di Aza, {charNameOne} ha raccontato di non avere un buon rapporto con la rabbia, ma di aver sentito il desiderio, leggendo il racconto, di morsicare anche lei il tizio, di tirare fuori gli artigli. E per la prima volta ha visto la rabbia non come qualcosa da evitare ma come un segnale, l'allarme che scatta perché è stato superato un confine invalicabile.
    }

    {
        - grimoire_firstChar has grimFirstCharFranco:
            {charNameOne} ha perso la pazienza con Franco La Rana.
    }

    {
        - grimoire_firstChar has grimFirstOpenKitchen:
            {charNameOne} ha trovato una vecchia cucina abbandonata nei pressi dello stagno. Memore delle belle conversazioni avvenute a tavola, ha deciso di sistemarla per {player_name}, in modo che possa avere uno spazio dove conversare con tranquillità con le altre persone.
    }

    {
        - grimoire_firstChar has grimFirstCharKitchenAlone:
            Dopo aver cucinato da sola, {charNameOne} ha parlato a {player_name} del rapporto che ha con sua madre, e di come lei non la capisca fino in fondo. Ma sa che è una donna che parla poco ma ci tiene tanto alle altre persone. Ha raccontato a {player_name} del cibo che ha preparato quando è salita a trovarla, del riordino della casa, del saper dire "Ti voglio bene" solo coi fornelli. E che da quando {charNameOne} questa cosa un po' l'ha portata con sé, cucinando cenoni con le ame.

    }

    //Storylets condivisi

    {
        - grimoire_firstChar has grimFirstThirdChar:
            ~ grimFirstThirdChar_text()
    }

    {
        - grimoire_firstChar has grimFirstSecondChar:
            ~ grimFirstSecondChar_text()
    }
    
    {
        - grimoire_firstChar has grimFirstCharMentor:
            ~ grimFirstCharMentor_text()
    }


    + [Index #bookmark:index]
        -> grimoire
    + [{translator(firstChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_firstCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_first_character_conversation
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_first_character_conversation

->->



=== grimoire_first_character_present
@grimoireText #style:character #icon:{translator(firstChar_ActualName)} #title:{translator(firstChar_ActualName)} #description:{grimoire_characterDescription(FirstCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)



    {
        - frog_first_char_gift != "":
            Franco ha consigliato a {player_name} di regalare a {charNameOne} <b>{ingredientTranslator(frog_first_char_gift)}</b>.

    }


    {
        - firstChar_favouritesGifts has firstChar_giftedObject:
            {player_name} le ha donato <b><i>{ingredientTranslator(firstChar_giftedObject)}</b></i> ed era entusiasta!
        
        - firstChar_goodGifts has firstChar_giftedObject:
            {player_name} le ha donato <b><i>{ingredientTranslator(firstChar_giftedObject)}</b></i> ed ha abbastanza apprezzato.
        
        - else:
            {player_name} le ha donato <b><i>{ingredientTranslator(firstChar_giftedObject)}</b></i> e non ha apprezzato per nulla.
    
    }
        

    + [Index #bookmark:index]
        -> grimoire
    + [{translator(firstChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_firstCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_first_character_present
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_first_character_present
->->


=== grimoire_first_character_kitchen
@grimoireText #style:character #icon:{translator(firstChar_ActualName)} #title:{translator(firstChar_ActualName)} #description:{grimoire_characterDescription(FirstCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


    //Ricetta
    <b>{kitchen_firstCharRecipe}</b>
    Ranacronaca a cura di Franco Lo Chef.

    {kitchen_firstCharRecipeNoun}: l'elemento centrale di questa ricetta. La preparazione richiede una buona dose di manualità, cosa non facile per {charNameOne}, che ha solo delle vibrisse. Il piatto tradizionalmente prevede anche l'aggiunta di olio invernale, ma {player_name} ha optato per della {kitchen_firstCharRecipeAdjective}, rompendo gli schemi e il cuore di zio Gracco. Nel mentre {charNameOne} ha rovesciato una prima bottiglia di vino, cosa non prevista dalla ricetta, per poi riempirla con delle spighe raccolte dalla palude, cosa non prevista dai pesci della palude. Quando ormai il piatto ha iniziato ad addensarsi, il duo ha deciso di rafforzarne il sapore aggiungendo {kitchen_firstCharRecipeComplement}, cosa che i più definirebbero coraggiosa, ma non {player_name}, che ha avuto la capacità di seguire la conversazione con {charNameOne}, e anche di preparare un piatto irripetibile (Tullio dice che è importante che sia irripetibile o a qualcuno viene il mal di pancia). <>
    {
        - kitchen_firstCharExtraIngredient != ():
            Con classe e anche con palestra e presidenza, {player_name} ha infine aggiunto {ingredientTranslator(kitchen_firstCharExtraIngredient)}, perché al girino piace rischiare. <>

        - else:
            Con austerità (che è una cosa che mi ha insegnato Euforbio e ha a che fare con l'Australia) {player_name} ha deciso di non aggiungere altro. <>
    }
    Entrambi i girini sono vivi, e consideriamo questa cosa un vero e proprio successo.

    //Recap cose dette
    {
        - grimoire_firstChar has grimFirstCharKitchenOne:
            Durante l'incontro in cucina, {charNameOne} ha parlato delle sue relazioni. Ha raccontato di aver avuto un'infanzia senza amici, ma con un forte legame con suo padre, che le ha passato l'amore per la musica. E dai suoi ha imparato che le relazioni sono cura e sacrificio. Con l'arrivo al nord ha fatto molte amicizie in Conservatorio, scoprendo però che nei gruppi si litiga, e questa cosa l'ha riempita di conflitti, soprattutto quando il rapporto con un'amica è stato lasciato morire. Crede anche che non ci sia una differenza vera tra amicizia e amore, e che sia un problema per lo più culturale e linguistico, e le complicazioni che nascono vengono dalle parole che ancora mancano per parlare a modo delle relazioni.
    }
    {
        - grimoire_firstChar has grimFirstCharKitchenTwo:
            Durante l'incontro in cucina, {charNameOne} ha parlato del suo desiderio di salvare il mondo. E delle sue difficoltà: non si sente brava a parlare di cose politiche, e La Rifugia è nata perché ha potuto vedere un problema concreto e decidere di fare qualcosa, mentre altre parole cariche la fanno sentire inadeguata. E crede che parte di questa inadeguatezza venga dalle dinamiche social e dal giudizio costante. Ritiene che questo tolga la possibilità di sbagliare, ma gli sbagli creano possibilità impreviste. Come il gorgonzola. E poi ha citato la sua amica Valeria, che dice che l'attivismo deve dare piacere, e che a {charNameOne} piace addormentarsi sapendo di aver portato qualcosa di buono nel mondo. E poi: <i>più gorgonzola, meno poliziott3.</i>
    }
    {
        - grimoire_firstChar has grimFirstCharKitchenThree:
            Durante l'incontro in cucina, {charNameOne} ha parlato del suo rapporto con la creatività. Ha detto che ci sono cose che sa pensare solo quando compone, e per questo è terapeutico. Ma che è preoccupata perché il lavoro la stanca così tanto che a volte non riesce a comporre nulla. E ha paura di non esistere più se dovesse smettere di creare. Creare per lei poi è come gettare un ponte: sia tra le persone che ha conosciuto, sia tra persone che non si conoscono. Trovare l'universale nel particolare, così da potersi ritrovare.
    }

    //Feedback ingrediente extra
    {
        - kitchen_firstCharExtraIngredient == universalIngredient:
            L'aggiunta di {ingredientTranslator(kitchen_firstCharExtraIngredient)} ha ricordato a {charNameOne} i cenoni di Natale quando era piccola e poteva cucinare con sua madre, presa dall'attesa dei regali il giorno dopo.

        - firstChar_favouritesGifts has kitchen_firstCharExtraIngredient:
                {charNameOne} ha apprezzato l'aggiunta di {ingredientTranslator(kitchen_firstCharExtraIngredient)}, e ha raccontato a {player_name} che sa che non è sempre facilissimo capire come ragiona, ma che alla fine basta non riempirla di commenti rigidini e razionali quando si parla, e che si trova più a suo agio con le cose emotive che non con i dati freddi e distaccati.
   
        - firstChar_goodGifts has kitchen_firstCharExtraIngredient:
                {charNameOne} si è sentita confusa dall'aggiunta di {ingredientTranslator(kitchen_firstCharExtraIngredient)}. Ha detto a {player_name} che ci sono cose che si odiano e si amano quando parli con una persona, ma anche cose che stanno un po' nel mezzo, che non ti fanno né impazzire né le odi. Per esempio per lei è quando una persona dice sempre che si risolve tutto facendo cose, prendendo le cose di petto, o con la rabbia. Oppure quando è tutto molto tangibile, concreto, in un mix di lavoro o riposo.

        - kitchen_firstCharExtraIngredient != ():
                {charNameOne} ha detestato l'aggiunta di {ingredientTranslator(kitchen_firstCharExtraIngredient)} nel piatto.
        
        - else:
            Cucinando con {charNameOne}, {player_name} ha deciso di non aggiungere alcun ingrediente aggiuntivo.

    }

    //Recap commento a tavola
    {
        - grimoire_firstChar has grimFirstCharKitchenPositiveReaction:
            Dopo aver cucinato assieme, {charNameOne} ha detto a {player_name} che vedono il mondo in modo simile, e che avere gli stessi valori aiuta a capirsi, a costruire cose assieme, ed è felice di aver conosciuto {player_name}.

        - grimoire_firstChar has grimFirstCharKitchenNegativeReaction:
            Dopo aver cucinato assieme, {charNameOne} ha detto a {player_name} che le cose che sono per lei non sembrano importanti per {player_name}, e viceversa. È come se guardassero il mondo con due paia di occhiali molto diversi.

        - grimoire_firstChar has grimFirstCharKitchenNeutralReaction:
            Dopo aver cucinato assieme, {charNameOne} ha detto a {player_name} che un po' si capiscono e un po' no, ma che è una cosa che ci sta, perché alla fine si stanno giusto conoscendo.

    }
    

    + [Index #bookmark:index]
        -> grimoire
    + [{translator(firstChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_firstCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_first_character_kitchen
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_first_character_kitchen
->->




=== grimoire_first_character_rewrite
@grimoireText #style:character #icon:{translator(firstChar_ActualName)} #title:{translator(firstChar_ActualName)} #description:{grimoire_characterDescription(FirstCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


    {
        - grimoire_firstChar has grimFirstCharProposal:
            Prima della riscrittura, {charNameOne} ha detto a {player_name} di aver capito perché si sia ritrovata con questo nome. Crede che la chitarra sia la cosa media, la cosa che possono fare tutt3. Lei si aspettava grandi cose dalla vita, e invece ora ha una vita comune. E si chiede se questo è il massimo che può aspettarsi dalla vita, e se le cose non andranno sempre peggio.
    } 
    {
        - firstAffinityFeedback:
            Il valore di inchiostro che {player_name} ha raggiunto con {charNameOne} prima della riscrittura è stato: <b>{fromInkToNumbers(FirstCharacter)}</b>.<>
    }

    {
        - grimoire_firstChar has grimFirstCharNewName:
            Dopo la riscrittura, ha scelto un nuovo nome: <b><i>{translator(firstChar_ActualName)}.</b></i>
    }
    {
        - firstChar_ActualName has Triangolo:
            L'ha definito lo strumento semplice, eppure fondamentale. Quello che attende che le altre facciano casino, per mettere un accento, un colore. Che ritrova il bello nelle cose quotidiane. Apprezzando quello che ha.
        
        - firstChar_ActualName has Orchestra:

            L'ha definito la gioia del cambiamento. Dell'infinita possibilità. Ciò che può provare tutto. Incluso il cambiare paese. Che nulla teme, perché tutto è.
                
        - firstChar_ActualName has FlautoDolce:

            Ha detto che, che sia quel pezzetto di plastica suonato alle elementari o un pezzo pregiato di un'orchestra, il Flauto ricorda che la musica è ovunque. E dove c'è musica, c'è cambiamento. E per questo metterà al centro di tutto la mia musica, la band, per fare cose che davvero cambino il mondo.
            
    
        - firstChar_ActualName has Ocarina:
    
            L'ha definito un riabbraccio della sua infanzia, gli spazi in cui è cresciuta. Per ricominciare a giocare, a esplorare quello che già conosco. Per prendersi cura dei suoi genitori e della sua terra. Per permettere ad altr3 di non doversene andare.

        - firstChar_ActualName has Violino:

            L'ha definito loo strumento romantico. Lo strumento divino. Che abbraccio l'amore come motore del cambiamento. Smuovendo acque sicure per trovare la felicità.
    }

    {
        - grimoire_firstChar has grimFirstCharMentorFeedback:
            {charNameFive} ha detto a {player_name} che <>

            {
                - firstChar_ActualName has Triangolo: ha aiutato {translator(firstChar_ActualName)} a trovare il bello nel quotidiano, cosa che {charNameFive} apprezza molto.
                    
                - firstChar_ActualName has Orchestra: è rimasta colpita dalla partenza di {translator(firstChar_ActualName)} per l'Islanda, perché ha già vicine persone che le vogliono bene. E che i problemi seguono le persone anche quando se ne vanno.
                                
                - firstChar_ActualName has FlautoDolce: mettere al centro della propria vita la propria passione, come ha fatto {translator(firstChar_ActualName)} non è cosa da tutt3.
                                
                - firstChar_ActualName has Ocarina: il suo cuoricino ha tremato dopo che {translator(firstChar_ActualName)} ha deciso di tornare a vivere coi suoi genitori, riscoprendo le sue radici.

                - firstChar_ActualName has Violino: {translator(firstChar_ActualName)} ha scelto l'amore, e spera possa trovare la felicità di cui ha bisogno.
            
            }
    }


    + [Index #bookmark:index]
        -> grimoire
    + [{translator(firstChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_firstCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_first_character_rewrite
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_first_character_rewrite
->->


=== grimoire_first_character_letters
@grimoireText #style:character #icon:{translator(firstChar_ActualName)} #title:{translator(firstChar_ActualName)} #description:{grimoire_characterDescription(FirstCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


    {
        - grimoire_firstChar has grimFirstCharLetterOne:
        
            Ciao {player_name}, come stai?
            ~ letters_firstCharLetters_first()
    }
    
    {
        - grimoire_firstChar has grimFirstCharLetterTwo:
        
            Ciao {player_name}, qui è sempre {charNameOne} che ti scrive.
            ~ letters_firstCharLetters_second()
    }

    {
        - grimoire_firstChar has grimFirstCharLetterThree:

            Ciao ama!
            ~ letters_firstCharLetters_third()
    }

    {
        - grimoire_firstChar has grimFirstCharLetterFour:
            
            Rieccomi ama.
            ~ letters_firstCharLetters_fourth()
    }
    

    + [Index #bookmark:index]
        -> grimoire
    + [{translator(firstChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_firstCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_first_character_letters
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_first_character_letters
->->