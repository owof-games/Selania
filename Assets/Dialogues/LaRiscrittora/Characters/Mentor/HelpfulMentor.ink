/* ---------------------------------

    Mentore utile: diramazioni dialoghi
       
 ----------------------------------*/
 === support
    ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    {charNameFive}: Come posso aiutarti?
    - (top)
        + {gifts_and_ink}[Mi ripeteresti cosa devo fare?]
            -> to_do
        + [Ho una domanda su un luogo.]
            -> tutorial
        + [C'è una cosa che mi riguarda.]
            -> myself
        + [Vorrei parlare d'altro.]
            -> talk_with_mentor
        -
            -> top   

    = myself
        + [Vorrei cambiare il mio nome.]
                -> name_choice -> support
        + [Vorrei cambiare i miei pronomi.]
                -> gender -> support
        + [Vorrei consigli su come stare meglio.]
                -> mindfulness -> support
        + [Vorrei aggiornare la lista dei miei temi delicati.]
                -> trigger_warning -> support 
        + [Sono a posto così, grazie.]
                -> talk_with_mentor
 
 

/* ---------------------------------

    Mentore utile: contenuti
       
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
            
    + {secondTier or thirdTier or fourthTier}[Sono altri i luoghi di cui vorrei parlare.]
        -> second_top
    
    + {not secondTier or thirdTier or fourthTier}[Voglio parlare d'altro.]
        -> talk_with_mentor  

    
- (second_top)    
    + {secondTier}[Sulla biblioteca.]
            {charNameFive}: La biblioteca è un posto... un posto.
            {charNameFive}: Ci sono molti racconti, ma chi ha il tempo di leggerli?
            {charNameFive}: Con tutta quella polvere che raccolgono, poi.
            {charNameFive}: Però un paio di volte ho usato la poltrona per fare del body scan, e non è stato male.
            {charNameFive}: Mi sono quasi addormentata.
            {charNameFive}: Quasi.
            -> second_top
            
    + {thirdTier}[Sul laboratorio.]
        Informazioni
            -> second_top

    + {fourthTier}[Sul nido.]
        Informazioni
            -> second_top
    
    + {secondTier} [Vorrei parlare di un altro luogo.]
            -> top
    
    + [Vorrei parlare di qualcosa di diverso.]
        -> talk_with_mentor
    -

    -> talk_with_mentor

=== to_do
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)

        {gifts_and_ink:{charNameFive}: La prima cosa da fare è: conquistare la <b>fiducia</b> della persona che devi aiutare.}
        {gifts_and_ink:{charNameFive}: Ci <b>parli</b>, cerchi di capire di cosa ha bisogno e quali sono le risposte che le piacciono.}
        {gifts_and_ink:{charNameFive}: Poi, le fai un <b>dono</b>.}
        {gifts_and_ink:{charNameFive}: Più il dono è qualcosa che le dimostra che l'hai ascoltata, più avrai <b>inchiostro</b> per aiutarla a riscrivere la sua storia.}
        {questions: {charNameFive}: A quel punto inizi i tuoi <b>interventi</b>: riprendi eventi della sua storia e la aiuti a guardarli sotto una luce diversa.}
        {questions: {charNameFive}: Più inchiostro hai, più interventi puoi fare.}
        {questions: {charNameFive}: Infine: in base alle cose che avrai detto, la persona sceglierà il suo <b>nuovo nome</b>.}
        {questions: {charNameFive}: E poi si ricomincia.}
           -> talk_with_mentor



 
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

    + {mourning == true} [Tienimi {pronouns has him: lontano|{pronouns has her: lontana|lontanə}} da <b>morte e lutto</b>.]
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
        
    + {loneliness == true} [L'idea dell'<b>abbandono</b> per me è pesante.]
        {charNameFive}: Fatto.
        ~ loneliness = false
            -> top
    + {loneliness == false} [Sono {pronouns has him: pronto|{pronouns has her: pronta|prontə}} ad ascoltare storie di abbandono.]
        {charNameFive}: Perfetto.
        ~ loneliness = true
    
    + [I temi che voglio evitare sono altri.]
        -> top_due
    + [Sono a posto così.]
        ->->

    
    - (top_due)
    + {dysphoria == true}[Non mi sento a mio agio a parlare di <b>disforia</b>.]
        {charNameFive}: Capisco benissimo.
        ~ dysphoria = false
            -> top_due
    + {dysphoria == false}[Ho cambiato idea: affrontiamo storie legate alla disforia.]
        {charNameFive}: Ottimo.
        ~ dysphoria = true
            -> top_due
            
        {charNameFive}: Cosa vorresti evitare?
    
    + {sex == true}[Non parliamo di <b>sesso</b>.]
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
        ->->
    -  
 -> main
 
 
 
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
     ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
     
        {charNameFive}: Quando inizio a pensare molto, ma molto molto, una cosa che mi aiuta è concentrarmi su quello che mi circonda.
        {charNameFive}: Inizio ad osservare un oggetto e a dirmi dentro la testa cosa è.
        {charNameFive}: Una sedia, uno sgabello, un frigorifero, un tostapane, una lavatrice.
        {charNameFive}: Se la confusione è molta, cerco di partire con il generico, come <i>elettrodomestico</i>, e poi man mano che divento più concentrata inizio a scendere nel dettaglio.
        {charNameFive}: Se ci sono poche cose, provo a descrivere le parti di un oggetto.
        {charNameFive}: O del mio corpo.
        {charNameFive}: Cosa che evito nei giorni in cui non mi piaccio.
        {charNameFive}: Questa cosa funziona benissimo anche con gli odori, o i suoni, o il tatto, o persino il gusto.
        {charNameFive}: Ti aiuta a tornare coi piedi per terra.
            ->->
    
    = two
     ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
     
        {charNameFive}: Ci sono volte in cui mi focalizzo solo sulle cose che non vanno.
        {charNameFive}: Una cosa che mi aiuta in queste situazioni è puntare una sveglia ogni due ore.
        {charNameFive}: E quando la sveglia suona provo a chiedermi:
        {charNameFive}: Come mi sto sentendo?
        {charNameFive}: Cosa sto facendo?
        {charNameFive}: Perché mi fa sentire così?
        {charNameFive}: Se mi rendo conto di star provando una emozione negativa, posso capire meglio cosa l'ha scatenata.
        {charNameFive}: Ma spesso mi rendo conto di essere serena in quel momento, o per lo meno tranquilla.
        {charNameFive}: E a quel punto capisco che non è vero che sto male tutto il giorno, ma che ci sono delle cose che non mi fanno stare bene.
        ->->
    
    = three
     ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
     
     {charNameFive}: Un tempo conoscevo una ragazza che soffriva di attacchi d'ansia e che mi ha dato una dritta che puoi applicare ovunque.
     {charNameFive}: Se il pensiero si inceppa su qualcosa, prova a stringere con forza degli oggetti che hai vicino.
     {charNameFive}: Può essere il bracciolo di una sedia.
     {charNameFive}: Il tavolo.
     {charNameFive}: Il palo sull'autobus.
     {charNameFive}: Stringi e concentrati sulla sensazione.
     {charNameFive}: Ti aiuta a tornare coi piedi per terra.
        ->->
    
    = four
     ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
     
    {charNameFive}: Il mio migliore amico è il body scan.
    {charNameFive}: Lo faccio al risveglio tra gli arbusti della foresta.
    {charNameFive}: Prima di tutto mi stendo, comoda, e faccio qualche respiro profondo.
    {charNameFive}: Poi inizio a concentrarmi sulla punta di uno dei piedi, e da lì sposto la concentrazione lungo tutto il piede, la caviglia, il polpaccio, il ginocchio, il quadricipite.
    {charNameFive}: Poi faccio la stessa cosa con l'altra gamba.
    {charNameFive}: E a quel punto mi sposto sul ventre, i glutei, i muscoli lombari, i dorsali, le spalle e via di seguito fino alla testa.
    {charNameFive}: Anche se conosco persone che preferiscono partire dalla testa e arrivare ai piedi.
    {charNameFive}: L'importante è che per tutto il processo ascolti quella parte del corpo senza giudicare, senza cercare di cambiarla.
    {charNameFive}: Respiri, accogli dolori e morbidezze, e quando te la senti, cambi area.
    {charNameFive}: Anche solo a parlarne mi sento già più rilassata.
        ->->
        
    = five
     ~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
     
    {charNameFive}: Non so se ti capita di avere l'addome contratto.
    {charNameFive}: Per molte persone quell'area, e il diaframma in particolare, accumula un sacco di tensione e preoccupazione.
    {charNameFive}: Un modo per allentarla è prendere un suono che ti piace, una vocale, un <i>Aum</i>, tutte le vocali, e iniziare a ripeterle, con calma.
    {charNameFive}: Lasciando che quel suono scenda e scenda e scenda dalla gola al petto, dal petto al diaframma.
    {charNameFive}: Aiutandoti così a rilassare l'area.
    {charNameFive}: E a respirare meglio.
        ->->     

