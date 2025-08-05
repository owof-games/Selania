//Lista coltivabili e stati possibili    
    LIST cultivable = LicheneDegliAbissi, NonTiScordarDiTe, EderaDelleAmanti, CantoDelleCompagne, LaSpazzata, BaccaDellaAddolorata, BrinaDellImpossibile, CardoAspinato

    LIST growStep = notStarted, stepZero, stepOne, stepTwo, stepThree

//QUESTA LISTA LA USO PER GESTIRE LA PESCATA O MENO DEI COLTIVABILI
    VAR backupCultivable = (LicheneDegliAbissi, NonTiScordarDiTe, EderaDelleAmanti, CantoDelleCompagne, LaSpazzata, BaccaDellaAddolorata, BrinaDellImpossibile, CardoAspinato)
    
    VAR growthCantoDelleCompagne = notStarted
    VAR growthLicheneDegliAbissi = notStarted
    VAR growthEderaDelleAmanti = notStarted
    VAR growthBrinaDellImpossibile = notStarted
    VAR growthLaSpazzata = notStarted
    VAR growthBaccaDellaAddolorata = notStarted
    VAR growthNonTiScordarDiTe = notStarted
    VAR growthCardoAspinato = notStarted

//Variabili per la gestione della serra
    LIST cropsType = relationship, shift, understanding, selfdetermination, wonder, imagination

//QUESTE LISTE HANNO UN VALORE CATALOGATIVO E PER LA GESTIONE DELLE DOMANDE

    //Relazione: con sé e con gli altri, anche con l’ambiente.
    VAR relationshipCrops = (LicheneDegliAbissi, NonTiScordarDiTe, EderaDelleAmanti, CardoAspinato)
    //Mutamento: capacità di generare e accogliere il cambiamento.
    VAR shiftCrops = (LicheneDegliAbissi, LaSpazzata)
    //Comprensione: cercare il senso, capire il perché.
    VAR understandingCrops = (LaSpazzata, BaccaDellaAddolorata, CardoAspinato)
    //Autodeterminazione: definire la mia vita per come la voglio, o la vita della mia comunità.
    VAR selfdeterminationCrops = (CantoDelleCompagne, BaccaDellaAddolorata, BrinaDellImpossibile)
    //Stupore, meraviglia: sorprendermi, scoprire cose nuove, scoprire cose inaspettate. Vedere la vita come qualcosa di non prevedibile e godere di questo.
    VAR wonderCrops = (EderaDelleAmanti, BrinaDellImpossibile)
    //Immaginazione e creazione: sono due parole legate ma non sinonimi, ma mi viene istintivo unirle. Da una parte abbiamo la possibilità di pensare a ciò che non c’è, dall’altra di generarlo. In parte immaginazione si collega a stupore (una nuova idea), in parte a comprensione (quando capisco qualcosa e provo ad applicarlo in realtà immaginate). Creatività invece è sia un processo di mutamento (creando porto cambiamento, con tutte le sue conseguenze) che di autodeterminazione (creo ciò che voglio, ciò che penso possa servire, portare piacere, ristorare la mia comunità).
    VAR imaginationCrops = (NonTiScordarDiTe, CantoDelleCompagne)

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
<i>La serra ha qualcosa da svelarti.#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
<i>Sussurri serpeggiano tra i vasi, ponendoti domande.

{
    - not gifts_and_ink.sbadata: <i>Qualcosa ti lascia un dono: uno zainetto per raccogliere tutto ciò che coltiverai.</i>
        ~ move_entity(Inventory, Greenhouse)
}
    -> test

=== test
{debugCultivable: <i>Sono passato da <i>test.}
{debugCultivable: <i>Gli elementi ancora coltivabili sono: {backupCultivable}.<i>}

{
    - counter < 2:
    {debugCultivable: <i>Counter ha valore {counter} e per questo vado a Random.}
        -> random
    - counter == 2:
    {debugCultivable: <i>Counter ha valore {counter} e per questo vado a Results.}
        -> results
}

= random
~ temp dice = RANDOM(1,14)

