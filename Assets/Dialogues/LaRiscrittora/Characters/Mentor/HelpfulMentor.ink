/* ---------------------------------

   Presentazioni

 ----------------------------------*/

=== welcome ===
~ temp charNameOne = uppercaseTranslator(firstCharacterState)
~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
~ temp charNameThree = uppercaseTranslator(thirdCharacterState)
~ temp charNameFour= uppercaseTranslator(fourthCharacterState)
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)

    Sconosciuto: Sapevo che sarebbe arrivata una nuova persona!
    Sconosciuto: Immagino tu abbia un milione di domande, vero?
    - (top)
        * (dove) [Dove sono?]
            {chiSei:{charNameFive}|Sconosciuto}: Bella domanda.
            {chiSei:{charNameFive}|Sconosciuto}: La cosa che posso dirti con certezza è che faccio di tutto per renderlo un posto sicuro.
            {chiSei:{charNameFive}|Sconosciuto}: Un posto dove prenderti cura di te.
            {chiSei:{charNameFive}|Sconosciuto}: Non male, no?
            {chiSei:{charNameFive}|Sconosciuto}: Soprattutto quando fuori da qui è difficile trovare un senso.
                -> top
        
        * (chiSei) [Chi sei?]
            Sconosciuto: Sostanzialmente, la persona che tieni in piedi questo luogo.
            Sconosciuto: Ma tu puoi chiamarmi <b>{lowercaseTranslator(fifthCharacterState)}</b>.
            {charNameFive}: Così puoi ricordarti con facilità qual è il mio ruolo.
                -> top
        
        * (vado) [Come me ne vado da qui?]
            {chiSei:{charNameFive}|Sconosciuto}: Vuoi già andartene?
            {chiSei:{charNameFive}|Sconosciuto}: Merda, forse devo rivedere il mio benvenuto.
            {chiSei:{charNameFive}|Sconosciuto}: Forse sono stata troppo formale?
            {chiSei:{charNameFive}|Sconosciuto}: O dovrei essere più autorevole?
            {chiSei:{charNameFive}|Sconosciuto}: Ma non devo essere scortese, ora.
            {chiSei:{charNameFive}|Sconosciuto}: Mi hai fatto una domanda, e vedrò di rispondere.
            {chiSei:{charNameFive}|Sconosciuto}: Ad est della fermata del bus troverai un sentiero che ti riporterà a casa.
            {chiSei:{charNameFive}|Sconosciuto}: E se deciderai di tornare, troverai tutto salvato come l'hai lasciato.
                -> top
                
        * {vado} [Non ho più voglia di parlare.]
            {chiSei:{charNameFive}|Sconosciuto}: Lascia che ti rubi giusto un secondo!
            -> your_name
            
        * {vado or chiSei or dove} [Ma perché sono qui?]
            {chiSei:{charNameFive}|Sconosciuto}: Ora tocca a me farti una domanda.
            -> your_name
            
        * -> your_name
    
    = your_name
        ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
        ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        
        {chiSei:{charNameFive}|Sconosciuto}: Come ti devo chiamare?
        {chiSei:{charNameFive}|Sconosciuto}: Puoi usare qualsiasi nome: prendi questa occasione come un nuovo inizio.
            -> name_choice ->
        {chiSei:{charNameFive}|Sconosciuto}: E quali sono i pronomi in cui ti riconosci?
            -> gender ->
        {chiSei:{charNameFive}|Sconosciuto}: Piacere di conoscerti, {name}.
        {chiSei:{charNameFive}|Sconosciuto}: E {pronouns has him: benvenuto|{pronouns has her: benvenuta|benvenutə}}.
        {not chiSei: Sconosciuto: Ah, che sbadata. Invece tu chiamami <b>{charNameFive}</b>.|{charNameFive}: È mio dovere farti stare bene.}
        {charNameFive}: Un'altra domanda importante, {name}.
        {charNameFive}: Nel tuo soggiorno in questo luogo potrebbe accadere che incontrerai qualche situazione complessa.
        {charNameFive}: Se ti va di dirmi quali sono le cose che ti creano disagio, farò del mio meglio per non fartele incontrare.
                -> trigger_warning ->
        {charNameFive}: Ma in tutto questo non ti ho detto cosa devi fare!
            
            {
                - not talk_with_first_character: 
                    {charNameFive}: Facciamo così: prova a parlare con la persona che troverai alla <b>fermata del bus</b>.
                    {charNameFive}: E poi torna da me.
                    {charNameFive}: Nel frattempo raccolgo le foglie del giardino.
                         ~ firstPauseTalking = 0
                            ->->
                - talk_with_first_character:
                    {charNameFive}: Ma sei super sul pezzo! Sembra che {charNameOne} ti abbia già raccontato qualcosa di sè!
                    {charNameFive}: Cavolo, sei qui da pochissimo e già mi rendi orgogliosa di te!
                            -> gifts_and_ink
    
            }

            
    === gifts_and_ink
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameThree = uppercaseTranslator(thirdCharacterState)
    ~ temp charNameFour= uppercaseTranslator(fourthCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
        
        {charNameFive}: Parliamo di doveri, {name}.
        {charNameFive}: Ogni tanto compariranno delle persone nuove.
        {charNameFive}: Sono sempre persone che sono rimaste bloccate in qualcosa: rimpianti, rimorsi, traumi.
        {charNameFive}: Quale che sia il motivo, si ritovano bloccate nella loro vita.
        {charNameFive}: E qui arrivi tu, {name}.
        {charNameFive}: Passa del tempo per ascoltarle, capirle, cerca di capire quale sia la cosa giusta da dire.
        {charNameFive}: Conquista la loro fiducia.

        {
            - knowing_first_character.one.oneYellow:
            {charNameFive}: Parlare con {charNameOne} dei violini e dei tamburi è stato un ottimo inizio, mi hai fatta felice!
            
            - knowing_first_character.one.oneRed:
            {charNameFive}: Suggerire di cercare Talco con l'olfatto per esempio è stata originale, ma non ho percepito {charNameOne} particolarmente entusiasta all'idea. Forse dovevo darti più dritte.
            
            - knowing_first_character.one.oneBlue:
            {charNameFive}: In questo senso, essere razionale con {charNameOne} non è un buon inizio, ma è colpa mia, è mio dovere darti le giuste indicazioni.
            
            - knowing_first_character.one.oneGreen:
            {charNameFive}: La tua proposta di ascoltare {charNameOne} per esempio è stata molto tenera, ma non sono sicura che sia molto nelle sue corde.
            
            - knowing_first_character.one.onePurple:
            {charNameFive}: Dire a {charNameOne} che Talco sarà sempre con lei ti ha fatto partire col piede giusto. Sono orgogliosa di te!
        
        }
        
        {charNameFive}: Perché vogliamo la loro fiducia?
        {charNameFive}: Perché quando si saranno aperte con te, ti verrà offerta l'occasione di dare loro un </b>dono<b>.
        {charNameFive}: I doni sono oggetti che puoi donare a una persona in difficoltà.
        {charNameFive}: A volte li troverai in giro, ma il più delle volte dovrai crearli da te.
        {charNameFive}: Ad esempio, coltivando qualcosa <b>alla serra</b>.
        {charNameFive}: Il dono è una cosa che puoi fare una sola volta, ed è il tuo modo di dimostrare loro che l3 hai ascoltat3.

            + [Matematico: ascolto, analizzo, scelgo il dono.]
                {charNameFive}: Esatto!
                {charNameFive}: Siamo sulla stessa lunghezza d'onda noi due!
                    ~ fifthBlue ++
                    
            + [Come un videogioco: comprendi il loop, dai il meglio di te.]
                {charNameFive}: Non sono una fan dei videogiochi, ma credo tu abbia centrato il punto.
                    ~ fifthYellow ++
                    
            + [Mi stai chiedendo di lavorare senza darmi un soldo.]
                {charNameFive}: Non è un lavoro.
                {charNameFive}: E qui non c'è denaro.
                {charNameFive}: Ma è colpa mia, sto dando troppe cose per scontate.
                    ~ fifthRed ++
                    
            + [Quindi devo creare una relazione con queste persone?]
                {charNameFive}: Un po' di distacco è utile, per non farti ferire.
                {charNameFive}: Vediti più come {pronouns has him: un dottore|{pronouns has her: una dottora|unə dottorə}}, che cerca di far trovare loro un nuovo equilibrio. 
                    ~ fifthGreen ++
                    
            + [La fiducia non si conquista, la fiducia è un dono.]
                {charNameFive}: Ho usato delle parole frettolose, scusa.
                {charNameFive}: Ma sì: tu doni loro tempo e ascolto, e loro ti donano la propria fiducia.
                    ~ fifthPurple ++
            -
        {charNameFive}: Ma perché devi dare un dono?
        {charNameFive}: Non solo per dimostrare a queste persone che le hai ascoltate, ma anche per aumentare la tua quantità di <b>inchiostro</b>.
        {charNameFive}: Perché tu {pronouns has him: amico mio|{pronouns has her: amica mia|amicə miə}} sei <b>{pronouns has him: un riscrittore|{pronouns has her: una riscrittora|unə riscrittorə}}</b>!
        {charNameFive}: Aiuti queste persone bloccate a guardare la loro storia in modo diverso, e a scegliersi un nuovo nome.
        
            + [E tu, hai bisogno di un nuovo nome?]
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
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameThree = uppercaseTranslator(thirdCharacterState)
    ~ temp charNameFour= uppercaseTranslator(fourthCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
        {firstCharacterInkLevel == Empty or firstCharacterInkLevel == Low: {charNameFive}: Non hai ottenuto molto inchiostro. Ma come si dice: se {pronouns has him: l'alunno|{pronouns has her: la alunna|l'alunnə}}} sbaglia, la colpa è del maestro.
        {firstCharacterInkLevel == Normal: {charNameFive}: Bel colpo! Ti sei {pronouns has him: guadagnato|{pronouns has her: guadagnata|guadagnatə}} subito una bella dose di inchiostro! Avessi fatto meglio il mio lavoro, sarebbe stato il massimo!}
        {firstCharacterInkLevel == High: {charNameFive}: {name}, hai dato alla persona il suo dono preferito! Riempi questo cuore di orgoglio!}
        {charNameFive}: E adesso, l'ultima lezione: a cosa serve l'inchiostro?
        {charNameFive}: Sostanzialmente più alto è il valore di inchiostro, più <b>interventi</b> puoi fare.
        {charNameFive}: Gli interventi sono domande o commenti che puoi fare su cose diverse che preoccupano la persona.
        {charNameFive}: Un intervento ti è sempre garantito, per provare a cambiare le cose, ma gli altri te li devi meritare.
        {charNameFive}: E più interventi hai a disposizione, più puoi convincere la persona a vedere le cose diversamente.
        {charNameFive}: A raggiungere il tuo obiettivo:
        {charNameFive}: riscrivere la sua storia.
        
            + [Hai un consiglio da darmi Mentore?]
                {charNameFive}: Sii chi sei.
                {charNameFive}: Segui i miei consigli.
                {charNameFive}: E non chiedere all'altra persona di diventare qualcosa che non è.
                    ~ fifthGreen ++
                    
            + [Ma non posso dirle: chiamati così, ciao, adios!?]
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
                    
            + [Mentore, ti stimo, ma non sei tu a decidere il mio obiettivo.]
                {charNameFive}: Il tuo obiettivo <i>qui</i>, perdonami.
                {charNameFive}: Non avendo altri luoghi in cui andare, mi dimentico che possono esserci sono altre vite, altri obiettivi da raggiungere.
                    ~ fifthPurple ++
            -
        {charNameFive}: Ricorda {name}: sei una guida, ma sta alla persona decidere alla fine chi è, e di cosa ha bisogno.
        {charNameFive}: Quando te la senti, affronta questo ultimo passaggio, e poi torna da me.
                ~ firstPauseTalking = 0
                    -> main
        
        
    === first_character_feedback
    ~ temp charNameOne = uppercaseTranslator(firstCharacterState)
    ~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
    ~ temp charNameThree = uppercaseTranslator(thirdCharacterState)
    ~ temp charNameFour= uppercaseTranslator(fourthCharacterState)
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    
        {charNameFive}: Beh, direi che è andata, {name}.
        {
            - firstCharacterPossibleStates has Triangolo:
                {charNameFive}: Hai aiutato {charNameOne} a riscoprire il suo lato più pratico, razionale.
                {charNameFive}: Non quello di cui aveva bisogno, temo.
                {charNameFive}: Ma per essere la tua prima riscrittura hai dato davvero il massimo.
                {charNameFive}: Il resto, è colpa dei miei consigli imperfetti.
                {charNameFive}: Spero mi concederai il tempo di migliorarmi.
                
            - firstCharacterPossibleStates has RagazzaOrchestra:
                {charNameFive}: {charNameOne} ora sa di possedere un'idole più attiva, e anche oppositiva se serve.
                {charNameFive}: Forse avrei potuto guidarti meglio, non sono sicura che sia la natura più vicina alla sua indole.
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
        {charNameFive}: E per ogni momento di confusione o incertezza, ricordati che potrai chiedermi qualsiasi cosa.
        {charNameFive}: Ora vado a sistemare quel disastro che è la biblioteca, che già ci ho messo ore per sbloccare la porta.
            -> main
       

/* ---------------------------------

   Tutorial

 ----------------------------------*/


=== tutorial
~ temp charNameOne = uppercaseTranslator(firstCharacterState)
~ temp charNameTwo = uppercaseTranslator(secondCharacterState)
~ temp charNameThree = uppercaseTranslator(thirdCharacterState)
~ temp charNameFour= uppercaseTranslator(fourthCharacterState)
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)

//Strutturare come wave sintetica?
    {charNameFive}: Ecco i luoghi che puoi visitare in questo momento.
    {charNameFive}: Su quali vorresti avere informazioni?

- (top)
    + [Sulla fermata del bus.]
            {charNameFive}: Intendi il luogo dove passo ore a spalare neve?
            {charNameFive}: La fermata, ad est del Giardino, è il posto dove approdano le nuove persone.
            {charNameFive}: È anche il luogo attraverso cui potrai raggiungerci.
            {charNameFive}: O da cui andartene, quando vorrai.
                -> top

    + [Sulla serra.]
            {charNameFive}: La serra è il mio posto preferito: ho sempre amato coltivare fiori e piante!
            {charNameFive}: Anche se lì dentro cresce della roba molto strana.
            {charNameFive}: La serra è un piccolo posto di meditazione.
            {charNameFive}: Se non sta crescendo nulla, puoi provare a seguire le sue suggestioni.
            {charNameFive}: Col tempo qualcosa crescerà, e a quel punto forse avrai anche una risposta a una domanda che non sapevi di doverti fare.
            {charNameFive}: Tipo: come fa {charNameFive} a tenere i vetri sempre così puliti?
                -> top

    + [Sulla foresta.]
            {charNameFive}: La foresta è un po' il nostro posto di passaggio.
            {charNameFive}: Non ho idea di chi abbia messo la panchina, sinceramente.
            {charNameFive}: E tenerla pulita tutti i giorni è una gran fatica.
            {charNameFive}: E quella pianta, fungo, quella cosa che è nel mezzo, non ho ancora capito come farla rifiorire.
            {charNameFive}: E questo mi lascia molto frustrata.
            -> top
            
    + [Sono altri i luoghi di cui vorrei parlare.]
        -> second_top

    
- (second_top)    
    + {secondTier}[Sulla biblioteca.]
            {charNameFive}: La biblioteca è un posto... un posto.
            {charNameFive}: Ci sono molti racconti, ma chi ha il tempo di leggerli?
            {charNameFive}: Con tutta quella polvere che raccolgono, poi.
            {charNameFive}: Però un paio di volte ho usato la poltrona per fare del body scan, e non è stato male.
            {charNameFive}: Mi sono quasi addormentata.
            {charNameFive}: Quasi.
            -> top
            
    + {thirdTier}[Sul laboratorio.]
        Informazioni
            -> top

    + {fourthTier}[Sul nido.]
        Informazioni
            -> top

    + [Vorrei parlare di qualcosa di diverso.]
        -> speaking_with_mentor
    -

    -> speaking_with_mentor

=== to_do
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)

        {gifts_and_ink}{charNameFive}: La prima cosa da fare è: conquistare la <b>fiducia</b> della persona che devi aiutare.
        {gifts_and_ink}{charNameFive}: Ci <b>parli</b>, cerchi di capire di cosa ha bisogno e quali sono le risposte che le piacciono.
        {gifts_and_ink}{charNameFive}: Poi, le fai un <b>dono</b>.
        {gifts_and_ink}{charNameFive}: Più il dono è qualcosa che le dimostra che l'hai ascoltata, più avrai <b>inchiostro</b> per aiutarla a riscrivere la sua storia.
        {questions}{charNameFive}: A quel punto inizi i tuoi <b>interventi</b>, riprendendo eventi della sua storia e la aiuti a guardarli sotto una luce diversa.
        {questions}{charNameFive}: Più inchiostro hai, più interventi puoi fare.
        {questions}{charNameFive}: Infine: in base alle cose che avrai detto, la persona sceglierà il suo <b>nuovo nome</b>.
        {questions}{charNameFive}: E poi si ricomincia.
           -> speaking_with_mentor



