/* ---------------------------------

       Storylets tutorial

 ----------------------------------*/

=== welcome ===
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
        Sapevo che sarebbe arrivata una nuova persona! #speaker:{fifthChar_tag()} #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        Immagino tu abbia un milione di domande, vero?
        - (top)
            * (dove) [Dove sono?]
                 Questo luogo non ha un nome.
                 Per me è il giardino, ma vedrai anche tu che è anche molto altre cose.
                 La cosa che posso dirti con certezza è che faccio di tutto per renderlo un posto sicuro.
                 Un posto dove prenderti cura di te.
                 Non male, no?
                 Soprattutto quando fuori da qui è difficile trovare un senso.
                    -> top
            
            * (chiSei) [Chi sei?]
                La persona che tiene in piedi questo luogo
                Ma tu puoi chiamarmi <b>{translator(fifthCharacterState)}</b>. #portrait: mentore_happy 
                Così puoi ricordarti con facilità a cosa servo.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_happy
                    -> top
            
            * (vado) [Come me ne vado da qui?]
                 Vuoi già andartene?
                 Forse devo rivedere il mio benvenuto.
                 Forse sono stata troppo formale?
                 O dovrei essere più autorevole?
                 Ma non devo essere scortese ora.
                 Mi hai fatto una domanda, e vedrò di rispondere.
                 A est della stazione troverai un sentiero che ti riporterà a casa.
                 E se deciderai di tornare, troverai tutto nello stato in cui l'hai lasciato.
                    -> top
                    
            * {vado} [Non ho più voglia di parlare.]
                 Lascia che ti rubi giusto un secondo!
                    -> your_name
                
            * {vado or chiSei or dove} [Ma perché sono qui?]
                 Ora tocca a me farti una domanda.
                    -> your_name
                
            * -> your_name
    
    = your_name
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
         Come ti devo chiamare?#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
         Puoi usare un nome qualsiasi: prendi questa occasione come un nuovo inizio.
            -> name_choice ->
         E quali sono i tuoi pronomi?
            -> gender ->
         Piacere di conoscerti, {name}.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
         E {pronouns has him: benvenuto|{pronouns has her: benvenuta|benvenutə}}.
         Con me usa pure i pronomi femminili.
        {not chiSei: ???: Ah, che sbadata. Mi chiamo <b>{charNameFive}</b>.|È mio dovere farti stare bene.}#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        - (selfName)
        Un'altra domanda importante, {name}.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        Nel tuo soggiorno in questo luogo potrebbe accadere che incontrerai qualche situazione complessa.
        Se ti va di dirmi quali sono le cose che ti creano disagio, farò il possibile per non fartele incontrare.
                -> trigger_warning ->
        Ma in tutto questo non ti ho detto cosa devi fare!
            
            {
                - not talk_with_first_character: 
                    Facciamo così: prova a parlare con la persona{entity_location(PG) == TrainStop: al nostro fianco.| che troverai alla <b>stazione del treno</b>.}
                    E poi torna da me.
                    Nel frattempo raccolgo le foglie del giardino.
                         ~ firstPauseTalking = 0
                            -> main
                
                - talk_with_first_character:
                    Ma sei super sul pezzo! Sembra che {charNameOne} ti abbia già raccontato qualcosa di sè!
                    Cavolo, sei qui da pochissimo e già mi rendi orgogliosa di te!
                        -> gifts_and_ink
    
            }

            
