//Lista coltivabili e stati possibili    
    LIST greenhouse_cultivable = BaccaDellaAddolorata, BarbaDellInciampo, BastoneDellOzioso, BrinaDellImpossibile, CantoDelleCompagne, CardoAspinato, EderaDelleAmanti,  ErbaLiccia, FalsaPalude, LanaNotturna, LicheneDegliAbissi, NonTiScordarDiTe, Olobino, LaSpazzata

    LIST greenhouse_growStep = notStarted, stepZero, stepOne, stepTwo, stepThree

//QUESTA LISTA LA USO PER GESTIRE LA PESCATA O MENO DEI COLTIVABILI
    VAR greenhouse_backupCultivable = (BaccaDellaAddolorata, BarbaDellInciampo, BastoneDellOzioso, BrinaDellImpossibile, CantoDelleCompagne, CardoAspinato, EderaDelleAmanti, ErbaLiccia, FalsaPalude, LanaNotturna, LicheneDegliAbissi, NonTiScordarDiTe, Olobino, LaSpazzata)

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

//Variabili per la gestione della serra
    LIST greenhouse_cropsType = relationship, shift, understanding, selfdetermination, wonder, imagination

//QUESTE LISTE HANNO UN VALORE CATALOGATIVO E PER LA GESTIONE DELLE DOMANDE

    //Relazione: con sé e con gli altri, anche con l’ambiente.
    VAR greenhouse_relationshipCrops = (BaccaDellaAddolorata, CantoDelleCompagne, EderaDelleAmanti, FalsaPalude, LicheneDegliAbissi, Olobino, LaSpazzata)
    //Mutamento: capacità di generare e accogliere il cambiamento.
    VAR greenhouse_shiftCrops = (BaccaDellaAddolorata, BarbaDellInciampo, BrinaDellImpossibile, CantoDelleCompagne, CardoAspinato, ErbaLiccia, FalsaPalude, LanaNotturna, LaSpazzata)
    //Comprensione: cercare il senso, capire il perché.
    VAR greenhouse_understandingCrops = (BarbaDellInciampo, BrinaDellImpossibile, CardoAspinato, ErbaLiccia, LicheneDegliAbissi, NonTiScordarDiTe, Olobino)
    //Autodeterminazione: definire la mia vita per come la voglio, o la vita della mia comunità.
    VAR greenhouse_selfdeterminationCrops = (BarbaDellInciampo, BastoneDellOzioso, ErbaLiccia, LanaNotturna, LicheneDegliAbissi, LaSpazzata)
    //Stupore, meraviglia: sorprendermi, scoprire cose nuove, scoprire cose inaspettate. Vedere la vita come qualcosa di non prevedibile e godere di questo.
    VAR greenhouse_wonderCrops = (BaccaDellaAddolorata, BastoneDellOzioso, CardoAspinato, EderaDelleAmanti, NonTiScordarDiTe, Olobino)
    //Immaginazione e creazione: sono due parole legate ma non sinonimi, ma mi viene istintivo unirle. Da una parte abbiamo la possibilità di pensare a ciò che non c’è, dall’altra di generarlo. In parte immaginazione si collega a stupore (una nuova idea), in parte a comprensione (quando capisco qualcosa e provo ad applicarlo in realtà immaginate). Creatività invece è sia un processo di mutamento (creando porto cambiamento, con tutte le sue conseguenze) che di autodeterminazione (creo ciò che voglio, ciò che penso possa servire, portare piacere, ristorare la mia comunità).
    VAR greenhouse_imaginationCrops = (BastoneDellOzioso, BrinaDellImpossibile, CantoDelleCompagne, EderaDelleAmanti, FalsaPalude, LanaNotturna, NonTiScordarDiTe)


//Pianta che verrà proposta. La uso anche per tracking dello stato delle piante.
    VAR greenhouse_chosenCultivable = ()
    
//Gestione dei temporanei TW
    VAR greenhouse_tempCultTriggerWarning = ()
    
//Variabili per la gestione del test
    VAR greenhouse_questionsCounter = 0
    VAR firstAnswerTracker = ()
    VAR firstQuest = false
    VAR secondQuest = false
    VAR thirdQuest = false
    VAR fourthQuest = false
    VAR fifthQuest = false
    VAR sixthQuest = false
    VAR seventhQuest = false
    VAR eighthQuest = false
    VAR ninthQuest = false
    VAR tenthQuest = false
    VAR eleventhQuest = false
    VAR twelfthQuest = false
    VAR thirteenthQuest = false
    VAR fourteenthQuest = false
    VAR fifteenQuest = false

//Questa è una strategia (basic e temporanea) per evitare che il testing vada in loop se non ci sono combinazioni sensate di domande.
    VAR randomCounter = 0
    VAR maxRandomCounter = 100

//Variabili monitoraggio stato vegetali
    VAR growing = 0 
    
//Gestione priorità coltivabili
    VAR nextCultivableOne = ()
    VAR nextCultivableTwo = ()
    VAR nextCultivableThree = ()
    
    
    
=== next_cultivable_management
{debug: passo per next_cultivable_management.}
{debug: prima di procedere, il valore di nextCultivableThree è {nextCultivableThree}, di nextCultivableTwo è {nextCultivableTwo} e di nextCultivableOne è {nextCultivableOne}.}
//Qui gestiamo la priorità di crescita dettata dalla rana. Se c'è qualcosa in coda, facciamo salire tutto e poi attiviamo il next greenhouse_cultivable iniziale.

//Step uno: riordino delle richieste
{
    - nextCultivableThree != () && nextCultivableTwo == ():
        ~ nextCultivableTwo = nextCultivableThree
        ~ nextCultivableThree = ()
}