/* ---------------------------------

   Trigger Warning
       
 ----------------------------------*/
 
 === trigger_warning ===
 ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
 
    {charNameFive}: Questi sono i principali temi delicati che potresti incontrare durante le tue chiacchierate.
    {charNameFive}: Sarà mio compito evitare che tu possa incontrarli.
    {charNameFive}: Non è detto che ci riesca al cento per cento: in questo posto devo fare tantissime cose, {name}.

    - (top)
    {charNameFive}: Cosa vorresti evitare?
    + {alcoholism == true}[Non voglio che si parli di <b>dipendenza da sostanze</b>.]
        {charNameFive}: Perfetto.
        ~ alcoholism = false
            -> top
    + {alcoholism == false}[Ho cambiato idea: lascia che il tema delle <b>dipendenze da sostanze</b> sia presente.]
        {charNameFive}: Ottimo.
        ~ alcoholism = true
            -> top
        
  
    + {abuses == true}[Evitiamo storie su <b>relazioni abusanti</b>.]
        {charNameFive}: Hai il mio appoggio.
        ~ abuses = false
            -> top
    + {abuses == false}[Ora me la sento di sentire storie su <b>relazioni abusanti</b>.]
        {charNameFive}: Perfetto.
        ~ abuses = true
            -> top

    + {mourning == true} [Tienimi {pronouns has him: lontano|{pronouns has her: lontana|lontanə}} da morte e lutto.]
        {charNameFive}: Non li incontrerai nel tuo viaggio.
        ~ mourning = false
            //Rimuovo coltivabile legato a lutto
            ~ pianteCiclicità -= NonTiScordarDiTe
            ~ pianteIndipendenza -= NonTiScordarDiTe
            ~ pianteRicordo -= NonTiScordarDiTe
            ~ backupCultivable -= NonTiScordarDiTe
            -> top
            
    + {mourning == false} [Ho cambiato idea: me la sento di parlare di lutto.]
        {charNameFive}: Grandioso.
        ~ mourning = true
        
            -> top
        
    + {loneliness == true} [L'idea dell'abbandono per me è pesante.]
        {charNameFive}: Fatto.
        ~ loneliness = false
            -> top
    + {loneliness == false} [Sono {pronouns has him: pronto|{pronouns has her: pronta|prontə}} ad ascoltare storie di abbandono.]
        {charNameFive}: Perfetto.
        ~ loneliness = true
    
    + [I temi che voglio evitare sono altri.]
        -> top_due
    + [Ho cambiato idea.]
        -> speaking_with_mentor

    
    - (top_due)
    + {dysphoria == true}[Non mi sento a mio agio a parlare di disforia.]
        {charNameFive}: Capisco benissimo.
        ~ dysphoria = false
            -> top_due
    + {dysphoria == false}[Ho cambiato idea: affrontiamo storie legate alla disforia.]
        {charNameFive}: Ottimo.
        ~ dysphoria = true
            -> top_due
            
        {charNameFive}: Cosa vorresti evitare?
    
    + {sex == true}[Non parliamo di sesso.]
        {charNameFive}: Fatto.
        ~ sex = false
            -> top_due
    + {sex == false}[Introduci anche storie legate al sesso.]
        {charNameFive}: Ottimo.
        ~ sex = true
            -> top_due
    
    + [Fammi rivedere i temi precedenti.]
        -> top
    + [Sono a posto così.]
        -> speaking_with_mentor
    -  
 -> main
 
 
 
 === mindfulness 
 
 
 Mind
 ->->