{debugCultivable: <i>Il dado ha valore: {dice}.}
{

    - randomCounter >= maxRandomCounter:
        {debugCultivable: <i>randomCounter {randomCounter} ha raggiunto il livello massimo {maxRandomCounter}.}
        {
            - backupCultivable != ():
                ~ chosenCultivable = LIST_RANDOM(backupCultivable)
                {debugCultivable: <i>Erano presenti ancora coltivabili in backupCultivable e ho estratto {chosenCultivable}.}
                -> list_to_crops
            - else:
            <i>In questo momento non è possibile coltivare altro. #speaker:{fungus_tag()}
                -> main
        
        }

    - dice == 1 && relationshipCrops ^ backupCultivable != () && understandingCrops ^ backupCultivable != ():
        {
            - firstQuest == false:
            {debugCultivable: <i>Il valore di firstQuest è {firstQuest}. Piante Collaborazione contiene: {relationshipCrops}. Piante Indipendenza contiene: {understandingCrops}.}
            {
                - cropsType == ():
                {debugCultivable: <i>Questa è la prima domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi vado direttamente alla domanda.}
                    -> first_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.}
                {
                    - LIST_RANDOM(relationshipCrops^firstAnswerTracker) != () && LIST_RANDOM(understandingCrops^firstAnswerTracker) != () && cropsType hasnt relationship && cropsType hasnt imagination:
                    {debugCultivable: <i>L'intersezione tra prima scelta e piantecollaborazione produce {relationshipCrops^firstAnswerTracker}, quella tra prima scelta e piante Indipendenza produce {understandingCrops^firstAnswerTracker}}
                    {debugCultivable: <i>Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> first_question
                    
                    - else:
                    {debugCultivable: <i>Non ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                    {debugCultivable: <i>L'intersezione tra prima scelta e piantecollaborazione produce {relationshipCrops^firstAnswerTracker}, quella tra prima scelta e piante Indipendenza produce {understandingCrops^firstAnswerTracker}}
                        ~ randomCounter ++
                        ->random
                }
                }
                    
            - else:
             {debugCultivable: <i>Il valore di firstQuest è {firstQuest} e per questo torno a random.}
                    ~ randomCounter ++
                    -> random
        }
    
        
    - dice == 2 && shiftCrops ^ backupCultivable != () && selfdeterminationCrops ^ backupCultivable != ():
        {
            -secondQuest == false:
            {debugCultivable: <i>Il valore di secondQuest è {secondQuest}. Piante Ciclicità contiene: {shiftCrops}. Piante Novità contiene: {selfdeterminationCrops} e per questo vado alla domanda.}
            {
                - cropsType == ():
                {debugCultivable: <i>Questa è la prima domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi vado direttamente alla domanda.}
                   -> second_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.}
                {
                    - LIST_RANDOM(shiftCrops^firstAnswerTracker) != () && LIST_RANDOM(selfdeterminationCrops^firstAnswerTracker) != () && cropsType hasnt shift && cropsType hasnt understanding:
                    {debugCultivable: <i>L'intersezione tra prima scelta e piante shift produce {shiftCrops^firstAnswerTracker}, quella tra prima scelta e piante understanding produce {selfdeterminationCrops^firstAnswerTracker}.}
                    {debugCultivable: <i>Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> second_question
                    - else:
                    {debugCultivable: <i>Non ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                    {debugCultivable: <i>L'intersezione tra prima scelta e piante shift produce {shiftCrops^firstAnswerTracker}, quella tra prima scelta e piante understanding produce {selfdeterminationCrops^firstAnswerTracker}.}
                            ~ randomCounter ++
                        ->random
                }
            
            }
            - else:
            {debugCultivable: <i>Il valore di secondQuest è {secondQuest} e per questo torno a random.}
                        ~ randomCounter ++
                    -> random
        }


        
    - dice == 3 && wonderCrops ^ backupCultivable != () && imaginationCrops ^ backupCultivable != ():
        {
            - thirdQuest == false:
                {debugCultivable: <i>Il valore di thirdQuest è {thirdQuest}. Piante Ricordo contiene: {wonderCrops}. Piante Cancellazione contiene: {imaginationCrops} e per questo vado alla domanda.}    
                    {
                - cropsType == ():
                {debugCultivable: <i>Questa è la prima domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi vado direttamente alla domanda.}
                   -> third_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(wonderCrops^firstAnswerTracker) != () && LIST_RANDOM(imaginationCrops^firstAnswerTracker) != () && cropsType hasnt wonder && cropsType hasnt selfdetermination:
                    {debugCultivable: <i>L'intersezione tra prima scelta e piante wonder produce {wonderCrops^firstAnswerTracker}, quella tra prima scelta e piante selfdetermination produce {imaginationCrops^firstAnswerTracker}.}
                    {debugCultivable: <i>Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> third_question
                    - else:
                    {debugCultivable: <i>Non ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                    {debugCultivable: <i>L'intersezione tra prima scelta e piante selfdetermination produce {wonderCrops^firstAnswerTracker}, quella tra prima scelta e piante understanding produce {imaginationCrops^firstAnswerTracker}.}
                            ~ randomCounter ++
                        ->random
                }
            
            }
                
            - thirdQuest == true:
                {debugCultivable: <i>Il valore di thirdQuest è {thirdQuest} e per questo torno a random.}
                        ~ randomCounter ++
                    -> random
        }


        - dice == 4 && relationshipCrops ^ backupCultivable != () && shiftCrops ^ backupCultivable != (): 
        {
            - fourthQuest == false:
            {
                - cropsType == ():
                    -> fourth_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.}                 
                {
                    - LIST_RANDOM(relationshipCrops^firstAnswerTracker) != () && LIST_RANDOM(shiftCrops^firstAnswerTracker) != () && cropsType hasnt relationship && cropsType hasnt shift:
                        -> fourth_question
                    - else:
                        ~ randomCounter ++
                        ->random
                }
            }
                    
            - else:
                    ~ randomCounter ++
                    -> random
        }
        
        - dice == 5 && relationshipCrops ^ backupCultivable!= () && wonderCrops ^ backupCultivable != (): 
        {
            - fifthQuest == false:
            {
                - cropsType == ():
                    -> fifth_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(relationshipCrops^firstAnswerTracker) != () && LIST_RANDOM(wonderCrops^firstAnswerTracker) != () && cropsType hasnt relationship && cropsType hasnt wonder:
                        -> fifth_question
                    - else:
                        ~ randomCounter ++
                        ->random
                }
            }
                    
            - else:
                    ~ randomCounter ++
                    -> random
        }        
        
        - dice == 6 && relationshipCrops ^ backupCultivable != () && imaginationCrops ^ backupCultivable != (): 
        {
            - sixthQuest == false:
            {
                - cropsType == ():
                    -> sixth_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(relationshipCrops^firstAnswerTracker) != () && LIST_RANDOM(imaginationCrops^firstAnswerTracker) != () && cropsType hasnt relationship && cropsType hasnt selfdetermination:
                        -> sixth_question
                    - else:
                        ~ randomCounter ++
                        ->random
                }
            }
                    
            - else:
                    ~ randomCounter ++
                    -> random
        }          
        
        - dice == 7 && shiftCrops ^ backupCultivable != () && understandingCrops ^ backupCultivable != (): 
        {
            - seventhQuest == false:
            {
                - cropsType == ():
                    -> seventh_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(shiftCrops^firstAnswerTracker) != () && LIST_RANDOM(understandingCrops^firstAnswerTracker) != () && cropsType hasnt shift && cropsType hasnt imagination:
                        -> seventh_question
                    - else:
                        ~ randomCounter ++
                        ->random
                }
            }
                    
            - else:
                    ~ randomCounter ++
                    -> random
        }         
        
        - dice == 8 && shiftCrops ^ backupCultivable != () && wonderCrops ^ backupCultivable != (): 
        {
            - eighthQuest == false:
  
            {
                - cropsType == ():
                    -> eighth_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.}
                   {debugCultivable: <i>L'intersezione tra prima scelta e piante wonder produce {shiftCrops^firstAnswerTracker}, quella tra prima scelta e piante selfdetermination produce {wonderCrops^firstAnswerTracker}.}                
                {
                    - LIST_RANDOM(shiftCrops^firstAnswerTracker) != () && LIST_RANDOM(wonderCrops^firstAnswerTracker) != () && cropsType hasnt shift && cropsType hasnt wonder:
                   
                        -> eighth_question
                    - else:
                        ~ randomCounter ++
                        ->random
                }
            }
                    
            - else:
                    ~ randomCounter ++
                    -> random
        }        

        - dice == 9 && shiftCrops ^ backupCultivable != () && imaginationCrops ^ backupCultivable != (): 
        {
            - ninthQuest == false:
            {
                - cropsType == ():
                    -> ninth_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(shiftCrops^firstAnswerTracker) != () && LIST_RANDOM(imaginationCrops^firstAnswerTracker) != () && cropsType hasnt shift && cropsType hasnt selfdetermination:
                        -> ninth_question
                    - else:
                        ~ randomCounter ++
                        ->random
                }
            }
            - else:
                ~ randomCounter ++
                -> random        
        }
        
        - dice == 10 && understandingCrops ^ backupCultivable != () && selfdeterminationCrops ^ backupCultivable != (): 
        {
            - tenthQuest == false:
            {
                - cropsType == ():
                    -> tenth_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(understandingCrops^firstAnswerTracker) != () && LIST_RANDOM(selfdeterminationCrops^firstAnswerTracker) != () && cropsType hasnt imagination && cropsType hasnt understanding:
                        -> tenth_question
                    - else:
                        ~ randomCounter ++
                        ->random
                }
            }
 
            
            - else:
                    ~ randomCounter ++
                    -> random
        }         

        - dice == 11 && understandingCrops ^ backupCultivable != () && wonderCrops ^ backupCultivable ^ backupCultivable != (): 
        {
            - eleventhQuest == false:
            {
                - cropsType == ():
                    -> eleventh_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(understandingCrops^firstAnswerTracker) != () && LIST_RANDOM(wonderCrops^firstAnswerTracker) != () && cropsType hasnt imagination && cropsType hasnt wonder:
                        -> eleventh_question
                    - else:
                        ~ randomCounter ++
                        ->random
                }
            }
            - else:
                ~ randomCounter ++
                -> random
        }
        
        - dice == 12 && understandingCrops ^ backupCultivable != () && imaginationCrops ^ backupCultivable != (): 
        {
            - twelfthQuest == false:
            {
                - cropsType == ():
                    -> twelfth_question
                
                - else:
                {
                    - LIST_RANDOM(understandingCrops^firstAnswerTracker) != () && LIST_RANDOM(imaginationCrops^firstAnswerTracker) != () && cropsType hasnt imagination && cropsType hasnt selfdetermination:
                        -> twelfth_question
                    - else:
                        ~ randomCounter ++
                        ->random
                }
            }
                    - else:
                    ~ randomCounter ++
                    -> random
        } 
        
        - dice == 13 && selfdeterminationCrops ^ backupCultivable != () && wonderCrops ^ backupCultivable != (): 
        {
            - thirteenthQuest == false:
            {
                - cropsType == ():
                    -> thirteenth_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(selfdeterminationCrops^firstAnswerTracker) != () && LIST_RANDOM(wonderCrops^firstAnswerTracker) != () && cropsType hasnt understanding && cropsType hasnt wonder:
                        -> thirteenth_question
                    - else:
                        ~ randomCounter ++
                        ->random
                }
            }
                    - else:
                    ~ randomCounter ++
                    -> random
        } 

        - dice == 14 && selfdeterminationCrops ^ backupCultivable != () && imaginationCrops ^ backupCultivable != (): 
        {
            - fourteenthQuest == false:
            {
                - cropsType == ():
                    -> fourteenth_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(selfdeterminationCrops^firstAnswerTracker) != () && LIST_RANDOM(imaginationCrops^firstAnswerTracker) != () && cropsType hasnt understanding && cropsType hasnt selfdetermination:
                        -> fourteenth_question
                    - else:
                        ~ randomCounter ++
                        ->random
                }
            }
            - else:
             ~ randomCounter ++
                -> random
            }    
        
        - dice == 15 && selfdeterminationCrops ^ backupCultivable != () && relationshipCrops ^ backupCultivable != (): 
        {
            - fifteenQuest == false:
            {
                - cropsType == ():
                    -> fifteen_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(selfdeterminationCrops^firstAnswerTracker) != () && LIST_RANDOM(relationshipCrops^firstAnswerTracker) != () && cropsType hasnt understanding && cropsType hasnt relationship:
                        -> fifteen_question
                    - else:
                        ~ randomCounter ++
                        ->random
                }
            }
            - else:
             ~ randomCounter ++
                -> random
                
        }
        
    - else:
        {debugCultivable: <i>Il dado ha valore {dice} e non ci sono condizioni valide per proporre una delle domande e per questo ritiro.}
            ~ randomCounter ++
                    -> random
}


