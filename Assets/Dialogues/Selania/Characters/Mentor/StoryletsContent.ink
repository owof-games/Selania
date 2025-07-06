/* ---------------------------------

       Storylets tutorial

 ----------------------------------*/

=== welcome ===
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
        ???: Sapevo che sarebbe arrivata una nuova persona!
        ???: Immagino tu abbia un milione di domande, vero?
        - (top)
            * (dove) [Dove sono?]
                {chiSei:{charNameFive}|???}: Questo luogo non ha un nome.
                {chiSei:{charNameFive}|???}: Per me è il giardino, ma vedrai anche tu che è anche molto altre cose.
                {chiSei:{charNameFive}|???}: La cosa che posso dirti con certezza è che faccio di tutto per renderlo un posto sicuro.
                {chiSei:{charNameFive}|???}: Un posto dove prenderti cura di te.
                {chiSei:{charNameFive}|???}: Non male, no?
                {chiSei:{charNameFive}|???}: Soprattutto quando fuori da qui è difficile trovare un senso.
                    -> top
            
            * (chiSei) [Chi sei?]
                ???: La persona che tiene in piedi questo luogo.
                ???: Ma tu puoi chiamarmi <b>{translator(fifthCharacterState)}</b>.
                {charNameFive}: Così puoi ricordarti con facilità a cosa servo.
                    -> top
            
            * (vado) [Come me ne vado da qui?]
                {chiSei:{charNameFive}|???}: Vuoi già andartene?
                {chiSei:{charNameFive}|???}: Forse devo rivedere il mio benvenuto.
                {chiSei:{charNameFive}|???}: Forse sono stata troppo formale?
                {chiSei:{charNameFive}|???}: O dovrei essere più autorevole?
                {chiSei:{charNameFive}|???}: Ma non devo essere scortese ora.
                {chiSei:{charNameFive}|???}: Mi hai fatto una domanda, e vedrò di rispondere.
                {chiSei:{charNameFive}|???}: A est della stazione troverai un sentiero che ti riporterà a casa.
                {chiSei:{charNameFive}|???}: E se deciderai di tornare, troverai tutto nello stato in cui l'hai lasciato.
                    -> top
                    
            * {vado} [Non ho più voglia di parlare.]
                {chiSei:{charNameFive}|???}: Lascia che ti rubi giusto un secondo!
                    -> your_name
                
            * {vado or chiSei or dove} [Ma perché sono qui?]
                {chiSei:{charNameFive}|???}: Ora tocca a me farti una domanda.
                    -> your_name
                
            * -> your_name
    
    = your_name
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
        {chiSei:{charNameFive}|???}: Come ti devo chiamare?
        {chiSei:{charNameFive}|???}: Puoi usare un nome qualsiasi: prendi questa occasione come un nuovo inizio.
            -> name_choice ->
        {chiSei:{charNameFive}|???}: E quali sono i tuoi pronomi?
            -> gender ->
        {chiSei:{charNameFive}|???}: Piacere di conoscerti, {name}.
        {chiSei:{charNameFive}|???}: E {pronouns has him: benvenuto|{pronouns has her: benvenuta|benvenutə}}.
        {chiSei:{charNameFive}|???}: Con me usa pure i pronomi femminili.
        {not chiSei: ???: Ah, che sbadata. Mi chiamo <b>{charNameFive}</b>.|{charNameFive}: È mio dovere farti stare bene.}
        {charNameFive}: Un'altra domanda importante, {name}.
        {charNameFive}: Nel tuo soggiorno in questo luogo potrebbe accadere che incontrerai qualche situazione complessa.
        {charNameFive}: Se ti va di dirmi quali sono le cose che ti creano disagio, farò il possibile per non fartele incontrare.
                -> trigger_warning ->
        {charNameFive}: Ma in tutto questo non ti ho detto cosa devi fare!
            
            {
                - not talk_with_first_character: 
                    {charNameFive}: Facciamo così: prova a parlare con la persona{entity_location(PG) == TrainStop: al nostro fianco.| che troverai alla <b>stazione del treno</b>.}
                    {charNameFive}: E poi torna da me.
                    {charNameFive}: Nel frattempo raccolgo le foglie del giardino.
                         ~ firstPauseTalking = 0
                            -> main
                
                - talk_with_first_character:
                    {charNameFive}: Ma sei super sul pezzo! Sembra che {charNameOne} ti abbia già raccontato qualcosa di sè!
                    {charNameFive}: Cavolo, sei qui da pochissimo e già mi rendi orgogliosa di te!
                        -> gifts_and_ink
    
            }

            