=== gifts_and_ink
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
        
        Parliamo di doveri, {name}.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        Ogni tanto compariranno delle persone nuove.
        Sono persone rimaste bloccate in qualcosa: rimpianti, rimorsi, traumi.
        E qui arrivi tu, {name}.
        Passa del tempo per ascoltarle, capirle, cerca di capire quale sia la cosa giusta da dire.
        Conquista la loro fiducia.

        {
            - knowing_first_character.one.oneYellow:
            Parlare con {charNameOne} dei violini e dei tamburi è stato un ottimo inizio!
            
            - knowing_first_character.one.oneRed:
            Suggerire di cercare Talco con l'olfatto per esempio è stata un'idea originale, ma non ho percepito {charNameOne} particolarmente entusiasta. Forse dovevo darti più dritte.
            
            - knowing_first_character.one.oneBlue:
            In questo senso, un atteggiamento concreto con {charNameOne} non è un buon inizio, ma è colpa mia, è mio dovere darti le giuste indicazioni.
            
            - knowing_first_character.one.oneGreen:
            La tua proposta di ascoltare {charNameOne} per esempio è stata molto tenera, ma non sono sicura che sia molto nelle sue corde.
            
            - knowing_first_character.one.onePurple:
            Dire a {charNameOne} che Talco sarà sempre con lei ti ha fatto partire col piede giusto. Sono orgogliosa di te!
        
        }
        
        Ma perché vogliamo la loro fiducia?
        Perché quando si saranno aperte con te, ti verrà offerta l'occasione di dare loro un </b>dono<b>.
        I doni sono oggetti che offri a una persona in difficoltà.
        Può capitare che li troverai in giro, ma il più delle volte dovrai crearli da te.
        Ad esempio, coltivando qualcosa <b>alla serra</b>.
        Il dono è una cosa che puoi fare una sola volta, ed è il tuo modo di dimostrare a una persona che l'hai ascoltata.

            + [Matematico: ascolto, analizzo, scelgo il dono.]
                Esatto!
                Siamo sulla stessa lunghezza d'onda noi due!
                ~ fifthBlue ++
                    
            + [Come un gioco: comprendi il loop, dai il meglio di te.]
                Sono troppo vecchia per giocare, ma credo tu abbia centrato il punto.
                ~ fifthYellow ++
                    
            + [Quindi devo lavorare senza ricevere mezzo soldo.]
                Non è un lavoro.
                E qui non c'è denaro.
                Ma è colpa mia, sto dando troppe cose per scontato.
                ~ fifthRed ++
                    
            + [Mi piace l'idea di creare una relazione con queste persone.]
                Un po' di distacco è utile, per non farti ferire.
                Vediti più come {pronouns has him: un amico|{pronouns has her: un'amica|unə amicə}}, che aiuta una persona a vedersi in modo diverso. 
                ~ fifthGreen ++
                    
            + [La fiducia non si conquista, la fiducia è un dono.]
                Ho usato delle parole frettolose, scusa.
                Ma sì: tu doni loro tempo e ascolto, e loro ti donano la propria fiducia.
                ~ fifthPurple ++
            -
        
        Il dono è importante non solo per guadagnare fiducia.
        Il giusto dono può anche aumentare la tua quantità di <b>inchiostro</b>.
        Perché tu{pronouns has him: amico mio|{pronouns has her: amica mia|amicə miə}} sei<b>{pronouns has him: un riscrittore|{pronouns has her: una riscrittora|unə riscrittorə}}</b>!
        Aiuti queste persone bloccate a guardare la loro storia in modo diverso, e a scegliersi un nuovo nome.
        
            + [E tu hai bisogno di un nuovo nome?]
                Io?
                No!
                Questo è stato, è e sarà sempre il mio nome.
                    ~ fifthPurple ++
                    
            + [Con l'inchiostro ci posso disegnare?]
                Apprezzo la tua creatività, {name}.
                Ma tu sei {pronouns has him: un riscrittore|{pronouns has her: una riscrittora|unə riscrittorə}}, non {pronouns has him: un disegnatore|{pronouns has her: una disegnatrice|unə disegnatricə}}.
                    ~ fifthYellow ++
                    
            + [Solo le persone care ci fanno vedere in modo diverso.]
                A volte è più facile aprirsi a chi non si conosce.
                E mentre noi riflettiamo sulle loro difficoltà, impariamo anche qualcosa su di noi.
                        ~ fifthGreen ++
                        
            + [Tipo gaslighting?]
                No no no assolutamente no.
                Cavolo, devo essere più chiara.
                Ma se una persona si sente presa in giro, non si fiderà mai di te.
                        ~ fifthRed ++
            
            + [Un nome è un nome. Che se ne fanno di uno nuovo?]
                Un nome è come una magia.
                Lo carichiamo di volta in volta di significato.
                E quando lo usiamo, ci dice chi siamo.
                A volte quella magia non va più bene, e dobbiamo cercare una nuova formula. Un nuovo nome.
                    ~ fifthBlue ++
            -
        
            Ora devo continuare a sbloccare un vecchio sentiero.
            Questo posto morirebbe senza me.
            Quando avrai conquistato la fiducia di {charNameOne} e le avrai donato qualcosa, torna da me per le ultime istruzioni.
            {not cultivable_test.zainetto: Uh, che sbadata! Ti servirà di sicuro qualcosa per raccogliere gli oggetti!|E vevo che hai già trovato uno zainetto con cui raccogliere doni.}
            {not cultivable_test.zainetto: Ecco, prendi!| Interessante.}
                - (sbadata)
                
            ~ firstPauseTalking = 0
                -> main
             

    
=== questions
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameThree = translator(thirdCharacterState)
        ~ temp charNameFour= translator(fourthCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
            {firstCharacterInkLevel == Empty or firstCharacterInkLevel == Low: Non hai ottenuto molto inchiostro. Ma come si dice: se {pronouns has him: l'alunno|{pronouns has her: la alunna|l'alunnə}} sbaglia, la colpa è della maestra.}#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
            {firstCharacterInkLevel == Normal: Bel colpo! Ti sei {pronouns has him: guadagnato|{pronouns has her: guadagnata|guadagnatə}} subito una bella dose di inchiostro! Avessi fatto meglio il mio lavoro, sarebbe stato il massimo!}#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
            {firstCharacterInkLevel == High: {name}, hai dato alla persona il suo dono preferito! Riempi questo cuore di orgoglio!}#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
            E adesso, l'ultima lezione: a cosa serve l'inchiostro?
            Sostanzialmente più alto è il suo valore, più <b>interventi</b> puoi fare.
            Gli interventi sono domande o commenti che puoi fare su cose diverse che preoccupano la persona.
            Un intervento ti è sempre garantito, per provare a cambiare le cose, ma gli altri te li dovrai meritare.
            E più interventi hai a disposizione, più sarà facile convincere la persona a vedere le cose diversamente.
            A raggiungere il tuo obiettivo:
            riscrivere la sua storia.
            
                + [Hai un consiglio da darmi Mentore?]
                    Sii chi sei.
                    Segui i miei consigli.
                    E non chiedere all'altra persona di diventare qualcosa che non è.
                        ~ fifthGreen ++
                        
                + [Ma non posso dirle: chiamati così e cosà, addio!?]
                    Un nuovo nome è una nuova esperienza.
                    E l'esperienza viene dal percorso.
                    Se non c'è percorso, non c'è cambiamento.
                        ~ fifthRed ++
                
                + [Non è una persona razionale. Può farcela?]
                    {name}, capisco la tua perplessità, ma con la giusta guida, ce la può fare.
                    E assieme noi non possiamo di certo sbagliare!
                        ~ fifthBlue ++
                        
                + [Gli scoiattoli non hanno bisogno di riscriverla, invece?]
                    {name}, apprezzo la tua creatività, ma mantieni l'attenzione sull'obiettivo.
                    E gli scoiattoli non si fanno queste domande.
                    Gli scoiattoli <i>sono</i> e basta.
                        ~ fifthYellow ++
                        
                + [Non dovrei essere io a decidere il mio obiettivo?]
                    Il tuo obiettivo <i>qui</i>, perdonami.
                    Non avendo altri luoghi in cui andare, mi dimentico che possono esserci sono altre vite, altri obiettivi da raggiungere.
                        ~ fifthPurple ++
                -
            Ricorda {name}: sei una guida, ma sta alla persona decidere alla fine chi è, e di cosa ha bisogno.
            Quando te la senti, affronta questo ultimo passaggio e poi torna da me.
            
            ~ firstPauseTalking = 0
                -> main
        
        
    
   
=== little_storylets
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    Vorrei raccontarti una cosa strana. #speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:PG_neutral
        * (voices){pre_test}[C'è una voce che mi racconta cose.]
            Voce? #speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
            Sì. #speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:PG_neutral
            Ad esempio mi descrive le piante della serra.
            O i luoghi in cui entro.
            Riscrivere la storie di altre persone richiede una forte empatia. #speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
            Sicuramente quella voce è il tuo modo di capire questo luogo.
            Un intuito latente che ora è più forte.
            Meglio della stanchezza dell'essere mentore, fidati.
                -> talk_with_mentor
                
        * (infoImpo){firstCharacterInkLevel has High} [Quali informazioni importanti hanno le personagge?]
            Dove l'hai sentita questa cosa, stellina? #speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
            Quando stavo per fare le ultime domande a {charNameOne}, {voices: la|una} voce mi ha detto quanto inchiostro avevo e che avrei ricevuto una informazione importante. #speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:PG_neutral
            {not voices: Per la voce sarà la stanchezza, questo lavoro è faticoso.|Come ti dicevo, vedrai che è solo la tua empatia che parla.}#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
            Comunque ogni cosa qui è importante, {name}.
            Soprattutto se ti aiuta a raggiungere il tuo obiettivo.
                -> talk_with_mentor
        
        * (talkingFungus) {talking_fungus.first_story_ended_check} [Prima ho parlato con il tronco.]
            E mi ha chiesto come stavo dopo aver aiutato {charNameOne}. #speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:PG_neutral
            {infoImpo or voices: Stellina, di nuovo con questa voce?|Senti le voci, stellina?}#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
            Sono in questo posto da non so quanto e non ho mai parlato con tronchi o rami o radici. #speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:PG_neutral
            L'unica cosa che ha voce sono le persone che arrivano per chiedere il nostro aiuto.
            Il tuo aiuto.
            Se senti ancora una volte delle voci, prenditi un po' di riposo.
                -> talk_with_mentor
        
        * (talkingFrog) {the_frog.frog} [C'è una rana blu parlante.]
            Una rana. E dove?#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
            {are_entities_together_in(Mentor, PG, GreenhouseMiddlePath):Qui nello stagno.|Allo stagno.} #speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:PG_neutral
            Da che sono qui non ho mai visto rane parlanti, {name}.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
            E nemmeno rane e basta.
            Forse è il caso che ti riposi un poco, davvero.
            Lascia fare a me il resto.
            -> talk_with_mentor
        
        + [Ripensadonci, non ho nulla di nuovo da dire.]
            -> talk_with_mentor
   
//Feedback//
=== first_character_feedback
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
        Hai concluso la tua prima riscrittura, {name}!#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        {are_two_entities_together(FirstCharacter, PG): {charNameOne}: Mmm, sembra l'ora della pagella. Me ne vado.}#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_neutral
            ~ change_entity_place(FirstCharacter)
        E vorrei darti qualche mio feedback! #speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral    
        {
            - firstCharacterPossibleStates has Triangolo:
                Hai aiutato {charNameOne} a riscoprire il suo lato più pratico, razionale.
                Non quello di cui aveva bisogno, temo.
                Ma per essere la tua prima riscrittura hai dato davvero il massimo.
                Il resto, è colpa dei miei consigli imperfetti.
                Spero mi concederai il tempo di migliorarmi.
                
            - firstCharacterPossibleStates has RagazzaOrchestra:
                {charNameOne} ora sa di possedere un'idole più attiva, e anche oppositiva se serve.
                Forse avrei potuto guidarti meglio, non sono sicura che sia la natura più vicina al suo cuore.
                Ma faremo meglio la prossima volta.
                
            - firstCharacterPossibleStates has FlautoDolce:
                Grazie al tuo lavoro, {charNameOne} ha scoperto che gli affetti sono la cosa per lei fondamentale.
                Forse qualcosa che sapeva già.
                Forse ora sta meglio, giusto?
                Questo è il massimo che potevamo fare per lei, vero?
                
            - firstCharacterPossibleStates has Ocarina:
                {charNameOne} ha trovato nella giocosità uno sblocco, ed è pronta ad abbandonarsi alla sua creatività. 
                E chi sono io per giudicare cosa fa star bene un'altra persona?
                E indubbiamente sembra molto più felice di quando è arrivata.
                
            - firstCharacterPossibleStates has Violino:
                {charNameOne} aveva bisogno di riconoscere che per lei la vita ha senso solo con uno scopo più grande, e grazie a te, ce l'ha fatta.
                Abbiamo fatto un grande lavoro assieme, {name}.
                Non vedo l'ora di aiutare la prossima persona con te!
                
            - else: Non tutte le persone sono disposte a cambiare, ma questa non è una tua colpa.
                    Questa è mia. Il mio compito è renderti {pronouns has him: pronto|{pronouns has her: pronta|prontə}} per ogni evenienza.
                    A qualunque costo.
        }
        
        
        Non ti conosco ancora abbastanza, ma ci tengo a dirtelo: sentiti {pronouns has him: soddisfatto|{pronouns has her: soddisfatta|soddisfattə}}!
        Questo è un lavoro complesso, ma vedrai che col tempo sarà tutto più facile.
        Comunque sia, direi che ti ho dato tutti gli strumenti per far sì che tu possa riscrivere storie in autonomia. 
        Ma se avrai bisogno di aiuto per i luoghi del giardino, o un po' di supporto personale, sono qui.
        O anche solo per due chiacchiere.
        Ora vado a sistemare quel disastro che è la biblioteca, che già ci ho messo ore per sbloccare la porta.
                -> main
          
=== second_character_feedback
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)   
    
   Hai finito il percorso con {charNameTwo}, {name}!#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
   Ed entrambi mi avete stupita: non pensavo davvero che un bambino avrebbe avuto bisogno di questo luogo.
    {are_two_entities_together(SecondCharacter, PG): {charNameTwo}: Devi imparare tante cose sui bambini, tu. Vado a farmi due passi.}#speaker:{secondChar_tag()} #inkA:{ink_tag_a(secondCharacterInkLevel)} #inkB:{ink_tag_b(secondCharacterInkLevel)}  #inkC:{ink_tag_c(secondCharacterInkLevel)}  #inkD:{ink_tag_d(secondCharacterInkLevel)} #portrait:riccio_neutral
            ~ change_entity_place(SecondCharacter)
    Eccoti il mio modesto pensiero: #speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral        
    {
            - secondCharacterPossibleStates has Riccio:
                Mi spiace che non si sia liberato delle sue paure.
                E di quell'atteggiamento violento e fastidioso.
                Forse avrei dovuto darti più aiuto.
                O forse devi imparare meglio ad ascoltare gli altri?

            - secondCharacterPossibleStates has Grizzly:
                A quanto pare il nostro bambino ha abbracciato il suo lato rabbioso.
                E invece di combatterlo, l'ha fatto proprio.
                Personalmente, la rabbia non mi convince mai molto.
                Porta solo disordine e dolore.
                Ma immagino tu sappia quello che stai facendo, no?
    
            - secondCharacterPossibleStates has Lupo:
                La famiglia è qualcosa di importante, {name}.
                E sono contenta che {charNameTwo} abbia scoperto in sé la voglia di prendersene cura.
                E magari un giorno la sua nonna e suo fratello torneranno sotto il tetto dei genitori.
                Per me sarebbe un finale davvero felice.


            - secondCharacterPossibleStates has Delfino:
                Sono perplessa: non pensavo l'avresti spinto ad abbracciare il suo lato più infantile.
                Giocoso.
                So che il tuo lavoro è fare uscire queste persone dal blocco.
                Ma l'unica soluzione era quella di renderlo un giullare?
                
            - secondCharacterPossibleStates has Capibara:
                A volte forse devo solo dirmi: non tutto il mondo può essere come vorrei.
                Il fatto che il nostro piccolo amico ora si senta un {charNameTwo} mi lascia perplessa.
                Non sono mai stata una grande fan de "l'unione fa la forza".
                Ma forse tu hai visto qualcosa in quel bimbo che a me sfuggiva.
                E un giorno diventerà un uomo responsabile.
                Spero.
            
            - secondCharacterPossibleStates has Corvo:
                Non credo avresti potuto ottenere un esito migliore.
                La sua curiosità, la sua intelligenza indirizzate verso qualcosa di concreto, utile.
                Ce lo vedo a studiare nuovi modi per curare le persone.
                Per ridurre la fame nel mondo.
                O anche solo per inventare una variante di begonia che sia completamente nera.
                Ottimo lavoro, {name}!
     
        }
        
    Dopo la tua seconda riscrittura, spero di cuore che tu sia felice di quello che stai facendo. 
    A prescindere dal risultato.
    E un giorno potrai fare questo lavoro da {pronouns has him: solo|{pronouns has her: sola|solə}}.
    E a quel punto forse anche io potrò un poco riposare.
        -> talk_with_mentor
   
   === third_character_feedback
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState) 
    
   third_character_feedback #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_neutral
    -> talk_with_mentor
   
=== fourth_character_feedback
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    fourth_character_feedback #speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_neutral
        -> talk_with_mentor
    
=== fifth_character_feedback
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)    
    
    fifth_character_feedback#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_neutral
        -> talk_with_mentor
    
//Storylets di commentario
    === growing_fungus_storylet
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameThree = translator(thirdCharacterState)
        ~ temp charNameFour= translator(fourthCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
        Quella pianta mezza morta.#speaker:{firstChar_tag()} #inkA:{ink_tag_a(firstCharacterInkLevel)} #inkB:{ink_tag_b(firstCharacterInkLevel)}  #inkC:{ink_tag_c(firstCharacterInkLevel)}  #inkD:{ink_tag_d(firstCharacterInkLevel)} #portrait:chitarra_neutral
        Alla fine qualcosa è cambiato, ma non ho capito cosa.
        Ma ora sta crescendo.
        Sono comparse in un batter d'occhio queste radici solide, colorate.
        Non pensavo che questo luogo mi avrebbe stupita.
        Da quando sei qui, {name}, sono cambiate molte cose.
        Spero solo sia un segno positivo.
        Poi provo a dare un po' di concime a quel brutto albero.
        {entity_location(PG) == Forest: <i>Noi preferiamo crescere senza concime. Chiederemo alle formiche di forare il sacco.</i>} #speaker:{fungus_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState  #portrait:fungus_neutral
            -> talk_with_mentor
    
//Storylets sul secondo personaggio
    === that_little_liar_storylet
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
    
        {name}, sei {pronouns has him: riuscito|{pronouns has her: riuscita|riuscitə}} a rimandare quel bambino a casa?#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        {are_two_entities_together(SecondCharacter, PG):Da quanto vedo, no.}
        {are_two_entities_together(SecondCharacter, PG): {knowing_second_character.two: {charNameTwo}|???}: Antipatica.}#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral 
            ~ change_entity_place(SecondCharacter)
        Non è mai successo che qui arrivassero dei bambini.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        Non è un posto adatto a un bambino.
        E mi ha tirato un calcio!
        {knowing_second_character.not_talk:Lui dice che gli hai fatto male.} #speaker:{PG_tag()} #inkA:offState #inkB:offState #inkC:offState  #inkD:offState #portrait:PG_neutral
        {knowing_second_character.not_talk: L'ho solo fermato perché cercava di scappare.}#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral   
        Mi fa tenerezza, sai?#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        Mi sembra un riccio.
        Così carino, tenero.
        Ma poi come ti avvicini ti fa male.
        Mi spiace aver perso la pazienza con lui.
        Ma ci sono rimasta male per quel calcio.
        Io non ho tempo ora, ma sono sicura che troverai una soluzione.
        Trova un modo per allontanarlo.
        Ma non metterci troppo, per favore.
        ~ secondPauseTalking = 0
            -> talk_with_mentor
    
    === watering_can_storylet
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        L'annaffiatoio!#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        L'annaffiatoio è scomparso dalla serra.
        E sono sicura, sicura che è stato quel bambino dispettoso!
        {are_two_entities_together(SecondCharacter, PG):{charNameTwo}: Dispettosa sarai tu, vecchia biscia!}#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
            ~ change_entity_place(SecondCharacter)
        Giuro che sto cercando di essere paziente, {name}.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
        Giuro!
        Ma senza l'annaffiatoio non si possono coltivare le piante della serra.
        Senza piante della serra non ci sono molti doni per le persone che ne hanno bisogno.
        E l'equilibrio delicato di questo posto verrà meno.
        Ti prego, digli di ridarcelo!
        E caricalo di peso sul prossimo treno.
        No, non devo essere così severa.
        Ma ti prego, tienimelo lontano.
        ~ secondPauseTalking = 0
            -> talk_with_mentor

//Fine della demo
    === ending_demo
    ~ temp charNameFive = translator(fifthCharacterState)
    Sembra che la demo sia finita qui, {name}.#speaker:{fifthChar_tag()}  #inkA:{ink_tag_a(fifthCharacterInkLevel)} #inkB:{ink_tag_b(fifthCharacterInkLevel)}  #inkC:{ink_tag_c(fifthCharacterInkLevel)}  #inkD:{ink_tag_d(fifthCharacterInkLevel)} #portrait:mentore_neutral
    Potrai girare ancora per gli spazi aperti.
    Continuare a leggere le storie della <b>biblioteca</b>.
    E coltivare cosa rimane da coltivare nella <b>serra</b>.
    Ma non compariranno nuove persone bisognose.
    Ti chiedo un favore prima di salutarci, {name}.
    Salvati questo codice, e inseriscilo poi nel documento del testing.
    O se non hai voglia di rispondere alle domande mandamelo attraverso Queerginia: faresti molto felice entrambe.
    Il codice è {playerPurple}{playerYellow}{playerBlue}{playerGreen}{playerRed}{playerFirstStory}{playerSecondStory}{firstCharacterState} {secondCharacterState}
    Grazie di cuore.
        -> talk_with_mentor