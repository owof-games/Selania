=== grimoire_third_character_conversation
    @grimoireText #style:character #icon:{translator(thirdChar_ActualName)} #title:{translator(thirdChar_ActualName)} #description:{grimoire_characterDescription(ThirdCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


    //Main story
    {
        - grimoire_thirdChar has grimThirdCharOne:
            {player_name} ha conosciuto {charNameThree}, che è sembrato molto incuriosito dalla sua forma temporanea. Ha raccontato a {player_name} di lavorare in una birreria, e di essere un grande lavoratore. È l'unica birreria della frazione in cui vive, e un tempo era in gestione a suo padre.
    }

    {
        - grimoire_thirdChar has grimThirdCharTwo:
            {charNameThree} ha raccontato a {player_name} di Ava, la sua attuale ragazza; della sua ex, Donatella, con cui non è in buoni rapporti; e delle donne con cui è uscito dopo la fine della loro relazione, tra app di dating e turiste ubriache incontrate al bar.
    }

    {
        - grimoire_thirdChar has grimThirdCharThree:
            {charNameThree} ha parlato degli amici con cui gioca a calcetto il lunedì sera: il Merlo, un uomo ricco. Il Giova, legato al mondo delle start up e a detta di {charNameThree}, non particolarmente brillante. Dario, che è nel gruppo solo perché esce con la cugina del Giova. E Rocco, un uomo egiziano con due figli con la testa sulle spalle e che {charNameThree} incontra anche fuori dalle partite. Queste serate sono state organizzate all'inizio dal Poggi, l'amico storico di {charNameThree}, per aiutarlo a superare un periodo complesso dopo il Covid, durante il quale {charNameThree} si è ritrovato senza un lavoro per lui prestigioso.
    }

    {
        - grimoire_thirdChar has grimThirdCharFour:
            Su suggerimento di {charNameFive}, {charNameThree} ha raccontato a {player_name} della sua relazione con Donatella. Ha raccontato una lunga storia d'amore e convivenza che ha creato tensioni col padre di {charNameThree} quando {charNameThree} e Donatella hanno deciso di sposarsi. Ma i due non sono arrivati al matrimonio perché Donatella si è resa conto a ridosso dei trent'anni di non sapere davvero chi è. Sente di essere stata cresciuta da {charNameThree}, e per questo incapace di capire se sta per sposarsi perché lo vuole, o perché è l'unica cosa a cui sa pensare. Decide così di lasciare {charNameThree}, che per un anno la aspetta dedicandosi al suo corpo e al lavoro, fino a quando lei non gli dice che non deve più aspettarla, e {charNameThree}  amaro, legge la fine della relazione come un segno del suo invecchiamento, del non essere ricco, del non avere amici interessanti.
            {
                - thirdChar_firstCharRage == true:
                    <> {charNameOne} era presente alla conversazione, e ha criticato {charNameThree}, dicendogli che Donatella aveva tutto il diritto di andarsene, che lui si è tratteggiato come vittima davanti a tutti e che ha <i>groomato</i> (noi non sappiamo cosa sia questa cosa) la ragazza per un decennio. Sia {charNameOne} che {charNameThree} se ne sono andat3 arrabbiat3.
            }
    } 

    {
        - grimoire_thirdChar has grimThirdCharFive:
            {charNameThree} ha condiviso un po' di elementi sulla sua famiglia. In particolare ha parlato della madre, a cui era molto legata ma è morta da tempo, e della sorella Marta, che sembra stimare molto. Anche se ora Marta ha avuto un figlio, Armando, e {charNameThree} crede che la sorella sia al centro dell'attenzione del padre e della matrigna. Padre verso cui non sembra provare molta stima, e che se si presenta in birreria, ignora.
    } 

    {
        - grimoire_thirdChar has grimThirdCharSix:
            {charNameThree} è tornato a parlare dell'amico storico, il Poggi. Ha raccontato di come si sono conosciuti alle medie, e di come sia passato dal bullizzarlo con un altro gruppo di ragazzini, fino a vederlo come il suo migliore amico. Hanno studiato assieme al liceo e per due anni di Ingegneria, fino a quando {charNameThree} non ha lasciato l'università, ma senza perdere l'amicizia per il Poggi. {charNameThree} è stato presente nella vita del Poggi anche mentre conosceva quella che poi è diventata la sua moglie ed ha avuto una bambina, Olivia, di cui {charNameThree} è padrino. Ma negli ultimi anni le cose si sono raffreddati e si sentono molto meno. {charNameThree} si chiede se faccia pena al suo amico, anche perché nel gruppo di calcetto le persone lo prendono in giro dicendo che Donatella l'ha lasciato per motivi secondo loro di non virilità. Dopo questa confidenza, {charNameThree} ha comunicato a {player_name} di essere pronto per la sua riscrittura. 
    }

    
    //Storylets speciali

    {
        - grimoire_thirdChar has grimThirdCharMentor:
            ~ grimThirdCharMentor_text()
    } 

    {
        - grimoire_thirdChar has grimThirdCharFranco:
            ~ grimThirdCharFranco_text()
    }

    {
        - grimoire_thirdChar has grimSecondThirdChar:
            ~ grimSecondThirdChar_text()
    }

    {
        - grimoire_thirdChar has grimFirstThirdChar:
            ~ grimFirstThirdChar_text()
    }

    {
        - grimoire_thirdChar has grimWitchThirdChar:
            ~ grimWitchThirdChar_text()     
    }
    {
        - grimoire_thirdChar has grimWitchThirdCharFollowUp:
            Dopo la nostra conversazione con {charNameThree}, {charNameThree} ha chiesto a {player_name} cosa noi intendessimo con le nostre parole. Dopo la risposta di {player_name}, {charNameThree} ha detto a {player_name} che su una cosa noi avevamo ragione: che c'è sempre qualcuno che vorrà bene a una persona che è totalmente sé stessa, senza maschere o menzogne. Ma che {charNameThree} ha avuto quella persona vicino per una vita, e ora ha cancellato {charNameThree} dalla sua vita.
    }

    {
        - grimoire_thirdChar has grimThirdOpenNest:
            ~ grimThirdOpenNest_text()

    }

    {
        - grimoire_thirdChar has grimThirdCharKitchenAlone:
            Dopo aver preparato dei toast bruciati, {charNameThree} ha raccontato a {player_name} della sua vita al bar dei genitori, delle scarse doti culinarie della madre e dei pic nic organizzati per il padre, dove la madre di {charNameThree} cucinava molte cose poco buone che il padre di {charNameThree} mangiava per rispetto, mentre {charNameThree} e la sorella mangiavano di nascosto patatine e pop corn recuperati nei giorni precedenti al bar di famiglia. Durante l'ultimo pic nic assieme, la mamma di {charNameThree} ha fatto trovare un cestino pieno di patatine e pop corn, raccontando che sapeva del loro trucchetto durante i vecchi pic nic. Per questo {charNameThree} ha lasciato in cucina in dono per {player_name} un set da pic nic.
    }

    {
        - grimoire_thirdChar has grimThirdCharNovel:
            La rabbia di {charNameThree} dopo aver letto <i>Polvere</i> di Maura nella biblioteca è stata palpabile. {charNameThree} ha definito il racconto "misandrico", e ha detto a {player_name} che se un uomo avesse scritto lo stesso racconto "lo bruciano sul rogo". Nonostante la rabbia, dopo la risposta di {player_name} {charNameThree} ha deciso di leggere un altro racconto della biblioteca. E anche se non è ortodosso, lasciamo un nostro commento: crediamo nella capacità di {player_name} di poter aiutare {charNameThree} a trovare una nuova strada, ma era dai tempi del <i>Movimento per la Rinascita Maschile</i> che non sentivamo discorsi del genere.
    }

    

    //Storylets condivisi DA INSERIRE


    
    + [Index #bookmark:index]
        -> grimoire
    + [{translator(thirdChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_thirdCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_third_character_conversation
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_third_character_conversation

->->



=== grimoire_third_character_present
@grimoireText #style:character #icon:{translator(thirdChar_ActualName)} #title:{translator(thirdChar_ActualName)} #description:{grimoire_characterDescription(ThirdCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)



    {
        - frog_third_char_gift != "":
            Franco ha consigliato a {player_name} di regalare a {charNameThree} <b>{ingredientTranslator(frog_third_char_gift)}</b>.

    }


    {
        - thirdChar_favouritesGifts has thirdChar_giftedObject:
            {player_name} gli ha donato <b><i>{ingredientTranslator(thirdChar_giftedObject)}</b></i> ed era entusiasta!
        
        - thirdChar_goodGifts has thirdChar_giftedObject:
            {player_name} gli ha donato <b><i>{ingredientTranslator(thirdChar_giftedObject)}</b></i> ed ha abbastanza apprezzato.
        
        - else:
            {player_name} gli ha donato <b><i>{ingredientTranslator(thirdChar_giftedObject)}</b></i> e non ha apprezzato per nulla.
    
    }
    {
        - grimoire_franco has grimFrancoThirdIngredientFailure:
            Nonostante {player_name} abbia seguito i consigli di Franco, la reazione di {charNameThree} è stata negativa. Franco è rimasto stupito della cosa, e ha promesso di indagare sul perché, pur dimenticandosi quasi immediatamente del problema.
    }
        

    + [Index #bookmark:index]
        -> grimoire
    + [{translator(thirdChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_thirdCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_third_character_present
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_third_character_present
->->


=== grimoire_third_character_kitchen
@grimoireText #style:character #icon:{translator(thirdChar_ActualName)} #title:{translator(thirdChar_ActualName)} #description:{grimoire_characterDescription(ThirdCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    <b>{kitchen_thirdCharRecipe}.</b>
    <i>Ranacronaca a cura di Franco Lo Chef.</i>

    {kitchen_thirdCharRecipeNoun}: l'elemento centrale di questa ricetta. La preparazione richiede una buona dose di manualità, cosa non facile per {charNameOne}, che ha solo delle vibrisse. Il piatto tradizionalmente prevede anche l'aggiunta di olio invernale, ma {player_name} ha optato per della {kitchen_thirdCharRecipeAdjective}, rompendo gli schemi e il cuore di zio Gracco. Nel mentre {charNameOne} ha rovesciato una prima bottiglia di vino, cosa non prevista dalla ricetta, per poi riempirla con delle spighe raccolte dalla palude, cosa non prevista dai pesci della palude. Quando ormai il piatto ha iniziato ad addensarsi, il duo ha deciso di rafforzarne il sapore aggiungendo {kitchen_thirdCharRecipeComplement}, cosa che i più definirebbero coraggiosa, ma non {player_name}, che ha avuto la capacità di seguire la conversazione con {charNameOne}, e anche di preparare un piatto irripetibile (Tullio dice che è importante che sia irripetibile o a qualcuno viene il mal di pancia). <>
    {
        - kitchen_thirdCharExtraIngredient != ():
            Con classe e anche con palestra e presidenza, {player_name} ha infine aggiunto {ingredientTranslator(kitchen_thirdCharExtraIngredient)}, perché al girino piace rischiare. <>

        - else:
            Con austerità (che è una cosa che mi ha insegnato Euforbo e ha a che fare con l'Australia) {player_name} ha deciso di non aggiungere altro. <>
    }
    Entrambi i girini sono vivi, e consideriamo questa cosa un vero e proprio successo.


    //Recap cose dette
    {
        - grimoire_thirdChar has grimThirdCharKitchenOne:
        Cucinando con {player_name}, {charNameThree} e {player_name} hanno parlato di calcio. All'inizio {charNameThree} si è messo a parlare delle partite con gli amici, come Dario, Giova, Merlo, Rocco. Ha raccontato che Ultimamente è difficile che riescano ad essere tutti presenti durante le partitelle del lunedì sera, per via di figli, mogli e lavoro. E che quando c'era Poggi, questa cosa non accadeva. {charNameThree} e Poggi hanno passato assieme il sabato sera da quando si conoscono fino a quando Poggi ha iniziato a sparire. All'epoca uscivano insieme a bere, e {charNameThree} racconta di come Poggi avesse più successo di lui con le ragazze, perché percepito come più gentile, sorridente e ascoltatore di {charNameThree}. {charNameThree} ha anche raccontato del rapporto tra Poggi e Amanda, e di come Donatella, l'ex ragazza di {charNameThree}, chiamasse con disprezzo Amanda <i>l'ingegnera</i>. A lungo {charNameThree} è stato convinto che il rapporto tra Poggi e {charNameThree} si fosse incrinato per colpa di questa tensione, ma le cose non sono migliorate finita la storia tra lui e Donatella. {charNameThree} avrebbe voglia di raccontare la sua esperienza qui a Poggi, ma non se la sente. Però {charNameThree} vorrebbe parlarne con Rocco, che di recente si è confidato con lui in merito ai problemi in famiglia: un padre malato che non vuole lasciare l'Egitto per venire in Italia, una moglie che non vede l'ora di tornare a casa, e le esperienze di razzismo subite da figli di recenti. Rocco ha anche ringraziato {charNameThree} per averlo ascoltato, perché certe cose non se la sente di raccontarle al resto del gruppo visto che passano il tempo a criticare tutti. Ora {charNameThree} e Rocco si bevono qualcosa a fine partita, ed è un momento che piace a {charNameThree}, ma che lo fa anche sentire solo.
 
    }
    {
        - grimoire_thirdChar has grimThirdCharKitchenTwo:
        
  
    }
    {
        - grimoire_thirdChar has grimThirdCharKitchenThree:
        Cucinando con {player_name}, {charNameThree} e {player_name} hanno parlato di lavoro. {charNameThree} si è rivelato molto orgoglioso del suo lavoro, perché lo vede come qualcosa che fa bene alle persone per staccare la testa e dimenticare per un po' il mondo, mentre i suoi amici di calcetto lo vedono come un lavoro da ragazzino. {charNameThree} crede che "se la sentano" perché sono pieni di soldi. {charNameThree} ha sviluppato un buon rapporto con Petra, una delle sue colleghe, e ha scoperto che gli piace insegnare le cose che sa fare. Lo fa sentire rispettato e importante. Hanno una visione diversa su cosa sia fare il proprio lavoro, ma {charNameThree} ammira come Petra sappia difendersi dal capo e dai clienti che la deridono in quanto lesbica. {charNameThree} ha anche raccontato a {player_name} che è infastidito dalla presenza della fidanzata del capo, incapace e lì per spiarli. E che ha imparato a fare il suo lavoro dal padre. {charNameThree} vorrebbe però guadagnare di più, soprattutto visto che fa un buon lavoro. {charNameThree} è stanco di vivere col suo coinquilino e il gatto. E da la colpa al padre, perché il Baretto era di sua proprietà quando era piccolo, ma poi il padre di {charNameThree} l'ha perso perché "incapace di gestire i soldi e di non fare favori ad amici di merda". Questo lavoro {charNameThree} l'ha trovato attraverso il padre, e crede che il padre sia felice perché "alla fine ha vinto lui".

    }

    //Feedback ingrediente extra
    {
        - kitchen_thirdCharExtraIngredient == universalIngredient:
            AGGIUNGI RICORDO IMPORTANTE.

        - thirdChar_favouritesGifts has kitchen_thirdCharExtraIngredient:

   
        - thirdChar_goodGifts has kitchen_thirdCharExtraIngredient:


        - kitchen_thirdCharExtraIngredient != ():

        
        - else:
            Cucinando con {charNameThree}, {player_name} ha deciso di non aggiungere alcun ingrediente aggiuntivo.

    }

    //Recap commento a tavola
    {
        - grimoire_thirdChar has grimThirdCharKitchenPositiveReaction:
            Dopo aver cucinato assieme, {charNameThree} ha detto a {player_name} che.

        - grimoire_thirdChar has grimThirdCharKitchenNegativeReaction:
            Dopo aver cucinato assieme, {charNameThree} ha detto a {player_name} che.

        - grimoire_thirdChar has grimThirdCharKitchenNeutralReaction:
            Dopo aver cucinato assieme, {charNameThree} ha detto a {player_name} che.

    }
    

    + [Index #bookmark:index]
        -> grimoire
    + [{translator(thirdChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_thirdCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_third_character_kitchen
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_third_character_kitchen
->->




=== grimoire_third_character_rewrite
@grimoireText #style:character #icon:{translator(thirdChar_ActualName)} #title:{translator(thirdChar_ActualName)} #description:{grimoire_characterDescription(ThirdCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)


    {
        - grimoire_thirdChar has grimThirdCharFirstProposal:
            Prima della riscrittura, {charNameThree} ha detto a {player_name} che non ha davvero bisogno del suo aiuto, che le cose vanno bene nella sua vita tra lavoro, amici e compagna. Ci ha tenuto a sottolineare che anche qui si è trovato bene con tutt3: dice che {charNameFive} lo adora, che per {charNameTwo} è come un secondo fratello, mentre {charNameOne} {thirdChar_firstCharRage == true or grimoire_thirdChar has grimFirstThirdChar: <i>ce l'ha con tutti gli uomini e quindi il problema non è lui, è lei.|è una brava ragazza, anche se {charNameThree} non crede di essere stato simpatico a {charNameOne}.}
    } 
    {
        - thirdChar_inkFirstRewriting_updated == true:
            Il valore di inchiostro che {player_name} ha raggiunto con {charNameThree} prima della riscrittura è stato: <b>{fromInkToNumbers(thirdChar_inkFirstRewriting)}</b>.<>
    }

    {
        - grimoire_thirdChar has grimThirdCharFirstRewriting:
            {charNameThree} ha interrotto {player_name} prima che potesse usare l'epilogo e, pieno di rabbia, ha lasciato questo luogo.
    }

    {
        - grimoire_thirdChar has grimThirdCharSecondProposal:
            Prima della riscrittura, la seconda, {charNameThree} ha detto a {player_name} di.
    } 

    {
        - thirdChar_inkFSecondRewriting_updated == true:
            Il valore di inchiostro che {player_name} ha raggiunto con {charNameThree} prima della seconda riscrittura è stato: <b>{fromInkToNumbers(thirdChar_inkFirstRewriting)}</b>.<>
    }

    {
        - grimoire_thirdChar has grimThirdCharNewName:
            Dopo la riscrittura, ha scelto un nuovo nome: <b><i>{translator(thirdChar_ActualName)}.</b></i>
    }
    {
        - thirdChar_ActualName has Triangolo:
            
        
        - thirdChar_ActualName has Orchestra:
.
                
        - thirdChar_ActualName has FlautoDolce:

    
        - thirdChar_ActualName has Ocarina:
    

        - thirdChar_ActualName has Violino:

    }

    {
        - grimoire_thirdChar has grimThirdCharMentorFeedback:
            {charNameFive} ha detto a {player_name} che <>

            {
                - thirdChar_ActualName has Triangolo:
                    
                - thirdChar_ActualName has Orchestra:

                - thirdChar_ActualName has FlautoDolce: 
                                
                - thirdChar_ActualName has Ocarina:

                - thirdChar_ActualName has Violino:
            
            }
    }


    + [Index #bookmark:index]
        -> grimoire
    + [{translator(thirdChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_thirdCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_third_character_rewrite
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_third_character_rewrite
->->


=== grimoire_third_character_letters
@grimoireText #style:character #icon:{translator(thirdChar_ActualName)} #title:{translator(thirdChar_ActualName)} #description:{grimoire_characterDescription(ThirdCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    NOTA: a seconda che la sua sia la prima o seconda lettera, ricordarsi di mettere qui un commento alla parte di "rivalutazione del rapporto" (ovvero quando si passa dal valore relazione dal vivo a quello a remoto) perché se lo lascio nella lettera verrà riconteggiato ogni volta e non ha senso.

    {
        - grimoire_thirdChar has grimThirdCharLetterOne:
            <b>Prima lettera</b>
            Saluto. <>
            -> letters_thirdCharLetters_one -> 
    }
    
    {
        - grimoire_thirdChar has grimThirdCharLetterTwo:
            <b>Seconda lettera</b>
            Saluto. <>
            -> letters_thirdCharLetters_two ->
    }

    {
        - grimoire_thirdChar has grimThirdCharLetterThree:
            <b>Terza lettera</b>
            Saluto. <>
            -> letters_thirdCharLetters_three -> 
    }

    {
        - grimoire_thirdChar has grimThirdCharLetterFour:
            <b>Quarta lettera</b>
            Saluto. <>
            -> letters_thirdCharLetters_four -> 
    }

    {
        - grimoire_thirdChar has grimThirdCharLetterFive:
            <b>Quinta lettera</b>
            Saluto. <>
            -> letters_thirdCharLetters_five -> 
    }

    {
        - grimoire_thirdChar has grimThirdCharLetterSix:
            <b>Sesta lettera</b>
            Saluto. <>
            -> letters_thirdCharLetters_six -> 
    }

    {
        - grimoire_thirdChar has grimThirdCharLetterSeven:
            <b>Settima lettera</b>
            Saluto. <>
            -> letters_thirdCharLetters_seven -> 
    }

    {
        - grimoire_thirdChar has grimThirdCharLetterEight:
            <b>Ottava lettera</b>
            Saluto. <>
            -> letters_thirdCharLetters_eight -> 
    }
    

    + [Index #bookmark:index]
        -> grimoire
    + [{translator(thirdChar_ActualName)} #bookmark:secondLevel]
        -> grimoire_thirdCharacter
    + [precedente #bookmark:previous]
        @grimoireTextPrevious
        -> grimoire_third_character_letters
    + [prossima #bookmark:next]
        @grimoireTextNext
        -> grimoire_third_character_letters
->->