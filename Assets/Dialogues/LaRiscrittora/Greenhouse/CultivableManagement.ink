//VARIABILI PER LA GESTIONE DELLA CRESCITA DEI COLTIVABILI
LIST growStep = notStarted, stepZero, stepOne, stepTwo, stepThree

//QUESTA LISTA LA USO PER GESTIRE LA PESCATA O MENO DEI COLTIVABILI
VAR backupCultivable = (LicheneDegliAbissi, NonTiScordarDiTe, MuschioDelleAmanti, CantoDelleCompagne, LaSpazzata, BaccaDellaAddolorata, BrinaDellImpossibile)

VAR statoCantoDelleCompagne = notStarted
VAR statoLicheneDegliAbissi = notStarted
VAR statoMuschioDelleAmanti = notStarted
VAR statoBrinaDellImpossibile = notStarted
VAR statoLaSpazzata = notStarted
VAR statoBaccaDellaAddolorata = notStarted
VAR statoNonTiScordarDiTe = notStarted

//Variabili per la gestione della serra
LIST cropsType = collaborazione, ciclicità, novità, cancellazione, ricordo, indipendenza

//QUESTE LISTE HANNO UN VALORE CATALOGATIVO E PER LA GESTIONE DELLE DOMANDE
    //Relazione: piante che parlano del rapporto con l'altra. Che per lo più è positiva, ma non sempre. Forse in questo senso la Brina ci azzecca poco.
VAR pianteCollaborazione = (LicheneDegliAbissi, MuschioDelleAmanti, CantoDelleCompagne, BrinaDellImpossibile)
    //Movimento: elementi che parlano di movimento fisico o emotivo
VAR pianteCiclicità = (LicheneDegliAbissi, CantoDelleCompagne, NonTiScordarDiTe)
    //Soglia: siamo a ridosso di qualcosa: lo accogliamo o lo rifiutiamo?
VAR pianteIndipendenza = (LaSpazzata, BaccaDellaAddolorata, NonTiScordarDiTe)
    //Futuro: il cambiamento è inevitabile.
VAR pianteNovità =(MuschioDelleAmanti,LaSpazzata, BaccaDellaAddolorata, BrinaDellImpossibile)
    //Passato: rimaniamo nello spazio della memoria, del ricordo
VAR pianteRicordo =(MuschioDelleAmanti, CantoDelleCompagne, NonTiScordarDiTe, BrinaDellImpossibile)
    //Esplosione: le cose cambiano di botto
VAR pianteCancellazione =(LicheneDegliAbissi,LaSpazzata, BaccaDellaAddolorata)



    //Pianta che verrà proposta. La uso anche per tracking dello stato delle piante.
    VAR chosenCultivable = ()
    
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

//Questa è una strategia (basic e temporanea) per evitare che il testing vada in loop se non ci sono combinazioni sensate di domande.
VAR randomCounter = 0
VAR maxRandomCounter = 100

//Variabili monitoraggio stato vegetali
VAR growing = 0    

