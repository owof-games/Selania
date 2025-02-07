/* ---------------------------------

   Presentazioni

 ----------------------------------*/

=== welcome ===
~ temp charName = uppercaseTranslator(seventhCharacterState)
    Sconosciuto: Che buffo, è da un po' che non incontravo una persona nuova.
    Sconosciuto: Immagino tu abbia un milione di domande, vero?
    - (top)
        * (dove) [Dove sono?]
            {chiSei:{charName}|Sconosciuto}: Questa è una risposta che potrai trovare solo col tempo.
            {chiSei:{charName}|Sconosciuto}: La cosa che posso dirti con certezza però è che un posto sicuro.
            {chiSei:{charName}|Sconosciuto}: Un posto dove prenderti le cose coi tuoi tempi, direi.
            {chiSei:{charName}|Sconosciuto}: Che non è poi male, no?
            {chiSei:{charName}|Sconosciuto}: So che fuori da qui è tutto un vortice continuo di casini.
                -> top
        
        * (chiSei) [Chi sei?]
            Sconosciuto: Dipende molto dal momento, e dalla persona che ho davanti.
            Sconosciuto: Ma direi che puoi chiamarmi {lowercaseTranslator(seventhCharacterState)}.
            {charName}: Non un name originale ma ehi, almeno ti ricordi chi chiamare se sei in difficoltà, no?
                -> top
        
        * (vado) [Come me ne vado da qui?]
            {chiSei:{charName}|Sconosciuto}: Dipende.
            {chiSei:{charName}|Sconosciuto}: Se con "qui" intendi questa conversazione, di solito interrompere la conversazione è sempre possibile.
            {chiSei:{charName}|Sconosciuto}: Basta dire qualcosa tipo "me ne vado" o simili.
            {chiSei:{charName}|Sconosciuto}: Nei casi più estremi c'è chi dice "quit", che credo sia il verso di un uccellino.
            {chiSei:{charName}|Sconosciuto}: Spesso tornano comunque, e la cosa mi fa piacere.
            {chiSei:{charName}|Sconosciuto}: Per il resto: se sei qui è perché in qualche modo l'hai chiesto.
            {chiSei:{charName}|Sconosciuto}: Forse ancora non lo sapevi, ma non è un problema: Presto o tardi capirai il perché direi.
                -> top
        * {vado} [Me ne vado.]
            {chiSei:{charName}|Sconosciuto}: Giusto un secondo, persona nuova.
            -> your_name
        * {vado or chiSei or dove} [Perfetto: ma ora?]
            -> your_name
        * -> your_name
    
    = your_name
        ~ temp charName = uppercaseTranslator(seventhCharacterState)
        
        {chiSei:{charName}|Sconosciuto}: Ora tocca a me farti una domanda: come ti devo chiamare?
        {chiSei:{charName}|Sconosciuto}: Puoi usare qualsiasi nome: prendi questa occasione come un nuovo inizio.
            -> name_choice ->
        {chiSei:{charName}|Sconosciuto}: E quali sono i pronomi in cui ti riconosci?
            -> gender ->
        {chiSei:{charName}|Sconosciuto}: piacere di conoscerti, {name}.
        {chiSei:{charName}|Sconosciuto}: E {pronouns has him: benvenuto|{pronouns has her: benvenuta|benvenutə}}. Spero ti troverai bene, qui.
        {not chiSei: Sconosciuto: Ah, che sbadato. Invece tu chiamami <b>{charName}</b>.|{charName}: È il mio dovere farvi stare benr.}
        {charName}: Un'altra cosa importante, {name}.
        {charName}: Nel tuo soggiorno in questo luogo potrebbe accadere che incontrerai qualche situazione complessa.
        {charName}: Se ti va di dirmi quali sono le cose che ti creano disagio, farò del mio meglio per non fartele incontrare.
                -> trigger_warning ->
        {charName}: Ma in tutto questo non ti ho detto cosa devi fare!
            
            {
                - not talk_with_first_character: 
                    {charName}: Facciamo così: prova a parlare con la persona che troverai alla <b>fermata del bus</b>.
                    {charName}: E poi torna da me.
                         ~ firstPauseTalking = 0
                            ->->
                - talk_with_first_character:
                    {charName}: Sembra che quella persona ti abbia raccontato qualcosa di sè!
                            -> gifts_and_ink
    
            }

            
    === gifts_and_ink
    ~ temp charName = uppercaseTranslator(seventhCharacterState)
        {charName}: Quindi: ogni tanto capita che delle persone si ritrovino in questo posto.
        {charName}: Sono sempre persone che sono rimaste bloccate in qualcosa.
        {charName}: Spesso sono storie di rimpianto o rimorso, in alcuni casi di traumi, o sensi di colpa.
        {charName}: Ma quale che siano il motivo, non riescono più ad andare avanti con la loro vita.        
        {charName}: In tutte queste situazioni arrivi tu, {name}.
        {charName}: Cerca di ascoltarle, di capirle, di intuire come ragionano.
        {charName}: Conquista la loro fiducia, e quando saranno aperte con te, ti verrà offerta l'occasione di dare loro un dono.
        {charName}: I doni sono oggetti che a volte troverai in questo luogo, ma che il più delle volte creerai da te.
        {charName}: Ad esempio, coltivando qualcosa <b>alla serra</b>.
        {charName}: Il dono è una cosa importante, perché è il tuo modo di dimostrare loro che l3 hai ascoltat3.

            + [Opzione che aumenta il blu]
                ~ seventhBlue ++
            + [Opzione che aumenta il giallo]
                ~ seventhYellow ++
            + [Opzione che aumenta il rosso]
                ~ seventhRed ++
            + [Opzione che aumenta il verde]
                ~ seventhGreen ++
            + [Opzione che aumenta il viola]
                ~ seventhPurple ++
            -
        {charName}: Ora, perché devi dare un dono?
        {charName}: Non solo per dimostrare a queste persone che le hai ascoltate, ma anche per aumentare la tua quantità di inchiostro.
        {charName}: Perché tu {pronouns has him: amico mio|{pronouns has her: amica mia|amicə miə}} sei {pronouns has him: un riscrittore|{pronouns has her: una riscrittora|unə riscrittorə}}!
        {charName}: Aiuti queste persone bloccate a guardare la loro storia in modo diverso, e a scegliersi un nuovo nome.
        
            + [Opzione che aumenta il blu]
                ~ seventhBlue ++
            + [Opzione che aumenta il giallo]
                ~ seventhYellow ++
            + [Opzione che aumenta il rosso]
                ~ seventhRed ++
            + [Opzione che aumenta il verde]
                ~ seventhGreen ++
            + [Opzione che aumenta il viola]
                ~ seventhPurple ++
            -
        
            - (top2)
            * [Tipo gaslighting?]
                {charName}: No no no assolutamente no.
                {charName}: Anche perché uno spettro preso in giro è uno spettro che diventa davvero, davvero, davvero fastidioso.
                    -> top2
            * [Dovrei dare consigli a uno sconosciuto?]
                {charName}: A volte è più facile aprirsi a chi non si conosce.
                {charName}: E mentre noi riflettiamo sulle loro difficoltà, impariamo anche qualcosa su di noi.
                {charName}: E poi... no, questo te lo dirò tra qualche tempo.
                    -> top2
            
            {charName}: Quindi: quando avrai conquistato la fiducia di quella persona e le avrai donato qualcosa, torna da me per le ultime istruzioni.
            ~ firstPauseTalking = 0
            -> main
             

    
    === questions
    ~ temp charName = uppercaseTranslator(seventhCharacterState)
    
        {firstCharacterInkLevel == Empty or firstCharacterInkLevel == Low: {charName}: Non ti demoralizzare, capita a chiunque di non dare il massimo al primo colpo.}
        {firstCharacterInkLevel == Normal: {charName}: Bel colpo! Ti sei {pronouns has him: guadagnato|{pronouns has her: guadagnata|guadagnatə}} subito una bella dose di inchiostro!}
        {firstCharacterInkLevel == High: {charName}: Beh, hai dato alla persona il suo dono preferito! Sei già {pronouns has him: pronto|{pronouns has her: pronta|prontə}} per questo incarico!}
        {charName}: Ora: a cosa serve l'inchiostro?
        {charName}: Sostanzialmente più alto è il valore di inchiostro, più interventi puoi fare.
        {charName}: Gli interventi sono domande o commenti che puoi fare su cose diverse che preoccupano la persona.
        {charName}: Più interventi hai a disposizione, più puoi convincere la persona a vedere le cose diversamente.
        {charName}: Riscrivere la sua storia.
        {charName}: Trovare un nuovo nome.
            + [Opzione che aumenta il blu]
                ~ seventhBlue ++
            + [Opzione che aumenta il giallo]
                ~ seventhYellow ++
            + [Opzione che aumenta il rosso]
                ~ seventhRed ++
            + [Opzione che aumenta il verde]
                ~ seventhGreen ++
            + [Opzione che aumenta il viola]
                ~ seventhPurple ++
            -
        {charName}: Ricorda {name}: sei una guida, ma sta alla persona decidere alla fine chi è, e di cosa ha bisogno.
        {charName}: Quando te la senti, affronta questo ultimo passaggio, e poi torna da me.
                ~ firstPauseTalking = 0
                    -> main
        
        
    === first_character_feedback
    ~ temp charName = uppercaseTranslator(seventhCharacterState)
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
    
        {charName}: Beh, direi che è andata, {name}.
    {
            - firstCharacterPossibleStates has Triangolo:
                {charName}: Hai aiutato {charNameUno} a riscoprire il suo lato più pratico, razionale.
            - firstCharacterPossibleStates has RagazzaOrchestra:
                {charName}: {charNameUno} ora sa di possedere un'idole più attiva, e anche oppositiva se serve.
            - firstCharacterPossibleStates has FlautoDolce:
                {charName}: Grazie al tuo lavoro, {charNameUno} ha scoperto che gli affetti sono la cosa per lei fondamentale.
            - firstCharacterPossibleStates has Ocarina:
                {charName}: {charNameUno} ha trovato nella giocosità uno sblocco, ed è pronta ad abbandonarsi alla sua creatività,
            - firstCharacterPossibleStates has Violino:
                {charName}: {charNameUno} aveva bisogno di riconoscere che per lei la vita ha senso solo con uno scopo più grande, e grazie a te, ce l'ha fatta.
            - else: {charName}: Non tutte le persone sono disposte a cambiare, ma questa non è una tua colpa. 
        }
        
        {charName}: Non ti conosco ancora abbastanza, ma ci tengo a dirtelo: sentiti {pronouns has him: soddisfatto|{pronouns has her: soddisfatta|soddisfattə}}!
        {charName}: Questo è un lavoro complesso, ma vedrai che col tempo sarà tutto più facile.
        {charName}: E per ogni momento di confusione o incertezza, ricordati che potrai chiedermi qualsiasi cosa.
            -> main
       