{
    - nextCultivableTwo != () && nextCultivableOne == ():
        ~ nextCultivableOne = nextCultivableTwo
        ~ nextCultivableTwo = ()
}

{debug: dopo l'aggiornamento, il valore di nextCultivableThree è {nextCultivableThree}, di nextCultivableTwo è {nextCultivableTwo} e di nextCultivableOne è {nextCultivableOne}.}

//Step due: attivazione o meno (parte solo se greenhouse_chosenCultivable è vuoto)
 {
        - nextCultivableOne != () && greenhouse_chosenCultivable == ():
            Sembra che la rana abbia messo qui le sue zampine.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
            Ecco qualcosa che crescerà su sua richiesta.
                ~ greenhouse_chosenCultivable = nextCultivableOne
                
            {debug or debug_frog: il valore di nextCultivable è {nextCultivableOne} e per questo skippo le domande. Ora greenhouse_chosenCultivable è = a {greenhouse_chosenCultivable}.}
            
                ~ nextCultivableOne = ()
            {debug or debug_frog: svuoto nextCultivable, e il suo valore è {nextCultivableOne}.}
            
                -> list_to_crops
        
        - else:
            {debug_cultivable or debug_frog: il valore di nextCultivable è {nextCultivableOne}, quello di greenhouse_chosenCultivable {greenhouse_chosenCultivable} e per questo passo alle domande o avanzo, a seconda dello stato di greenhouse_chosenCultivable {greenhouse_chosenCultivable}.}
            -> cultivable_test.top
    
    }



=== cultivable_test ===
-> next_cultivable_management ->

- (top)
{~La serra ha qualcosa da svelarti.|I vasi hanno nuove domande.|La terra è fertile di risposte.|L'aria scompiglia ragnatele e capelli.|Sussurri serpeggiano tra i vasi, ponendoti domande.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
    {
        - not are_two_entities_together(Inventory, PG): Hai trovato un dono: uno zainetto per raccogliere tutto ciò che coltiverai.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #ewWord:{em_state(Other)} #portrait:{witch_state()}
                ~ move_entity(Inventory, Greenhouse)
    }
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

    - randomCounter >= maxRandomCounter:
        {debug_cultivable: randomCounter {randomCounter} ha raggiunto il livello massimo {maxRandomCounter}.}
        {
            - greenhouse_backupCultivable != ():
                ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
                {debug_cultivable: Erano presenti ancora coltivabili in greenhouse_backupCultivable e ho estratto {greenhouse_chosenCultivable}.}
                -> list_to_crops
            - else:
            In questo momento non è possibile coltivare altro. #speaker:{witch_tag()}
                -> main
        
      }

    - dice == 1 && greenhouse_relationshipCrops ^ greenhouse_backupCultivable != () && greenhouse_understandingCrops ^ greenhouse_backupCultivable != ():
        {
            - firstQuest == false:
            {debug_cultivable: Il valore di firstQuest è {firstQuest}. Piante Collaborazione contiene: {greenhouse_relationshipCrops}. Piante Indipendenza contiene: {greenhouse_understandingCrops}.}
            {
                - greenhouse_cropsType == ():
                {debug_cultivable: Questa è la prima domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi vado direttamente alla domanda.}
                    -> first_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.}
                {
                    - LIST_RANDOM(greenhouse_relationshipCrops^firstAnswerTracker) != () && LIST_RANDOM(greenhouse_understandingCrops^firstAnswerTracker) != () && greenhouse_cropsType hasnt relationship && greenhouse_cropsType hasnt understanding:
                    
                    {debug_cultivable: L'intersezione tra prima scelta e piantecollaborazione produce {greenhouse_relationshipCrops^firstAnswerTracker}, quella tra prima scelta e piante Indipendenza produce {greenhouse_understandingCrops^firstAnswerTracker}}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                    
                        -> first_question
                    
                    - else:
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                    {debug_cultivable: L'intersezione tra prima scelta e piantecollaborazione produce {greenhouse_relationshipCrops^firstAnswerTracker}, quella tra prima scelta e piante Indipendenza produce {greenhouse_understandingCrops^firstAnswerTracker}}
                        ~ randomCounter ++
                        ->random
                }
                }
                    
            - else:
             {debug_cultivable: Il valore di firstQuest è {firstQuest} e per questo torno a random.}
                    ~ randomCounter ++
                    -> random
        }
    
        
    - dice == 2 && greenhouse_shiftCrops ^ greenhouse_backupCultivable != () && greenhouse_selfdeterminationCrops ^ greenhouse_backupCultivable != ():
        {
            -secondQuest == false:
            {debug_cultivable: Il valore di secondQuest è {secondQuest}. Piante Ciclicità contiene: {greenhouse_shiftCrops}. Piante Novità contiene: {greenhouse_selfdeterminationCrops} e per questo vado alla domanda.}
            {
                - greenhouse_cropsType == ():
                {debug_cultivable: Questa è la prima domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi vado direttamente alla domanda.}
                   -> second_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.}
                {
                    - LIST_RANDOM(greenhouse_shiftCrops^firstAnswerTracker) != () && LIST_RANDOM(greenhouse_selfdeterminationCrops^firstAnswerTracker) != () && greenhouse_cropsType hasnt shift && greenhouse_cropsType hasnt selfdetermination:
                    
                    {debug_cultivable: L'intersezione tra prima scelta e piante shift produce {greenhouse_shiftCrops^firstAnswerTracker}, quella tra prima scelta e piante understanding produce {greenhouse_selfdeterminationCrops^firstAnswerTracker}.}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> second_question
                        
                    - else:
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                    {debug_cultivable: L'intersezione tra prima scelta e piante shift produce {greenhouse_shiftCrops^firstAnswerTracker}, quella tra prima scelta e piante understanding produce {greenhouse_selfdeterminationCrops^firstAnswerTracker}.}
                            ~ randomCounter ++
                        ->random
                }
            
            }
            - else:
            {debug_cultivable: Il valore di secondQuest è {secondQuest} e per questo torno a random.}
                        ~ randomCounter ++
                    -> random
        }


        
    - dice == 3 && greenhouse_wonderCrops ^ greenhouse_backupCultivable != () && greenhouse_imaginationCrops ^ greenhouse_backupCultivable != ():
        {
            - thirdQuest == false:
                {debug_cultivable: Il valore di thirdQuest è {thirdQuest}. Piante Ricordo contiene: {greenhouse_wonderCrops}. Piante Cancellazione contiene: {greenhouse_imaginationCrops} e per questo vado alla domanda.}    
                    {
                - greenhouse_cropsType == ():
                {debug_cultivable: Questa è la prima domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi vado direttamente alla domanda.}
                   -> third_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(greenhouse_wonderCrops^firstAnswerTracker) != () && LIST_RANDOM(greenhouse_imaginationCrops^firstAnswerTracker) != () && greenhouse_cropsType hasnt wonder && greenhouse_cropsType hasnt imagination:
                    
                    {debug_cultivable: L'intersezione tra prima scelta e piante wonder produce {greenhouse_wonderCrops^firstAnswerTracker}, quella tra prima scelta e piante selfdetermination produce {greenhouse_imaginationCrops^firstAnswerTracker}.}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                    
                        -> third_question
                        
                    - else:
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                    {debug_cultivable: L'intersezione tra prima scelta e piante selfdetermination produce {greenhouse_wonderCrops^firstAnswerTracker}, quella tra prima scelta e piante understanding produce {greenhouse_imaginationCrops^firstAnswerTracker}.}
                            ~ randomCounter ++
                        ->random
                }
            
            }
                
            - thirdQuest == true:
                {debug_cultivable: Il valore di thirdQuest è {thirdQuest} e per questo torno a random.}
                        ~ randomCounter ++
                    -> random
        }


        - dice == 4 && greenhouse_relationshipCrops ^ greenhouse_backupCultivable != () && greenhouse_shiftCrops ^ greenhouse_backupCultivable != (): 
        {
            - fourthQuest == false:
            {debug_cultivable: Il valore di fourthQuest è {fourthQuest}. Piante Collaborazione contiene: {greenhouse_relationshipCrops}. Piante Cambiamento contiene: {greenhouse_shiftCrops}.}
            {
                - greenhouse_cropsType == ():
                    -> fourth_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.}                 
                {
                    - LIST_RANDOM(greenhouse_relationshipCrops^firstAnswerTracker) != () && LIST_RANDOM(greenhouse_shiftCrops^firstAnswerTracker) != () && greenhouse_cropsType hasnt relationship && greenhouse_cropsType hasnt shift:
                    
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_relationshipCrops produce {greenhouse_relationshipCrops^firstAnswerTracker}, quella tra prima scelta e piante shift produce {greenhouse_shiftCrops^firstAnswerTracker}}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                    
                    
                        -> fourth_question
                    - else:
                    
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_relationshipCrops produce {greenhouse_relationshipCrops^firstAnswerTracker}, quella tra prima scelta e piante shift produce {greenhouse_shiftCrops^firstAnswerTracker}}
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                    
                        ~ randomCounter ++
                        ->random
                }
            }
                    
            - else:
            {debug_cultivable: Il valore di fourthQuest è {fourthQuest} e per questo torno a random.}
                    ~ randomCounter ++
                    -> random
        }
        
        - dice == 5 && greenhouse_relationshipCrops ^ greenhouse_backupCultivable!= () && greenhouse_wonderCrops ^ greenhouse_backupCultivable != (): 
        {
            - fifthQuest == false:
            {debug_cultivable: Il valore di fifthQuest è {fifthQuest}. Piante Collaborazione contiene: {greenhouse_relationshipCrops}. Piante Wonder contiene: {greenhouse_wonderCrops}.}
            {
                - greenhouse_cropsType == ():
                    -> fifth_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(greenhouse_relationshipCrops^firstAnswerTracker) != () && LIST_RANDOM(greenhouse_wonderCrops^firstAnswerTracker) != () && greenhouse_cropsType hasnt relationship && greenhouse_cropsType hasnt wonder:
                    
                    {debug_cultivable: L'intersezione tra prima scelta e piantecollaborazione produce {greenhouse_relationshipCrops^firstAnswerTracker}, quella tra prima scelta e piante wonderC produce {greenhouse_wonderCrops^firstAnswerTracker}}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}                    
                        -> fifth_question
                    - else:
                    {debug_cultivable: L'intersezione tra prima scelta e piantecollaborazione produce {greenhouse_relationshipCrops^firstAnswerTracker}, quella tra prima scelta e piante wonderC produce {greenhouse_wonderCrops^firstAnswerTracker}}
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                    
                        ~ randomCounter ++
                        ->random
                }
            }
                    
            - else:
            {debug_cultivable: Il valore di fifthQuest è {fifthQuest} e per questo torno a random.}
                    ~ randomCounter ++
                    -> random
        }        
        
        - dice == 6 && greenhouse_relationshipCrops ^ greenhouse_backupCultivable != () && greenhouse_imaginationCrops ^ greenhouse_backupCultivable != (): 
        {
            - sixthQuest == false:
            {debug_cultivable: Il valore di sixthQuest è {sixthQuest}. Piante Collaborazione contiene: {greenhouse_relationshipCrops}. Piante imagination contiene: {greenhouse_imaginationCrops}.}            
            {
                - greenhouse_cropsType == ():
                    -> sixth_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(greenhouse_relationshipCrops^firstAnswerTracker) != () && LIST_RANDOM(greenhouse_imaginationCrops^firstAnswerTracker) != () && greenhouse_cropsType hasnt relationship && greenhouse_cropsType hasnt imagination:
                    
                    {debug_cultivable: L'intersezione tra prima scelta e piantecollaborazione produce {greenhouse_relationshipCrops^firstAnswerTracker}, quella tra prima scelta e piante selfdetermination produce {greenhouse_selfdeterminationCrops^firstAnswerTracker}}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                    
                        -> sixth_question
                    - else:
                    {debug_cultivable: L'intersezione tra prima scelta e piantecollaborazione produce {greenhouse_relationshipCrops^firstAnswerTracker}, quella tra prima scelta e piante selfdetermination produce {greenhouse_selfdeterminationCrops^firstAnswerTracker}}
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ randomCounter ++
                        ->random
                }
            }
                    
            - else:
            {debug_cultivable: Il valore di sixthQuest è {sixthQuest} e per questo torno a random.}
                    ~ randomCounter ++
                    -> random
        }          
        
        - dice == 7 && greenhouse_shiftCrops ^ greenhouse_backupCultivable != () && greenhouse_understandingCrops ^ greenhouse_backupCultivable != ():
            {debug_cultivable: Il valore di seventhQuest è {seventhQuest}. Piante shift contiene: {greenhouse_shiftCrops}. Piante understanding contiene: {greenhouse_understandingCrops}.}        
        {
            - seventhQuest == false:
            {
                - greenhouse_cropsType == ():
                    -> seventh_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(greenhouse_shiftCrops^firstAnswerTracker) != () && LIST_RANDOM(greenhouse_understandingCrops^firstAnswerTracker) != () && greenhouse_cropsType hasnt shift && greenhouse_cropsType hasnt understanding:
                    
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_shiftCrops produce {greenhouse_shiftCrops^firstAnswerTracker}, quella tra prima scelta e piante Indipendenza produce {greenhouse_understandingCrops^firstAnswerTracker}}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                    
                        -> seventh_question
                    - else:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_shiftCrops produce {greenhouse_shiftCrops^firstAnswerTracker}, quella tra prima scelta e piante Indipendenza produce {greenhouse_understandingCrops^firstAnswerTracker}}
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ randomCounter ++
                        ->random
                }
            }
                    
            - else:
            {debug_cultivable: Il valore di seventhQuest è {seventhQuest} e per questo torno a random.}
                    ~ randomCounter ++
                    -> random
        }         
        
        - dice == 8 && greenhouse_shiftCrops ^ greenhouse_backupCultivable != () && greenhouse_wonderCrops ^ greenhouse_backupCultivable != ():
            {debug_cultivable: Il valore di eighthQuest è {eighthQuest}. Piante shift contiene: {greenhouse_shiftCrops}. Piante Wonder contiene: {greenhouse_wonderCrops}.}        
        {
            - eighthQuest == false:
  
            {
                - greenhouse_cropsType == ():
                    -> eighth_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.}
                   {debug_cultivable: L'intersezione tra prima scelta e piante wonder produce {greenhouse_shiftCrops^firstAnswerTracker}, quella tra prima scelta e piante selfdetermination produce {greenhouse_wonderCrops^firstAnswerTracker}.}                
                {
                    - LIST_RANDOM(greenhouse_shiftCrops^firstAnswerTracker) != () && LIST_RANDOM(greenhouse_wonderCrops^firstAnswerTracker) != () && greenhouse_cropsType hasnt shift && greenhouse_cropsType hasnt wonder:
                    
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_shiftCrops produce {greenhouse_shiftCrops^firstAnswerTracker}, quella tra prima scelta e greenhouse_wonderCrops produce {greenhouse_wonderCrops^firstAnswerTracker}}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                   
                        -> eighth_question
                    - else:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_shiftCrops produce {greenhouse_shiftCrops^firstAnswerTracker}, quella tra prima scelta e greenhouse_wonderCrops produce {greenhouse_wonderCrops^firstAnswerTracker}}
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ randomCounter ++
                        ->random
                }
            }
                    
            - else:
            {debug_cultivable: Il valore di eightQuest è {eighthQuest} e per questo torno a random.}
                    ~ randomCounter ++
                    -> random
        }        

        - dice == 9 && greenhouse_shiftCrops ^ greenhouse_backupCultivable != () && greenhouse_imaginationCrops ^ greenhouse_backupCultivable != ():
            {debug_cultivable: Il valore di ninthQuest è {ninthQuest}. Piante shift contiene: {greenhouse_shiftCrops}. Piante imagination contiene: {greenhouse_imaginationCrops}.}        
        {
            - ninthQuest == false:
            {
                - greenhouse_cropsType == ():
                    -> ninth_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(greenhouse_shiftCrops^firstAnswerTracker) != () && LIST_RANDOM(greenhouse_imaginationCrops^firstAnswerTracker) != () && greenhouse_cropsType hasnt shift && greenhouse_cropsType hasnt imagination:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_shiftCrops produce {greenhouse_shiftCrops^firstAnswerTracker}, quella tra prima scelta e greenhouse_imaginationCrops produce {greenhouse_imaginationCrops^firstAnswerTracker}}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> ninth_question
                    - else:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_shiftCrops produce {greenhouse_shiftCrops^firstAnswerTracker}, quella tra prima scelta e greenhouse_imaginationCrops produce {greenhouse_imaginationCrops^firstAnswerTracker}}
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ randomCounter ++
                        ->random
                }
            }
            - else:
            {debug_cultivable: Il valore di nineQuest è {ninthQuest} e per questo torno a random.}
                ~ randomCounter ++
                -> random        
        }
        
        - dice == 10 && greenhouse_understandingCrops ^ greenhouse_backupCultivable != () && greenhouse_selfdeterminationCrops ^ greenhouse_backupCultivable != ():
        {debug_cultivable: Il valore di tenthQuest è {tenthQuest}. Piante understanding contiene: {greenhouse_understandingCrops}. Piante selfdetermination contiene: {greenhouse_selfdeterminationCrops}.}          
        {
            - tenthQuest == false:
            {
                - greenhouse_cropsType == ():
                    -> tenth_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(greenhouse_understandingCrops^firstAnswerTracker) != () && LIST_RANDOM(greenhouse_selfdeterminationCrops^firstAnswerTracker) != () && greenhouse_cropsType hasnt understanding && greenhouse_cropsType hasnt selfdetermination:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_understandingCrops produce {greenhouse_understandingCrops^firstAnswerTracker}, quella tra prima scelta e greenhouse_selfdeterminationCrops produce {greenhouse_selfdeterminationCrops^firstAnswerTracker}}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> tenth_question
                    - else:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_understandingCrops produce {greenhouse_understandingCrops^firstAnswerTracker}, quella tra prima scelta e greenhouse_selfdeterminationCrops produce {greenhouse_selfdeterminationCrops^firstAnswerTracker}}
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ randomCounter ++
                        ->random
                }
            }
 
            
            - else:
            {debug_cultivable: Il valore di tenthQuest è {tenthQuest} e per questo torno a random.}
                    ~ randomCounter ++
                    -> random
        }         

        - dice == 11 && greenhouse_understandingCrops ^ greenhouse_backupCultivable != () && greenhouse_wonderCrops ^ greenhouse_backupCultivable ^ greenhouse_backupCultivable != ():
        {debug_cultivable: Il valore di eleventhQuest è {eleventhQuest}. Piante understanding contiene: {greenhouse_understandingCrops}. Piante wonder contiene: {greenhouse_wonderCrops}.}         
        {
            - eleventhQuest == false:
            {
                - greenhouse_cropsType == ():
                    -> eleventh_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(greenhouse_understandingCrops^firstAnswerTracker) != () && LIST_RANDOM(greenhouse_wonderCrops^firstAnswerTracker) != () && greenhouse_cropsType hasnt understanding && greenhouse_cropsType hasnt wonder:
                    
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_understandingCrops produce {greenhouse_understandingCrops^firstAnswerTracker}, quella tra prima scelta e greenhouse_wonderCrops produce {greenhouse_wonderCrops^firstAnswerTracker}}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> eleventh_question
                    
                    - else:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_understandingCrops produce {greenhouse_understandingCrops^firstAnswerTracker}, quella tra prima scelta e greenhouse_wonderCrops produce {greenhouse_wonderCrops^firstAnswerTracker}}
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ randomCounter ++
                        ->random
                }
            }
            - else:
            {debug_cultivable: Il valore di eleventhQuest è {eleventhQuest} e per questo torno a random.}
                ~ randomCounter ++
                -> random
        }
        
        - dice == 12 && greenhouse_understandingCrops ^ greenhouse_backupCultivable != () && greenhouse_imaginationCrops ^ greenhouse_backupCultivable != ():
        {debug_cultivable: Il valore di twelfthQuest è {twelfthQuest}. Piante understanding contiene: {greenhouse_understandingCrops}. Piante imagination contiene: {greenhouse_imaginationCrops}.}          
        {
            - twelfthQuest == false:
            {
                - greenhouse_cropsType == ():
                    -> twelfth_question
                
                - else:
                {
                    - LIST_RANDOM(greenhouse_understandingCrops^firstAnswerTracker) != () && LIST_RANDOM(greenhouse_imaginationCrops^firstAnswerTracker) != () && greenhouse_cropsType hasnt understanding && greenhouse_cropsType hasnt imagination:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_understandingCrops produce {greenhouse_understandingCrops^firstAnswerTracker}, quella tra prima scelta e greenhouse_imaginationCrops produce {greenhouse_imaginationCrops^firstAnswerTracker}}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> twelfth_question
                    - else:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_understandingCrops produce {greenhouse_understandingCrops^firstAnswerTracker}, quella tra prima scelta e greenhouse_imaginationCrops produce {greenhouse_imaginationCrops^firstAnswerTracker}}
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ randomCounter ++
                        ->random
                }
            }
                    - else:
                    {debug_cultivable: Il valore di twelfthQuest è {twelfthQuest} e per questo torno a random.}
                    ~ randomCounter ++
                    -> random
        } 
        
        - dice == 13 && greenhouse_selfdeterminationCrops ^ greenhouse_backupCultivable != () && greenhouse_wonderCrops ^ greenhouse_backupCultivable != ():
        {debug_cultivable: Il valore di thirteenthQuest è {thirteenthQuest}. Piante selfdetermination contiene: {greenhouse_selfdeterminationCrops}. Piante wonder contiene: {greenhouse_wonderCrops}.}          
        {
            - thirteenthQuest == false:
            {
                - greenhouse_cropsType == ():
                    -> thirteenth_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(greenhouse_selfdeterminationCrops^firstAnswerTracker) != () && LIST_RANDOM(greenhouse_wonderCrops^firstAnswerTracker) != () && greenhouse_cropsType hasnt selfdetermination && greenhouse_cropsType hasnt wonder:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_selfdeterminationCrops produce {greenhouse_selfdeterminationCrops^firstAnswerTracker}, quella tra prima scelta e greenhouse_wonderCrops produce {greenhouse_wonderCrops^firstAnswerTracker}}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> thirteenth_question
                    - else:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_selfdeterminationCrops produce {greenhouse_selfdeterminationCrops^firstAnswerTracker}, quella tra prima scelta e greenhouse_wonderCrops produce {greenhouse_wonderCrops^firstAnswerTracker}}
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ randomCounter ++
                        ->random
                }
            }
                    - else:
                    {debug_cultivable: Il valore di thirteenthQuest è {thirteenthQuest} e per questo torno a random.}
                    ~ randomCounter ++
                    -> random
        } 

        - dice == 14 && greenhouse_selfdeterminationCrops ^ greenhouse_backupCultivable != () && greenhouse_imaginationCrops ^ greenhouse_backupCultivable != ():
        {debug_cultivable: Il valore di fourteenthQuest è {fourteenthQuest}. Piante selfdetermination contiene: {greenhouse_selfdeterminationCrops}. Piante imagination contiene: {greenhouse_imaginationCrops}.}
        
        {
            - fourteenthQuest == false:
            {
                - greenhouse_cropsType == ():
                    -> fourteenth_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(greenhouse_selfdeterminationCrops^firstAnswerTracker) != () && LIST_RANDOM(greenhouse_imaginationCrops^firstAnswerTracker) != () && greenhouse_cropsType hasnt selfdetermination && greenhouse_cropsType hasnt imagination:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_selfdeterminationCrops produce {greenhouse_selfdeterminationCrops^firstAnswerTracker}, quella tra prima scelta e greenhouse_imaginationCrops produce {greenhouse_imaginationCrops^firstAnswerTracker}}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> fourteenth_question
                    - else:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_selfdeterminationCrops produce {greenhouse_selfdeterminationCrops^firstAnswerTracker}, quella tra prima scelta e greenhouse_imaginationCrops produce {greenhouse_imaginationCrops^firstAnswerTracker}}
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ randomCounter ++
                        ->random
                }
            }
            - else:
            {debug_cultivable: Il valore di fourteenthQuest è {fourteenthQuest} e per questo torno a random.}
             ~ randomCounter ++
                -> random
            }    
        
        - dice == 15 && greenhouse_selfdeterminationCrops ^ greenhouse_backupCultivable != () && greenhouse_relationshipCrops ^ greenhouse_backupCultivable != ():
        {debug_cultivable: Il valore di fifteenQuest è {fifteenQuest}. Piante selfdetermination contiene: {greenhouse_selfdeterminationCrops}. Piante relationship contiene: {greenhouse_relationshipCrops}.}
        
        {
            - fifteenQuest == false:
            {
                - greenhouse_cropsType == ():
                    -> fifteen_question
                
                - else:
                {debug_cultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(greenhouse_selfdeterminationCrops^firstAnswerTracker) != () && LIST_RANDOM(greenhouse_relationshipCrops^firstAnswerTracker) != () && greenhouse_cropsType hasnt selfdetermination && greenhouse_cropsType hasnt relationship:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_selfdeterminationCrops produce {greenhouse_selfdeterminationCrops^firstAnswerTracker}, quella tra prima scelta e greenhouse_relationshipCrops produce {greenhouse_relationshipCrops^firstAnswerTracker}}
                    {debug_cultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> fifteen_question
                    - else:
                    {debug_cultivable: L'intersezione tra prima scelta e greenhouse_selfdeterminationCrops produce {greenhouse_selfdeterminationCrops^firstAnswerTracker}, quella tra prima scelta e greenhouse_relationshipCrops produce {greenhouse_relationshipCrops^firstAnswerTracker}}
                    {debug_cultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ randomCounter ++
                        ->random
                }
            }
            - else:
            {debug_cultivable: Il valore di fifteenQuest è {fifteenQuest} e per questo torno a random.}
             ~ randomCounter ++
                -> random
                
        }
        
    - else:
        {debug_cultivable: Il dado ha valore {dice} e non ci sono condizioni valide per proporre una delle domande e per questo ritiro.}
            ~ randomCounter ++
                    -> random
}


/* ---------------------------------

QUESTIONS

 ----------------------------------*/



    = first_question
     ~ firstQuest = true
         {debug_cultivable: Entro in first_question. {firstQuest: firstQuest ora = true|firstQuest = false}}
 
        Le foglie...#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~Si sfiorano|Si mescolano|Si proteggono le une con le altre}.]
                    ~ greenhouse_cropsType += relationship
                    ~ firstAnswerTracker = greenhouse_relationshipCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}
            + [{~Si accumulano sulla soglia|Si dispongono in ordine attorno ai vasi|Resistono al vento}.]
                    ~ greenhouse_cropsType += imagination
                    ~ firstAnswerTracker = greenhouse_understandingCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test
    
    = second_question
    ~ secondQuest = true
        {debug_cultivable: Entro in second_question. {secondQuest: SecondQuest ora = true|SecondQuest = false}}

        L'aria... #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~Insegue sé stessa|Crea mulinelli di foglie|Ruota e ruzzola portando odori inaspettati}.]
                    ~ greenhouse_cropsType += shift
                    ~ firstAnswerTracker = greenhouse_shiftCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [{~È scoppiettante|Freme, carica di elettricità|Corre in avanti, sempre}.]
                    ~ greenhouse_cropsType += understanding
                    ~ firstAnswerTracker = greenhouse_selfdeterminationCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test
    

    = third_question
     ~ thirdQuest = true
    {debug_cultivable:Entro in third_question. {thirdQuest: thirdQuest ora = true|thirdQuest = false}.}
    
        L'acqua...#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~È mossa solo sulla superficie|È torbida|È piena di foglie e petali}.]
                    ~ greenhouse_cropsType += wonder
                    ~ firstAnswerTracker = greenhouse_wonderCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [{~Scava, portando con sé ogni cosa|Schiaccia foglie e sassi|Rimbomba tra i vasi}.]
                    ~ greenhouse_cropsType += selfdetermination
                    ~ firstAnswerTracker = greenhouse_imaginationCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test

    = fourth_question
     ~ fourthQuest = true
    {debug_cultivable: Entro in fourthQuest. {fourthQuest: fourthQuest ora = true|fourthQuest = false}.}
    
        Le api...#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~Proteggono la regina|Si scambiano direzioni|Si puliscono a vicenda}.]
                    ~ greenhouse_cropsType += relationship
                    ~ firstAnswerTracker = greenhouse_relationshipCrops 
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [{~Danzano in sintonia|Cercano il sole|Spargono polline tra i fiori}.]
                    ~ greenhouse_cropsType += shift
                    ~ firstAnswerTracker = greenhouse_shiftCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test
    
    = fifth_question
     ~ fifthQuest = true
    {debug_cultivable: Entro in fifthQuest. {fifthQuest: fifthQuest ora = true|fifthQuest = false}.}
    
        Le formiche...#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~Lasciano tracce per le compagne|Accumulano cibo per l'inverno|Creano ponti di foglie}.]
                    ~ greenhouse_cropsType += relationship
                    ~ firstAnswerTracker = greenhouse_relationshipCrops 
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [{~Pensano alle amiche perse|Ricordano ciò che non sono più|Si aggrappano ai sogni}.]
                    ~ greenhouse_cropsType += wonder
                    ~ firstAnswerTracker = greenhouse_wonderCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test
                    
    = sixth_question
     ~ sixthQuest = true
    {debug_cultivable: Entro in sixfthQuest. {sixthQuest: sixfthQuest ora = true|sixfthQuest = false}.}
    
        I sassi... #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~Creano scale verso il cielo|Si fanno mura, protezione|Si scaldano fregandosi lentamente l'un l'altro}.]
                    ~ greenhouse_cropsType += relationship
                    ~ firstAnswerTracker = greenhouse_relationshipCrops 
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [{~Lasciano pezzi di sè sul terreno|Si lanciano contro porte serrate|Schiacciano noci per gli scoiattoli}.]
                    ~ greenhouse_cropsType += selfdetermination
                    ~ firstAnswerTracker = greenhouse_imaginationCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test
    
    = seventh_question
     ~ seventhQuest = true
    {debug_cultivable: Entro in seventhQuest. {seventhQuest: seventhQuest ora = true|seventhQuest = false}.}
    
        La terra...#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~Avanza massaggiando le radici nodose delle quercie|Scivola, trascinando con sé i rospi|Asciutta, rotola a valle}.]
                    ~ greenhouse_cropsType += shift
                    ~ firstAnswerTracker = greenhouse_shiftCrops 
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [{~Tentenna sulla cima della collina|Si accumula inquieta lungo la strada|Si solleva dall'acqua, facendosi diga}.]
                    ~ greenhouse_cropsType += imagination
                    ~ firstAnswerTracker = greenhouse_understandingCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test
                    
    = eighth_question
     ~ eighthQuest = true
    {debug_cultivable: Entro in eighthQuest. {eighthQuest: eighthQuest ora = true|eighthQuest = false}.}
    
        I cardellini...#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~Svolazzano in stormi sopra alla foresta|Saltellano tra i rami del salice}.]
                    ~ greenhouse_cropsType += shift 
                    ~ firstAnswerTracker = greenhouse_shiftCrops 
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [{~Cantano i nomi dei compagni persi|Ricostruiscono i nidi di chi non c'è più|Controllano le vecchie scorte dell'inverno}.]
                    ~ greenhouse_cropsType += wonder
                    ~ firstAnswerTracker = greenhouse_wonderCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test                   

    = ninth_question
     ~ ninthQuest = true
    {debug_cultivable: Entro in ninthQuest. {ninthQuest: ninthQuest ora = true|ninthQuest = false}.}
    
        Il cervo volante... #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~Insegue l'odore di frutta matura|Scava nel legno lunghe gallerie|Trascina pensieri dimenticati}.]
                    ~ greenhouse_cropsType += shift
                    ~ firstAnswerTracker = greenhouse_shiftCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}
                    
            + [{~Lotta temibile e inquieto|Spacca la crisalide, asciugandosi al vento}.]
                    ~ greenhouse_cropsType += selfdetermination
                    ~ firstAnswerTracker = greenhouse_imaginationCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}
            -
                ~ greenhouse_questionsCounter ++
                    -> test                   
   
    = tenth_question
     ~ tenthQuest = true
    {debug_cultivable: Entro in tenthQuest. {tenthQuest: tenthQuest ora = true|tenthQuest = false}.}
    
        Il sole... #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~Mostra il cammino|Offre coraggio alle lucertole|Solleva goccie dalla palude silente}. ]
                    ~ greenhouse_cropsType += imagination  
                    ~ firstAnswerTracker = greenhouse_understandingCrops 
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [{~Accresce gli steli delle lenticchie selvatiche|Scalda le uova del fagiano|Carezza le foglie verdi di primavera}.]
                    ~ greenhouse_cropsType += understanding
                    ~ firstAnswerTracker = greenhouse_selfdeterminationCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test
    
    = eleventh_question
     ~ eleventhQuest = true
    {debug_cultivable: Entro in eleventhQuest. {eleventhQuest: eleventhQuest ora = true|eleventhQuest = false}.}
    
        La notte...#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~Nasconde i sotterfugi delle falene|Raccoglie i baci delle amanti|Accompagna i ghiri nello spazio del sogno}.]
                    ~ greenhouse_cropsType += imagination  
                    ~ firstAnswerTracker = greenhouse_understandingCrops 
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [{~Nasconde nomi amati tra le nuvole|Riempie di ricordi i sogni della lepre|Asciuga le lacrime tristi del riccio}.]
                    ~ greenhouse_cropsType += wonder
                    ~ firstAnswerTracker = greenhouse_wonderCrops
                {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test                     
 
     = twelfth_question
     ~ twelfthQuest = true
    {debug_cultivable: Entro in twelfthQuest. {twelfthQuest: twelfthQuest ora = true|twelfthQuest = false}.}
    
        La neve...#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~Nasconde allo stambecco il burrone|Spinge ai confini del parco|Piega le punte degli abeti più alti}.]
                    ~ greenhouse_cropsType += imagination  
                    ~ firstAnswerTracker = greenhouse_understandingCrops 
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [{~Schiaccia i nidi delle tortore|Tradisce il passo della volpe}.]
                    ~ greenhouse_cropsType += selfdetermination
                    ~ firstAnswerTracker = greenhouse_imaginationCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test 
    
    = thirteenth_question
     ~ thirteenthQuest = true
    {debug_cultivable: Entro in thirteenthQuest. {thirteenthQuest: thirteenthQuest ora = true|thirteenthQuest = false}.}
    
        {player_pronouns has him: Il riscrittore...|{player_pronouns has her:La riscrittora...|Lə riscrittorə...}}#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        
            + [{~Assapora sulla lingua il sapore del cambiamento|Sente sulle mani un accesso di futuro|Freme nel lanciarsi verso ciò che arriverà}.]
                    ~ greenhouse_cropsType += understanding
                    ~ firstAnswerTracker = greenhouse_selfdeterminationCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [{~Indugia su ciò che è stato|Trova conforto nel ricordo di ciò che era|Si chiede dove sia casa}.]
                    ~ greenhouse_cropsType += wonder
                    ~ firstAnswerTracker = greenhouse_wonderCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test                    

    = fourteenth_question
     ~ fourteenthQuest = true
    {debug_cultivable: Entro in fourteenthQuest. {fourteenthQuest: fourteenthQuest ora = true|fourteenthQuest = false}.}
    
        La serra...#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~Brama la crescita di una nuova pianta|Gioisce per l'erbetta che cresce tra le travi|Spalanca le sue porte a nuove sementi}.]
                    ~ greenhouse_cropsType += understanding   
                    ~ firstAnswerTracker = greenhouse_selfdeterminationCrops 
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [{~Scaccia cimici e cavallette|Acceca il corvo ingordo}.]
                    ~ greenhouse_cropsType += selfdetermination
                    ~ firstAnswerTracker = greenhouse_imaginationCrops
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test
    
    = fifteen_question
    ~ fifteenQuest = true
    {debug_cultivable: Entro in fifteenQuest. {fifteenQuest: fifteenQuest ora = true|fifteenQuest = false}.}
    
        La luna... #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~Accenna timida un nuovo ciclo|Invita la Bella di Notte a sbocciare|Suggerisci sogni di cambiamento}.]
                    ~ greenhouse_cropsType += understanding   
                    ~ firstAnswerTracker = greenhouse_selfdeterminationCrops 
                    {debug_cultivable: greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [{~Solleva le maree per divertire i delfini|Indica la strada alle nuvole|Danza giocosa con la Terra}.]
                    ~ greenhouse_cropsType += relationship
                    ~ firstAnswerTracker = greenhouse_relationshipCrops
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
    ~ firstQuest = false
    ~ secondQuest = false
    ~ thirdQuest = false
    ~ fourthQuest = false
    ~ fifthQuest = false
    ~ sixthQuest = false
    ~ seventhQuest = false
    ~ eighthQuest = false
    ~ ninthQuest = false
    ~ tenthQuest = false
    ~ eleventhQuest = false
    ~ twelfthQuest = false
    ~ thirteenthQuest = false
    ~ fourteenthQuest = false
    ~ fifteenQuest = false
    ~ greenhouse_questionsCounter = 0
    ~ growing = 1
    ~ firstAnswerTracker = ()
    ~ randomCounter = 0

 
{debug_cultivable: Entro in list_to_crops. Il valore di greenhouse_questionsCounter è {greenhouse_questionsCounter}, il valore di growing è {growing}. firstQuest è {firstQuest}, secondQuest è {secondQuest}, thirdQuest è {thirdQuest}.}
{debug_cultivable: Gli elementi ancora coltivabili sono: {greenhouse_backupCultivable}.}
{debug_cultivable: Svuoto lista tipo Coltivazioni. Il contenuto di tipo Coltivazioni ora è {greenhouse_cropsType}.}
{debug_cultivable: Svuoto lista firstAnswerTracker. Il contenuto di tipo firstAnswerTracker ora è {firstAnswerTracker==(): vuota|piena}.}
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

	~ greenhouse_backupCultivable -= greenhouse_chosenCultivable
	~ greenhouse_tempCultTriggerWarning += greenhouse_chosenCultivable
    ~ greenhouse_chosenCultivable = ()
	
{debug_cultivable: Dopo l'operazione la lista dei coltivabili include {greenhouse_backupCultivable}.}	
->->

//Per renderli disponibili la volta successiva
=== empty_tempCultTW
{debug_cultivable: Passo dalla funzione empty_tempCultTW. Prima dell'operazione la lista dei coltivabili include {greenhouse_backupCultivable}, mentre dei TW temporanei include {greenhouse_tempCultTriggerWarning}.}

	~ greenhouse_backupCultivable +=  greenhouse_tempCultTriggerWarning
	~  greenhouse_tempCultTriggerWarning = ()
	
{debug_cultivable: Dopo l'operazione la lista dei coltivabili include {greenhouse_backupCultivable}, mentre dei TW temporanei include {greenhouse_tempCultTriggerWarning}.}	
->->

	
