//Lista coltivabili e stati possibili    
    LIST greenhouse_cultivable = (BaccaDellaAddolorata), (BarbaDellInciampo), (BastoneDellOzioso), (BrinaDellImpossibile), (CantoDelleCompagne), (CardoAspinato), (EderaDelleAmanti),  (ErbaLiccia), (FalsaPalude), (LanaNotturna), (LicheneDegliAbissi), (NonTiScordarDiTe), (Olobino), (LaSpazzata)

    LIST greenhouse_growStep = notStarted, stepZero, stepOne, stepTwo, stepThree

    //Valori per far crescere la singola pianta
    VAR greenhouse_growingValueStepZero = 2
    VAR greenhouse_growingValueStepOne = 3
    VAR greenhouse_growingValueStepTwo = 4


//QUESTA LISTA LA USO PER GESTIRE LA PESCATA O MENO DEI COLTIVABILI
    VAR greenhouse_backupCultivable = (BaccaDellaAddolorata, BarbaDellInciampo, BastoneDellOzioso, BrinaDellImpossibile, CantoDelleCompagne, CardoAspinato, EderaDelleAmanti, ErbaLiccia, FalsaPalude, LanaNotturna, LicheneDegliAbissi, NonTiScordarDiTe, Olobino, LaSpazzata)
    //E questo è il recap di tutto quello che ho trovato
    VAR greenhouse_findedCultivables = ()
    //E come per Franco, faccio un conto di tutte le cose coltivabili sin dall'inizio.
    VAR greenhouse_allCultivables = ()

//LISTA PER FAR AVANZARE GLI ELEMENTI GRAFICI
    VAR growthBaccaDellaAddolorata = notStarted
    VAR growthBarbaDellInciampo = notStarted
    VAR growthBastoneDellOzioso = notStarted
    VAR growthBrinaDellImpossibile = notStarted
    VAR growthCantoDelleCompagne = notStarted
    VAR growthCardoAspinato = notStarted
    VAR growthEderaDelleAmanti = notStarted
    VAR growthErbaLiccia = notStarted
    VAR growthFalsaPalude = notStarted
    VAR growthLanaNotturna = notStarted
    VAR growthLicheneDegliAbissi = notStarted
    VAR growthNonTiScordarDiTe = notStarted
    VAR growthOlobino = notStarted
    VAR growthLaSpazzata = notStarted
    
//LISTA PER FAR AVANZARE GLI ELEMENTI TESTUALI
    VAR narrativeGrowthBaccaDellaAddolorata = notStarted
    VAR narrativeGrowthBarbaDellInciampo = notStarted
    VAR narrativeGrowthBastoneDellOzioso = notStarted
    VAR narrativeGrowthBrinaDellImpossibile = notStarted
    VAR narrativeGrowthCantoDelleCompagne = notStarted
    VAR narrativeGrowthCardoAspinato = notStarted
    VAR narrativeGrowthEderaDelleAmanti = notStarted
    VAR narrativeGrowthErbaLiccia = notStarted
    VAR narrativeGrowthFalsaPalude = notStarted
    VAR narrativeGrowthLanaNotturna = notStarted
    VAR narrativeGrowthLicheneDegliAbissi = notStarted
    VAR narrativeGrowthNonTiScordarDiTe = notStarted
    VAR narrativeGrowthOlobino = notStarted
    VAR narrativeGrowthLaSpazzata = notStarted

//GESTIONE DEL TW TEMPORANEO
    VAR greenhouse_relationshipCrops_tempTriggerWarning = ()
    VAR greenhouse_shiftCrops_tempTriggerWarning = ()
    VAR greenhouse_understandingCrops_tempTriggerWarning = ()
    VAR greenhouse_selfdeterminationCrops_tempTriggerWarning = ()
    VAR greenhouse_wonderCrops_tempTriggerWarning = ()
    VAR greenhouse_imaginationCrops_tempTriggerWarning = ()

//Variabili per la gestione della serra
    LIST greenhouse_cropsType = relationship, shift, understanding, selfdetermination, wonder, imagination

//QUESTE LISTE HANNO UN VALORE CATALOGATIVO E PER LA GESTIONE DELLE DOMANDE

    //Relazione: con sé e con gli altri, anche con l'ambiente.
    VAR greenhouse_relationshipCrops = (BaccaDellaAddolorata, CantoDelleCompagne, EderaDelleAmanti, FalsaPalude, LicheneDegliAbissi, Olobino, LaSpazzata)
    //Mutamento: capacità di generare e accogliere il cambiamento.
    VAR greenhouse_shiftCrops = (BaccaDellaAddolorata, BarbaDellInciampo, BrinaDellImpossibile, CantoDelleCompagne, CardoAspinato, ErbaLiccia, FalsaPalude, LanaNotturna, LaSpazzata)
    //Comprensione: cercare il senso, capire il perché.
    VAR greenhouse_understandingCrops = (BarbaDellInciampo, BrinaDellImpossibile, CardoAspinato, ErbaLiccia, LicheneDegliAbissi, NonTiScordarDiTe, Olobino)
    //Autodeterminazione: definire la mia vita per come la voglio, o la vita della mia comunità.
    VAR greenhouse_selfdeterminationCrops = (BarbaDellInciampo, BastoneDellOzioso, ErbaLiccia, LanaNotturna, LicheneDegliAbissi, LaSpazzata)
    //Stupore, meraviglia: sorprendermi, scoprire cose nuove, scoprire cose inaspettate. Vedere la vita come qualcosa di non prevedibile e godere di questo.
    VAR greenhouse_wonderCrops = (BaccaDellaAddolorata, BastoneDellOzioso, CardoAspinato, EderaDelleAmanti, NonTiScordarDiTe, Olobino)
    //Immaginazione e creazione: sono due parole legate ma non sinonimi, ma mi viene istintivo unirle. Da una parte abbiamo la possibilità di pensare a ciò che non c'è, dall'altra di generarlo. In parte immaginazione si collega a stupore (una nuova idea), in parte a comprensione (quando capisco qualcosa e provo ad applicarlo in realtà immaginate). Creatività invece è sia un processo di mutamento (creando porto cambiamento, con tutte le sue conseguenze) che di autodeterminazione (creo ciò che voglio, ciò che penso possa servire, portare piacere, ristorare la mia comunità).
    VAR greenhouse_imaginationCrops = (BastoneDellOzioso, BrinaDellImpossibile, CantoDelleCompagne, EderaDelleAmanti, FalsaPalude, LanaNotturna, NonTiScordarDiTe)


//Pianta che verrà proposta. La uso anche per tracking dello stato delle piante.
    VAR greenhouse_chosenCultivable = ()
    
//Gestione dei temporanei TW
    VAR greenhouse_tempCultTriggerWarning = ()
    
//Variabili per la gestione del test
    VAR greenhouse_questionsCounter = 0
    VAR greenhouse_firstAnswerTracker = ()
    VAR greenhouse_firstQuest = false
    VAR greenhouse_secondQuest = false
    VAR greenhouse_thirdQuest = false
    VAR greenhouse_fourthQuest = false
    VAR greenhouse_fifthQuest = false
    VAR greenhouse_sixthQuest = false
    VAR greenhouse_seventhQuest = false
    VAR greenhouse_eighthQuest = false
    VAR greenhouse_ninthQuest = false
    VAR greenhouse_tenthQuest = false
    VAR greenhouse_eleventhQuest = false
    VAR greenhouse_twelfthQuest = false
    VAR greenhouse_thirteenthQuest = false
    VAR greenhouse_fourteenthQuest = false
    VAR greenhouse_fifteenQuest = false

//Questa è una strategia (basic e temporanea) per evitare che il testing vada in loop se non ci sono combinazioni sensate di domande.
    VAR greenhouse_randomizedQuestionsCounter = 0
    VAR greenhouse_maxRandomizableQuestions = 100

//Variabili monitoraggio stato vegetali
    VAR greenhouse_cultivableGrowing = 0 
    
//Gestione priorità coltivabili
    VAR greenhouse_frog_nextCultivableOne = ()
    VAR greenhouse_frog_nextCultivableTwo = ()
    VAR greenhouse_frog_nextCultivableThree = ()
    
    
    
=== next_cultivable_management
{debug: passo per next_cultivable_management.}
{debug: prima di procedere, il valore di greenhouse_frog_nextCultivableThree è {greenhouse_frog_nextCultivableThree}, di greenhouse_frog_nextCultivableTwo è {greenhouse_frog_nextCultivableTwo} e di greenhouse_frog_nextCultivableOne è {greenhouse_frog_nextCultivableOne}.}
//Qui gestiamo la priorità di crescita dettata dalla rana. Se c'è qualcosa in coda, facciamo salire tutto e poi attiviamo il next greenhouse_cultivable iniziale.

//Step uno: riordino delle richieste
{
    - greenhouse_frog_nextCultivableThree != () && greenhouse_frog_nextCultivableTwo == ():
        ~ greenhouse_frog_nextCultivableTwo = greenhouse_frog_nextCultivableThree
        ~ greenhouse_frog_nextCultivableThree = ()
}

