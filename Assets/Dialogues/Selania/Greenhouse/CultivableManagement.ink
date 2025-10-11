//Lista coltivabili e stati possibili    
    LIST cultivable = BaccaDellaAddolorata, BarbaDellInciampo, BastoneDellOzioso, BrinaDellImpossibile, CantoDelleCompagne, CardoAspinato, EderaDelleAmanti, FalsaPalude, LicheneDegliAbissi, NonTiScordarDiTe, Olobino, LaSpazzata, NuovoSette, NuovoOtto

    LIST growStep = notStarted, stepZero, stepOne, stepTwo, stepThree

//QUESTA LISTA LA USO PER GESTIRE LA PESCATA O MENO DEI COLTIVABILI
    VAR backupCultivable = (BaccaDellaAddolorata, BarbaDellInciampo, BastoneDellOzioso, BrinaDellImpossibile, CantoDelleCompagne, CardoAspinato, EderaDelleAmanti, FalsaPalude, LicheneDegliAbissi, NonTiScordarDiTe, Olobino, LaSpazzata, NuovoSette, NuovoOtto)
    
    VAR growthCantoDelleCompagne = notStarted
    VAR growthLicheneDegliAbissi = notStarted
    VAR growthEderaDelleAmanti = notStarted
    VAR growthBrinaDellImpossibile = notStarted
    VAR growthLaSpazzata = notStarted
    VAR growthBaccaDellaAddolorata = notStarted
    VAR growthNonTiScordarDiTe = notStarted
    VAR growthCardoAspinato = notStarted
    VAR growthBastoneDellOzioso = notStarted
    VAR growthBarbaDellInciampo = notStarted
    VAR growthOlobino = notStarted
    VAR growthFalsaPalude = notStarted

//Variabili per la gestione della serra
    LIST cropsType = relationship, shift, understanding, selfdetermination, wonder, imagination

//QUESTE LISTE HANNO UN VALORE CATALOGATIVO E PER LA GESTIONE DELLE DOMANDE

    //Relazione: con sé e con gli altri, anche con l’ambiente.
    VAR relationshipCrops = (LicheneDegliAbissi, NonTiScordarDiTe, EderaDelleAmanti, CardoAspinato, NuovoSette, NuovoOtto, BastoneDellOzioso, CantoDelleCompagne)
    //Mutamento: capacità di generare e accogliere il cambiamento.
    VAR shiftCrops = (LicheneDegliAbissi, LaSpazzata, EderaDelleAmanti, FalsaPalude, BaccaDellaAddolorata, BastoneDellOzioso, BarbaDellInciampo)
    //Comprensione: cercare il senso, capire il perché.
    VAR understandingCrops = (LaSpazzata, BaccaDellaAddolorata, CardoAspinato, FalsaPalude, LicheneDegliAbissi, Olobino, NuovoOtto)
    //Autodeterminazione: definire la mia vita per come la voglio, o la vita della mia comunità.
    VAR selfdeterminationCrops = (CantoDelleCompagne, BaccaDellaAddolorata, BrinaDellImpossibile, LaSpazzata, BastoneDellOzioso, BarbaDellInciampo, NuovoSette)
    //Stupore, meraviglia: sorprendermi, scoprire cose nuove, scoprire cose inaspettate. Vedere la vita come qualcosa di non prevedibile e godere di questo.
    VAR wonderCrops = (EderaDelleAmanti, BrinaDellImpossibile, FalsaPalude, NonTiScordarDiTe, CantoDelleCompagne, BarbaDellInciampo, Olobino)
    //Immaginazione e creazione: sono due parole legate ma non sinonimi, ma mi viene istintivo unirle. Da una parte abbiamo la possibilità di pensare a ciò che non c’è, dall’altra di generarlo. In parte immaginazione si collega a stupore (una nuova idea), in parte a comprensione (quando capisco qualcosa e provo ad applicarlo in realtà immaginate). Creatività invece è sia un processo di mutamento (creando porto cambiamento, con tutte le sue conseguenze) che di autodeterminazione (creo ciò che voglio, ciò che penso possa servire, portare piacere, ristorare la mia comunità).
    VAR imaginationCrops = (NonTiScordarDiTe, CantoDelleCompagne, CardoAspinato, BrinaDellImpossibile, BastoneDellOzioso, Olobino, NuovoSette, NuovoOtto)


//Pianta che verrà proposta. La uso anche per tracking dello stato delle piante.
    VAR chosenCultivable = ()
    
//Gestione dei temporanei TW
    VAR tempCultTW = ()
    
//Variabili per la gestione del test
    VAR counter = 0
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