/* ---------------------------------

QUESTIONS

 ----------------------------------*/



    = first_question
     ~ firstQuest = true
         {debugCultivable: <i>Entro in first_question. {firstQuest: firstQuest ora = true|firstQuest = false}}
 
        <i>Le foglie...#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
            + [<i>{~ Si sfiorano|Si mescolano|Si proteggono le une con le altre}.]
                    ~ cropsType += relationship
                    ~ firstAnswerTracker = relationshipCrops
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}
            + [<i>{~ Si accumulano sulla soglia|Si dispongono in ordine attorno ai vasi|Resistono al vento}.]
                    ~ cropsType += imagination
                    ~ firstAnswerTracker = understandingCrops
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test
    
    = second_question
    ~ secondQuest = true
        {debugCultivable: <i>Entro in second_question. {secondQuest: SecondQuest ora = true|SecondQuest = false}}

        <i>L'aria... #speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
            + [<i>{~ Insegue sé stessa|Crea mulinelli di foglie|Ruota e ruzzola portando odori inaspettati}.]
                    ~ cropsType += shift
                    ~ firstAnswerTracker = shiftCrops
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            + [<i>{~ È scoppiettante|Freme, carica di elettricità|Corre in avanti, sempre}.]
                    ~ cropsType += understanding
                    ~ firstAnswerTracker = selfdeterminationCrops
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test
    

    = third_question
     ~ thirdQuest = true
    {debugCultivable:<i>Entro in third_question. {thirdQuest: thirdQuest ora = true|thirdQuest = false}.}
    
        <i>L'acqua...#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
            + [<i>{~ È mossa solo sulla superficie|È torbida|È piena di foglie e petali}.]
                    ~ cropsType += wonder
                    ~ firstAnswerTracker = wonderCrops
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            + [<i>{~ Scava, portando con sé ogni cosa|Schiaccia foglie e sassi|Rimbomba tra i vasi}.]
                    ~ cropsType += selfdetermination
                    ~ firstAnswerTracker = imaginationCrops
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test

    = fourth_question
     ~ fourthQuest = true
    {debugCultivable: <i>Entro in fourthQuest. {fourthQuest: fourthQuest ora = true|fourthQuest = false}.}
    
        <i>Le api...#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
            + [<i>{~Proteggono la regina|Si scambiano direzioni|Si puliscono a vicenda}.]
                    ~ cropsType += relationship
                    ~ firstAnswerTracker = relationshipCrops 
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            + [<i>{~Danzano in sintonia|Cercano il sole|Spargono polline tra i fiori}.]
                    ~ cropsType += shift
                    ~ firstAnswerTracker = shiftCrops
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test
    
    = fifth_question
     ~ fifthQuest = true
    {debugCultivable: <i>Entro in fifthQuest. {fifthQuest: fifthQuest ora = true|fifthQuest = false}.}
    
        <i>Le formiche...#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
            + [<i>{~Lasciano tracce per le compagne|Accumulano cibo per l'inverno|Creano ponti di foglie}.]
                    ~ cropsType += relationship
                    ~ firstAnswerTracker = relationshipCrops 
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            + [<i>{~Pensano alle amiche perse|Ricordano ciò che non sono più|Si aggrappano ai sogni}.]
                    ~ cropsType += wonder
                    ~ firstAnswerTracker = wonderCrops
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test
                    
    = sixth_question
     ~ sixthQuest = true
    {debugCultivable: Entro in sixfthQuest. {sixthQuest: <i>sixfthQuest ora = true|sixfthQuest = false}.}
    
        <i>I sassi... #speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
            + [<i>{~Creano scale verso il cielo|Si fanno mura, protezione|Si scaldano fregandosi lentamente l'un l'altro}.]
                    ~ cropsType += relationship
                    ~ firstAnswerTracker = relationshipCrops 
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            + [<i>{~Lasciano pezzi di sè sul terreno|Si lanciano contro porte serrate|Schiacciano noci per gli scoiattoli}.]
                    ~ cropsType += selfdetermination
                    ~ firstAnswerTracker = imaginationCrops
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test
    
    = seventh_question
     ~ seventhQuest = true
    {debugCultivable: <i>Entro in seventhQuest. {seventhQuest: seventhQuest ora = true|seventhQuest = false}.}
    
        <i>La terra...#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
            + [<i>{~Avanza massaggiando le radici nodose delle quercie|Scivola, trascinando con sé i rospi|Asciutta, rotola a valle}.]
                    ~ cropsType += shift
                    ~ firstAnswerTracker = shiftCrops 
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            + [<i>{~Tentenna sulla cima della collina|Si accumula inquieta lungo la strada|Si solleva dall'acqua, facendosi diga}.]
                    ~ cropsType += imagination
                    ~ firstAnswerTracker = understandingCrops
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test
                    
    = eighth_question
     ~ eighthQuest = true
    {debugCultivable: <i>Entro in eighthQuest. {eighthQuest: eighthQuest ora = true|eighthQuest = false}.}
    
        <i>I cardellini...#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
            + [<i>{~Svolazzano in stormi sopra alla foresta|Saltellano tra i rami del salice}.]
                    ~ cropsType += shift 
                    ~ firstAnswerTracker = shiftCrops 
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            + [<i>{~Cantano i nomi dei compagni persi|Ricostruiscono i nidi di chi non c'è più|Controllano le vecchie scorte dell'inverno}.]
                    ~ cropsType += wonder
                    ~ firstAnswerTracker = wonderCrops
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test                   

    = ninth_question
     ~ ninthQuest = true
    {debugCultivable: <i>Entro in ninthQuest. {ninthQuest: ninthQuest ora = true|ninthQuest = false}.}
    
        <i>Il cervo volante... #speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
            + [<i>{~Insegue l'odore di frutta matura|Scava nel legno lunghe gallerie|Trascina pensieri dimenticati}.]
                    ~ cropsType += shift
                    ~ firstAnswerTracker = shiftCrops
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}
                    
            + [<i>{~Lotta temibile e inquieto|Spacca la crisalide, asciugandosi al vento}.]
                    ~ cropsType += selfdetermination
                    ~ firstAnswerTracker = imaginationCrops
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}
            -
                ~ counter ++
                    -> test                   
   
    = tenth_question
     ~ tenthQuest = true
    {debugCultivable: <i>Entro in tenthQuest. {tenthQuest: tenthQuest ora = true|tenthQuest = false}.}
    
        <i>Il sole... #speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
            + [<i>{~Mostra il cammino|Offre coraggio alle lucertole|Solleva goccie dalla palude silente}. ]
                    ~ cropsType += imagination  
                    ~ firstAnswerTracker = understandingCrops 
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            + [<i>{~Accresce gli steli delle lenticchie selvatiche|Scalda le uova del fagiano|Carezza le foglie verdi di primavera}.]
                    ~ cropsType += understanding
                    ~ firstAnswerTracker = selfdeterminationCrops
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test
    
    = eleventh_question
     ~ eleventhQuest = true
    {debugCultivable: <i>Entro in eleventhQuest. {eleventhQuest: eleventhQuest ora = true|eleventhQuest = false}.}
    
        <i>La notte...#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
            + [<i>{~Nasconde i sotterfugi delle falene|Raccoglie i baci delle amanti|Accompagna i ghiri nello spazio del sogno}.]
                    ~ cropsType += imagination  
                    ~ firstAnswerTracker = understandingCrops 
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            + [<i>{~Nasconde nomi amati tra le nuvole|Riempie di ricordi i sogni della lepre|Asciuga le lacrime tristi del riccio}.]
                    ~ cropsType += wonder
                    ~ firstAnswerTracker = wonderCrops
                {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test                     
 
     = twelfth_question
     ~ twelfthQuest = true
    {debugCultivable: <i>Entro in twelfthQuest. {twelfthQuest: twelfthQuest ora = true|twelfthQuest = false}.}
    
        <i>La neve...#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
            + [<i>{~Nasconde allo stambecco il burrone|Spinge ai confini del parco|Piega le punte degli abeti più alti}.]
                    ~ cropsType += imagination  
                    ~ firstAnswerTracker = understandingCrops 
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            + [<i>{~Schiaccia i nidi delle tortore|Tradisce il passo della volpe}.]
                    ~ cropsType += selfdetermination
                    ~ firstAnswerTracker = imaginationCrops
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test 
    
    = thirteenth_question
     ~ thirteenthQuest = true
    {debugCultivable: <i>Entro in thirteenthQuest. {thirteenthQuest: thirteenthQuest ora = true|thirteenthQuest = false}.}
    
        {pronouns has him: <i>Il riscrittore...|{pronouns has her:<i>La riscrittora...|<i>Lə riscrittorə...}}#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
        
            + [<i>{~Assapora sulla lingua il sapore del cambiamento|Sente sulle mani un accesso di futuro|Freme nel lanciarsi verso ciò che arriverà}.]
                    ~ cropsType += understanding
                    ~ firstAnswerTracker = selfdeterminationCrops
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            + [<i>{~Indugia su ciò che è stato|Trova conforto nel wonder di ciò che era|Si chiede dove sia casa}.]
                    ~ cropsType += wonder
                    ~ firstAnswerTracker = wonderCrops
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test                    

    = fourteenth_question
     ~ fourteenthQuest = true
    {debugCultivable: <i>Entro in fourteenthQuest. {fourteenthQuest: fourteenthQuest ora = true|fourteenthQuest = false}.}
    
        <i>La serra...#speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
            + [<i>{~Brama la crescita di una nuova pianta|Gioisce per l'erbetta che cresce tra le travi|Spalanca le sue porte a nuove sementi}.]
                    ~ cropsType += understanding   
                    ~ firstAnswerTracker = selfdeterminationCrops 
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            + [<i>{~Scaccia cimici e cavallette|Acceca il corvo ingordo}.]
                    ~ cropsType += selfdetermination
                    ~ firstAnswerTracker = imaginationCrops
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test
    
    = fifteen_question
    ~ fifteenQuest = true
    {debugCultivable: <i>Entro in fifteenQuest. {fifteenQuest: fifteenQuest ora = true|fifteenQuest = false}.}
    
        <i>La luna... #speaker:{fungus_tag()} #inkA: offState #inkB:offState #inkC:offState  #inkD:offState  #portrait: {fungus_state()}
            + [<i>{~ Accenna timida un nuovo ciclo|Invita la Bella di Notte a sbocciare|Suggerisci sogni di cambiamento}.]
                    ~ cropsType += understanding   
                    ~ firstAnswerTracker = selfdeterminationCrops 
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            + [<i>{~ Solleva le maree per divertire i delfini|Indica la strada alle nuvole|Danza giocosa con la Terra}.]
                    ~ cropsType += relationship
                    ~ firstAnswerTracker = relationshipCrops
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test
 
 ->->
 
 === results
{debugCultivable: <i>Entro in results.}
{debugCultivable: <i>Il valore di cropsType è {cropsType}.}
 
    {
    
    - cropsType == (relationship, shift):{
        - LIST_RANDOM(relationshipCrops ^ shiftCrops) == ():
            {debugCultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: <i>Il fungo proposto è {chosenCultivable}.}   
                -> list_to_crops
            
        - else: 
        {debugCultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
                ~ chosenCultivable = LIST_RANDOM(relationshipCrops ^ shiftCrops)
                {
                    - backupCultivable has chosenCultivable:
                    {debugCultivable: <i>backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                        -> list_to_crops
                    //Questo è un check extra: non dovrebbe mai accadere, ma non si sa mai.    
                    - backupCultivable hasnt chosenCultivable:
                    {debugCultivable: <i>backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                        -> results
                }
    }
        
        
    - cropsType == (relationship, understanding): {
        - LIST_RANDOM(relationshipCrops ^ selfdeterminationCrops) == ():
            {debugCultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.} 
                ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: <i> Il fungo proposto è {chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debugCultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
                ~ chosenCultivable = LIST_RANDOM(relationshipCrops ^ selfdeterminationCrops)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: <i>backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: <i> backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
        
    - cropsType == (relationship, selfdetermination):{
        - LIST_RANDOM(relationshipCrops ^ imaginationCrops) == ():
        {debugCultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: <i>Il fungo proposto è {chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debugCultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(relationshipCrops ^ imaginationCrops)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: <i> backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: <i> backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
        
    - cropsType == (relationship, wonder):{
        - LIST_RANDOM(relationshipCrops ^ wonderCrops) == ():
        {debugCultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: <i>Il fungo proposto è {chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debugCultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(relationshipCrops ^ wonderCrops)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: <i>backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable:<i>backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
        
        
    - cropsType == (imagination, shift):{
        - LIST_RANDOM(understandingCrops ^ shiftCrops) == ():
       {debugCultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: <i> Il fungo proposto è {chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debugCultivable: <i> Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(understandingCrops ^ shiftCrops)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: <i> backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: <i>backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
                
    - cropsType == (imagination, understanding):{
        - LIST_RANDOM(understandingCrops ^ selfdeterminationCrops) == ():
        {debugCultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: <i> Il fungo proposto è {chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debugCultivable: <i> Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(understandingCrops ^ selfdeterminationCrops)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: <i> backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: <i> backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    - cropsType == (imagination, selfdetermination): {
        - LIST_RANDOM(understandingCrops ^ imaginationCrops) == ():
        {debugCultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: <i>Il fungo proposto è {chosenCultivable}.}   
            -> list_to_crops
        - else:
        {debugCultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(understandingCrops ^ imaginationCrops)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: <i>backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: <i>backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
            }
        
    - cropsType == (imagination, wonder): {
        - LIST_RANDOM(understandingCrops ^ wonderCrops) == ():
        {debugCultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: <i>Il fungo proposto è {chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debugCultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(understandingCrops ^ wonderCrops)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: <i>backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: <i>backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    - cropsType == (shift, selfdetermination):{
        - LIST_RANDOM(shiftCrops ^ imaginationCrops) == ():
        {debugCultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: <i>Il fungo proposto è {chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debugCultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(shiftCrops ^ imaginationCrops)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: <i>backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: <i>backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    - cropsType == (shift, wonder):{
        - LIST_RANDOM(shiftCrops ^ wonderCrops) == ():
        {debugCultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
         {debugCultivable: <i>Il fungo proposto è {chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debugCultivable:<i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(shiftCrops ^ wonderCrops)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: <i>backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: <i>backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    - cropsType == (understanding, selfdetermination):{
        - LIST_RANDOM(imaginationCrops ^ selfdeterminationCrops) == ():
        {debugCultivable:<i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: <i>Il fungo proposto è {chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debugCultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(selfdeterminationCrops ^ imaginationCrops)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: <i>backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: <i>backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    - cropsType == (understanding, wonder): {
        - LIST_RANDOM(wonderCrops ^ selfdeterminationCrops) == ():
        {debugCultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: <i>il fungo proposto è {chosenCultivable}.}   
            -> list_to_crops
            
        - else:
        {debugCultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(selfdeterminationCrops ^ wonderCrops)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: <i>backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> list_to_crops
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: <i>backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    
    - else:
    {debugCultivable: <i>Passo da else nella lista cropsType perché non c'è un fungo adatto.}
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
    ~ counter = 0
    ~ growing = 1
    ~ firstAnswerTracker = ()
    ~ randomCounter = 0

 
{debugCultivable: <i>Entro in list_to_crops. Il valore di counter è {counter}, il valore di growing è {growing}. firstQuest è {firstQuest}, secondQuest è {secondQuest}, thirdQuest è {thirdQuest}.}
{debugCultivable: <i>Gli elementi ancora coltivabili sono: {backupCultivable}.}
{debugCultivable: <i>Svuoto lista tipo Coltivazioni. Il contenuto di tipo Coltivazioni ora è {cropsType}.}
{debugCultivable: <i>Svuoto lista firstAnswerTracker. Il contenuto di tipo firstAnswerTracker ora è {firstAnswerTracker==(): vuota|piena}.}
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
}


-> main


=== remove_proposed_cultivable
//Questa azione mi permette di rimuovere il fungo selezionato da ogni lista che lo può contenere. E dato che col tempo le liste possono aumentare, devo solo mettere un remove qui e non OVUNQUE XD
{debugCultivable: <i>Passo da remove_proposed_cultivable. Prima della rimozione backupColtivabile contiene {backupCultivable}, e il coltivabile selezionato è {chosenCultivable}.}
{debugCultivable: <i>relationshipCrops contiene {relationshipCrops}, shiftCrops contiene {shiftCrops}, understandingCrops contiene {understandingCrops}, selfdeterminationCrops contiene {selfdeterminationCrops}, wonderCrops contiene {wonderCrops} e imaginationCrops contiene {imaginationCrops}.}
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

{debugCultivable: <i>Dopo la rimozione backupColtivabile contiene {backupCultivable}.}
{debugCultivable: <i>relationshipCrops contiene {relationshipCrops}, shiftCrops contiene {shiftCrops}, understandingCrops contiene {understandingCrops}, selfdeterminationCrops contiene {selfdeterminationCrops}, wonderCrops contiene {wonderCrops} e imaginationCrops contiene {imaginationCrops}.}
->->

//Formule per la gestione dei TW della serra.
//Per inserire dei coltivabili temporaneamente in TW
=== tempCultTW_formula
{debugCultivable: <i>Passo dalla funzione tempCultTW_formula. Il coltivabile selezionato è {chosenCultivable} e prima dell'operazione la lista dei coltivabili include {backupCultivable}.}

	~ backupCultivable -= chosenCultivable
	~ tempCultTW += chosenCultivable
	
{debugCultivable: <i>Dopo l'operazione la lista dei coltivabili include {backupCultivable}.}	
->->

//Per renderli disponibili la volta successiva
=== empty_tempCultTW
{debugCultivable: <i>Passo dalla funzione empty_tempCultTW. Prima dell'operazione la lista dei coltivabili include {backupCultivable}, mentre dei TW temporanei include {tempCultTW}.}

	~ backupCultivable +=  tempCultTW
	~  tempCultTW = ()
	
{debugCultivable: <i>Dopo l'operazione la lista dei coltivabili include {backupCultivable}, mentre dei TW temporanei include {tempCultTW}.}	
->->

	
