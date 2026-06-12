=== grimoire_third_character_conversation
    @grimoireText #style:character #icon:{translator(thirdChar_ActualName)} #title:{translator(thirdChar_ActualName)} #description:{grimoire_characterDescription(ThirdCharacter)}

    ~ temp charNameOne = translator(firstChar_ActualName)
    ~ temp charNameTwo = translator(secondChar_ActualName)
    ~ temp charNameThree = translator(thirdChar_ActualName)
    ~ temp charNameFour= translator(fourthChar_ActualName)
    ~ temp charNameFive = translator(fifthChar_ActualName)

    {
    - grimoire_thirdChar != ():
        <b>Lista delle persone importanti per {charNameThree}</b>.
        <i>Dona</i>: la ex di {charNameThree}.
        <i>Il Poggi</i>: il migliore amico di {charNameThree}.  
    }

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

    {player_name} parte in attacco scegliendo il piatto di oggi: {kitchen_thirdCharRecipeNoun}. {charNameThree} fa melina al centrocampo preparando <i>qualcosa</i>, mentre osserva {player_name} che attacca con le note decise della {kitchen_thirdCharRecipeAdjective}, che rendono {kitchen_thirdCharRecipe} un autogol fermato all'ultimo. Ma ecco che zio Gracco mi tira due sberle e dice che non sarò mai un cuoco e ora osserviamo {player_name} riempire la cucina fino al soffitto di {kitchen_thirdCharRecipeComplement}. Mancano pochi secondi alla fine del match, ed ecco che {charNameThree} fa cascare le patate e anche una decina di piatti. {charNameThree} non lo sa, ma <i>questo</i> è l'ingrediente per rendere {kitchen_thirdCharRecipeComplement} un piatto perfetto. <>

    {
        - kitchen_thirdCharExtraIngredient != ():
            Questo, e l'aggiunta da parte di {player_name} di {ingredientTranslator(kitchen_thirdCharExtraIngredient)}, il vero tocco da fuoriclasse, signor3 e signore e signori! <>

        - else:
            Anche per questo {player_name} ha deciso di non rovinare il delicato equilibrio, e non ha aggiunto altro. <>
    }
    L'arbitro segna la fine della partita. Il duo {charNameThree} e {player_name} ha salvato anche oggi le sorti della partita. Gli ananassi dovranno attendere lo spareggio. Che quindi non è una cosa dispari? Devo trovare Euforbo.


    //Recap cose dette
    {
        - grimoire_thirdChar has grimThirdCharKitchenOne:
        Cucinando con {player_name}, {charNameThree} e {player_name} hanno parlato di calcio. All'inizio {charNameThree} si è messo a parlare delle partite con gli amici, come Dario, Giova, Merlo, Rocco. Ha raccontato che Ultimamente è difficile che riescano ad essere tutti presenti durante le partitelle del lunedì sera, per via di figli, mogli e lavoro. E che quando c'era Poggi, questa cosa non accadeva. {charNameThree} e Poggi hanno passato assieme il sabato sera da quando si conoscono fino a quando Poggi ha iniziato a sparire. All'epoca uscivano insieme a bere, e {charNameThree} racconta di come Poggi avesse più successo di lui con le ragazze, perché percepito come più gentile, sorridente e ascoltatore di {charNameThree}. {charNameThree} ha anche raccontato del rapporto tra Poggi e Amanda, e di come Donatella, l'ex ragazza di {charNameThree}, chiamasse con disprezzo Amanda <i>l'ingegnera</i>. A lungo {charNameThree} è stato convinto che il rapporto tra Poggi e {charNameThree} si fosse incrinato per colpa di questa tensione, ma le cose non sono migliorate finita la storia tra lui e Donatella. {charNameThree} avrebbe voglia di raccontare la sua esperienza qui a Poggi, ma non se la sente. Però {charNameThree} vorrebbe parlarne con Rocco, che di recente si è confidato con lui in merito ai problemi in famiglia: un padre malato che non vuole lasciare l'Egitto per venire in Italia, una moglie che non vede l'ora di tornare a casa, e le esperienze di razzismo subite da figli di recenti. Rocco ha anche ringraziato {charNameThree} per averlo ascoltato, perché certe cose non se la sente di raccontarle al resto del gruppo visto che passano il tempo a criticare tutti. Ora {charNameThree} e Rocco si bevono qualcosa a fine partita, ed è un momento che piace a {charNameThree}, ma che lo fa anche sentire solo.
 
    }
    {
        - grimoire_thirdChar has grimThirdCharKitchenTwo:
        Cucinando con {player_name}, {charNameThree} e {player_name} hanno parlato di ragazze. {charNameThree} ha iniziato a parlare di Ava, e di come l'abbia aiutato a uscire dallo stallo dopo la fine della storia con Donatella. {charNameThree} ha parlato dei primi contrasti con Ava, del modo in cui lei l'ha trattato come una persona intelligente, capace di comprendere che gli sono lontane, e per questo lui la adora. Quando la reazione con Donatella è finita, {charNameThree} si è sentito a lungo tempo un fallito. Ha ripiegato sul sesso, dopo aver atteso per tre mesi che Donatella tornasse da lui, andando a letto con una cliente. In quella occasione {charNameThree} ha pensato di aver tradito Donatella, ma col tempo le cose sono diventate più facili. Ora con Ava non fa sesso, e ne sente la mancanza, e anche se Ava lascia andare {charNameThree} con altre donne, per {charNameThree} non è la stessa cosa. Anche perché {charNameThree} sta pensando alla possibilità di diventare padre. {charNameThree} e Donatella ne hanno parlato più volte durante la loro relazione, e hanno anche provato ad avere un figlio, anche se {charNameThree} ha scoperto solo quando Donatella se ne stava andando che in realtà stava prendendo la pillola. {charNameThree} sente che avere un figlio lo renderà una persona migliore, diversa dal padre. {charNameThree} dice che gli insegnerà le cose giuste, come farsi valere, e che non gli farà mai mancare il supporto economico. {charNameThree} vorrebbe affrontare presto questo discorso con Ava, o forse no. E {charNameThree} si chiede se il futuro figlio si fidanzerà un giorno con la figlia dell'amico Poggi, così da diventare consuoceri.
  
    }
    {
        - grimoire_thirdChar has grimThirdCharKitchenThree:
        Cucinando con {player_name}, {charNameThree} e {player_name} hanno parlato di lavoro. {charNameThree} si è rivelato molto orgoglioso del suo lavoro, perché lo vede come qualcosa che fa bene alle persone per staccare la testa e dimenticare per un po' il mondo, mentre i suoi amici di calcetto lo vedono come un lavoro da ragazzino. {charNameThree} crede che "se la sentano" perché sono pieni di soldi. {charNameThree} ha sviluppato un buon rapporto con Petra, una delle sue colleghe, e ha scoperto che gli piace insegnare le cose che sa fare. Lo fa sentire rispettato e importante. Hanno una visione diversa su cosa sia fare il proprio lavoro, ma {charNameThree} ammira come Petra sappia difendersi dal capo e dai clienti che la deridono in quanto lesbica. {charNameThree} ha anche raccontato a {player_name} che è infastidito dalla presenza della fidanzata del capo, incapace e lì per spiarli. E che ha imparato a fare il suo lavoro dal padre. {charNameThree} vorrebbe però guadagnare di più, soprattutto visto che fa un buon lavoro. {charNameThree} è stanco di vivere col suo coinquilino e il gatto. E da la colpa al padre, perché il Baretto era di sua proprietà quando era piccolo, ma poi il padre di {charNameThree} l'ha perso perché "incapace di gestire i soldi e di non fare favori ad amici di merda". Questo lavoro {charNameThree} l'ha trovato attraverso il padre, e crede che il padre sia felice perché "alla fine ha vinto lui".

    }

    //Feedback ingrediente extra
    {

        - kitchen_thirdCharExtraIngredientReaction == badReaction:
        L'aggiunta di {ingredientTranslator(kitchen_thirdCharExtraIngredient)} da parte di {player_name} non è stata apprezzata da {charNameThree}. {charNameThree} dice che gli ha fatto pensare a cose che lo fanno incazzare, ma che quando si mangia, si mangia per stare bene.

        - kitchen_thirdCharExtraIngredientReaction == mehReaction:
        L'aggiunta di {ingredientTranslator(kitchen_thirdCharExtraIngredient)} da parte di {player_name} è stata abbastanza apprezzata da {charNameThree}, felice del gusto che resta al suo posto. {charNameThree} ha raccontato che è un po' così che gli piacciono le persone, senza sfarzi. E ha commentato che Petra ritiene che sia troppo vecchio per l'età che ha. E ha fatto un esempio a {player_name}: <>
                {//Blocco per reazioni e commenti legati al genere.
                - thirdChar_recordedPlayerPronoun != him:
                se ha a che fare con un uomo, {charNameThree} non è contento se gli parla di cose emotive, spirituali, politiche o psicologiche.
                - else:
                se ha a che fare con una ragazza, {charNameThree} si aspetta che parli di cose emotive, mentre da una persona non binaria si aspetta osservazioni politiche o psicologiche, ma non "cose da uomo", sennò si confonde, e la confusione lo innervosisce.                                                                        
                } 

        
        - else:
            Cucinando con {charNameThree}, {player_name} ha deciso di non aggiungere alcun ingrediente aggiuntivo.

    }

    //Recap commento a tavola
    {
        - grimoire_thirdChar has grimThirdCharKitchenPositiveReaction:
            Dopo aver cucinato assieme, {charNameThree} ha detto a {player_name} che <>
                { 
                - thirdChar_recordedPlayerPronoun == him:
                adora {player_name}, e che è "fuori di testa" come piace a {charNameThree}, un po' come se fossero due fratelli, o gli amici di calcio. <>
                                                            
                - else:
                non è male "per non essere un ragazzo", e che {player_name} ha una bella testa, che aiuta {charNameThree} a pensare. <>
                }
            {charNameThree} ha anche aggiunto che c'è però qualcosa di fastidioso, come se fosse tutto troppo al suo posto.    

        - grimoire_thirdChar has grimThirdCharKitchenNegativeReaction:
            Dopo aver cucinato assieme, {charNameThree} ha detto a {player_name} che non costruirebbe una amicizia con {player_name}, perché {player_name} scompagina a {charNameThree} tutte le cose che ritiene importanti, mettendo {charNameThree} in difficoltà.


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
            Il valore di inchiostro che {player_name} ha raggiunto con {charNameThree} prima della seconda riscrittura è stato: <b>{fromInkToNumbers(ThirdCharacter)}</b>.<>
    }

    {
        - grimoire_thirdChar has grimThirdCharNewName:
            Dopo la riscrittura, ha scelto un nuovo nome: <b><i>{translator(thirdChar_ActualName)}.</b></i>
    }
    {
    - thirdChar_ActualName has Forum:
        
    
    - thirdChar_ActualName has Canovaccio:
    
            
    - thirdChar_ActualName has Sigaro:


    - thirdChar_ActualName has Guantone:


    - thirdChar_ActualName has Cerchio:

    }

    {
        - grimoire_thirdChar has grimThirdCharMentorFeedback:
            {charNameFive} ha detto a {player_name} che <>

            {
            - thirdChar_ActualName has Forum:
            
        
            - thirdChar_ActualName has Canovaccio:
    
                    
            - thirdChar_ActualName has Sigaro:

        
            - thirdChar_ActualName has Guantone:
        

            - thirdChar_ActualName has Cerchio:
                
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
            Ti odio. <>
            -> letters_thirdCharLetters_one -> 
    }
    
    {
        - grimoire_thirdChar has grimThirdCharLetterTwo:
            <b>Seconda lettera</b>
            C'ho messo un po' a risponderti, {player_name}.
            -> letters_thirdCharLetters_two ->
    }

    {
        - grimoire_thirdChar has grimThirdCharLetterThree:
            <b>Terza lettera</b>
            Ciao {player_name}! <>
            -> letters_thirdCharLetters_three -> 
    }

    {
        - grimoire_thirdChar has grimThirdCharLetterFour:
            <b>Quarta lettera</b>
            Ciao {player_name}! <>
            -> letters_thirdCharLetters_four -> 
    }

    {
        - grimoire_thirdChar has grimThirdCharLetterFive:
            <b>Quinta lettera</b>
            Ciao {player_name}! <>
            -> letters_thirdCharLetters_five -> 
    }

    {
        - grimoire_thirdChar has grimThirdCharLetterSix:
            <b>Sesta lettera</b>
            Ciao {player_name}! <>
            -> letters_thirdCharLetters_six -> 
    }

    {
        - grimoire_thirdChar has grimThirdCharLetterSeven:
            <b>Settima lettera</b>
            Ciao {player_name}! <>
            -> letters_thirdCharLetters_seven -> 
    }

    {
        - grimoire_thirdChar has grimThirdCharLetterEight:
            <b>Ottava lettera</b>
            Ciao {player_name}! <>
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