=== cultivable_test ===
{~La serra ha qualcosa da svelarti.|I vasi hanno nuove domande.|La terra è fertile di risposte.|L'aria scompiglia ragnatele e capelli.|Sussurri serpeggiano tra i vasi, ponendoti domande.}#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
    {
        - not are_two_entities_together(Inventory, PG): Hai trovato un dono: uno zainetto per raccogliere tutto ciò che coltiverai.#speaker:{witch_tag()} #inkA:offState #inkB:offState #inkC:offState #inkD:offState #portrait:{witch_state()}
                ~ move_entity(Inventory, Greenhouse)
    }
    -> test

=== test
{debugCultivable: Sono passato da test.}
{debugCultivable: Gli elementi ancora coltivabili sono: {backupCultivable}.}

{
    - counter < 2:
    {debugCultivable: Counter ha valore {counter} e per questo vado a Random.}
        -> random
    - counter == 2:
    {debugCultivable: Counter ha valore {counter} e per questo vado a Results.}
        -> results
}

= random
~ temp dice = RANDOM(1,14)

{debugCultivable: Il dado ha valore: {dice}.}
{

    - randomCounter >= maxRandomCounter:
        {debugCultivable: randomCounter {randomCounter} ha raggiunto il livello massimo {maxRandomCounter}.}
        {
            - backupCultivable != ():
                ~ chosenCultivable = LIST_RANDOM(backupCultivable)
                {debugCultivable: Erano presenti ancora coltivabili in backupCultivable e ho estratto {chosenCultivable}.}
                -> list_to_crops
            - else:
            In questo momento non è possibile coltivare altro. #speaker:{witch_tag()}
                -> main
        
      }

    - dice == 1 && relationshipCrops ^ backupCultivable != () && understandingCrops ^ backupCultivable != ():
        {
            - firstQuest == false:
            {debugCultivable: Il valore di firstQuest è {firstQuest}. Piante Collaborazione contiene: {relationshipCrops}. Piante Indipendenza contiene: {understandingCrops}.}
            {
                - cropsType == ():
                {debugCultivable: Questa è la prima domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi vado direttamente alla domanda.}
                    -> first_question
                
                - else:
                {debugCultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.}
                {
                    - LIST_RANDOM(relationshipCrops^firstAnswerTracker) != () && LIST_RANDOM(understandingCrops^firstAnswerTracker) != () && cropsType hasnt relationship && cropsType hasnt understanding:
                    
                    {debugCultivable: L'intersezione tra prima scelta e piantecollaborazione produce {relationshipCrops^firstAnswerTracker}, quella tra prima scelta e piante Indipendenza produce {understandingCrops^firstAnswerTracker}}
                    {debugCultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                    
                        -> first_question
                    
                    - else:
                    {debugCultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                    {debugCultivable: L'intersezione tra prima scelta e piantecollaborazione produce {relationshipCrops^firstAnswerTracker}, quella tra prima scelta e piante Indipendenza produce {understandingCrops^firstAnswerTracker}}
                        ~ randomCounter ++
                        ->random
                }
                }
                    
            - else:
             {debugCultivable: Il valore di firstQuest è {firstQuest} e per questo torno a random.}
                    ~ randomCounter ++
                    -> random
        }
    
        
    - dice == 2 && shiftCrops ^ backupCultivable != () && selfdeterminationCrops ^ backupCultivable != ():
        {
            -secondQuest == false:
            {debugCultivable: Il valore di secondQuest è {secondQuest}. Piante Ciclicità contiene: {shiftCrops}. Piante Novità contiene: {selfdeterminationCrops} e per questo vado alla domanda.}
            {
                - cropsType == ():
                {debugCultivable: Questa è la prima domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi vado direttamente alla domanda.}
                   -> second_question
                
                - else:
                {debugCultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.}
                {
                    - LIST_RANDOM(shiftCrops^firstAnswerTracker) != () && LIST_RANDOM(selfdeterminationCrops^firstAnswerTracker) != () && cropsType hasnt shift && cropsType hasnt selfdetermination:
                    
                    {debugCultivable: L'intersezione tra prima scelta e piante shift produce {shiftCrops^firstAnswerTracker}, quella tra prima scelta e piante understanding produce {selfdeterminationCrops^firstAnswerTracker}.}
                    {debugCultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> second_question
                        
                    - else:
                    {debugCultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                    {debugCultivable: L'intersezione tra prima scelta e piante shift produce {shiftCrops^firstAnswerTracker}, quella tra prima scelta e piante understanding produce {selfdeterminationCrops^firstAnswerTracker}.}
                            ~ randomCounter ++
                        ->random
                }
            
            }
            - else:
            {debugCultivable: Il valore di secondQuest è {secondQuest} e per questo torno a random.}
                        ~ randomCounter ++
                    -> random
        }


        
    - dice == 3 && wonderCrops ^ backupCultivable != () && imaginationCrops ^ backupCultivable != ():
        {
            - thirdQuest == false:
                {debugCultivable: Il valore di thirdQuest è {thirdQuest}. Piante Ricordo contiene: {wonderCrops}. Piante Cancellazione contiene: {imaginationCrops} e per questo vado alla domanda.}    
                    {
                - cropsType == ():
                {debugCultivable: Questa è la prima domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi vado direttamente alla domanda.}
                   -> third_question
                
                - else:
                {debugCultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(wonderCrops^firstAnswerTracker) != () && LIST_RANDOM(imaginationCrops^firstAnswerTracker) != () && cropsType hasnt wonder && cropsType hasnt imagination:
                    
                    {debugCultivable: L'intersezione tra prima scelta e piante wonder produce {wonderCrops^firstAnswerTracker}, quella tra prima scelta e piante selfdetermination produce {imaginationCrops^firstAnswerTracker}.}
                    {debugCultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                    
                        -> third_question
                        
                    - else:
                    {debugCultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                    {debugCultivable: L'intersezione tra prima scelta e piante selfdetermination produce {wonderCrops^firstAnswerTracker}, quella tra prima scelta e piante understanding produce {imaginationCrops^firstAnswerTracker}.}
                            ~ randomCounter ++
                        ->random
                }
            
            }
                
            - thirdQuest == true:
                {debugCultivable: Il valore di thirdQuest è {thirdQuest} e per questo torno a random.}
                        ~ randomCounter ++
                    -> random
        }


        - dice == 4 && relationshipCrops ^ backupCultivable != () && shiftCrops ^ backupCultivable != (): 
        {
            - fourthQuest == false:
            {debugCultivable: Il valore di fourthQuest è {fourthQuest}. Piante Collaborazione contiene: {relationshipCrops}. Piante Cambiamento contiene: {shiftCrops}.}
            {
                - cropsType == ():
                    -> fourth_question
                
                - else:
                {debugCultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.}                 
                {
                    - LIST_RANDOM(relationshipCrops^firstAnswerTracker) != () && LIST_RANDOM(shiftCrops^firstAnswerTracker) != () && cropsType hasnt relationship && cropsType hasnt shift:
                    
                    {debugCultivable: L'intersezione tra prima scelta e relationshipCrops produce {relationshipCrops^firstAnswerTracker}, quella tra prima scelta e piante shift produce {shiftCrops^firstAnswerTracker}}
                    {debugCultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                    
                    
                        -> fourth_question
                    - else:
                    
                    {debugCultivable: L'intersezione tra prima scelta e relationshipCrops produce {relationshipCrops^firstAnswerTracker}, quella tra prima scelta e piante shift produce {shiftCrops^firstAnswerTracker}}
                    {debugCultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                    
                        ~ randomCounter ++
                        ->random
                }
            }
                    
            - else:
            {debugCultivable: Il valore di fourthQuest è {fourthQuest} e per questo torno a random.}
                    ~ randomCounter ++
                    -> random
        }
        
        - dice == 5 && relationshipCrops ^ backupCultivable!= () && wonderCrops ^ backupCultivable != (): 
        {
            - fifthQuest == false:
            {debugCultivable: Il valore di fifthQuest è {fifthQuest}. Piante Collaborazione contiene: {relationshipCrops}. Piante Wonder contiene: {wonderCrops}.}
            {
                - cropsType == ():
                    -> fifth_question
                
                - else:
                {debugCultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(relationshipCrops^firstAnswerTracker) != () && LIST_RANDOM(wonderCrops^firstAnswerTracker) != () && cropsType hasnt relationship && cropsType hasnt wonder:
                    
                    {debugCultivable: L'intersezione tra prima scelta e piantecollaborazione produce {relationshipCrops^firstAnswerTracker}, quella tra prima scelta e piante wonderC produce {wonderCrops^firstAnswerTracker}}
                    {debugCultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}                    
                        -> fifth_question
                    - else:
                    {debugCultivable: L'intersezione tra prima scelta e piantecollaborazione produce {relationshipCrops^firstAnswerTracker}, quella tra prima scelta e piante wonderC produce {wonderCrops^firstAnswerTracker}}
                    {debugCultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                    
                        ~ randomCounter ++
                        ->random
                }
            }
                    
            - else:
            {debugCultivable: Il valore di fifthQuest è {fifthQuest} e per questo torno a random.}
                    ~ randomCounter ++
                    -> random
        }        
        
        - dice == 6 && relationshipCrops ^ backupCultivable != () && imaginationCrops ^ backupCultivable != (): 
        {
            - sixthQuest == false:
            {debugCultivable: Il valore di sixthQuest è {sixthQuest}. Piante Collaborazione contiene: {relationshipCrops}. Piante imagination contiene: {imaginationCrops}.}            
            {
                - cropsType == ():
                    -> sixth_question
                
                - else:
                {debugCultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(relationshipCrops^firstAnswerTracker) != () && LIST_RANDOM(imaginationCrops^firstAnswerTracker) != () && cropsType hasnt relationship && cropsType hasnt imagination:
                    
                    {debugCultivable: L'intersezione tra prima scelta e piantecollaborazione produce {relationshipCrops^firstAnswerTracker}, quella tra prima scelta e piante selfdetermination produce {selfdeterminationCrops^firstAnswerTracker}}
                    {debugCultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                    
                        -> sixth_question
                    - else:
                    {debugCultivable: L'intersezione tra prima scelta e piantecollaborazione produce {relationshipCrops^firstAnswerTracker}, quella tra prima scelta e piante selfdetermination produce {selfdeterminationCrops^firstAnswerTracker}}
                    {debugCultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ randomCounter ++
                        ->random
                }
            }
                    
            - else:
            {debugCultivable: Il valore di sixthQuest è {sixthQuest} e per questo torno a random.}
                    ~ randomCounter ++
                    -> random
        }          
        
        - dice == 7 && shiftCrops ^ backupCultivable != () && understandingCrops ^ backupCultivable != ():
            {debugCultivable: Il valore di seventhQuest è {seventhQuest}. Piante shift contiene: {shiftCrops}. Piante understanding contiene: {understandingCrops}.}        
        {
            - seventhQuest == false:
            {
                - cropsType == ():
                    -> seventh_question
                
                - else:
                {debugCultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(shiftCrops^firstAnswerTracker) != () && LIST_RANDOM(understandingCrops^firstAnswerTracker) != () && cropsType hasnt shift && cropsType hasnt understanding:
                    
                    {debugCultivable: L'intersezione tra prima scelta e shiftCrops produce {shiftCrops^firstAnswerTracker}, quella tra prima scelta e piante Indipendenza produce {understandingCrops^firstAnswerTracker}}
                    {debugCultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                    
                        -> seventh_question
                    - else:
                    {debugCultivable: L'intersezione tra prima scelta e shiftCrops produce {shiftCrops^firstAnswerTracker}, quella tra prima scelta e piante Indipendenza produce {understandingCrops^firstAnswerTracker}}
                    {debugCultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ randomCounter ++
                        ->random
                }
            }
                    
            - else:
            {debugCultivable: Il valore di seventhQuest è {seventhQuest} e per questo torno a random.}
                    ~ randomCounter ++
                    -> random
        }         
        
        - dice == 8 && shiftCrops ^ backupCultivable != () && wonderCrops ^ backupCultivable != ():
            {debugCultivable: Il valore di eighthQuest è {eighthQuest}. Piante shift contiene: {shiftCrops}. Piante Wonder contiene: {wonderCrops}.}        
        {
            - eighthQuest == false:
  
            {
                - cropsType == ():
                    -> eighth_question
                
                - else:
                {debugCultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.}
                   {debugCultivable: L'intersezione tra prima scelta e piante wonder produce {shiftCrops^firstAnswerTracker}, quella tra prima scelta e piante selfdetermination produce {wonderCrops^firstAnswerTracker}.}                
                {
                    - LIST_RANDOM(shiftCrops^firstAnswerTracker) != () && LIST_RANDOM(wonderCrops^firstAnswerTracker) != () && cropsType hasnt shift && cropsType hasnt wonder:
                    
                    {debugCultivable: L'intersezione tra prima scelta e shiftCrops produce {shiftCrops^firstAnswerTracker}, quella tra prima scelta e wonderCrops produce {wonderCrops^firstAnswerTracker}}
                    {debugCultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                   
                        -> eighth_question
                    - else:
                    {debugCultivable: L'intersezione tra prima scelta e shiftCrops produce {shiftCrops^firstAnswerTracker}, quella tra prima scelta e wonderCrops produce {wonderCrops^firstAnswerTracker}}
                    {debugCultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ randomCounter ++
                        ->random
                }
            }
                    
            - else:
            {debugCultivable: Il valore di eightQuest è {eighthQuest} e per questo torno a random.}
                    ~ randomCounter ++
                    -> random
        }        

        - dice == 9 && shiftCrops ^ backupCultivable != () && imaginationCrops ^ backupCultivable != ():
            {debugCultivable: Il valore di ninthQuest è {ninthQuest}. Piante shift contiene: {shiftCrops}. Piante imagination contiene: {imaginationCrops}.}        
        {
            - ninthQuest == false:
            {
                - cropsType == ():
                    -> ninth_question
                
                - else:
                {debugCultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(shiftCrops^firstAnswerTracker) != () && LIST_RANDOM(imaginationCrops^firstAnswerTracker) != () && cropsType hasnt shift && cropsType hasnt imagination:
                    {debugCultivable: L'intersezione tra prima scelta e shiftCrops produce {shiftCrops^firstAnswerTracker}, quella tra prima scelta e imaginationCrops produce {imaginationCrops^firstAnswerTracker}}
                    {debugCultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> ninth_question
                    - else:
                    {debugCultivable: L'intersezione tra prima scelta e shiftCrops produce {shiftCrops^firstAnswerTracker}, quella tra prima scelta e imaginationCrops produce {imaginationCrops^firstAnswerTracker}}
                    {debugCultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ randomCounter ++
                        ->random
                }
            }
            - else:
            {debugCultivable: Il valore di nineQuest è {ninthQuest} e per questo torno a random.}
                ~ randomCounter ++
                -> random        
        }
        
        - dice == 10 && understandingCrops ^ backupCultivable != () && selfdeterminationCrops ^ backupCultivable != ():
        {debugCultivable: Il valore di tenthQuest è {tenthQuest}. Piante understanding contiene: {understandingCrops}. Piante selfdetermination contiene: {selfdeterminationCrops}.}          
        {
            - tenthQuest == false:
            {
                - cropsType == ():
                    -> tenth_question
                
                - else:
                {debugCultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(understandingCrops^firstAnswerTracker) != () && LIST_RANDOM(selfdeterminationCrops^firstAnswerTracker) != () && cropsType hasnt understanding && cropsType hasnt selfdetermination:
                    {debugCultivable: L'intersezione tra prima scelta e understandingCrops produce {understandingCrops^firstAnswerTracker}, quella tra prima scelta e selfdeterminationCrops produce {selfdeterminationCrops^firstAnswerTracker}}
                    {debugCultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> tenth_question
                    - else:
                    {debugCultivable: L'intersezione tra prima scelta e understandingCrops produce {understandingCrops^firstAnswerTracker}, quella tra prima scelta e selfdeterminationCrops produce {selfdeterminationCrops^firstAnswerTracker}}
                    {debugCultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ randomCounter ++
                        ->random
                }
            }
 
            
            - else:
            {debugCultivable: Il valore di tenthQuest è {tenthQuest} e per questo torno a random.}
                    ~ randomCounter ++
                    -> random
        }         

        - dice == 11 && understandingCrops ^ backupCultivable != () && wonderCrops ^ backupCultivable ^ backupCultivable != ():
        {debugCultivable: Il valore di eleventhQuest è {eleventhQuest}. Piante understanding contiene: {understandingCrops}. Piante wonder contiene: {wonderCrops}.}         
        {
            - eleventhQuest == false:
            {
                - cropsType == ():
                    -> eleventh_question
                
                - else:
                {debugCultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(understandingCrops^firstAnswerTracker) != () && LIST_RANDOM(wonderCrops^firstAnswerTracker) != () && cropsType hasnt understanding && cropsType hasnt wonder:
                    
                    {debugCultivable: L'intersezione tra prima scelta e understandingCrops produce {understandingCrops^firstAnswerTracker}, quella tra prima scelta e wonderCrops produce {wonderCrops^firstAnswerTracker}}
                    {debugCultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> eleventh_question
                    
                    - else:
                    {debugCultivable: L'intersezione tra prima scelta e understandingCrops produce {understandingCrops^firstAnswerTracker}, quella tra prima scelta e wonderCrops produce {wonderCrops^firstAnswerTracker}}
                    {debugCultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ randomCounter ++
                        ->random
                }
            }
            - else:
            {debugCultivable: Il valore di eleventhQuest è {eleventhQuest} e per questo torno a random.}
                ~ randomCounter ++
                -> random
        }
        
        - dice == 12 && understandingCrops ^ backupCultivable != () && imaginationCrops ^ backupCultivable != ():
        {debugCultivable: Il valore di twelfthQuest è {twelfthQuest}. Piante understanding contiene: {understandingCrops}. Piante imagination contiene: {imaginationCrops}.}          
        {
            - twelfthQuest == false:
            {
                - cropsType == ():
                    -> twelfth_question
                
                - else:
                {
                    - LIST_RANDOM(understandingCrops^firstAnswerTracker) != () && LIST_RANDOM(imaginationCrops^firstAnswerTracker) != () && cropsType hasnt understanding && cropsType hasnt imagination:
                    {debugCultivable: L'intersezione tra prima scelta e understandingCrops produce {understandingCrops^firstAnswerTracker}, quella tra prima scelta e imaginationCrops produce {imaginationCrops^firstAnswerTracker}}
                    {debugCultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> twelfth_question
                    - else:
                    {debugCultivable: L'intersezione tra prima scelta e understandingCrops produce {understandingCrops^firstAnswerTracker}, quella tra prima scelta e imaginationCrops produce {imaginationCrops^firstAnswerTracker}}
                    {debugCultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ randomCounter ++
                        ->random
                }
            }
                    - else:
                    {debugCultivable: Il valore di twelfthQuest è {twelfthQuest} e per questo torno a random.}
                    ~ randomCounter ++
                    -> random
        } 
        
        - dice == 13 && selfdeterminationCrops ^ backupCultivable != () && wonderCrops ^ backupCultivable != ():
        {debugCultivable: Il valore di thirteenthQuest è {thirteenthQuest}. Piante selfdetermination contiene: {selfdeterminationCrops}. Piante wonder contiene: {wonderCrops}.}          
        {
            - thirteenthQuest == false:
            {
                - cropsType == ():
                    -> thirteenth_question
                
                - else:
                {debugCultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(selfdeterminationCrops^firstAnswerTracker) != () && LIST_RANDOM(wonderCrops^firstAnswerTracker) != () && cropsType hasnt selfdetermination && cropsType hasnt wonder:
                    {debugCultivable: L'intersezione tra prima scelta e selfdeterminationCrops produce {selfdeterminationCrops^firstAnswerTracker}, quella tra prima scelta e wonderCrops produce {wonderCrops^firstAnswerTracker}}
                    {debugCultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> thirteenth_question
                    - else:
                    {debugCultivable: L'intersezione tra prima scelta e selfdeterminationCrops produce {selfdeterminationCrops^firstAnswerTracker}, quella tra prima scelta e wonderCrops produce {wonderCrops^firstAnswerTracker}}
                    {debugCultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ randomCounter ++
                        ->random
                }
            }
                    - else:
                    {debugCultivable: Il valore di thirteenthQuest è {thirteenthQuest} e per questo torno a random.}
                    ~ randomCounter ++
                    -> random
        } 

        - dice == 14 && selfdeterminationCrops ^ backupCultivable != () && imaginationCrops ^ backupCultivable != ():
        {debugCultivable: Il valore di fourteenthQuest è {fourteenthQuest}. Piante selfdetermination contiene: {selfdeterminationCrops}. Piante imagination contiene: {imaginationCrops}.}
        
        {
            - fourteenthQuest == false:
            {
                - cropsType == ():
                    -> fourteenth_question
                
                - else:
                {debugCultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(selfdeterminationCrops^firstAnswerTracker) != () && LIST_RANDOM(imaginationCrops^firstAnswerTracker) != () && cropsType hasnt selfdetermination && cropsType hasnt imagination:
                    {debugCultivable: L'intersezione tra prima scelta e selfdeterminationCrops produce {selfdeterminationCrops^firstAnswerTracker}, quella tra prima scelta e imaginationCrops produce {imaginationCrops^firstAnswerTracker}}
                    {debugCultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> fourteenth_question
                    - else:
                    {debugCultivable: L'intersezione tra prima scelta e selfdeterminationCrops produce {selfdeterminationCrops^firstAnswerTracker}, quella tra prima scelta e imaginationCrops produce {imaginationCrops^firstAnswerTracker}}
                    {debugCultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ randomCounter ++
                        ->random
                }
            }
            - else:
            {debugCultivable: Il valore di fourteenthQuest è {fourteenthQuest} e per questo torno a random.}
             ~ randomCounter ++
                -> random
            }    
        
        - dice == 15 && selfdeterminationCrops ^ backupCultivable != () && relationshipCrops ^ backupCultivable != ():
        {debugCultivable: Il valore di fifteenQuest è {fifteenQuest}. Piante selfdetermination contiene: {selfdeterminationCrops}. Piante relationship contiene: {relationshipCrops}.}
        
        {
            - fifteenQuest == false:
            {
                - cropsType == ():
                    -> fifteen_question
                
                - else:
                {debugCultivable: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(selfdeterminationCrops^firstAnswerTracker) != () && LIST_RANDOM(relationshipCrops^firstAnswerTracker) != () && cropsType hasnt selfdetermination && cropsType hasnt relationship:
                    {debugCultivable: L'intersezione tra prima scelta e selfdeterminationCrops produce {selfdeterminationCrops^firstAnswerTracker}, quella tra prima scelta e relationshipCrops produce {relationshipCrops^firstAnswerTracker}}
                    {debugCultivable: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> fifteen_question
                    - else:
                    {debugCultivable: L'intersezione tra prima scelta e selfdeterminationCrops produce {selfdeterminationCrops^firstAnswerTracker}, quella tra prima scelta e relationshipCrops produce {relationshipCrops^firstAnswerTracker}}
                    {debugCultivable: <b>Non</b> ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                        ~ randomCounter ++
                        ->random
                }
            }
            - else:
            {debugCultivable: Il valore di fifteenQuest è {fifteenQuest} e per questo torno a random.}
             ~ randomCounter ++
                -> random
                
        }
        
    - else:
        {debugCultivable: Il dado ha valore {dice} e non ci sono condizioni valide per proporre una delle domande e per questo ritiro.}
            ~ randomCounter ++
                    -> random
}


/* ---------------------------------

QUESTIONS

 ----------------------------------*/



    = first_question
     ~ firstQuest = true
         {debugCultivable: Entro in first_question. {firstQuest: firstQuest ora = true|firstQuest = false}}
 
        Le foglie...#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~Si sfiorano|Si mescolano|Si proteggono le une con le altre}.]
                    ~ cropsType += relationship
                    ~ firstAnswerTracker = relationshipCrops
                    {debugCultivable: cropsType contiene ora {cropsType}.}
            + [{~Si accumulano sulla soglia|Si dispongono in ordine attorno ai vasi|Resistono al vento}.]
                    ~ cropsType += imagination
                    ~ firstAnswerTracker = understandingCrops
                    {debugCultivable: cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test
    
    = second_question
    ~ secondQuest = true
        {debugCultivable: Entro in second_question. {secondQuest: SecondQuest ora = true|SecondQuest = false}}

        L'aria... #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~Insegue sé stessa|Crea mulinelli di foglie|Ruota e ruzzola portando odori inaspettati}.]
                    ~ cropsType += shift
                    ~ firstAnswerTracker = shiftCrops
                    {debugCultivable: cropsType contiene ora {cropsType}.}                    
            + [{~È scoppiettante|Freme, carica di elettricità|Corre in avanti, sempre}.]
                    ~ cropsType += understanding
                    ~ firstAnswerTracker = selfdeterminationCrops
                    {debugCultivable: cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test
    

    = third_question
     ~ thirdQuest = true
    {debugCultivable:Entro in third_question. {thirdQuest: thirdQuest ora = true|thirdQuest = false}.}
    
        L'acqua...#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~È mossa solo sulla superficie|È torbida|È piena di foglie e petali}.]
                    ~ cropsType += wonder
                    ~ firstAnswerTracker = wonderCrops
                    {debugCultivable: cropsType contiene ora {cropsType}.}                    
            + [{~Scava, portando con sé ogni cosa|Schiaccia foglie e sassi|Rimbomba tra i vasi}.]
                    ~ cropsType += selfdetermination
                    ~ firstAnswerTracker = imaginationCrops
                    {debugCultivable: cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test

    = fourth_question
     ~ fourthQuest = true
    {debugCultivable: Entro in fourthQuest. {fourthQuest: fourthQuest ora = true|fourthQuest = false}.}
    
        Le api...#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~Proteggono la regina|Si scambiano direzioni|Si puliscono a vicenda}.]
                    ~ cropsType += relationship
                    ~ firstAnswerTracker = relationshipCrops 
                    {debugCultivable: cropsType contiene ora {cropsType}.}                    
            + [{~Danzano in sintonia|Cercano il sole|Spargono polline tra i fiori}.]
                    ~ cropsType += shift
                    ~ firstAnswerTracker = shiftCrops
                    {debugCultivable: cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test
    
    = fifth_question
     ~ fifthQuest = true
    {debugCultivable: Entro in fifthQuest. {fifthQuest: fifthQuest ora = true|fifthQuest = false}.}
    
        Le formiche...#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~Lasciano tracce per le compagne|Accumulano cibo per l'inverno|Creano ponti di foglie}.]
                    ~ cropsType += relationship
                    ~ firstAnswerTracker = relationshipCrops 
                    {debugCultivable: cropsType contiene ora {cropsType}.}                    
            + [{~Pensano alle amiche perse|Ricordano ciò che non sono più|Si aggrappano ai sogni}.]
                    ~ cropsType += wonder
                    ~ firstAnswerTracker = wonderCrops
                    {debugCultivable: cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test
                    
    = sixth_question
     ~ sixthQuest = true
    {debugCultivable: Entro in sixfthQuest. {sixthQuest: sixfthQuest ora = true|sixfthQuest = false}.}
    
        I sassi... #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~Creano scale verso il cielo|Si fanno mura, protezione|Si scaldano fregandosi lentamente l'un l'altro}.]
                    ~ cropsType += relationship
                    ~ firstAnswerTracker = relationshipCrops 
                    {debugCultivable: cropsType contiene ora {cropsType}.}                    
            + [{~Lasciano pezzi di sè sul terreno|Si lanciano contro porte serrate|Schiacciano noci per gli scoiattoli}.]
                    ~ cropsType += selfdetermination
                    ~ firstAnswerTracker = imaginationCrops
                    {debugCultivable: cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test
    
    = seventh_question
     ~ seventhQuest = true
    {debugCultivable: Entro in seventhQuest. {seventhQuest: seventhQuest ora = true|seventhQuest = false}.}
    
        La terra...#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~Avanza massaggiando le radici nodose delle quercie|Scivola, trascinando con sé i rospi|Asciutta, rotola a valle}.]
                    ~ cropsType += shift
                    ~ firstAnswerTracker = shiftCrops 
                    {debugCultivable: cropsType contiene ora {cropsType}.}                    
            + [{~Tentenna sulla cima della collina|Si accumula inquieta lungo la strada|Si solleva dall'acqua, facendosi diga}.]
                    ~ cropsType += imagination
                    ~ firstAnswerTracker = understandingCrops
                    {debugCultivable: cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test
                    
    = eighth_question
     ~ eighthQuest = true
    {debugCultivable: Entro in eighthQuest. {eighthQuest: eighthQuest ora = true|eighthQuest = false}.}
    
        I cardellini...#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~Svolazzano in stormi sopra alla foresta|Saltellano tra i rami del salice}.]
                    ~ cropsType += shift 
                    ~ firstAnswerTracker = shiftCrops 
                    {debugCultivable: cropsType contiene ora {cropsType}.}                    
            + [{~Cantano i nomi dei compagni persi|Ricostruiscono i nidi di chi non c'è più|Controllano le vecchie scorte dell'inverno}.]
                    ~ cropsType += wonder
                    ~ firstAnswerTracker = wonderCrops
                    {debugCultivable: cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test                   

    = ninth_question
     ~ ninthQuest = true
    {debugCultivable: Entro in ninthQuest. {ninthQuest: ninthQuest ora = true|ninthQuest = false}.}
    
        Il cervo volante... #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~Insegue l'odore di frutta matura|Scava nel legno lunghe gallerie|Trascina pensieri dimenticati}.]
                    ~ cropsType += shift
                    ~ firstAnswerTracker = shiftCrops
                    {debugCultivable: cropsType contiene ora {cropsType}.}
                    
            + [{~Lotta temibile e inquieto|Spacca la crisalide, asciugandosi al vento}.]
                    ~ cropsType += selfdetermination
                    ~ firstAnswerTracker = imaginationCrops
                    {debugCultivable: cropsType contiene ora {cropsType}.}
            -
                ~ counter ++
                    -> test                   
   
    = tenth_question
     ~ tenthQuest = true
    {debugCultivable: Entro in tenthQuest. {tenthQuest: tenthQuest ora = true|tenthQuest = false}.}
    
        Il sole... #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~Mostra il cammino|Offre coraggio alle lucertole|Solleva goccie dalla palude silente}. ]
                    ~ cropsType += imagination  
                    ~ firstAnswerTracker = understandingCrops 
                    {debugCultivable: cropsType contiene ora {cropsType}.}                    
            + [{~Accresce gli steli delle lenticchie selvatiche|Scalda le uova del fagiano|Carezza le foglie verdi di primavera}.]
                    ~ cropsType += understanding
                    ~ firstAnswerTracker = selfdeterminationCrops
                    {debugCultivable: cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test
    
    = eleventh_question
     ~ eleventhQuest = true
    {debugCultivable: Entro in eleventhQuest. {eleventhQuest: eleventhQuest ora = true|eleventhQuest = false}.}
    
        La notte...#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~Nasconde i sotterfugi delle falene|Raccoglie i baci delle amanti|Accompagna i ghiri nello spazio del sogno}.]
                    ~ cropsType += imagination  
                    ~ firstAnswerTracker = understandingCrops 
                    {debugCultivable: cropsType contiene ora {cropsType}.}                    
            + [{~Nasconde nomi amati tra le nuvole|Riempie di ricordi i sogni della lepre|Asciuga le lacrime tristi del riccio}.]
                    ~ cropsType += wonder
                    ~ firstAnswerTracker = wonderCrops
                {debugCultivable: cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test                     
 
     = twelfth_question
     ~ twelfthQuest = true
    {debugCultivable: Entro in twelfthQuest. {twelfthQuest: twelfthQuest ora = true|twelfthQuest = false}.}
    
        La neve...#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~Nasconde allo stambecco il burrone|Spinge ai confini del parco|Piega le punte degli abeti più alti}.]
                    ~ cropsType += imagination  
                    ~ firstAnswerTracker = understandingCrops 
                    {debugCultivable: cropsType contiene ora {cropsType}.}                    
            + [{~Schiaccia i nidi delle tortore|Tradisce il passo della volpe}.]
                    ~ cropsType += selfdetermination
                    ~ firstAnswerTracker = imaginationCrops
                    {debugCultivable: cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test 
    
    = thirteenth_question
     ~ thirteenthQuest = true
    {debugCultivable: Entro in thirteenthQuest. {thirteenthQuest: thirteenthQuest ora = true|thirteenthQuest = false}.}
    
        {pronouns has him: Il riscrittore...|{pronouns has her:La riscrittora...|Lə riscrittorə...}}#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
        
            + [{~Assapora sulla lingua il sapore del cambiamento|Sente sulle mani un accesso di futuro|Freme nel lanciarsi verso ciò che arriverà}.]
                    ~ cropsType += understanding
                    ~ firstAnswerTracker = selfdeterminationCrops
                    {debugCultivable: cropsType contiene ora {cropsType}.}                    
            + [{~Indugia su ciò che è stato|Trova conforto nel ricordo di ciò che era|Si chiede dove sia casa}.]
                    ~ cropsType += wonder
                    ~ firstAnswerTracker = wonderCrops
                    {debugCultivable: cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test                    

    = fourteenth_question
     ~ fourteenthQuest = true
    {debugCultivable: Entro in fourteenthQuest. {fourteenthQuest: fourteenthQuest ora = true|fourteenthQuest = false}.}
    
        La serra...#speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~Brama la crescita di una nuova pianta|Gioisce per l'erbetta che cresce tra le travi|Spalanca le sue porte a nuove sementi}.]
                    ~ cropsType += understanding   
                    ~ firstAnswerTracker = selfdeterminationCrops 
                    {debugCultivable: cropsType contiene ora {cropsType}.}                    
            + [{~Scaccia cimici e cavallette|Acceca il corvo ingordo}.]
                    ~ cropsType += selfdetermination
                    ~ firstAnswerTracker = imaginationCrops
                    {debugCultivable: cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test
    
    = fifteen_question
    ~ fifteenQuest = true
    {debugCultivable: Entro in fifteenQuest. {fifteenQuest: fifteenQuest ora = true|fifteenQuest = false}.}
    
        La luna... #speaker:{witch_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {witch_state()}
            + [{~Accenna timida un nuovo ciclo|Invita la Bella di Notte a sbocciare|Suggerisci sogni di cambiamento}.]
                    ~ cropsType += understanding   
                    ~ firstAnswerTracker = selfdeterminationCrops 
                    {debugCultivable: cropsType contiene ora {cropsType}.}                    
            + [{~Solleva le maree per divertire i delfini|Indica la strada alle nuvole|Danza giocosa con la Terra}.]
                    ~ cropsType += relationship
                    ~ firstAnswerTracker = relationshipCrops
                    {debugCultivable: cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test
 
 ->->
 
 === results
{debugCultivable: Entro in results.}
{debugCultivable: Il valore di cropsType è {cropsType}.}
 
    {
    
    - cropsType == (relationship, shift):{
        - LIST_RANDOM(relationshipCrops ^ shiftCrops) == ():
            {debugCultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: Il fungo proposto è {chosenCultivable}.}   
                -> list_to_crops
            
        - else: 
        {debugCultivable: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
                ~ chosenCultivable = LIST_RANDOM(relationshipCrops ^ shiftCrops)
                {
                    - backupCultivable has chosenCultivable:
                    {debugCultivable: backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                        -> list_to_crops
                    //Questo è un check extra: non dovrebbe mai accadere, ma non si sa mai.    
                    - backupCultivable hasnt chosenCultivable:
                    {debugCultivable: backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                        -> results
                }
    }
        
        
    - cropsType == (relationship, understanding): {
        - LIST_RANDOM(relationshipCrops ^ selfdeterminationCrops) == ():
            {debugCultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.} 
                ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable:  Il fungo proposto è {chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debugCultivable: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
                ~ chosenCultivable = LIST_RANDOM(relationshipCrops ^ selfdeterminationCrops)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable:  backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
        
    - cropsType == (relationship, selfdetermination):{
        - LIST_RANDOM(relationshipCrops ^ imaginationCrops) == ():
        {debugCultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: Il fungo proposto è {chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debugCultivable: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(relationshipCrops ^ imaginationCrops)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable:  backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable:  backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
        
    - cropsType == (relationship, wonder):{
        - LIST_RANDOM(relationshipCrops ^ wonderCrops) == ():
        {debugCultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: Il fungo proposto è {chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debugCultivable: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(relationshipCrops ^ wonderCrops)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable:backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
        
        
    - cropsType == (imagination, shift):{
        - LIST_RANDOM(understandingCrops ^ shiftCrops) == ():
       {debugCultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable:  Il fungo proposto è {chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debugCultivable:  Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(understandingCrops ^ shiftCrops)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable:  backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
                
    - cropsType == (imagination, understanding):{
        - LIST_RANDOM(understandingCrops ^ selfdeterminationCrops) == ():
        {debugCultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable:  Il fungo proposto è {chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debugCultivable:  Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(understandingCrops ^ selfdeterminationCrops)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable:  backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable:  backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    - cropsType == (imagination, selfdetermination): {
        - LIST_RANDOM(understandingCrops ^ imaginationCrops) == ():
        {debugCultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: Il fungo proposto è {chosenCultivable}.}   
            -> list_to_crops
        - else:
        {debugCultivable: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(understandingCrops ^ imaginationCrops)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
            }
        
    - cropsType == (imagination, wonder): {
        - LIST_RANDOM(understandingCrops ^ wonderCrops) == ():
        {debugCultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: Il fungo proposto è {chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debugCultivable: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(understandingCrops ^ wonderCrops)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    - cropsType == (shift, selfdetermination):{
        - LIST_RANDOM(shiftCrops ^ imaginationCrops) == ():
        {debugCultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: Il fungo proposto è {chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debugCultivable: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(shiftCrops ^ imaginationCrops)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    - cropsType == (shift, wonder):{
        - LIST_RANDOM(shiftCrops ^ wonderCrops) == ():
        {debugCultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
         {debugCultivable: Il fungo proposto è {chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debugCultivable:Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(shiftCrops ^ wonderCrops)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    - cropsType == (understanding, selfdetermination):{
        - LIST_RANDOM(imaginationCrops ^ selfdeterminationCrops) == ():
        {debugCultivable:Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: Il fungo proposto è {chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debugCultivable: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(selfdeterminationCrops ^ imaginationCrops)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    - cropsType == (understanding, wonder): {
        - LIST_RANDOM(wonderCrops ^ selfdeterminationCrops) == ():
        {debugCultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: il fungo proposto è {chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debugCultivable: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(selfdeterminationCrops ^ wonderCrops)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
    
    - cropsType == (relationship, imagination): {
        - LIST_RANDOM(relationshipCrops ^ imaginationCrops) == ():
        {debugCultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: il fungo proposto è {chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debugCultivable: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(relationshipCrops ^ imaginationCrops)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
        
      - cropsType == (shift, understanding): {
        - LIST_RANDOM(shiftCrops ^ understandingCrops) == ():
        {debugCultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: il fungo proposto è {chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debugCultivable: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(shiftCrops ^ understandingCrops)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
    
    
    - cropsType == (selfdetermination, wonder): {
        - LIST_RANDOM(selfdeterminationCrops ^ wonderCrops) == ():
        {debugCultivable: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: il fungo proposto è {chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debugCultivable: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(selfdeterminationCrops ^ wonderCrops)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
    
    - else:
    {debugCultivable: Passo da else nella lista cropsType perché non c'è un fungo adatto.}
         ~ chosenCultivable = LIST_RANDOM(backupCultivable)
         ~ backupCultivable -= chosenCultivable
    {debugCultivable: Il fungo proposto è {chosenCultivable}.}      
        -> list_to_crops
    
    }
    
 
 
-> list_to_crops
 
 


=== list_to_crops ===
    ~ cropsType = ()
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
    ~ counter = 0
    ~ growing = 1
    ~ firstAnswerTracker = ()
    ~ randomCounter = 0

 
{debugCultivable: Entro in list_to_crops. Il valore di counter è {counter}, il valore di growing è {growing}. firstQuest è {firstQuest}, secondQuest è {secondQuest}, thirdQuest è {thirdQuest}.}
{debugCultivable: Gli elementi ancora coltivabili sono: {backupCultivable}.}
{debugCultivable: Svuoto lista tipo Coltivazioni. Il contenuto di tipo Coltivazioni ora è {cropsType}.}
{debugCultivable: Svuoto lista firstAnswerTracker. Il contenuto di tipo firstAnswerTracker ora è {firstAnswerTracker==(): vuota|piena}.}
    -> chosen_cultivable

= chosen_cultivable
{chosenCultivable:
    - LicheneDegliAbissi:
        -> lichene_degli_abissi.TW
    - EderaDelleAmanti:
        -> edera_delle_amanti.TW
    - CantoDelleCompagne:
        -> canto_delle_compagne.TW
    - LaSpazzata:
        -> la_spazzata.TW
    - BaccaDellaAddolorata:
        -> bacca_della_addolorata.TW
    - NonTiScordarDiTe:
        -> non_ti_scordar_di_te.TW
    - BrinaDellImpossibile:
        -> brina_dell_impossibile.TW
    - CardoAspinato:
        -> cardo_aspinato.TW
    - BastoneDellOzioso:
        -> bastone_dell_ozioso.TW
    - BarbaDellInciampo:
        -> barba_dell_inciampo.TW
    - Olobino:
        -> olobino.TW
    - FalsaPalude:    
        -> falsa_palude.TW
}       



-> main


=== remove_proposed_cultivable
//Questa azione mi permette di rimuovere il fungo selezionato da ogni lista che lo può contenere. E dato che col tempo le liste possono aumentare, devo solo mettere un remove qui e non OVUNQUE XD
{debugCultivable: Passo da remove_proposed_cultivable. Prima della rimozione backupColtivabile contiene {backupCultivable}, e il coltivabile selezionato è {chosenCultivable}.}
{debugCultivable: relationshipCrops contiene {relationshipCrops}, shiftCrops contiene {shiftCrops}, understandingCrops contiene {understandingCrops}, selfdeterminationCrops contiene {selfdeterminationCrops}, wonderCrops contiene {wonderCrops} e imaginationCrops contiene {imaginationCrops}.}
{
    - backupCultivable has chosenCultivable:
        ~ backupCultivable -= chosenCultivable
}
{
    - relationshipCrops has chosenCultivable:
        ~ relationshipCrops -= chosenCultivable
 }
 {
    - shiftCrops has chosenCultivable:
        ~ shiftCrops -= chosenCultivable        
  }
  {
    - understandingCrops has chosenCultivable:
        ~ understandingCrops -= chosenCultivable   
  }
  {
    - selfdeterminationCrops has chosenCultivable:
        ~ selfdeterminationCrops -= chosenCultivable
 }
 {
    - wonderCrops has chosenCultivable:
        ~ wonderCrops -= chosenCultivable
}
{
    - imaginationCrops has chosenCultivable:
        ~ imaginationCrops -= chosenCultivable        
}

{debugCultivable: Dopo la rimozione backupColtivabile contiene {backupCultivable}.}
{debugCultivable: relationshipCrops contiene {relationshipCrops}, shiftCrops contiene {shiftCrops}, understandingCrops contiene {understandingCrops}, selfdeterminationCrops contiene {selfdeterminationCrops}, wonderCrops contiene {wonderCrops} e imaginationCrops contiene {imaginationCrops}.}
->->

//Formule per la gestione dei TW della serra.
//Per inserire dei coltivabili temporaneamente in TW
=== tempCultTW_formula
{debugCultivable: Passo dalla funzione tempCultTW_formula. Il coltivabile selezionato è {chosenCultivable} e prima dell'operazione la lista dei coltivabili include {backupCultivable}.}

	~ backupCultivable -= chosenCultivable
	~ tempCultTW += chosenCultivable
    ~ chosenCultivable = ()
	
{debugCultivable: Dopo l'operazione la lista dei coltivabili include {backupCultivable}.}	
->->

//Per renderli disponibili la volta successiva
=== empty_tempCultTW
{debugCultivable: Passo dalla funzione empty_tempCultTW. Prima dell'operazione la lista dei coltivabili include {backupCultivable}, mentre dei TW temporanei include {tempCultTW}.}

	~ backupCultivable +=  tempCultTW
	~  tempCultTW = ()
	
{debugCultivable: Dopo l'operazione la lista dei coltivabili include {backupCultivable}, mentre dei TW temporanei include {tempCultTW}.}	
->->

	