/* ---------------------------------

   Tutorial

 ----------------------------------*/


=== tutorial
~ temp charName = uppercaseTranslator(seventhCharacterState)
//Strutturare come wave sintetica?
    {charName}: Ecco i luoghi che puoi visitare in questo momento.
    {charName}: Su quali vorresti avere un po' di informazioni?
-(top)
    + [Sulla fermata del bus.]
            {charName}: La fermata, ad est del Giardino, è il posto dove approdano le nuove persone.
            {charName}: È anche il luogo attraverso cui potrai raggiungerci.
            {charName}: O da cui andartene, quando vorrai.
                -> top

    + [La serra.]
            {charName}: La serra è un piccolo posto di meditazione.
            {charName}: Se non sta crescendo nulla, puoi provare a seguire le sue suggestioni.
            {charName}: Col tempo qualcosa crescerà, e a quel punto forse avrai anche una risposta a una domanda che non sapevi di doverti fare.
                -> top

    + [Sulla foresta.]
            {charName}: La foresta è un po' il nostro posto di passaggio.
            {charName}: Non ho idea di chi abbia messo la panchina, sinceramente.
            {charName}: E quella pianta, fungo, cosa che è nel mezzo, non ho ancora capito come farla rifiorire.
            -> top

    + {firstStory == Ended}[Sulle falene.]
        Informazioni
            -> top
    + {firstStory == Ended}[Sul labirinto.]
        Informazioni
            -> top
    + {secondStory == Ended}[Sulle Laboratory.]
        Informazioni
            -> top
    + {secondStory == Ended}[Sulle sirene.]
        Informazioni
            -> top
    + {secondStory == Ended}[Sulla Libary.]
        Informazioni
            -> top
    + [Vorrei parlare di qualcosa di diverso.]
        -> speaking_with_mentor
    -

    -> speaking_with_mentor