=== gifts_and_ink
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
        
        {charNameFive}: Parliamo di doveri, {name}.
        {charNameFive}: Ogni tanto compariranno delle persone nuove.
        {charNameFive}: Sono persone rimaste bloccate in qualcosa: rimpianti, rimorsi, traumi.
        {charNameFive}: E qui arrivi tu, {name}.
        {charNameFive}: Passa del tempo per ascoltarle, capirle, cerca di capire quale sia la cosa giusta da dire.
        {charNameFive}: Conquista la loro fiducia.

        {
            - knowing_first_character.one.oneYellow:
            {charNameFive}: Parlare con {charNameOne} dei violini e dei tamburi è stato un ottimo inizio!
            
            - knowing_first_character.one.oneRed:
            {charNameFive}: Suggerire di cercare Talco con l'olfatto per esempio è stata un'idea originale, ma non ho percepito {charNameOne} particolarmente entusiasta. Forse dovevo darti più dritte.
            
            - knowing_first_character.one.oneBlue:
            {charNameFive}: In questo senso, un atteggiamento concreto con {charNameOne} non è un buon inizio, ma è colpa mia, è mio dovere darti le giuste indicazioni.
            
            - knowing_first_character.one.oneGreen:
            {charNameFive}: La tua proposta di ascoltare {charNameOne} per esempio è stata molto tenera, ma non sono sicura che sia molto nelle sue corde.
            
            - knowing_first_character.one.onePurple:
            {charNameFive}: Dire a {charNameOne} che Talco sarà sempre con lei ti ha fatto partire col piede giusto. Sono orgogliosa di te!
        
        }
        
        {charNameFive}: Ma perché vogliamo la loro fiducia?
        {charNameFive}: Perché quando si saranno aperte con te, ti verrà offerta l'occasione di dare loro un </b>dono<b>.
        {charNameFive}: I doni sono oggetti che offri a una persona in difficoltà.
        {charNameFive}: Può capitare che li troverai in giro, ma il più delle volte dovrai crearli da te.
        {charNameFive}: Ad esempio, coltivando qualcosa <b>alla serra</b>.
        {charNameFive}: Il dono è una cosa che puoi fare una sola volta, ed è il tuo modo di dimostrare a una persona che l'hai ascoltata.

            + [Matematico: ascolto, analizzo, scelgo il dono.]
                {charNameFive}: Esatto!
                {charNameFive}: Siamo sulla stessa lunghezza d'onda noi due!
                ~ fifthBlue ++
                    
            + [Come un gioco: comprendi il loop, dai il meglio di te.]
                {charNameFive}: Sono troppo vecchia per giocare, ma credo tu abbia centrato il punto.
                ~ fifthYellow ++
                    
            + [Quindi devo lavorare senza ricevere mezzo soldo.]
                {charNameFive}: Non è un lavoro.
                {charNameFive}: E qui non c'è denaro.
                {charNameFive}: Ma è colpa mia, sto dando troppe cose per scontato.
                ~ fifthRed ++
                    
            + [Mi piace l'idea di creare una relazione con queste persone.]
                {charNameFive}: Un po' di distacco è utile, per non farti ferire.
                {charNameFive}: Vediti più come {pronouns has him: un amico|{pronouns has her: un'amica|unə amicə}}, che aiuta una persona a vedersi in modo diverso. 
                ~ fifthGreen ++
                    
            + [La fiducia non si conquista, la fiducia è un dono.]
                {charNameFive}: Ho usato delle parole frettolose, scusa.
                {charNameFive}: Ma sì: tu doni loro tempo e ascolto, e loro ti donano la propria fiducia.
                ~ fifthPurple ++
            -
        
        {charNameFive}: Il dono è importante non solo per guadagnare fiducia.
        {charNameFive}: Il giusto dono può anche aumentare la tua quantità di <b>inchiostro</b>.
        {charNameFive}: Perché tu{pronouns has him: amico mio|{pronouns has her: amica mia|amicə miə}} sei<b>{pronouns has him: un riscrittore|{pronouns has her: una riscrittora|unə riscrittorə}}</b>!
        {charNameFive}: Aiuti queste persone bloccate a guardare la loro storia in modo diverso, e a scegliersi un nuovo nome.
        
            + [E tu hai bisogno di un nuovo nome?]
                {charNameFive}: Io?
                {charNameFive}: No!
                {charNameFive}: Questo è stato, è e sarà sempre il mio nome.
                    ~ fifthPurple ++
                    
            + [Con l'inchiostro ci posso disegnare?]
                {charNameFive}: Apprezzo la tua creatività, {name}.
                {charNameFive}: Ma tu sei {pronouns has him: un riscrittore|{pronouns has her: una riscrittora|unə riscrittorə}}, non {pronouns has him: un disegnatore|{pronouns has her: una disegnatrice|unə disegnatricə}}.
                    ~ fifthYellow ++
                    
            + [Solo le persone care ci fanno vedere in modo diverso.]
                {charNameFive}: A volte è più facile aprirsi a chi non si conosce.
                {charNameFive}: E mentre noi riflettiamo sulle loro difficoltà, impariamo anche qualcosa su di noi.
                        ~ fifthGreen ++
                        
            + [Tipo gaslighting?]
                {charNameFive}: No no no assolutamente no.
                {charNameFive}: Cavolo, devo essere più chiara.
                {charNameFive}: Ma se una persona si sente presa in giro, non si fiderà mai di te.
                        ~ fifthRed ++
            
            + [Un nome è un nome. Che se ne fanno di uno nuovo?]
                {charNameFive}: Un nome è come una magia.
                {charNameFive}: Lo carichiamo di volta in volta di significato.
                {charNameFive}: E quando lo usiamo, ci dice chi siamo.
                {charNameFive}: A volte quella magia non va più bene, e dobbiamo cercare una nuova formula. Un nuovo nome.
                    ~ fifthBlue ++
            -
        
            {charNameFive}: Ora devo continuare a sbloccare un vecchio sentiero.
            {charNameFive}: Questo posto morirebbe senza me.
            {charNameFive}: Quando avrai conquistato la fiducia di {charNameOne} e le avrai donato qualcosa, torna da me per le ultime istruzioni.
                
            ~ firstPauseTalking = 0
                -> main
             

    
=== questions
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameThree = translator(thirdCharacterState)
        ~ temp charNameFour= translator(fourthCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
            {firstCharacterInkLevel == Empty or firstCharacterInkLevel == Low: {charNameFive}: Non hai ottenuto molto inchiostro. Ma come si dice: se {pronouns has him: l'alunno|{pronouns has her: la alunna|l'alunnə}} sbaglia, la colpa è del maestro.}
            {firstCharacterInkLevel == Normal: {charNameFive}: Bel colpo! Ti sei {pronouns has him: guadagnato|{pronouns has her: guadagnata|guadagnatə}} subito una bella dose di inchiostro! Avessi fatto meglio il mio lavoro, sarebbe stato il massimo!}
            {firstCharacterInkLevel == High: {charNameFive}: {name}, hai dato alla persona il suo dono preferito! Riempi questo cuore di orgoglio!}
            {charNameFive}: E adesso, l'ultima lezione: a cosa serve l'inchiostro?
            {charNameFive}: Sostanzialmente più alto è il suo valore, più <b>interventi</b> puoi fare.
            {charNameFive}: Gli interventi sono domande o commenti che puoi fare su cose diverse che preoccupano la persona.
            {charNameFive}: Un intervento ti è sempre garantito, per provare a cambiare le cose, ma gli altri te li dovrai meritare.
            {charNameFive}: E più interventi hai a disposizione, più sarà facile convincere la persona a vedere le cose diversamente.
            {charNameFive}: A raggiungere il tuo obiettivo:
            {charNameFive}: riscrivere la sua storia.
            
                + [Hai un consiglio da darmi Mentore?]
                    {charNameFive}: Sii chi sei.
                    {charNameFive}: Segui i miei consigli.
                    {charNameFive}: E non chiedere all'altra persona di diventare qualcosa che non è.
                        ~ fifthGreen ++
                        
                + [Ma non posso dirle: chiamati così e cosà, addio!?]
                    {charNameFive}: Un nuovo nome è una nuova esperienza.
                    {charNameFive}: E l'esperienza viene dal percorso.
                    {charNameFive}: Se non c'è percorso, non c'è cambiamento.
                        ~ fifthRed ++
                
                + [Non è una persona razionale. Può farcela?]
                    {charNameFive}: {name}, capisco la tua perplessità, ma con la giusta guida, ce la può fare.
                    {charNameFive}: E assieme noi non possiamo di certo sbagliare!
                        ~ fifthBlue ++
                        
                + [Gli scoiattoli non hanno bisogno di riscriverla, invece?]
                    {charNameFive}: {name}, apprezzo la tua creatività, ma mantieni l'attenzione sull'obiettivo.
                    {charNameFive}: E gli scoiattoli non si fanno queste domande.
                    {charNameFive}: Gli scoiattoli <i>sono</i> e basta.
                        ~ fifthYellow ++
                        
                + [Non dovrei essere io a decidere il mio obiettivo?]
                    {charNameFive}: Il tuo obiettivo <i>qui</i>, perdonami.
                    {charNameFive}: Non avendo altri luoghi in cui andare, mi dimentico che possono esserci sono altre vite, altri obiettivi da raggiungere.
                        ~ fifthPurple ++
                -
            {charNameFive}: Ricorda {name}: sei una guida, ma sta alla persona decidere alla fine chi è, e di cosa ha bisogno.
            {charNameFive}: Quando te la senti, affronta questo ultimo passaggio e poi torna da me.
            
            ~ firstPauseTalking = 0
                -> main
        
        
    
   
=== little_storylets
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    {name}: Vorrei raccontarti una cosa strana.
        * (voices){pre_test}[C'è una voce che mi racconta cose.]
            {charNameFive}: Voce?
            {name}: Sì.
            {name}: Ad esempio mi descrive le piante della serra.
            {name}: O i luoghi in cui entro.
            {charNameFive}: Riscrivere la storie di altre persone richiede una forte empatia.
            {charNameFive}: Sicuramente quella voce è il tuo modo di capire questo luogo.
            {charNameFive}: Un intuito latente che ora è più forte.
            {charNameFive}: Meglio della stanchezza dell'essere mentore, fidati.
                -> talk_with_mentor
                
        * (infoImpo){firstCharacterInkLevel has High} [Quali informazioni importanti hanno le personagge?]
            {charNameFive}: Dove l'hai sentita questa cosa, stellina?
            {name}: Quando stavo per fare le ultime domande a {charNameOne}, {voices: la|una} voce mi ha detto quanto inchiostro avevo e che avrei ricevuto una informazione importante.
            {not voices: {charNameFive}: Per la voce sarà la stanchezza, questo lavoro è faticoso.|{charNameFive}: Come ti dicevo, vedrai che è solo la tua empatia che parla.}
            {charNameFive}: Comunque ogni cosa qui è importante, {name}.
            {charNameFive}: Soprattutto se ti aiuta a raggiungere il tuo obiettivo.
                -> talk_with_mentor
        
        * (talkingFungus) {talking_fungus.first_story_ended_check} [Prima ho parlato con il tronco.]
            {name}: E mi ha chiesto come stavo dopo aver aiutato {charNameOne}.
            {infoImpo or voices: {charNameFive}: Stellina, di nuovo con questa voce?|{charNameFive}: Senti le voci, stellina?}
            {name}: Sono in questo posto da non so quanto e non ho mai parlato con tronchi o rami o radici.
            {name}: L'unica cosa che ha voce sono le persone che arrivano per chiedere il nostro aiuto.
            {name}: Il tuo aiuto.
            {name}: Se senti ancora una volte delle voci, prenditi un po' di riposo.
                -> talk_with_mentor
        
        * (talkingFrog) {the_frog.frog} [C'è una rana blu parlante.]
            {charNameFive}: Una rana. E dove?
            {are_entities_together_in(Mentor, PG, GreenhouseMiddlePath):{name}: Qui nello stagno.|{name}: Allo stagno.}
            {charNameFive}: Da che sono qui non ho mai visto rane parlanti, {name}.
            {charNameFive}: E nemmeno rane e basta.
            {charNameFive}: Forse è il caso che ti riposi un poco, davvero.
            {charNameFive}: Lascia fare a me il resto.
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
    
        {charNameFive}: Hai concluso la tua prima riscrittura, {name}!
        {are_two_entities_together(FirstCharacter, PG): {charNameOne}: Mmm, sembra l'ora della pagella. Me ne vado.}
            ~ change_entity_place(FirstCharacter)
        {
            - firstCharacterPossibleStates has Triangolo:
                {charNameFive}: Hai aiutato {charNameOne} a riscoprire il suo lato più pratico, razionale.
                {charNameFive}: Non quello di cui aveva bisogno, temo.
                {charNameFive}: Ma per essere la tua prima riscrittura hai dato davvero il massimo.
                {charNameFive}: Il resto, è colpa dei miei consigli imperfetti.
                {charNameFive}: Spero mi concederai il tempo di migliorarmi.
                
            - firstCharacterPossibleStates has RagazzaOrchestra:
                {charNameFive}: {charNameOne} ora sa di possedere un'idole più attiva, e anche oppositiva se serve.
                {charNameFive}: Forse avrei potuto guidarti meglio, non sono sicura che sia la natura più vicina al suo cuore.
                {charNameFive}: Ma faremo meglio la prossima volta.
                
            - firstCharacterPossibleStates has FlautoDolce:
                {charNameFive}: Grazie al tuo lavoro, {charNameOne} ha scoperto che gli affetti sono la cosa per lei fondamentale.
                {charNameFive}: Forse qualcosa che sapeva già.
                {charNameFive}: Forse ora sta meglio, giusto?
                {charNameFive}: Questo è il massimo che potevamo fare per lei, vero?
                
            - firstCharacterPossibleStates has Ocarina:
                {charNameFive}: {charNameOne} ha trovato nella giocosità uno sblocco, ed è pronta ad abbandonarsi alla sua creatività.
                {charNameFive}: E chi sono io per giudicare cosa fa star bene un'altra persona?
                {charNameFive}: E indubbiamente sembra molto più felice di quando è arrivata.
                
            - firstCharacterPossibleStates has Violino:
                {charNameFive}: {charNameOne} aveva bisogno di riconoscere che per lei la vita ha senso solo con uno scopo più grande, e grazie a te, ce l'ha fatta.
                {charNameFive}: Abbiamo fatto un grande lavoro assieme, {name}.
                {charNameFive}: Non vedo l'ora di aiutare la prossima persona con te!
                
            - else: {charNameFive}: Non tutte le persone sono disposte a cambiare, ma questa non è una tua colpa. 
                    {charNameFive}: Questa è mia. Il mio compito è renderti {pronouns has him: pronto|{pronouns has her: pronta|prontə}} per ogni evenienza.
                    {charNameFive}: A qualunque costo.
        }
        
        
        {charNameFive}: Non ti conosco ancora abbastanza, ma ci tengo a dirtelo: sentiti {pronouns has him: soddisfatto|{pronouns has her: soddisfatta|soddisfattə}}!
        {charNameFive}: Questo è un lavoro complesso, ma vedrai che col tempo sarà tutto più facile.
        {charNameFive}: Comunque sia, direi che ti ho dato tutti gli strumenti per far sì che tu possa riscrivere storie in autonomia. 
        {charNameFive}: Ma se avrai bisogno di aiuto per i luoghi del giardino, o un po' di supporto personale, sono qui.
        {charNameFive}: O anche solo per due chiacchiere.
        {charNameFive}: Ora vado a sistemare quel disastro che è la biblioteca, che già ci ho messo ore per sbloccare la porta.
                -> main
          
=== second_character_feedback
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)   
    
   {charNameFive}: Hai finito il percorso con {charNameTwo}, {name}!
   {charNameFive}: Ed entrambi mi avete stupita: non pensavo davvero che un bambino avrebbe avuto bisogno di questo luogo.
    {are_two_entities_together(SecondCharacter, PG): {charNameTwo}: Devi imparare tante cose sui bambini, tu. Vado a farmi due passi.}
            ~ change_entity_place(SecondCharacter)
    {
            - secondCharacterPossibleStates has Riccio:
                {charNameFive}: Mi spiace che non si sia liberato delle sue paure.
                {charNameFive}: E di quell'atteggiamento violento e fastidioso.
                {charNameFive}: Forse avrei dovuto darti più aiuto.
                {charNameFive}: O forse devi imparare meglio ad ascoltare gli altri?

            - secondCharacterPossibleStates has Grizzly:
                {charNameFive}: A quanto pare il nostro bambino ha abbracciato il suo lato rabbioso.
                {charNameFive}: E invece di combatterlo, l'ha fatto proprio.
                {charNameFive}: Personalmente, la rabbia non mi convince mai molto.
                {charNameFive}: Porta solo disordine e dolore.
                {charNameFive}: Ma immagino tu sappia quello che stai facendo, no?
    
            - secondCharacterPossibleStates has Lupo:
                {charNameFive}: La famiglia è qualcosa di importante, {name}.
                {charNameFive}: E sono contenta che {charNameTwo} abbia scoperto in sé la voglia di prendersene cura.
                {charNameFive}: E magari un giorno la sua nonna e suo fratello torneranno sotto il tetto dei genitori.
                {charNameFive}: Per me sarebbe un finale davvero felice.


            - secondCharacterPossibleStates has Delfino:
                {charNameFive}: Sono perplessa: non pensavo l'avresti spinto ad abbracciare il suo lato più infantile.
                {charNameFive}: Giocoso.
                {charNameFive}: So che il tuo lavoro è fare uscire queste persone dal blocco.
                {charNameFive}: Ma l'unica soluzione era quella di renderlo un giullare?
                
            - secondCharacterPossibleStates has Capibara:
                {charNameFive}: A volte forse devo solo dirmi: non tutto il mondo può essere come vorrei.
                {charNameFive}: Il fatto che il nostro piccolo amico ora si senta un {charNameTwo} mi lascia perplessa.
                {charNameFive}: Non sono mai stata una grande fan de "l'unione fa la forza".
                {charNameFive}: Ma forse tu hai visto qualcosa in quel bimbo che a me sfuggiva.
                {charNameFive}: E un giorno diventerà un uomo responsabile.
                {charNameFive}: Spero.
            
            - secondCharacterPossibleStates has Corvo:
                {charNameFive}: Non credo avresti potuto ottenere un esito migliore.
                {charNameFive}: La sua curiosità, la sua intelligenza indirizzate verso qualcosa di concreto, utile.
                {charNameFive}: Ce lo vedo a studiare nuovi modi per curare le persone.
                {charNameFive}: Per ridurre la fame nel mondo.
                {charNameFive}: O anche solo per inventare una variante di begonia che sia completamente nera.
                {charNameFive}: Ottimo lavoro, {name}!
     
        }
        
    {charNameFive}: Dopo la tua seconda riscrittura, spero di cuore che tu sia felice di quello che stai facendo.
    {charNameFive}: A prescindere dal risultato.
    {charNameFive}: E un giorno potrai fare questo lavoro da {pronouns has him: solo|{pronouns has her: sola|solə}}.
    {charNameFive}: E a quel punto forse anche io potrò un poco riposare.
        -> talk_with_mentor
   
   === third_character_feedback
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState) 
    
   third_character_feedback
    -> talk_with_mentor
   
=== fourth_character_feedback
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)
    
    fourth_character_feedback
        -> talk_with_mentor
    
=== fifth_character_feedback
    ~ temp charNameOne = translator(firstCharacterState)
    ~ temp charNameTwo = translator(secondCharacterState)
    ~ temp charNameThree = translator(thirdCharacterState)
    ~ temp charNameFour= translator(fourthCharacterState)
    ~ temp charNameFive = translator(fifthCharacterState)    
    
    fifth_character_feedback
        -> talk_with_mentor
    
//Storylets di commentario
    === growing_fungus_storylet
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameThree = translator(thirdCharacterState)
        ~ temp charNameFour= translator(fourthCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        
        {charNameFive}: Quella pianta mezza morta.
        {charNameFive}: Alla fine qualcosa è cambiato, ma non ho capito cosa.
        {charNameFive}: Ma ora sta crescendo.
        {charNameFive}: Sono comparse in un batter d'occhio queste radici solide, colorate.
        {charNameFive}: Non pensavo che questo luogo mi avrebbe stupita.
        {charNameFive}: Da quando sei qui, {name}, sono cambiate molte cose.
        {charNameFive}: Spero solo sia un segno positivo.
        {charNameFive}: Poi provo a dare un po' di concime a quel brutto albero.
        {entity_location(PG) == Forest: <i>Noi preferiamo crescere senza concime. Chiederemo alle formiche di forare il sacco.</i>}
            -> talk_with_mentor
    
//Storylets sul secondo personaggio
    === that_little_liar_storylet
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
    
        {charNameFive}: {name}, sei {pronouns has him: riuscito|{pronouns has her: riuscita|riuscitə}} a rimandare quel bambino a casa?
        {are_two_entities_together(SecondCharacter, PG):{charNameFive}: Da quanto vedo, no.}
        {are_two_entities_together(SecondCharacter, PG): {knowing_second_character.two: {charNameTwo}|???}: Antipatica.}
            ~ change_entity_place(SecondCharacter)
        {charNameFive}: Non è mai successo che qui arrivassero dei bambini.
        {charNameFive}: Non è un posto adatto a un bambino.
        {charNameFive}: E mi ha tirato un calcio!
        {knowing_second_character.not_talk: {name}: Lui dice che gli hai fatto male.}
        {knowing_second_character.not_talk: {charNameFive}: L'ho solo fermato perché cercava di scappare.}    
        {charNameFive}: Mi fa tenerezza, sai?
        {charNameFive}: Mi sembra un riccio.
        {charNameFive}: Così carino, tenero.
        {charNameFive}: Ma poi come ti avvicini ti fa male.
        {charNameFive}: Mi spiace aver perso la pazienza con lui.
        {charNameFive}: Ma ci sono rimasta male per quel calcio.
        {charNameFive}: Io non ho tempo ora, ma sono sicura che troverai una soluzione.
        {charNameFive}: Trova un modo per allontanarlo.
        {charNameFive}: Ma non metterci troppo, per favore.
        ~ secondPauseTalking = 0
            -> talk_with_mentor
    
    === watering_can_storylet
        ~ temp charNameOne = translator(firstCharacterState)
        ~ temp charNameTwo = translator(secondCharacterState)
        ~ temp charNameFive = translator(fifthCharacterState)
        {charNameFive}: L'annaffiatoio!
        {charNameFive}: L'annaffiatoio è scomparso dalla serra.
        {charNameFive}: E sono sicura, sicura che è stato quel bambino dispettoso!
        {are_two_entities_together(SecondCharacter, PG):{charNameTwo}: Dispettosa sarai tu, vecchia biscia!}
            ~ change_entity_place(SecondCharacter)
        {charNameFive}: Giuro che sto cercando di essere paziente, {name}.
        {charNameFive}: Giuro!
        {charNameFive}: Ma senza l'annaffiatoio non si possono coltivare le piante della serra.
        {charNameFive}: Senza piante della serra non ci sono molti doni per le persone che ne hanno bisogno.
        {charNameFive}: E l'equilibrio delicato di questo posto verrà meno.
        {charNameFive}: Ti prego, digli di ridarcelo!
        {charNameFive}: E caricalo di peso sul prossimo treno.
        {charNameFive}: No, non devo essere così severa.
        {charNameFive}: Ma ti prego, tienimelo lontano.
        ~ secondPauseTalking = 0
            -> talk_with_mentor

//Fine della demo
    === ending_demo
    ~ temp charNameFive = translator(fifthCharacterState)
    {charNameFive}: Sembra che la demo sia finita qui, {name}.
    {charNameFive}: Potrai girare ancora per gli spazi aperti.
    {charNameFive}: Continuare a leggere le storie della <b>biblioteca</b>.
    {charNameFive}: E coltivare cosa rimane da coltivare nella <b>serra</b>.
    {charNameFive}: Ma non compariranno nuove persone bisognose.
    {charNameFive}: Ti chiedo un favore prima di salutarci, {name}.
    {charNameFive}: Salvati questo codice, e inseriscilo poi nel documento del testing.
    {charNameFive}: O se non hai voglia di rispondere alle domande mandamelo attraverso Queerginia: faresti molto felice entrambe.
    {charNameFive}: Il codice è {playerPurple}{playerYellow}{playerBlue}{playerGreen}{playerRed}{playerFirstStory}{playerSecondStory}{firstCharacterState} {secondCharacterState}
    {charNameFive}: Grazie di cuore.
        -> talk_with_mentor