{
    - greenhouse_frog_nextCultivableTwo != () && greenhouse_frog_nextCultivableOne == ():
        ~ greenhouse_frog_nextCultivableOne = greenhouse_frog_nextCultivableTwo
        ~ greenhouse_frog_nextCultivableTwo = ()
}

{debug: dopo l'aggiornamento, il valore di greenhouse_frog_nextCultivableThree è {greenhouse_frog_nextCultivableThree}, di greenhouse_frog_nextCultivableTwo è {greenhouse_frog_nextCultivableTwo} e di greenhouse_frog_nextCultivableOne è {greenhouse_frog_nextCultivableOne}.}

//Step due: attivazione o meno (parte solo se greenhouse_chosenCultivable è vuoto)
 {
        - greenhouse_frog_nextCultivableOne != () && greenhouse_chosenCultivable == ():
            {charTag(TheWitch, witch_state())}   <i>Sembra che Franco abbia messo qui le sue zampine.</i>
            <i>Ecco qualcosa che crescerà su sua richiesta.</i>
                ~ greenhouse_chosenCultivable = greenhouse_frog_nextCultivableOne
                
            {debug or debug_frog: il valore di nextCultivable è {greenhouse_frog_nextCultivableOne} e per questo skippo le domande. Ora greenhouse_chosenCultivable è = a {greenhouse_chosenCultivable}.}
            
                ~ greenhouse_frog_nextCultivableOne = ()
            {debug or debug_frog: svuoto nextCultivable, e il suo valore è {greenhouse_frog_nextCultivableOne}.}
            
                -> list_to_crops
        
        - else:
            {debug_cultivable or debug_frog: il valore di nextCultivable è {greenhouse_frog_nextCultivableOne}, quello di greenhouse_chosenCultivable {greenhouse_chosenCultivable} e per questo passo alle domande o avanzo, a seconda dello stato di greenhouse_chosenCultivable {greenhouse_chosenCultivable}.}
            -> cultivable_test.top
    
    }



=== cultivable_test ===
-> next_cultivable_management ->

- (top)
{charTag(TheWitch, witch_state())}   <i>{~La serra ha qualcosa da svelare.|I vasi hanno nuove domande.|La terra è fertile di risposte.|L'aria scompiglia ragnatele e capelli.|Sussurri serpeggiano tra i vasi, ponendo domande.}</i>
    -> test

=== test
{debug_cultivable: Sono passato da test.}
{debug_cultivable: Gli elementi ancora coltivabili sono: {greenhouse_backupCultivable}.}

{
    - greenhouse_questionsCounter < 2:
    {debug_cultivable: Counter ha valore {greenhouse_questionsCounter} e per questo vado a Random.}
        -> random
    - greenhouse_questionsCounter == 2:
    {debug_cultivable: Counter ha valore {greenhouse_questionsCounter} e per questo vado a Results.}
        -> results
}

= random
~ temp dice = RANDOM(1,14)

{debug_cultivable: Il dado ha valore: {dice}.}
{

    - greenhouse_randomizedQuestionsCounter >= greenhouse_maxRandomizableQuestions:
        {debug_cultivable: greenhouse_randomizedQuestionsCounter {greenhouse_randomizedQuestionsCounter} ha raggiunto il livello massimo {greenhouse_maxRandomizableQuestions}.}
        {
            - greenhouse_backupCultivable != ():
                ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
                {debug_cultivable: Erano presenti ancora coltivabili in greenhouse_backupCultivable e ho estratto {greenhouse_chosenCultivable}.}
                    -> list_to_crops
            
            - else:
                {charTag(TheWitch, witch_state())}   In questo momento non è possibile coltivare altro. 
                    -> main
      }

    - dice == 1 && greenhouse_relationshipCrops ^ greenhouse_backupCultivable != () && greenhouse_understandingCrops ^ greenhouse_backupCultivable != ():
        {
            - greenhouse_firstQuest == false:
            {debug_cultivable: Il valore di greenhouse_firstQuest è {greenhouse_firstQuest}. Piante Collaborazione contiene: {greenhouse_relationshipCrops}. Piante Indipendenza contiene: {greenhouse_understandingCrops}.}
            {
                - greenhouse_cropsType == ():
                {debug_cultivable: Questa è la prima domanda (greenhouse_firstAnswerTracker uguale a {greenhouse_firstAnswerTracker} e quindi vado direttamente alla domanda.}
                    -> first_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (greenhouse_firstAnswerTracker uguale a {greenhouse_firstAnswerTracker} e quindi procedo con le verifiche.}
                {
                    - LIST_RANDOM(greenhouse_relationshipCrops^greenhouse_firstAnswerTracker) != () && LIST_RANDOM(greenhouse_understandingCrops^greenhouse_firstAnswerTracker) != () && greenhouse_cropsType hasnt relationship && greenhouse_cropsType hasnt understanding:
                    
                    {debug_cultivable: L'intersezione tra prima scelta e piantecollaborazione produce {greenhouse_relationshipCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e piante Indipendenza produce {greenhouse_understandingCrops^greenhouse_firstAnswerTracker}}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                    
                        -> first_question
                    
                    - else:
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                    {debug_cultivable: L'intersezione tra prima scelta e piantecollaborazione produce {greenhouse_relationshipCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e piante Indipendenza produce {greenhouse_understandingCrops^greenhouse_firstAnswerTracker}}
                        ~ greenhouse_randomizedQuestionsCounter ++
                        ->random
                }
                }
                    
            - else:
             {debug_cultivable: Il valore di greenhouse_firstQuest è {greenhouse_firstQuest} e per questo torno a random.}
                    ~ greenhouse_randomizedQuestionsCounter ++
                    -> random
        }
    
        
    - dice == 2 && greenhouse_shiftCrops ^ greenhouse_backupCultivable != () && greenhouse_selfdeterminationCrops ^ greenhouse_backupCultivable != ():
        {
            -greenhouse_secondQuest == false:
            {debug_cultivable: Il valore di greenhouse_secondQuest è {greenhouse_secondQuest}. Piante Ciclicità contiene: {greenhouse_shiftCrops}. Piante Novità contiene: {greenhouse_selfdeterminationCrops} e per questo vado alla domanda.}
            {
                - greenhouse_cropsType == ():
                {debug_cultivable: Questa è la prima domanda (greenhouse_firstAnswerTracker uguale a {greenhouse_firstAnswerTracker} e quindi vado direttamente alla domanda.}
                   -> second_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (greenhouse_firstAnswerTracker uguale a {greenhouse_firstAnswerTracker} e quindi procedo con le verifiche.}
                {
                    - LIST_RANDOM(greenhouse_shiftCrops^greenhouse_firstAnswerTracker) != () && LIST_RANDOM(greenhouse_selfdeterminationCrops^greenhouse_firstAnswerTracker) != () && greenhouse_cropsType hasnt shift && greenhouse_cropsType hasnt selfdetermination:
                    
                    {debug_cultivable: L'intersezione tra prima scelta e piante shift produce {greenhouse_shiftCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e piante understanding produce {greenhouse_selfdeterminationCrops^greenhouse_firstAnswerTracker}.}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> second_question
                        
                    - else:
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                    {debug_cultivable: L'intersezione tra prima scelta e piante shift produce {greenhouse_shiftCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e piante understanding produce {greenhouse_selfdeterminationCrops^greenhouse_firstAnswerTracker}.}
                            ~ greenhouse_randomizedQuestionsCounter ++
                        ->random
                }
            
            }
            - else:
            {debug_cultivable: Il valore di greenhouse_secondQuest è {greenhouse_secondQuest} e per questo torno a random.}
                        ~ greenhouse_randomizedQuestionsCounter ++
                    -> random
        }


        
    - dice == 3 && greenhouse_wonderCrops ^ greenhouse_backupCultivable != () && greenhouse_imaginationCrops ^ greenhouse_backupCultivable != ():
        {
            - greenhouse_thirdQuest == false:
                {debug_cultivable: Il valore di greenhouse_thirdQuest è {greenhouse_thirdQuest}. Piante Ricordo contiene: {greenhouse_wonderCrops}. Piante Cancellazione contiene: {greenhouse_imaginationCrops} e per questo vado alla domanda.}    
                    {
                - greenhouse_cropsType == ():
                {debug_cultivable: Questa è la prima domanda (greenhouse_firstAnswerTracker uguale a {greenhouse_firstAnswerTracker} e quindi vado direttamente alla domanda.}
                   -> third_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (greenhouse_firstAnswerTracker uguale a {greenhouse_firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(greenhouse_wonderCrops^greenhouse_firstAnswerTracker) != () && LIST_RANDOM(greenhouse_imaginationCrops^greenhouse_firstAnswerTracker) != () && greenhouse_cropsType hasnt wonder && greenhouse_cropsType hasnt imagination:
                    
                    {debug_cultivable: L'intersezione tra prima scelta e piante wonder produce {greenhouse_wonderCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e piante selfdetermination produce {greenhouse_imaginationCrops^greenhouse_firstAnswerTracker}.}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                    
                        -> third_question
                        
                    - else:
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                    {debug_cultivable: L'intersezione tra prima scelta e piante selfdetermination produce {greenhouse_wonderCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e piante understanding produce {greenhouse_imaginationCrops^greenhouse_firstAnswerTracker}.}
                            ~ greenhouse_randomizedQuestionsCounter ++
                        ->random
                }
            
            }
                
            - greenhouse_thirdQuest == true:
                {debug_cultivable: Il valore di greenhouse_thirdQuest è {greenhouse_thirdQuest} e per questo torno a random.}
                        ~ greenhouse_randomizedQuestionsCounter ++
                    -> random
        }


        - dice == 4 && greenhouse_relationshipCrops ^ greenhouse_backupCultivable != () && greenhouse_shiftCrops ^ greenhouse_backupCultivable != (): 
        {
            - greenhouse_fourthQuest == false:
            {debug_cultivable: Il valore di greenhouse_fourthQuest è {greenhouse_fourthQuest}. Piante Collaborazione contiene: {greenhouse_relationshipCrops}. Piante Cambiamento contiene: {greenhouse_shiftCrops}.}
            {
                - greenhouse_cropsType == ():
                    -> fourth_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (greenhouse_firstAnswerTracker uguale a {greenhouse_firstAnswerTracker} e quindi procedo con le verifiche.}                 
                {
                    - LIST_RANDOM(greenhouse_relationshipCrops^greenhouse_firstAnswerTracker) != () && LIST_RANDOM(greenhouse_shiftCrops^greenhouse_firstAnswerTracker) != () && greenhouse_cropsType hasnt relationship && greenhouse_cropsType hasnt shift:
                    
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_relationshipCrops produce {greenhouse_relationshipCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e piante shift produce {greenhouse_shiftCrops^greenhouse_firstAnswerTracker}}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                    
                    
                        -> fourth_question
                    - else:
                    
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_relationshipCrops produce {greenhouse_relationshipCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e piante shift produce {greenhouse_shiftCrops^greenhouse_firstAnswerTracker}}
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                    
                        ~ greenhouse_randomizedQuestionsCounter ++
                        ->random
                }
            }
                    
            - else:
            {debug_cultivable: Il valore di greenhouse_fourthQuest è {greenhouse_fourthQuest} e per questo torno a random.}
                    ~ greenhouse_randomizedQuestionsCounter ++
                    -> random
        }
        
        - dice == 5 && greenhouse_relationshipCrops ^ greenhouse_backupCultivable!= () && greenhouse_wonderCrops ^ greenhouse_backupCultivable != (): 
        {
            - greenhouse_fifthQuest == false:
            {debug_cultivable: Il valore di greenhouse_fifthQuest è {greenhouse_fifthQuest}. Piante Collaborazione contiene: {greenhouse_relationshipCrops}. Piante Wonder contiene: {greenhouse_wonderCrops}.}
            {
                - greenhouse_cropsType == ():
                    -> fifth_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (greenhouse_firstAnswerTracker uguale a {greenhouse_firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(greenhouse_relationshipCrops^greenhouse_firstAnswerTracker) != () && LIST_RANDOM(greenhouse_wonderCrops^greenhouse_firstAnswerTracker) != () && greenhouse_cropsType hasnt relationship && greenhouse_cropsType hasnt wonder:
                    
                    {debug_cultivable: L'intersezione tra prima scelta e piantecollaborazione produce {greenhouse_relationshipCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e piante wonderC produce {greenhouse_wonderCrops^greenhouse_firstAnswerTracker}}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}                    
                        -> fifth_question
                    - else:
                    {debug_cultivable: L'intersezione tra prima scelta e piantecollaborazione produce {greenhouse_relationshipCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e piante wonderC produce {greenhouse_wonderCrops^greenhouse_firstAnswerTracker}}
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                    
                        ~ greenhouse_randomizedQuestionsCounter ++
                        ->random
                }
            }
                    
            - else:
            {debug_cultivable: Il valore di greenhouse_fifthQuest è {greenhouse_fifthQuest} e per questo torno a random.}
                    ~ greenhouse_randomizedQuestionsCounter ++
                    -> random
        }        
        
        - dice == 6 && greenhouse_relationshipCrops ^ greenhouse_backupCultivable != () && greenhouse_imaginationCrops ^ greenhouse_backupCultivable != (): 
        {
            - greenhouse_sixthQuest == false:
            {debug_cultivable: Il valore di greenhouse_sixthQuest è {greenhouse_sixthQuest}. Piante Collaborazione contiene: {greenhouse_relationshipCrops}. Piante imagination contiene: {greenhouse_imaginationCrops}.}            
            {
                - greenhouse_cropsType == ():
                    -> sixth_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (greenhouse_firstAnswerTracker uguale a {greenhouse_firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(greenhouse_relationshipCrops^greenhouse_firstAnswerTracker) != () && LIST_RANDOM(greenhouse_imaginationCrops^greenhouse_firstAnswerTracker) != () && greenhouse_cropsType hasnt relationship && greenhouse_cropsType hasnt imagination:
                    
                    {debug_cultivable: L'intersezione tra prima scelta e piantecollaborazione produce {greenhouse_relationshipCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e piante selfdetermination produce {greenhouse_selfdeterminationCrops^greenhouse_firstAnswerTracker}}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                    
                        -> sixth_question
                    - else:
                    {debug_cultivable: L'intersezione tra prima scelta e piantecollaborazione produce {greenhouse_relationshipCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e piante selfdetermination produce {greenhouse_selfdeterminationCrops^greenhouse_firstAnswerTracker}}
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ greenhouse_randomizedQuestionsCounter ++
                        ->random
                }
            }
                    
            - else:
            {debug_cultivable: Il valore di greenhouse_sixthQuest è {greenhouse_sixthQuest} e per questo torno a random.}
                    ~ greenhouse_randomizedQuestionsCounter ++
                    -> random
        }          
        
        - dice == 7 && greenhouse_shiftCrops ^ greenhouse_backupCultivable != () && greenhouse_understandingCrops ^ greenhouse_backupCultivable != ():
            {debug_cultivable: Il valore di greenhouse_seventhQuest è {greenhouse_seventhQuest}. Piante shift contiene: {greenhouse_shiftCrops}. Piante understanding contiene: {greenhouse_understandingCrops}.}        
        {
            - greenhouse_seventhQuest == false:
            {
                - greenhouse_cropsType == ():
                    -> seventh_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (greenhouse_firstAnswerTracker uguale a {greenhouse_firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(greenhouse_shiftCrops^greenhouse_firstAnswerTracker) != () && LIST_RANDOM(greenhouse_understandingCrops^greenhouse_firstAnswerTracker) != () && greenhouse_cropsType hasnt shift && greenhouse_cropsType hasnt understanding:
                    
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_shiftCrops produce {greenhouse_shiftCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e piante Indipendenza produce {greenhouse_understandingCrops^greenhouse_firstAnswerTracker}}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                    
                        -> seventh_question
                    - else:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_shiftCrops produce {greenhouse_shiftCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e piante Indipendenza produce {greenhouse_understandingCrops^greenhouse_firstAnswerTracker}}
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ greenhouse_randomizedQuestionsCounter ++
                        ->random
                }
            }
                    
            - else:
            {debug_cultivable: Il valore di greenhouse_seventhQuest è {greenhouse_seventhQuest} e per questo torno a random.}
                    ~ greenhouse_randomizedQuestionsCounter ++
                    -> random
        }         
        
        - dice == 8 && greenhouse_shiftCrops ^ greenhouse_backupCultivable != () && greenhouse_wonderCrops ^ greenhouse_backupCultivable != ():
            {debug_cultivable: Il valore di greenhouse_eighthQuest è {greenhouse_eighthQuest}. Piante shift contiene: {greenhouse_shiftCrops}. Piante Wonder contiene: {greenhouse_wonderCrops}.}        
        {
            - greenhouse_eighthQuest == false:
  
            {
                - greenhouse_cropsType == ():
                    -> eighth_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (greenhouse_firstAnswerTracker uguale a {greenhouse_firstAnswerTracker} e quindi procedo con le verifiche.}
                   {debug_cultivable: L'intersezione tra prima scelta e piante wonder produce {greenhouse_shiftCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e piante selfdetermination produce {greenhouse_wonderCrops^greenhouse_firstAnswerTracker}.}                
                {
                    - LIST_RANDOM(greenhouse_shiftCrops^greenhouse_firstAnswerTracker) != () && LIST_RANDOM(greenhouse_wonderCrops^greenhouse_firstAnswerTracker) != () && greenhouse_cropsType hasnt shift && greenhouse_cropsType hasnt wonder:
                    
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_shiftCrops produce {greenhouse_shiftCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e greenhouse_wonderCrops produce {greenhouse_wonderCrops^greenhouse_firstAnswerTracker}}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                   
                        -> eighth_question
                    - else:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_shiftCrops produce {greenhouse_shiftCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e greenhouse_wonderCrops produce {greenhouse_wonderCrops^greenhouse_firstAnswerTracker}}
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ greenhouse_randomizedQuestionsCounter ++
                        ->random
                }
            }
                    
            - else:
            {debug_cultivable: Il valore di eightQuest è {greenhouse_eighthQuest} e per questo torno a random.}
                    ~ greenhouse_randomizedQuestionsCounter ++
                    -> random
        }        

        - dice == 9 && greenhouse_shiftCrops ^ greenhouse_backupCultivable != () && greenhouse_imaginationCrops ^ greenhouse_backupCultivable != ():
            {debug_cultivable: Il valore di greenhouse_ninthQuest è {greenhouse_ninthQuest}. Piante shift contiene: {greenhouse_shiftCrops}. Piante imagination contiene: {greenhouse_imaginationCrops}.}        
        {
            - greenhouse_ninthQuest == false:
            {
                - greenhouse_cropsType == ():
                    -> ninth_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (greenhouse_firstAnswerTracker uguale a {greenhouse_firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(greenhouse_shiftCrops^greenhouse_firstAnswerTracker) != () && LIST_RANDOM(greenhouse_imaginationCrops^greenhouse_firstAnswerTracker) != () && greenhouse_cropsType hasnt shift && greenhouse_cropsType hasnt imagination:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_shiftCrops produce {greenhouse_shiftCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e greenhouse_imaginationCrops produce {greenhouse_imaginationCrops^greenhouse_firstAnswerTracker}}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> ninth_question
                    - else:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_shiftCrops produce {greenhouse_shiftCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e greenhouse_imaginationCrops produce {greenhouse_imaginationCrops^greenhouse_firstAnswerTracker}}
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ greenhouse_randomizedQuestionsCounter ++
                        ->random
                }
            }
            - else:
            {debug_cultivable: Il valore di nineQuest è {greenhouse_ninthQuest} e per questo torno a random.}
                ~ greenhouse_randomizedQuestionsCounter ++
                -> random        
        }
        
        - dice == 10 && greenhouse_understandingCrops ^ greenhouse_backupCultivable != () && greenhouse_selfdeterminationCrops ^ greenhouse_backupCultivable != ():
        {debug_cultivable: Il valore di greenhouse_tenthQuest è {greenhouse_tenthQuest}. Piante understanding contiene: {greenhouse_understandingCrops}. Piante selfdetermination contiene: {greenhouse_selfdeterminationCrops}.}          
        {
            - greenhouse_tenthQuest == false:
            {
                - greenhouse_cropsType == ():
                    -> tenth_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (greenhouse_firstAnswerTracker uguale a {greenhouse_firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(greenhouse_understandingCrops^greenhouse_firstAnswerTracker) != () && LIST_RANDOM(greenhouse_selfdeterminationCrops^greenhouse_firstAnswerTracker) != () && greenhouse_cropsType hasnt understanding && greenhouse_cropsType hasnt selfdetermination:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_understandingCrops produce {greenhouse_understandingCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e greenhouse_selfdeterminationCrops produce {greenhouse_selfdeterminationCrops^greenhouse_firstAnswerTracker}}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> tenth_question
                    - else:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_understandingCrops produce {greenhouse_understandingCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e greenhouse_selfdeterminationCrops produce {greenhouse_selfdeterminationCrops^greenhouse_firstAnswerTracker}}
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ greenhouse_randomizedQuestionsCounter ++
                        ->random
                }
            }
 
            
            - else:
            {debug_cultivable: Il valore di greenhouse_tenthQuest è {greenhouse_tenthQuest} e per questo torno a random.}
                    ~ greenhouse_randomizedQuestionsCounter ++
                    -> random
        }         

        - dice == 11 && greenhouse_understandingCrops ^ greenhouse_backupCultivable != () && greenhouse_wonderCrops ^ greenhouse_backupCultivable ^ greenhouse_backupCultivable != ():
        {debug_cultivable: Il valore di greenhouse_eleventhQuest è {greenhouse_eleventhQuest}. Piante understanding contiene: {greenhouse_understandingCrops}. Piante wonder contiene: {greenhouse_wonderCrops}.}         
        {
            - greenhouse_eleventhQuest == false:
            {
                - greenhouse_cropsType == ():
                    -> eleventh_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (greenhouse_firstAnswerTracker uguale a {greenhouse_firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(greenhouse_understandingCrops^greenhouse_firstAnswerTracker) != () && LIST_RANDOM(greenhouse_wonderCrops^greenhouse_firstAnswerTracker) != () && greenhouse_cropsType hasnt understanding && greenhouse_cropsType hasnt wonder:
                    
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_understandingCrops produce {greenhouse_understandingCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e greenhouse_wonderCrops produce {greenhouse_wonderCrops^greenhouse_firstAnswerTracker}}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> eleventh_question
                    
                    - else:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_understandingCrops produce {greenhouse_understandingCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e greenhouse_wonderCrops produce {greenhouse_wonderCrops^greenhouse_firstAnswerTracker}}
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ greenhouse_randomizedQuestionsCounter ++
                        ->random
                }
            }
            - else:
            {debug_cultivable: Il valore di greenhouse_eleventhQuest è {greenhouse_eleventhQuest} e per questo torno a random.}
                ~ greenhouse_randomizedQuestionsCounter ++
                -> random
        }
        
        - dice == 12 && greenhouse_understandingCrops ^ greenhouse_backupCultivable != () && greenhouse_imaginationCrops ^ greenhouse_backupCultivable != ():
        {debug_cultivable: Il valore di greenhouse_twelfthQuest è {greenhouse_twelfthQuest}. Piante understanding contiene: {greenhouse_understandingCrops}. Piante imagination contiene: {greenhouse_imaginationCrops}.}          
        {
            - greenhouse_twelfthQuest == false:
            {
                - greenhouse_cropsType == ():
                    -> twelfth_question
                
                - else:
                {
                    - LIST_RANDOM(greenhouse_understandingCrops^greenhouse_firstAnswerTracker) != () && LIST_RANDOM(greenhouse_imaginationCrops^greenhouse_firstAnswerTracker) != () && greenhouse_cropsType hasnt understanding && greenhouse_cropsType hasnt imagination:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_understandingCrops produce {greenhouse_understandingCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e greenhouse_imaginationCrops produce {greenhouse_imaginationCrops^greenhouse_firstAnswerTracker}}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> twelfth_question
                    - else:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_understandingCrops produce {greenhouse_understandingCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e greenhouse_imaginationCrops produce {greenhouse_imaginationCrops^greenhouse_firstAnswerTracker}}
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ greenhouse_randomizedQuestionsCounter ++
                        ->random
                }
            }
                    - else:
                    {debug_cultivable: Il valore di greenhouse_twelfthQuest è {greenhouse_twelfthQuest} e per questo torno a random.}
                    ~ greenhouse_randomizedQuestionsCounter ++
                    -> random
        } 
        
        - dice == 13 && greenhouse_selfdeterminationCrops ^ greenhouse_backupCultivable != () && greenhouse_wonderCrops ^ greenhouse_backupCultivable != ():
        {debug_cultivable: Il valore di greenhouse_thirteenthQuest è {greenhouse_thirteenthQuest}. Piante selfdetermination contiene: {greenhouse_selfdeterminationCrops}. Piante wonder contiene: {greenhouse_wonderCrops}.}          
        {
            - greenhouse_thirteenthQuest == false:
            {
                - greenhouse_cropsType == ():
                    -> thirteenth_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (greenhouse_firstAnswerTracker uguale a {greenhouse_firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(greenhouse_selfdeterminationCrops^greenhouse_firstAnswerTracker) != () && LIST_RANDOM(greenhouse_wonderCrops^greenhouse_firstAnswerTracker) != () && greenhouse_cropsType hasnt selfdetermination && greenhouse_cropsType hasnt wonder:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_selfdeterminationCrops produce {greenhouse_selfdeterminationCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e greenhouse_wonderCrops produce {greenhouse_wonderCrops^greenhouse_firstAnswerTracker}}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> thirteenth_question
                    - else:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_selfdeterminationCrops produce {greenhouse_selfdeterminationCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e greenhouse_wonderCrops produce {greenhouse_wonderCrops^greenhouse_firstAnswerTracker}}
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ greenhouse_randomizedQuestionsCounter ++
                        ->random
                }
            }
                    - else:
                    {debug_cultivable: Il valore di greenhouse_thirteenthQuest è {greenhouse_thirteenthQuest} e per questo torno a random.}
                    ~ greenhouse_randomizedQuestionsCounter ++
                    -> random
        } 

        - dice == 14 && greenhouse_selfdeterminationCrops ^ greenhouse_backupCultivable != () && greenhouse_imaginationCrops ^ greenhouse_backupCultivable != ():
        {debug_cultivable: Il valore di greenhouse_fourteenthQuest è {greenhouse_fourteenthQuest}. Piante selfdetermination contiene: {greenhouse_selfdeterminationCrops}. Piante imagination contiene: {greenhouse_imaginationCrops}.}
        
        {
            - greenhouse_fourteenthQuest == false:
            {
                - greenhouse_cropsType == ():
                    -> fourteenth_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (greenhouse_firstAnswerTracker uguale a {greenhouse_firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(greenhouse_selfdeterminationCrops^greenhouse_firstAnswerTracker) != () && LIST_RANDOM(greenhouse_imaginationCrops^greenhouse_firstAnswerTracker) != () && greenhouse_cropsType hasnt selfdetermination && greenhouse_cropsType hasnt imagination:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_selfdeterminationCrops produce {greenhouse_selfdeterminationCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e greenhouse_imaginationCrops produce {greenhouse_imaginationCrops^greenhouse_firstAnswerTracker}}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> fourteenth_question
                    - else:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_selfdeterminationCrops produce {greenhouse_selfdeterminationCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e greenhouse_imaginationCrops produce {greenhouse_imaginationCrops^greenhouse_firstAnswerTracker}}
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ greenhouse_randomizedQuestionsCounter ++
                        ->random
                }
            }
            - else:
            {debug_cultivable: Il valore di greenhouse_fourteenthQuest è {greenhouse_fourteenthQuest} e per questo torno a random.}
             ~ greenhouse_randomizedQuestionsCounter ++
                -> random
            }    
        
        - dice == 15 && greenhouse_selfdeterminationCrops ^ greenhouse_backupCultivable != () && greenhouse_relationshipCrops ^ greenhouse_backupCultivable != ():
        {debug_cultivable: Il valore di greenhouse_fifteenQuest è {greenhouse_fifteenQuest}. Piante selfdetermination contiene: {greenhouse_selfdeterminationCrops}. Piante relationship contiene: {greenhouse_relationshipCrops}.}
        
        {
            - greenhouse_fifteenQuest == false:
            {
                - greenhouse_cropsType == ():
                    -> fifteen_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (greenhouse_firstAnswerTracker uguale a {greenhouse_firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(greenhouse_selfdeterminationCrops^greenhouse_firstAnswerTracker) != () && LIST_RANDOM(greenhouse_relationshipCrops^greenhouse_firstAnswerTracker) != () && greenhouse_cropsType hasnt selfdetermination && greenhouse_cropsType hasnt relationship:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_selfdeterminationCrops produce {greenhouse_selfdeterminationCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e greenhouse_relationshipCrops produce {greenhouse_relationshipCrops^greenhouse_firstAnswerTracker}}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> fifteen_question
                    - else:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_selfdeterminationCrops produce {greenhouse_selfdeterminationCrops^greenhouse_firstAnswerTracker}, quella tra prima scelta e greenhouse_relationshipCrops produce {greenhouse_relationshipCrops^greenhouse_firstAnswerTracker}}
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ greenhouse_randomizedQuestionsCounter ++
                        ->random
                }
            }
            - else:
            {debug_cultivable: Il valore di greenhouse_fifteenQuest è {greenhouse_fifteenQuest} e per questo torno a random.}
             ~ greenhouse_randomizedQuestionsCounter ++
                -> random
                
        }
        
    - else:
        {debug_cultivable: Il dado ha valore {dice} e non ci sono condizioni valide per proporre una delle domande e per questo ritiro.}
            ~ greenhouse_randomizedQuestionsCounter ++
                    -> random
}


/* ---------------------------------

QUESTIONS

 ----------------------------------*/



    = first_question
     ~ greenhouse_firstQuest = true
         {debug_cultivable: Entro in first_question. {greenhouse_firstQuest: greenhouse_firstQuest ora = true|greenhouse_firstQuest = false}}
 
        {charTag(TheWitch, witch_state())}   <i>Le foglie...
            + [{~Si sfiorano|Si mescolano|Si proteggono le une con le altre}.]
                    ~ greenhouse_cropsType += relationship
                    ~ greenhouse_firstAnswerTracker = greenhouse_relationshipCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}
            + [{~Si accumulano sulla soglia|Si dispongono in ordine attorno ai vasi|Resistono al vento}.]
                    ~ greenhouse_cropsType += imagination
                    ~ greenhouse_firstAnswerTracker = greenhouse_understandingCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test
    
    = second_question
    ~ greenhouse_secondQuest = true
        {debug_cultivable: Entro in second_question. {greenhouse_secondQuest: greenhouse_secondQuest ora = true|greenhouse_secondQuest = false}}

        {charTag(TheWitch, witch_state())}   <i>L'aria... 
            + [{~Insegue sé stessa|Crea mulinelli di foglie|Ruota e ruzzola portando odori inaspettati}.]
                    ~ greenhouse_cropsType += shift
                    ~ greenhouse_firstAnswerTracker = greenhouse_shiftCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [{~È scoppiettante|Freme, carica di elettricità|Corre in avanti, sempre}.]
                    ~ greenhouse_cropsType += understanding
                    ~ greenhouse_firstAnswerTracker = greenhouse_selfdeterminationCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test
    

    = third_question
     ~ greenhouse_thirdQuest = true
    {debug_cultivable:Entro in third_question. {greenhouse_thirdQuest: greenhouse_thirdQuest ora = true|greenhouse_thirdQuest = false}.}
    
        {charTag(TheWitch, witch_state())}   <i>L'acqua...
            + [{~È mossa solo sulla superficie|È torbida|È piena di foglie e petali}.]
                    ~ greenhouse_cropsType += wonder
                    ~ greenhouse_firstAnswerTracker = greenhouse_wonderCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [{~Scava, portando con sé ogni cosa|Schiaccia foglie e sassi|Rimbomba tra i vasi}.]
                    ~ greenhouse_cropsType += selfdetermination
                    ~ greenhouse_firstAnswerTracker = greenhouse_imaginationCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test

    = fourth_question
     ~ greenhouse_fourthQuest = true
    {debug_cultivable: Entro in greenhouse_fourthQuest. {greenhouse_fourthQuest: greenhouse_fourthQuest ora = true|greenhouse_fourthQuest = false}.}
    
        {charTag(TheWitch, witch_state())}   <i>Le api...
            + [{~Proteggono la regina|Si scambiano direzioni|Si puliscono a vicenda}.]
                    ~ greenhouse_cropsType += relationship
                    ~ greenhouse_firstAnswerTracker = greenhouse_relationshipCrops 
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [{~Danzano in sintonia|Cercano il sole|Spargono polline tra i fiori}.]
                    ~ greenhouse_cropsType += shift
                    ~ greenhouse_firstAnswerTracker = greenhouse_shiftCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test
    
    = fifth_question
     ~ greenhouse_fifthQuest = true
    {debug_cultivable: Entro in greenhouse_fifthQuest. {greenhouse_fifthQuest: greenhouse_fifthQuest ora = true|greenhouse_fifthQuest = false}.}
    
        {charTag(TheWitch, witch_state())}   <i>Le formiche...
            + [{~Lasciano tracce per le compagne|Accumulano cibo per l'inverno|Creano ponti di foglie}.]
                    ~ greenhouse_cropsType += relationship
                    ~ greenhouse_firstAnswerTracker = greenhouse_relationshipCrops 
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [{~Pensano alle amiche perse|Ricordano ciò che non sono più|Si aggrappano ai sogni}.]
                    ~ greenhouse_cropsType += wonder
                    ~ greenhouse_firstAnswerTracker = greenhouse_wonderCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test
                    
    = sixth_question
     ~ greenhouse_sixthQuest = true
    {debug_cultivable: Entro in sixfthQuest. {greenhouse_sixthQuest: sixfthQuest ora = true|sixfthQuest = false}.}
    
        {charTag(TheWitch, witch_state())}   <i>I sassi... 
            + [{~Creano scale verso il cielo|Si fanno mura, protezione|Si scaldano fregandosi lentamente l'un l'altro}.]
                    ~ greenhouse_cropsType += relationship
                    ~ greenhouse_firstAnswerTracker = greenhouse_relationshipCrops 
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [{~Lasciano pezzi di sè sul terreno|Si lanciano contro porte serrate|Schiacciano noci per gli scoiattoli}.]
                    ~ greenhouse_cropsType += selfdetermination
                    ~ greenhouse_firstAnswerTracker = greenhouse_imaginationCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test
    
    = seventh_question
     ~ greenhouse_seventhQuest = true
    {debug_cultivable: Entro in greenhouse_seventhQuest. {greenhouse_seventhQuest: greenhouse_seventhQuest ora = true|greenhouse_seventhQuest = false}.}
    
        {charTag(TheWitch, witch_state())}   <i>La terra...
            + [{~Avanza massaggiando le radici nodose delle querce|Scivola, trascinando con sé i rospi|Asciutta, rotola a valle}.]
                    ~ greenhouse_cropsType += shift
                    ~ greenhouse_firstAnswerTracker = greenhouse_shiftCrops 
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [{~Tentenna sulla cima della collina|Si accumula inquieta lungo la strada|Si solleva dall'acqua, facendosi diga}.]
                    ~ greenhouse_cropsType += imagination
                    ~ greenhouse_firstAnswerTracker = greenhouse_understandingCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test
                    
    = eighth_question
     ~ greenhouse_eighthQuest = true
    {debug_cultivable: Entro in greenhouse_eighthQuest. {greenhouse_eighthQuest: greenhouse_eighthQuest ora = true|greenhouse_eighthQuest = false}.}
    
        {charTag(TheWitch, witch_state())}   <i>I cardellini...
            + [{~Svolazzano in stormi sopra alla foresta|Saltellano tra i rami del salice}.]
                    ~ greenhouse_cropsType += shift 
                    ~ greenhouse_firstAnswerTracker = greenhouse_shiftCrops 
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [{~Cantano i nomi dei compagni persi|Ricostruiscono i nidi di chi non c'è più|Controllano le vecchie scorte dell'inverno}.]
                    ~ greenhouse_cropsType += wonder
                    ~ greenhouse_firstAnswerTracker = greenhouse_wonderCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test                   

    = ninth_question
     ~ greenhouse_ninthQuest = true
    {debug_cultivable: Entro in greenhouse_ninthQuest. {greenhouse_ninthQuest: greenhouse_ninthQuest ora = true|greenhouse_ninthQuest = false}.}
    
        {charTag(TheWitch, witch_state())}   <i>Il cervo volante... 
            + [{~Insegue l'odore di frutta matura|Scava nel legno lunghe gallerie|Trascina pensieri dimenticati}.]
                    ~ greenhouse_cropsType += shift
                    ~ greenhouse_firstAnswerTracker = greenhouse_shiftCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}
                    
            + [{~Lotta temibile e inquieto|Spacca la crisalide, asciugandosi al vento}.]
                    ~ greenhouse_cropsType += selfdetermination
                    ~ greenhouse_firstAnswerTracker = greenhouse_imaginationCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}
            -
                ~ greenhouse_questionsCounter ++
                    -> test                   
   
    = tenth_question
     ~ greenhouse_tenthQuest = true
    {debug_cultivable: Entro in greenhouse_tenthQuest. {greenhouse_tenthQuest: greenhouse_tenthQuest ora = true|greenhouse_tenthQuest = false}.}
    
        {charTag(TheWitch, witch_state())}   <i>Il sole... 
            + [{~Mostra il cammino|Offre coraggio alle lucertole|Solleva gocce dalla palude silente}. ]
                    ~ greenhouse_cropsType += imagination  
                    ~ greenhouse_firstAnswerTracker = greenhouse_understandingCrops 
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [{~Accresce gli steli delle lenticchie selvatiche|Scalda le uova del fagiano|Carezza le foglie verdi di primavera}.]
                    ~ greenhouse_cropsType += understanding
                    ~ greenhouse_firstAnswerTracker = greenhouse_selfdeterminationCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test
    
    = eleventh_question
     ~ greenhouse_eleventhQuest = true
    {debug_cultivable: Entro in greenhouse_eleventhQuest. {greenhouse_eleventhQuest: greenhouse_eleventhQuest ora = true|greenhouse_eleventhQuest = false}.}
    
        {charTag(TheWitch, witch_state())}   <i>La notte...
            + [{~Nasconde i sotterfugi delle falene|Raccoglie i baci delle amanti|Accompagna i ghiri nello spazio del sogno}.]
                    ~ greenhouse_cropsType += imagination  
                    ~ greenhouse_firstAnswerTracker = greenhouse_understandingCrops 
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [{~Nasconde nomi amati tra le nuvole|Riempie di ricordi i sogni della lepre|Asciuga le lacrime tristi del riccio}.]
                    ~ greenhouse_cropsType += wonder
                    ~ greenhouse_firstAnswerTracker = greenhouse_wonderCrops
                {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test                     
 
     = twelfth_question
     ~ greenhouse_twelfthQuest = true
    {debug_cultivable: Entro in greenhouse_twelfthQuest. {greenhouse_twelfthQuest: greenhouse_twelfthQuest ora = true|greenhouse_twelfthQuest = false}.}
    
        {charTag(TheWitch, witch_state())}   <i>La neve...
            + [{~Nasconde allo stambecco il burrone|Spinge ai confini del parco|Piega le punte degli abeti più alti}.]
                    ~ greenhouse_cropsType += imagination  
                    ~ greenhouse_firstAnswerTracker = greenhouse_understandingCrops 
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [{~Schiaccia i nidi delle tortore|Tradisce il passo della volpe}.]
                    ~ greenhouse_cropsType += selfdetermination
                    ~ greenhouse_firstAnswerTracker = greenhouse_imaginationCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test 
    
    = thirteenth_question
     ~ greenhouse_thirteenthQuest = true
    {debug_cultivable: Entro in greenhouse_thirteenthQuest. {greenhouse_thirteenthQuest: greenhouse_thirteenthQuest ora = true|greenhouse_thirteenthQuest = false}.}
    
        {charTag(TheWitch, witch_state())}   <i>{player_pronouns has him: Il riscrittore...|{player_pronouns has her:La riscrittora...|Lə riscrittorə...}}
        
            + [{~Assapora sulla lingua il sapore del cambiamento|Sente sulle mani un accesso di futuro|Freme nel lanciarsi verso ciò che arriverà}.]
                    ~ greenhouse_cropsType += understanding
                    ~ greenhouse_firstAnswerTracker = greenhouse_selfdeterminationCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [{~Indugia su ciò che è stato|Trova conforto nel ricordo di ciò che era|Si chiede dove sia casa}.]
                    ~ greenhouse_cropsType += wonder
                    ~ greenhouse_firstAnswerTracker = greenhouse_wonderCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test                    

    = fourteenth_question
     ~ greenhouse_fourteenthQuest = true
    {debug_cultivable: Entro in greenhouse_fourteenthQuest. {greenhouse_fourteenthQuest: greenhouse_fourteenthQuest ora = true|greenhouse_fourteenthQuest = false}.}
    
        {charTag(TheWitch, witch_state())}   <i>La serra...
            + [{~Brama la crescita di una nuova pianta|Gioisce per l'erbetta che cresce tra le travi|Spalanca le sue porte a nuove sementi}.]
                    ~ greenhouse_cropsType += understanding   
                    ~ greenhouse_firstAnswerTracker = greenhouse_selfdeterminationCrops 
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [{~Scaccia cimici e cavallette|Acceca il corvo ingordo}.]
                    ~ greenhouse_cropsType += selfdetermination
                    ~ greenhouse_firstAnswerTracker = greenhouse_imaginationCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test
    
    = fifteen_question
    ~ greenhouse_fifteenQuest = true
    {debug_cultivable: Entro in greenhouse_fifteenQuest. {greenhouse_fifteenQuest: greenhouse_fifteenQuest ora = true|greenhouse_fifteenQuest = false}.}
    
        {charTag(TheWitch, witch_state())}   <i>La luna... 
            + [{~Accenna timida un nuovo ciclo|Invita la Bella di Notte a sbocciare|Suggerisci sogni di cambiamento}.]
                    ~ greenhouse_cropsType += understanding   
                    ~ greenhouse_firstAnswerTracker = greenhouse_selfdeterminationCrops 
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [{~Solleva le maree per divertire i delfini|Indica la strada alle nuvole|Danza giocosa con la Terra}.]
                    ~ greenhouse_cropsType += relationship
                    ~ greenhouse_firstAnswerTracker = greenhouse_relationshipCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test
 
 ->->
 
 === results
{debug_cultivable: Entro in results.}
{debug_cultivable: Il valore di greenhouse_cropsType è {greenhouse_cropsType}.}
 
    {
    
    - greenhouse_cropsType == (relationship, shift):{
        - LIST_RANDOM(greenhouse_relationshipCrops ^ greenhouse_shiftCrops) == ():
            {debug_cultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
            {debug_cultivable: Il fungo proposto è {greenhouse_chosenCultivable}.}   
                -> list_to_crops
            
        - else: 
        {debug_cultivable: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
                ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_relationshipCrops ^ greenhouse_shiftCrops)
                {
                    - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                    {debug_cultivable: greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                        -> list_to_crops
                    //Questo è un check extra: non dovrebbe mai accadere, ma non si sa mai.    
                    - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                    {debug_cultivable: greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                        -> results
                }
    }
        
        
    - greenhouse_cropsType == (relationship, understanding): {
        - LIST_RANDOM(greenhouse_relationshipCrops ^ greenhouse_selfdeterminationCrops) == ():
            {debug_cultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.} 
                ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
            {debug_cultivable:  Il fungo proposto è {greenhouse_chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debug_cultivable: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
                ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_relationshipCrops ^ greenhouse_selfdeterminationCrops)
                {
                - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                {debug_cultivable: greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                {debug_cultivable:  greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
        
    - greenhouse_cropsType == (relationship, selfdetermination):{
        - LIST_RANDOM(greenhouse_relationshipCrops ^ greenhouse_imaginationCrops) == ():
        {debug_cultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
            {debug_cultivable: Il fungo proposto è {greenhouse_chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debug_cultivable: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_relationshipCrops ^ greenhouse_imaginationCrops)
                {
                - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                {debug_cultivable:  greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                {debug_cultivable:  greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
        
    - greenhouse_cropsType == (relationship, wonder):{
        - LIST_RANDOM(greenhouse_relationshipCrops ^ greenhouse_wonderCrops) == ():
        {debug_cultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
            {debug_cultivable: Il fungo proposto è {greenhouse_chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debug_cultivable: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_relationshipCrops ^ greenhouse_wonderCrops)
                {
                - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                {debug_cultivable: greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                {debug_cultivable:greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
        
        
    - greenhouse_cropsType == (imagination, shift):{
        - LIST_RANDOM(greenhouse_understandingCrops ^ greenhouse_shiftCrops) == ():
       {debug_cultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
            {debug_cultivable:  Il fungo proposto è {greenhouse_chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debug_cultivable:  Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_understandingCrops ^ greenhouse_shiftCrops)
                {
                - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                {debug_cultivable:  greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                {debug_cultivable: greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
                
    - greenhouse_cropsType == (imagination, understanding):{
        - LIST_RANDOM(greenhouse_understandingCrops ^ greenhouse_selfdeterminationCrops) == ():
        {debug_cultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
            {debug_cultivable:  Il fungo proposto è {greenhouse_chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debug_cultivable:  Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_understandingCrops ^ greenhouse_selfdeterminationCrops)
                {
                - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                {debug_cultivable:  greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                {debug_cultivable:  greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    - greenhouse_cropsType == (imagination, selfdetermination): {
        - LIST_RANDOM(greenhouse_understandingCrops ^ greenhouse_imaginationCrops) == ():
        {debug_cultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
            {debug_cultivable: Il fungo proposto è {greenhouse_chosenCultivable}.}   
            -> list_to_crops
        - else:
        {debug_cultivable: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_understandingCrops ^ greenhouse_imaginationCrops)
                {
                - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                {debug_cultivable: greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                {debug_cultivable: greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
            }
        
    - greenhouse_cropsType == (imagination, wonder): {
        - LIST_RANDOM(greenhouse_understandingCrops ^ greenhouse_wonderCrops) == ():
        {debug_cultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
            {debug_cultivable: Il fungo proposto è {greenhouse_chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debug_cultivable: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_understandingCrops ^ greenhouse_wonderCrops)
                {
                - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                {debug_cultivable: greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                {debug_cultivable: greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    - greenhouse_cropsType == (shift, selfdetermination):{
        - LIST_RANDOM(greenhouse_shiftCrops ^ greenhouse_imaginationCrops) == ():
        {debug_cultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
            {debug_cultivable: Il fungo proposto è {greenhouse_chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debug_cultivable: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_shiftCrops ^ greenhouse_imaginationCrops)
                {
                - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                {debug_cultivable: greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                {debug_cultivable: greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    - greenhouse_cropsType == (shift, wonder):{
        - LIST_RANDOM(greenhouse_shiftCrops ^ greenhouse_wonderCrops) == ():
        {debug_cultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
         {debug_cultivable: Il fungo proposto è {greenhouse_chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debug_cultivable:Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_shiftCrops ^ greenhouse_wonderCrops)
                {
                - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                {debug_cultivable: greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                {debug_cultivable: greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    - greenhouse_cropsType == (understanding, selfdetermination):{
        - LIST_RANDOM(greenhouse_imaginationCrops ^ greenhouse_selfdeterminationCrops) == ():
        {debug_cultivable:Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
            {debug_cultivable: Il fungo proposto è {greenhouse_chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debug_cultivable: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_selfdeterminationCrops ^ greenhouse_imaginationCrops)
                {
                - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                {debug_cultivable: greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                {debug_cultivable: greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    - greenhouse_cropsType == (understanding, wonder): {
        - LIST_RANDOM(greenhouse_wonderCrops ^ greenhouse_selfdeterminationCrops) == ():
        {debug_cultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
            {debug_cultivable: il fungo proposto è {greenhouse_chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debug_cultivable: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_selfdeterminationCrops ^ greenhouse_wonderCrops)
                {
                - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                {debug_cultivable: greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                {debug_cultivable: greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
    
    - greenhouse_cropsType == (relationship, imagination): {
        - LIST_RANDOM(greenhouse_relationshipCrops ^ greenhouse_imaginationCrops) == ():
        {debug_cultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
            {debug_cultivable: il fungo proposto è {greenhouse_chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debug_cultivable: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_relationshipCrops ^ greenhouse_imaginationCrops)
                {
                - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                {debug_cultivable: greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                {debug_cultivable: greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
        
      - greenhouse_cropsType == (shift, understanding): {
        - LIST_RANDOM(greenhouse_shiftCrops ^ greenhouse_understandingCrops) == ():
        {debug_cultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
            {debug_cultivable: il fungo proposto è {greenhouse_chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debug_cultivable: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_shiftCrops ^ greenhouse_understandingCrops)
                {
                - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                {debug_cultivable: greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                {debug_cultivable: greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
    
    
    - greenhouse_cropsType == (selfdetermination, wonder): {
        - LIST_RANDOM(greenhouse_selfdeterminationCrops ^ greenhouse_wonderCrops) == ():
        {debug_cultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
            {debug_cultivable: il fungo proposto è {greenhouse_chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debug_cultivable: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_selfdeterminationCrops ^ greenhouse_wonderCrops)
                {
                - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                {debug_cultivable: greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                {debug_cultivable: greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
    
    - else:
    {debug_cultivable: Passo da else nella lista greenhouse_cropsType perché non c'è un fungo adatto.}
         ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
         ~ greenhouse_backupCultivable -= greenhouse_chosenCultivable
    {debug_cultivable: Il fungo proposto è {greenhouse_chosenCultivable}.}      
        -> list_to_crops
    
    }
    
 
 
-> list_to_crops
 
 


=== list_to_crops ===
    ~ greenhouse_cropsType = ()
    ~ greenhouse_firstQuest = false
    ~ greenhouse_secondQuest = false
    ~ greenhouse_thirdQuest = false
    ~ greenhouse_fourthQuest = false
    ~ greenhouse_fifthQuest = false
    ~ greenhouse_sixthQuest = false
    ~ greenhouse_seventhQuest = false
    ~ greenhouse_eighthQuest = false
    ~ greenhouse_ninthQuest = false
    ~ greenhouse_tenthQuest = false
    ~ greenhouse_eleventhQuest = false
    ~ greenhouse_twelfthQuest = false
    ~ greenhouse_thirteenthQuest = false
    ~ greenhouse_fourteenthQuest = false
    ~ greenhouse_fifteenQuest = false
    ~ greenhouse_questionsCounter = 0
    ~ greenhouse_cultivableGrowing = 1
    ~ greenhouse_firstAnswerTracker = ()
    ~ greenhouse_randomizedQuestionsCounter = 0

 
{debug_cultivable: Entro in list_to_crops. Il valore di greenhouse_questionsCounter è {greenhouse_questionsCounter}, il valore di greenhouse_cultivableGrowing è {greenhouse_cultivableGrowing}. greenhouse_firstQuest è {greenhouse_firstQuest}, greenhouse_secondQuest è {greenhouse_secondQuest}, greenhouse_thirdQuest è {greenhouse_thirdQuest}.}
{debug_cultivable: Gli elementi ancora coltivabili sono: {greenhouse_backupCultivable}.}
{debug_cultivable: Svuoto lista tipo Coltivazioni. Il contenuto di tipo Coltivazioni ora è {greenhouse_cropsType}.}
{debug_cultivable: Svuoto lista greenhouse_firstAnswerTracker. Il contenuto di tipo greenhouse_firstAnswerTracker ora è {greenhouse_firstAnswerTracker==(): vuota|piena}.}
    -> chosen_cultivable

= chosen_cultivable
{greenhouse_chosenCultivable:
    - BaccaDellaAddolorata:
        -> bacca_della_addolorata.TW
    - BastoneDellOzioso:
        -> bastone_dell_ozioso.TW
    - BarbaDellInciampo:
        -> barba_dell_inciampo.TW
    - BrinaDellImpossibile:
        -> brina_dell_impossibile.TW
    - CantoDelleCompagne:
        -> canto_delle_compagne.TW
    - CardoAspinato:
        -> cardo_aspinato.TW        
    - EderaDelleAmanti:
        -> edera_delle_amanti.TW
    - ErbaLiccia:
        -> erba_liccia.TW        
    - FalsaPalude:    
        -> falsa_palude.TW
    - LanaNotturna:
        -> lana_notturna.TW
    - LicheneDegliAbissi:
        -> lichene_degli_abissi.TW
    - NonTiScordarDiTe:
        -> non_ti_scordar_di_te.TW
    - Olobino:
        -> olobino.TW                        
    - LaSpazzata:
        -> la_spazzata.TW  

}       



-> main


=== remove_proposed_cultivable
//Questa azione mi permette di rimuovere il fungo selezionato da ogni lista che lo può contenere. E dato che col tempo le liste possono aumentare, devo solo mettere un remove qui e non OVUNQUE XD
{debug_cultivable: Passo da remove_proposed_cultivable. Prima della rimozione backupColtivabile contiene {greenhouse_backupCultivable}, e il coltivabile selezionato è {greenhouse_chosenCultivable}.}
{debug_cultivable: greenhouse_relationshipCrops contiene {greenhouse_relationshipCrops}, greenhouse_shiftCrops contiene {greenhouse_shiftCrops}, greenhouse_understandingCrops contiene {greenhouse_understandingCrops}, greenhouse_selfdeterminationCrops contiene {greenhouse_selfdeterminationCrops}, greenhouse_wonderCrops contiene {greenhouse_wonderCrops} e greenhouse_imaginationCrops contiene {greenhouse_imaginationCrops}.}
{
    - greenhouse_backupCultivable has greenhouse_chosenCultivable:
        ~ greenhouse_backupCultivable -= greenhouse_chosenCultivable
}
{
    - greenhouse_relationshipCrops has greenhouse_chosenCultivable:
        ~ greenhouse_relationshipCrops -= greenhouse_chosenCultivable
 }
 {
    - greenhouse_shiftCrops has greenhouse_chosenCultivable:
        ~ greenhouse_shiftCrops -= greenhouse_chosenCultivable        
  }
  {
    - greenhouse_understandingCrops has greenhouse_chosenCultivable:
        ~ greenhouse_understandingCrops -= greenhouse_chosenCultivable   
  }
  {
    - greenhouse_selfdeterminationCrops has greenhouse_chosenCultivable:
        ~ greenhouse_selfdeterminationCrops -= greenhouse_chosenCultivable
 }
 {
    - greenhouse_wonderCrops has greenhouse_chosenCultivable:
        ~ greenhouse_wonderCrops -= greenhouse_chosenCultivable
}
{
    - greenhouse_imaginationCrops has greenhouse_chosenCultivable:
        ~ greenhouse_imaginationCrops -= greenhouse_chosenCultivable        
}

{debug_cultivable: Dopo la rimozione backupColtivabile contiene {greenhouse_backupCultivable}.}
{debug_cultivable: greenhouse_relationshipCrops contiene {greenhouse_relationshipCrops}, greenhouse_shiftCrops contiene {greenhouse_shiftCrops}, greenhouse_understandingCrops contiene {greenhouse_understandingCrops}, greenhouse_selfdeterminationCrops contiene {greenhouse_selfdeterminationCrops}, greenhouse_wonderCrops contiene {greenhouse_wonderCrops} e greenhouse_imaginationCrops contiene {greenhouse_imaginationCrops}.}
->->

//Formule per la gestione dei TW della serra.
//Per inserire dei coltivabili temporaneamente in TW
=== tempCultTW_formula
{debug_cultivable: Passo dalla funzione tempCultTW_formula. Il coltivabile selezionato è {greenhouse_chosenCultivable} e prima dell'operazione la lista dei coltivabili include {greenhouse_backupCultivable}.}

	
	{
        - greenhouse_backupCultivable has greenhouse_chosenCultivable:
            ~ greenhouse_backupCultivable -= greenhouse_chosenCultivable
            ~ greenhouse_tempCultTriggerWarning += greenhouse_chosenCultivable
    }
    {
        - greenhouse_relationshipCrops has greenhouse_chosenCultivable:
            ~ greenhouse_relationshipCrops -= greenhouse_chosenCultivable
            ~ greenhouse_relationshipCrops_tempTriggerWarning += greenhouse_chosenCultivable
    }
    {
        - greenhouse_shiftCrops has greenhouse_chosenCultivable:
            ~ greenhouse_shiftCrops -= greenhouse_chosenCultivable 
            ~ greenhouse_shiftCrops_tempTriggerWarning += greenhouse_chosenCultivable
    }
    {
        - greenhouse_understandingCrops has greenhouse_chosenCultivable:
            ~ greenhouse_understandingCrops -= greenhouse_chosenCultivable 
            ~ greenhouse_understandingCrops_tempTriggerWarning += greenhouse_chosenCultivable
    }
    {
        - greenhouse_selfdeterminationCrops has greenhouse_chosenCultivable:
            ~ greenhouse_selfdeterminationCrops -= greenhouse_chosenCultivable
            ~ greenhouse_selfdeterminationCrops_tempTriggerWarning += greenhouse_chosenCultivable
    }
    {
        - greenhouse_wonderCrops has greenhouse_chosenCultivable:
            ~ greenhouse_wonderCrops -= greenhouse_chosenCultivable
            ~ greenhouse_wonderCrops_tempTriggerWarning += greenhouse_chosenCultivable
    }
    {
        - greenhouse_imaginationCrops has greenhouse_chosenCultivable:
            ~ greenhouse_imaginationCrops -= greenhouse_chosenCultivable
            ~ greenhouse_imaginationCrops_tempTriggerWarning += greenhouse_chosenCultivable
    }

    ~ greenhouse_chosenCultivable = ()
	
{debug_cultivable: Dopo l'operazione la lista dei coltivabili include {greenhouse_backupCultivable}.}

    {
        - greenhouse_backupCultivable != ():
            ->  cultivable_test
        
        - else:
            {charTag(TheWitch, witch_state())}   <i>Al momento la serra non ha domande da porre a {player_name}.</i>
            -> main
    }
            

//Per renderli disponibili la volta successiva
=== empty_tempCultTW
{debug_cultivable: Passo dalla funzione empty_tempCultTW. Prima dell'operazione la lista dei coltivabili include {greenhouse_backupCultivable}, mentre dei TW temporanei include {greenhouse_tempCultTriggerWarning}.}


    {
        - greenhouse_relationshipCrops_tempTriggerWarning has greenhouse_tempCultTriggerWarning:
            ~ greenhouse_relationshipCrops += greenhouse_tempCultTriggerWarning
            ~ greenhouse_relationshipCrops_tempTriggerWarning = ()
    }
    {
        - greenhouse_shiftCrops_tempTriggerWarning has greenhouse_tempCultTriggerWarning:
            ~ greenhouse_shiftCrops += greenhouse_tempCultTriggerWarning 
            ~ greenhouse_shiftCrops_tempTriggerWarning = ()
    }
    {
        - greenhouse_understandingCrops_tempTriggerWarning has greenhouse_tempCultTriggerWarning:
            ~ greenhouse_understandingCrops += greenhouse_tempCultTriggerWarning 
            ~ greenhouse_understandingCrops_tempTriggerWarning = ()
    }
    {
        - greenhouse_selfdeterminationCrops_tempTriggerWarning has greenhouse_tempCultTriggerWarning:
            ~ greenhouse_selfdeterminationCrops += greenhouse_tempCultTriggerWarning
            ~ greenhouse_selfdeterminationCrops_tempTriggerWarning = ()
    }
    {
        - greenhouse_wonderCrops_tempTriggerWarning has greenhouse_tempCultTriggerWarning:
            ~ greenhouse_wonderCrops += greenhouse_tempCultTriggerWarning
            ~ greenhouse_wonderCrops_tempTriggerWarning = ()
    }
    {
        - greenhouse_imaginationCrops_tempTriggerWarning has greenhouse_tempCultTriggerWarning:
            ~ greenhouse_imaginationCrops += greenhouse_tempCultTriggerWarning
            ~ greenhouse_imaginationCrops_tempTriggerWarning = ()
    }
    
    ~ greenhouse_backupCultivable += greenhouse_tempCultTriggerWarning
    ~ greenhouse_tempCultTriggerWarning = ()
	
{debug_cultivable: Dopo l'operazione la lista dei coltivabili include {greenhouse_backupCultivable}, mentre dei TW temporanei include {greenhouse_tempCultTriggerWarning}.}	
->->

	


=== function plantsNameTranslator(plant)
{
     - greenhouse_findedCultivables hasnt plant:
            ~ return "Sconosciuto"
        
    - else:
        {plant:

            - BaccaDellaAddolorata: 
                ~ return "Bacca della Addolorata"
            
            - BarbaDellInciampo:
                ~ return "Barba dell'Inciampo"
                
            - BastoneDellOzioso:
                ~ return "Bastone dell'Ozioso"
                    
            - BrinaDellImpossibile:
                ~ return "Brina dell'Impossibile"
                
            - CantoDelleCompagne: 
                ~ return "Canto delle Compagne"

            - CardoAspinato:
                ~ return "Cardo Aspinato"
                
            - EderaDelleAmanti:
                ~ return "Edera delle Amanti"
        
            - ErbaLiccia:
                ~ return "Erba Liccia"
                
            - FalsaPalude:
                ~ return "Falsa Palude"

            - LanaNotturna:
                ~ return "Lana Notturna"        
                            
            - LicheneDegliAbissi:
                ~ return "Lichene degli Abissi"
                
            - NonTiScordarDiTe:
                ~ return "Non Ti Scordar di Te"

            - Olobino:
                ~ return "Olobino"

            - LaSpazzata: 
                ~ return "Spezzata"
            
            - universalIngredient:
                ~ return "Ingrediente Universale"
                        
    }
}

    