=== to_do
~ temp charName = uppercaseTranslator(seventhCharacterState)

        {charName}: Step uno: parli con la persona, cerchi di capire di cosa ha bisogno, come ragiona, e conquisti la sua fiducia.
        {charName}: Step due: le fai un dono.
        {charName}: Più il dono è qualcosa di gradito, più avrai inchiostro per aiutarla a riscrivere la sua storia.
        {charName}: Step tre: riprendi eventi della sua storia e la aiuti a guardarli sotto una luce diversa.
        {charName}: Step quattro: la persona sceglierà il suo nuovo nome.
        {charName}: Step cinque: ti riposi.
            ->->
/* ---------------------------------

   Aiuto con le storie

 ----------------------------------*/
=== consigli_storie ===
~ temp charName = uppercaseTranslator(seventhCharacterState)

{
    - firstStory == Active:
        -> consigli_storia_uno
    - secondStory == Active:
        -> consigli_storia_due
    - thirdStory == Active:
        -> consigli_storia_tre
    - fourthCharacterState == Active:
        -> consigli_storia_quattro
    - fifthStory == Active:
        -> consigli_storia_cinque
    - sixthStory == Active:
        -> consigli_storia_sei
    - seventhStory == Active:
        -> consigli_storia_sette 
}

=== consigli_storia_uno
~ temp charName = uppercaseTranslator(seventhCharacterState)