=== cultivable_test ===
<i>La serra ha qualcosa da svelarti.
<i>Sussurri serpeggiano tra i vasi, ponendoti domande.
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

    - randomCounter == maxRandomCounter:
        {debugCultivable: <i>randomCounter {randomCounter} ha raggiunto il livello massimo {maxRandomCounter}.}
        {
            - backupCultivable != ():
                ~ chosenCultivable = LIST_RANDOM(backupCultivable)
                {debugCultivable: <i>Erano presenti ancora coltivabili in backupCultivable e ho estratto {chosenCultivable}.}
                -> remove_fungo_proposto
            - else:
            <i>In questo momento non è possibile coltivare altro.
                -> main
        
        }

    - dice == 1 && pianteCollaborazione != () && pianteIndipendenza != (): 
        {
            - firstQuest == false:
            {debugCultivable: <i>Il valore di firstQuest è {firstQuest}. Piante Collaborazione contiene: {pianteCollaborazione}. Piante Indipendenza contiene: {pianteIndipendenza}.}
            {
                - cropsType == ():
                {debugCultivable: <i>Questa è la prima domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi vado direttamente alla domanda.}
                    -> first_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.}
                {
                    - LIST_RANDOM(pianteCollaborazione^firstAnswerTracker) != () && LIST_RANDOM(pianteIndipendenza^firstAnswerTracker) != () && cropsType hasnt collaborazione && cropsType hasnt indipendenza:
                    {debugCultivable: <i>L'intersezione tra prima scelta e piantecollaborazione produce {pianteCollaborazione^firstAnswerTracker}, quella tra prima scelta e piante Indipendenza produce {pianteIndipendenza^firstAnswerTracker}}
                    {debugCultivable: <i>Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> first_question
                    - else:
                    {debugCultivable: <i>Non ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                    {debugCultivable: <i>L'intersezione tra prima scelta e piantecollaborazione produce {pianteCollaborazione^firstAnswerTracker}, quella tra prima scelta e piante Indipendenza produce {pianteIndipendenza^firstAnswerTracker}}
                        ~ randomCounter ++
                        ->random
                }
                }
                    
            - else:
             {debugCultivable: <i>Il valore di firstQuest è {firstQuest} e per questo torno a random.}
                    ~ randomCounter ++
                    -> random
        }
    
        
    - dice == 2 && pianteCiclicità != () && pianteNovità != ():
        {
            -secondQuest == false:
            {debugCultivable: <i>Il valore di secondQuest è {secondQuest}. Piante Ciclicità contiene: {pianteCiclicità}. Piante Novità contiene: {pianteNovità} e per questo vado alla domanda.}
            {
                - cropsType == ():
                {debugCultivable: <i>Questa è la prima domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi vado direttamente alla domanda.}
                   -> second_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.}
                {
                    - LIST_RANDOM(pianteCiclicità^firstAnswerTracker) != () && LIST_RANDOM(pianteNovità^firstAnswerTracker) != () && cropsType hasnt ciclicità && cropsType hasnt novità:
                    {debugCultivable: <i>L'intersezione tra prima scelta e piante ciclicità produce {pianteCiclicità^firstAnswerTracker}, quella tra prima scelta e piante novità produce {pianteNovità^firstAnswerTracker}.}
                    {debugCultivable: <i>Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> second_question
                    - else:
                    {debugCultivable: <i>Non ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                    {debugCultivable: <i>L'intersezione tra prima scelta e piante ciclicità produce {pianteCiclicità^firstAnswerTracker}, quella tra prima scelta e piante novità produce {pianteNovità^firstAnswerTracker}.}
                            ~ randomCounter ++
                        ->random
                }
            
            }
            - else:
            {debugCultivable: <i>Il valore di secondQuest è {secondQuest} e per questo torno a random.}
                        ~ randomCounter ++
                    -> random
        }


        
    - dice == 3 && pianteRicordo != () && pianteCancellazione != ():
        {
            - thirdQuest == false:
                {debugCultivable: <i>Il valore di thirdQuest è {thirdQuest}. Piante Ricordo contiene: {pianteRicordo}. Piante Cancellazione contiene: {pianteCancellazione} e per questo vado alla domanda.}    
                    {
                - cropsType == ():
                {debugCultivable: <i>Questa è la prima domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi vado direttamente alla domanda.}
                   -> third_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteRicordo^firstAnswerTracker) != () && LIST_RANDOM(pianteCancellazione^firstAnswerTracker) != () && cropsType hasnt ricordo && cropsType hasnt cancellazione:
                    {debugCultivable: <i>L'intersezione tra prima scelta e piante ricordo produce {pianteRicordo^firstAnswerTracker}, quella tra prima scelta e piante cancellazione produce {pianteCancellazione^firstAnswerTracker}.}
                    {debugCultivable: <i>Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> third_question
                    - else:
                    {debugCultivable: <i>Non ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                    {debugCultivable: <i>L'intersezione tra prima scelta e piante cancellazione produce {pianteRicordo^firstAnswerTracker}, quella tra prima scelta e piante novità produce {pianteCancellazione^firstAnswerTracker}.}
                            ~ randomCounter ++
                        ->random
                }
            
            }
                
            - thirdQuest == true:
                {debugCultivable: <i>Il valore di thirdQuest è {thirdQuest} e per questo torno a random.}
                        ~ randomCounter ++
                    -> random
        }


        - dice == 4 && pianteCollaborazione != () && pianteCiclicità != (): 
        {
            - fourthQuest == false:
            {
                - cropsType == ():
                    -> fourth_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.}                 
                {
                    - LIST_RANDOM(pianteCollaborazione^firstAnswerTracker) != () && LIST_RANDOM(pianteCiclicità^firstAnswerTracker) != () && cropsType hasnt collaborazione && cropsType hasnt ciclicità:
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
        
        - dice == 5 && pianteCollaborazione != () && pianteRicordo != (): 
        {
            - fifthQuest == false:
            {
                - cropsType == ():
                    -> fifth_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteCollaborazione^firstAnswerTracker) != () && LIST_RANDOM(pianteRicordo^firstAnswerTracker) != () && cropsType hasnt collaborazione && cropsType hasnt ricordo:
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
        
        - dice == 6 && pianteCollaborazione != () && pianteCancellazione != (): 
        {
            - sixthQuest == false:
            {
                - cropsType == ():
                    -> sixth_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteCollaborazione^firstAnswerTracker) != () && LIST_RANDOM(pianteCancellazione^firstAnswerTracker) != () && cropsType hasnt collaborazione && cropsType hasnt cancellazione:
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
        
        - dice == 7 && pianteCiclicità != () && pianteIndipendenza != (): 
        {
            - seventhQuest == false:
            {
                - cropsType == ():
                    -> seventh_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteCiclicità^firstAnswerTracker) != () && LIST_RANDOM(pianteIndipendenza^firstAnswerTracker) != () && cropsType hasnt ciclicità && cropsType hasnt indipendenza:
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
        
        - dice == 8 && pianteCiclicità != () && pianteRicordo != (): 
        {
            - eighthQuest == false:
  
            {
                - cropsType == ():
                    -> eighth_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.}
                   {debugCultivable: <i>L'intersezione tra prima scelta e piante ricordo produce {pianteCiclicità^firstAnswerTracker}, quella tra prima scelta e piante cancellazione produce {pianteRicordo^firstAnswerTracker}.}                
                {
                    - LIST_RANDOM(pianteCiclicità^firstAnswerTracker) != () && LIST_RANDOM(pianteRicordo^firstAnswerTracker) != () && cropsType hasnt ciclicità && cropsType hasnt ricordo:
                   
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

        - dice == 9 && pianteCiclicità != () && pianteCancellazione != (): 
        {
            - ninthQuest == false:
            {
                - cropsType == ():
                    -> ninth_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteCiclicità^firstAnswerTracker) != () && LIST_RANDOM(pianteCancellazione^firstAnswerTracker) != () && cropsType hasnt ciclicità && cropsType hasnt cancellazione:
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
        
        - dice == 10 && pianteIndipendenza != () && pianteNovità != (): 
        {
            - tenthQuest == false:
            {
                - cropsType == ():
                    -> tenth_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteIndipendenza^firstAnswerTracker) != () && LIST_RANDOM(pianteNovità^firstAnswerTracker) != () && cropsType hasnt indipendenza && cropsType hasnt novità:
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

        - dice == 11 && pianteIndipendenza != () && pianteRicordo != (): 
        {
            - eleventhQuest == false:
            {
                - cropsType == ():
                    -> eleventh_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteIndipendenza^firstAnswerTracker) != () && LIST_RANDOM(pianteRicordo^firstAnswerTracker) != () && cropsType hasnt indipendenza && cropsType hasnt ricordo:
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
        
        - dice == 12 && pianteIndipendenza != () && pianteCancellazione != (): 
        {
            - twelfthQuest == false:
            {
                - cropsType == ():
                    -> twelfth_question
                
                - else:
                {
                    - LIST_RANDOM(pianteIndipendenza^firstAnswerTracker) != () && LIST_RANDOM(pianteCancellazione^firstAnswerTracker) != () && cropsType hasnt indipendenza && cropsType hasnt cancellazione:
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
        
        - dice == 13 && pianteNovità != () && pianteRicordo != (): 
        {
            - thirteenthQuest == false:
            {
                - cropsType == ():
                    -> thirteenth_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteNovità^firstAnswerTracker) != () && LIST_RANDOM(pianteRicordo^firstAnswerTracker) != () && cropsType hasnt novità && cropsType hasnt ricordo:
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

        - dice == 14 && pianteNovità != () && pianteCancellazione != (): 
        {
            - fourteenthQuest == false:
            {
                - cropsType == ():
                    -> fourteenth_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteNovità^firstAnswerTracker) != () && LIST_RANDOM(pianteCancellazione^firstAnswerTracker) != () && cropsType hasnt novità && cropsType hasnt cancellazione:
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
        
    - else:
        {debugCultivable: <i>Il dado ha valore {dice} e non ci sono condizioni valide per proporre una delle domande e per questo ritiro.}
                    -> random
}


/* ---------------------------------

QUESTIONS

 ----------------------------------*/



    = first_question
     ~ firstQuest = true
         {debugCultivable: <i>Entro in first_question. {firstQuest: firstQuest ora = true|firstQuest = false}}
 
        <i>Le foglie...
            + [<i>{~ Si sfiorano|Si mescolano|Si proteggono le une con le altre}.]
                    ~ cropsType += collaborazione
                    ~ firstAnswerTracker = pianteCollaborazione
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}
            + [<i>{~ Si accumulano sulla soglia|Si dispongono in ordine attorno ai vasi|Resistono al vento}.]
                    ~ cropsType += indipendenza
                    ~ firstAnswerTracker = pianteIndipendenza
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test
    
    = second_question
    ~ secondQuest = true
        {debugCultivable: <i>Entro in second_question. {secondQuest: SecondQuest ora = true|SecondQuest = false}}

        <i>L'aria...
            + [<i>{~ Insegue sé stessa|Crea mulinelli di foglie|Ruota e ruzzola portando odori inaspettati}.]
                    ~ cropsType += ciclicità
                    ~ firstAnswerTracker = pianteCiclicità
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            + [<i>{~ È scoppiettante|Freme, carica di elettricità|Corre in avanti, sempre}.]
                    ~ cropsType += novità
                    ~ firstAnswerTracker = pianteNovità
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test
    

    = third_question
     ~ thirdQuest = true
    {debugCultivable:<i>Entro in third_question. {thirdQuest: thirdQuest ora = true|thirdQuest = false}.}
    
        <i>L'acqua...
            + [<i>{~ È mossa solo sulla superficie|È torbida|È piena di foglie e petali}.]
                    ~ cropsType += ricordo
                    ~ firstAnswerTracker = pianteRicordo
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            + [<i>{~ Scava, portando con sé ogni cosa|Schiaccia foglie e sassi|Rimbomba tra i vasi}.]
                    ~ cropsType += cancellazione
                    ~ firstAnswerTracker = pianteCancellazione
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test

    = fourth_question
     ~ fourthQuest = true
    {debugCultivable: <i>Entro in fourthQuest. {fourthQuest: fourthQuest ora = true|fourthQuest = false}.}
    
        <i>Le api...
            + [<i>{~Proteggono la regina|Si scambiano direzioni|Si puliscono a vicenda}.]
                    ~ cropsType += collaborazione
                    ~ firstAnswerTracker = pianteCollaborazione 
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            + [<i>{~Danzano in sintonia|Cercano il sole|Spargono polline tra i fiori}.]
                    ~ cropsType += ciclicità
                    ~ firstAnswerTracker = pianteCiclicità
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test
    
    = fifth_question
     ~ fifthQuest = true
    {debugCultivable: <i>Entro in fifthQuest. {fifthQuest: fifthQuest ora = true|fifthQuest = false}.}
    
        <i>Le formiche...
            + [<i>{~Lasciano tracce per le compagne|Accumulano cibo per l'inverno|Creano ponti di foglie}.]
                    ~ cropsType += collaborazione
                    ~ firstAnswerTracker = pianteCollaborazione 
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            + [<i>{~Pensano alle amiche perse|Ricordano ciò che non sono più|Si aggrappano ai sogni}.]
                    ~ cropsType += ricordo
                    ~ firstAnswerTracker = pianteRicordo
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test
                    
    = sixth_question
     ~ sixthQuest = true
    {debugCultivable: Entro in sixfthQuest. {sixthQuest: <i>sixfthQuest ora = true|sixfthQuest = false}.}
    
        <i>I sassi...
            + [<i>{~Creano scale verso il cielo|Si fanno mura, protezione|Si scaldano fregandosi lentamente l'un l'altro}.]
                    ~ cropsType += collaborazione
                    ~ firstAnswerTracker = pianteCollaborazione 
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            + [<i>{~Lasciano pezzi di sè sul terreno|Si lanciano contro porte serrate|Schiacciano noci per gli scoiattoli}.]
                    ~ cropsType += cancellazione
                    ~ firstAnswerTracker = pianteCancellazione
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test
    
    = seventh_question
     ~ seventhQuest = true
    {debugCultivable: <i>Entro in seventhQuest. {seventhQuest: seventhQuest ora = true|seventhQuest = false}.}
    
        <i>La terra..
            + [<i>{~Avanza massaggiando le radici nodose delle quercie|Scivola, trascinando con sé i rospi|Asciutta, rotola a valle}.]
                    ~ cropsType += ciclicità
                    ~ firstAnswerTracker = pianteCiclicità 
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            + [<i>{~Tentenna sulla cima della collina|Si accumula inquieta lungo la strada|Si solleva dall'acqua, facendosi diga}.]
                    ~ cropsType += indipendenza
                    ~ firstAnswerTracker = pianteIndipendenza
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test
                    
    = eighth_question
     ~ eighthQuest = true
    {debugCultivable: <i>Entro in eighthQuest. {eighthQuest: eighthQuest ora = true|eighthQuest = false}.}
    
        <i>I cardellini...
            + [<i>{~Svolazzano in stormi sopra alla foresta|Saltellano tra i rami del salice}.]
                    ~ cropsType += ciclicità 
                    ~ firstAnswerTracker = pianteCiclicità 
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            + [<i>{~Cantano i nomi dei compagni persi|Ricostruiscono i nidi di chi non c'è più|Controllano le vecchie scorte dell'inverno}.]
                    ~ cropsType += ricordo
                    ~ firstAnswerTracker = pianteRicordo
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test                   

    = ninth_question
     ~ ninthQuest = true
    {debugCultivable: <i>Entro in ninthQuest. {ninthQuest: ninthQuest ora = true|ninthQuest = false}.}
    
        <i>Il cervo volante...
            + [<i>{~Insegue l'odore di frutta matura|Scava nel legno lunghe gallerie|Trascina pensieri dimenticati}.]
                    ~ cropsType += ciclicità
                    ~ firstAnswerTracker = pianteCiclicità
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}
                    
            + [<i>{~Lotta temibile e inquieto|Spacca la crisalide, asciugandosi al vento}.]
                    ~ cropsType += cancellazione
                    ~ firstAnswerTracker = pianteCancellazione
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}
            -
                ~ counter ++
                    -> test                   
   
    = tenth_question
     ~ tenthQuest = true
    {debugCultivable: <i>Entro in tenthQuest. {tenthQuest: tenthQuest ora = true|tenthQuest = false}.}
    
        <i>Il sole...
            + [<i>{~Mostra il cammino|Offre coraggio alle lucertole|Solleva goccie dalla palude silente}. ]
                    ~ cropsType += indipendenza  
                    ~ firstAnswerTracker = pianteIndipendenza 
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            + [<i>{~Accresce gli steli delle lenticchie selvatiche|Scalda le uova del fagiano|Carezza le foglie verdi di primavera}.]
                    ~ cropsType += novità
                    ~ firstAnswerTracker = pianteNovità
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test
    
    = eleventh_question
     ~ eleventhQuest = true
    {debugCultivable: <i>Entro in eleventhQuest. {eleventhQuest: eleventhQuest ora = true|eleventhQuest = false}.}
    
        <i>La notte...
            + [<i>{~Nasconde i sotterfugi delle falene|Raccoglie i baci delle amanti|Accompagna i ghiri nello spazio del sogno}.]
                    ~ cropsType += indipendenza  
                    ~ firstAnswerTracker = pianteIndipendenza 
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            + [<i>{~Nasconde nomi amati tra le nuvole|Riempie di ricordi i sogni della lepre|Asciuga le lacrime tristi del riccio}.]
                    ~ cropsType += ricordo
                    ~ firstAnswerTracker = pianteRicordo
                {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test                     
 
     = twelfth_question
     ~ twelfthQuest = true
    {debugCultivable: <i>Entro in twelfthQuest. {twelfthQuest: twelfthQuest ora = true|twelfthQuest = false}.}
    
        <i>La neve...
            + [<i>{~Nasconde allo stambecco il burrone|Spinge ai confini del parco|Piega le punte degli abeti più alti}.]
                    ~ cropsType += indipendenza  
                    ~ firstAnswerTracker = pianteIndipendenza 
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            + [<i>{~Schiaccia i nidi delle tortore|Tradisce il passo della volpe}.]
                    ~ cropsType += cancellazione
                    ~ firstAnswerTracker = pianteCancellazione
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test 
    
    = thirteenth_question
     ~ thirteenthQuest = true
    {debugCultivable: <i>Entro in thirteenthQuest. {thirteenthQuest: thirteenthQuest ora = true|thirteenthQuest = false}.}
    
        {pronouns has him: <i>Il riscrittore...|{pronouns has her:<i>La riscrittora...|<i>Lə riscrittorə...}}
        
            + [<i>{~Assapora sulla lingua il sapore del cambiamento|Sente sulle mani un accesso di futuro|Freme nel lanciarsi verso ciò che arriverà}.]
                    ~ cropsType += novità   
                    ~ firstAnswerTracker = pianteNovità 
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            + [<i>{~Indugia su ciò che è stato|Trova conforto nel ricordo di ciò che era|Si chiede dove sia casa}.]
                    ~ cropsType += ricordo
                    ~ firstAnswerTracker = pianteRicordo
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test                    

    = fourteenth_question
     ~ fourteenthQuest = true
    {debugCultivable: <i>Entro in fourteenthQuest. {fourteenthQuest: fourteenthQuest ora = true|fourteenthQuest = false}.}
    
        <i>La serra...
            + [<i>{~Brama la crescita di una nuova pianta|Gioisce per l'erbetta che cresce tra le travi|Spalanca le sue porte a nuove sementi}.]
                    ~ cropsType += novità   
                    ~ firstAnswerTracker = pianteNovità 
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            + [<i>{~Scaccia cimici e cavallette|Acceca il corvo ingordo}.]
                    ~ cropsType += cancellazione
                    ~ firstAnswerTracker = pianteCancellazione
                    {debugCultivable: <i>cropsType contiene ora {cropsType}.}                    
            -   
                ~ counter ++
                    -> test
 
 ->->
 
 === results
{debugCultivable: <i>Entro in results.}
{debugCultivable: <i>Il valore di cropsType è {cropsType}.}
 
    {
    - cropsType == (collaborazione, ciclicità):{
        - LIST_RANDOM(pianteCollaborazione ^ pianteCiclicità) == ():
            {debugCultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: <i>Il fungo proposto è {chosenCultivable}.}   
                -> remove_fungo_proposto
            
        - else: 
        {debugCultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
                ~ chosenCultivable = LIST_RANDOM(pianteCollaborazione ^ pianteCiclicità)
                {
                    - backupCultivable has chosenCultivable:
                    {debugCultivable: <i>backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                        -> remove_fungo_proposto
                    //Questo è un check extra: non dovrebbe mai accadere, ma non si sa mai.    
                    - backupCultivable hasnt chosenCultivable:
                    {debugCultivable: <i>backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                        -> results
                }
    }
        
        
    - cropsType == (collaborazione, novità): {
        - LIST_RANDOM(pianteCollaborazione ^ pianteNovità) == ():
            {debugCultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}       
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: <i> Il fungo proposto è {chosenCultivable}.}   
            -> remove_fungo_proposto
            
        - else:
        {debugCultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
                ~ chosenCultivable = LIST_RANDOM(pianteCollaborazione ^ pianteNovità)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: <i>backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> remove_fungo_proposto
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: <i> backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
        
    - cropsType == (collaborazione, cancellazione):{
        - LIST_RANDOM(pianteCollaborazione ^ pianteCancellazione) == ():
        {debugCultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: <i>Il fungo proposto è {chosenCultivable}.}   
            -> remove_fungo_proposto
            
        - else:
        {debugCultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(pianteCollaborazione ^ pianteCancellazione)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: <i> backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> remove_fungo_proposto
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: <i> backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
        
    - cropsType == (collaborazione, ricordo):{
        - LIST_RANDOM(pianteCollaborazione ^ pianteRicordo) == ():
        {debugCultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: <i>Il fungo proposto è {chosenCultivable}.}   
            -> remove_fungo_proposto
            
        - else:
        {debugCultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(pianteCollaborazione ^ pianteRicordo)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: <i>backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> remove_fungo_proposto
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable:<i>backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
        
        
    - cropsType == (indipendenza, ciclicità):{
        - LIST_RANDOM(pianteIndipendenza ^ pianteCiclicità) == ():
       {debugCultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: <i> Il fungo proposto è {chosenCultivable}.}   
            -> remove_fungo_proposto
            
        - else:
        {debugCultivable: <i> Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(pianteIndipendenza ^ pianteCiclicità)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: <i> backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> remove_fungo_proposto
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: <i>backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
                
    - cropsType == (indipendenza, novità):{
        - LIST_RANDOM(pianteIndipendenza ^ pianteNovità) == ():
        {debugCultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: <i> Il fungo proposto è {chosenCultivable}.}   
            -> remove_fungo_proposto
            
        - else:
        {debugCultivable: <i> Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(pianteIndipendenza ^ pianteNovità)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: <i> backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> remove_fungo_proposto
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: <i> backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    - cropsType == (indipendenza, cancellazione): {
        - LIST_RANDOM(pianteIndipendenza ^ pianteCancellazione) == ():
        {debugCultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: <i>Il fungo proposto è {chosenCultivable}.}   
            -> remove_fungo_proposto
        - else:
        {debugCultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(pianteIndipendenza ^ pianteCancellazione)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: <i>backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> remove_fungo_proposto
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: <i>backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
            }
        
    - cropsType == (indipendenza, ricordo): {
        - LIST_RANDOM(pianteIndipendenza ^ pianteRicordo) == ():
        {debugCultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: <i>Il fungo proposto è {chosenCultivable}.}   
            -> remove_fungo_proposto
            
        - else:
        {debugCultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(pianteIndipendenza ^ pianteRicordo)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: <i>backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> remove_fungo_proposto
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: <i>backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    - cropsType == (ciclicità, cancellazione):{
        - LIST_RANDOM(pianteCiclicità ^ pianteCancellazione) == ():
        {debugCultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: <i>Il fungo proposto è {chosenCultivable}.}   
            -> remove_fungo_proposto
            
        - else:
        {debugCultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(pianteCiclicità ^ pianteCancellazione)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: <i>backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> remove_fungo_proposto
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: <i>backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    - cropsType == (ciclicità, ricordo):{
        - LIST_RANDOM(pianteCiclicità ^ pianteRicordo) == ():
        {debugCultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
         {debugCultivable: <i>Il fungo proposto è {chosenCultivable}.}   
            -> remove_fungo_proposto
            
        - else:
        {debugCultivable:<i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(pianteCiclicità ^ pianteRicordo)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: <i>backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> remove_fungo_proposto
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: <i>backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    - cropsType == (novità, cancellazione):{
        - LIST_RANDOM(pianteCancellazione ^ pianteNovità) == ():
        {debugCultivable:<i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: <i>Il fungo proposto è {chosenCultivable}.}   
            -> remove_fungo_proposto
            
        - else:
        {debugCultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(pianteNovità ^ pianteCancellazione)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: <i>backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> remove_fungo_proposto
                - backupCultivable hasnt chosenCultivable:
                {debugCultivable: <i>backupCultivable non contiene {chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    - cropsType == (novità, ricordo): {
        - LIST_RANDOM(pianteRicordo ^ pianteNovità) == ():
        {debugCultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ chosenCultivable = LIST_RANDOM(backupCultivable)
            {debugCultivable: <i>il fungo proposto è {chosenCultivable}.}   
            -> remove_fungo_proposto
            
        - else:
        {debugCultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ chosenCultivable = LIST_RANDOM(pianteNovità ^ pianteRicordo)
                {
                - backupCultivable has chosenCultivable:
                {debugCultivable: <i>backupCultivable contiene {chosenCultivable} e per questo lo rimuovo}
                    -> remove_fungo_proposto
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
        -> remove_fungo_proposto
    
    }
    
 
 
-> da_lista_a_coltivazioni
 
 


=== da_lista_a_coltivazioni ===
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

 
{debugCultivable: <i>Entro in da_lista_a_coltivazioni. Il valore di counter è {counter}, il valore di growing è {growing}. firstQuest è {firstQuest}, secondQuest è {secondQuest}, thirdQuest è {thirdQuest}.}
{debugCultivable: <i>Gli elementi ancora coltivabili sono: {backupCultivable}.}
{debugCultivable: <i>Svuoto lista tipo Coltivazioni. Il contenuto di tipo Coltivazioni ora è {cropsType}.}
{debugCultivable: <i>Svuoto lista firstAnswerTracker. Il contenuto di tipo firstAnswerTracker ora è {firstAnswerTracker}.}

{chosenCultivable:
    - LicheneDegliAbissi:
        -> lichene_degli_abissi
    - MuschioDelleAmanti:
        -> muschio_delle_amanti
    - CantoDelleCompagne:
        -> canto_delle_compagne
    - LaSpazzata:
        -> la_spazzata
    - BaccaDellaAddolorata:
        -> bacca_della_addolorata
    - NonTiScordarDiTe:
        -> non_ti_scordar_di_te

        
}


-> main


=== remove_fungo_proposto
//Questa azione mi permette di rimuovere il fungo selezionato da ogni lista che lo può contenere. E dato che col tempo le liste possono aumentare, devo solo mettere un remove qui e non OVUNQUE XD
{debugCultivable: <i>Passo dalla funzione remove_fungo_proposto e rimuovo {chosenCultivable} da:}
{
    - pianteRicordo has chosenCultivable:
        ~ pianteRicordo -= chosenCultivable
        {debugCultivable: <i>piante ricordo.}
}
{
    - pianteNovità has chosenCultivable:    
        ~ pianteNovità -= chosenCultivable
       {debugCultivable: <i>piante novità.}        
}
{
    - pianteCollaborazione has chosenCultivable:
        ~ pianteCollaborazione -= chosenCultivable
    {debugCultivable: <i>piante collaborazione.}    
}
{
    - pianteCiclicità has chosenCultivable:
        ~ pianteCiclicità -= chosenCultivable
    {debugCultivable: <i>piante ciclicità.}    
}
{
    - pianteIndipendenza has chosenCultivable:
        ~ pianteIndipendenza -= chosenCultivable
    {debugCultivable: <i>piante indipendenza.}    
}
{
    - pianteCancellazione has chosenCultivable:
        ~ pianteCancellazione -= chosenCultivable
    {debugCultivable: <i>piante cancellazione.}    
}
{
    - backupCultivable has chosenCultivable:
        ~ backupCultivable -= chosenCultivable
    {debugCultivable: <i>backup Coltivabili.}    
}
-> da_lista_a_coltivazioni