{~ Consiglio storia uno|Consiglio storia uno|Consiglio storia uno}
    ->speaking_with_mentor

=== consigli_storia_due
Consiglio storia due
    ->speaking_with_mentor

=== consigli_storia_tre
Consiglio storia tre
    ->speaking_with_mentor

=== consigli_storia_quattro
Consiglio storia quattro
    ->speaking_with_mentor


=== consigli_storia_cinque
Consiglio storia cinque
    ->speaking_with_mentor


=== consigli_storia_sei
Consiglio storia sei
    ->speaking_with_mentor


=== consigli_storia_sette
Consiglio storia sette
    ->speaking_with_mentor



/* ---------------------------------

   Trigger Warning
       
//Variabili per tracciare i trigger warning
VAR alcoholism = false
VAR abuses = false
VAR mourning = false

 ----------------------------------*/
 
 === trigger_warning ===
 ~ temp charName = uppercaseTranslator(seventhCharacterState)
 
    {charName}: Questi sono i principali temi delicati che potresti incontrare durante le tue chiacchierate.
    {charName}: Riuscirò per la maggior parte dei casi a fare in modo che tu non ne venga mai in contatto se li disabiliti.
    {charName}: E sono consapevole che ne mancano diversi, ma qui è un lavoro complicato, sono l'unico mentore, ma sono sempre pronto ad accogliere ogni segnalazione.

    - (top)
    {charName}: Cosa vorresti evitare?
    + {alcoholism == true}[Preferirei non leggere nulla che riguardi la dipendenza da alcool.]
        {charName}: Capisco benissimo. Preferenza registrata.
        ~ alcoholism = false
            -> top
    + {alcoholism == false}[Ho cambiato idea: introducimi pure storie che parlano di dipendenza d'alcool.]
        {charName}: Ottimo. Preferenza registrata.
        ~ alcoholism = true
            -> top
        
  
    + {abuses == true}[Non voglio leggere storie su relazioni abusanti.]
        {charName}: Hai il mio appoggio. Preferenza registrata.
        ~ abuses = false
            -> top
    + {abuses == false}[Sai, forse mi va bene di affrontare storie che parlano di abuses relazionali.]
        {charName}: Perfetto. Preferenza registrata.
        ~ abuses = true
            -> top

    + {mourning == true} [Non me la sento di parlare di lutto.]
        {charName}: Sentiti a casa. Preferenza registrata.
        ~ mourning = false
            -> top
    + {mourning == false} [Ho cambiato idea: me la sento di parlare di lutto.]
        {charName}: Grandioso. Preferenza registrata.
        ~ mourning = true
            -> top
        
    + {loneliness == true} [Preferirei evitare storie di solitudine e abbandono.]
        {charName}: Preferenza registrata. E se butta male, sono qui.
        ~ loneliness = false
            -> top
    + {loneliness == false} [Sono {pronouns has him: pronto|{pronouns has her: pronta|prontə}} ad ascoltare storie di solitudine e abbandono.]
        {charName}: Preferenza registrata. E se butta male, puoi sempre cambiare idea.
        ~ loneliness = true
            -> top
            
    + [Sono a posto così.]
        ->->
    -  
 -> main