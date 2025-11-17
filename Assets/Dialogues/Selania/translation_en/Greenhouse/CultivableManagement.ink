LIST greenhouse_growStep = notStarted, stepZero, stepOne, stepTwo, stepThree

//QUESTA LISTA LA USO PER GESTIRE LA PESCATA O MENO DEI COLTIVABILI
VAR greenhouse_backupCultivable = (LicheneDegliAbissi, NonTiScordarDiTe, MuschioDelleAmanti, CantoDelleCompagne, LaSpazzata, BaccaDellaAddolorata, BrinaDellImpossibile)

VAR statoCantoDelleCompagne = notStarted
VAR statoLicheneDegliAbissi = notStarted
VAR statoMuschioDelleAmanti = notStarted
VAR statoBrinaDellImpossibile = notStarted
VAR statoLaSpazzata = notStarted
VAR statoBaccaDellaAddolorata = notStarted
VAR statoNonTiScordarDiTe = notStarted

//Variabili per la gestione della serra
LIST greenhouse_cropsType = collaborazione, ciclicità, novità, cancellazione, ricordo, indipendenza

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
    VAR greenhouse_chosenCultivable = ()
    
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

//Questa è una strategia (basic e temporanea) per evitare che il testing vada in loop se non ci sono combinazioni sensate di domande.
VAR randomCounter = 0
VAR maxRandomCounter = 100

//Variabili monitoraggio stato vegetali
VAR greenhouse_cultivableGrowing = 0    

=== cultivable_test ===
<i>La serra ha qualcosa da svelarti.
<i>Sussurri serpeggiano tra i vasi, ponendoti domande.
    -> test

=== test
{debug_cultivable: <i>Sono passato da <i>test.}
{debug_cultivable: <i>Gli elementi ancora coltivabili sono: {greenhouse_backupCultivable}.<i>}

{
    - greenhouse_questionsCounter < 2:
    {debug_cultivable: <i>Counter ha valore {greenhouse_questionsCounter} e per questo vado a Random.}
        -> random
    - greenhouse_questionsCounter == 2:
    {debug_cultivable: <i>Counter ha valore {greenhouse_questionsCounter} e per questo vado a Results.}
        -> results
}

= random
~ temp dice = RANDOM(1,14)

{debug_cultivable: <i>Il dado ha valore: {dice}.}
{

    - randomCounter == maxRandomCounter:
        {debug_cultivable: <i>randomCounter {randomCounter} ha raggiunto il livello massimo {maxRandomCounter}.}
        {
            - greenhouse_backupCultivable != ():
                ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
                {debug_cultivable: <i>Erano presenti ancora coltivabili in greenhouse_backupCultivable e ho estratto {greenhouse_chosenCultivable}.}
                -> remove_fungo_proposto
            - else:
            <i>In questo momento non è possibile coltivare altro.
                -> main
        
        }

    - dice == 1 && pianteCollaborazione != () && pianteIndipendenza != (): 
        {
            - firstQuest == false:
            {debug_cultivable: <i>Il valore di firstQuest è {firstQuest}. Piante Collaborazione contiene: {pianteCollaborazione}. Piante Indipendenza contiene: {pianteIndipendenza}.}
            {
                - greenhouse_cropsType == ():
                {debug_cultivable: <i>Questa è la prima domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi vado direttamente alla domanda.}
                    -> first_question
                
                - else:
                {debug_cultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.}
                {
                    - LIST_RANDOM(pianteCollaborazione^firstAnswerTracker) != () && LIST_RANDOM(pianteIndipendenza^firstAnswerTracker) != () && greenhouse_cropsType hasnt collaborazione && greenhouse_cropsType hasnt indipendenza:
                    {debug_cultivable: <i>L'intersezione tra prima scelta e piantecollaborazione produce {pianteCollaborazione^firstAnswerTracker}, quella tra prima scelta e piante Indipendenza produce {pianteIndipendenza^firstAnswerTracker}}
                    {debug_cultivable: <i>Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> first_question
                    - else:
                    {debug_cultivable: <i>Non ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                    {debug_cultivable: <i>L'intersezione tra prima scelta e piantecollaborazione produce {pianteCollaborazione^firstAnswerTracker}, quella tra prima scelta e piante Indipendenza produce {pianteIndipendenza^firstAnswerTracker}}
                        ~ randomCounter ++
                        ->random
                }
                }
                    
            - else:
             {debug_cultivable: <i>Il valore di firstQuest è {firstQuest} e per questo torno a random.}
                    ~ randomCounter ++
                    -> random
        }
    
        
    - dice == 2 && pianteCiclicità != () && pianteNovità != ():
        {
            -secondQuest == false:
            {debug_cultivable: <i>Il valore di secondQuest è {secondQuest}. Piante Ciclicità contiene: {pianteCiclicità}. Piante Novità contiene: {pianteNovità} e per questo vado alla domanda.}
            {
                - greenhouse_cropsType == ():
                {debug_cultivable: <i>Questa è la prima domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi vado direttamente alla domanda.}
                   -> second_question
                
                - else:
                {debug_cultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.}
                {
                    - LIST_RANDOM(pianteCiclicità^firstAnswerTracker) != () && LIST_RANDOM(pianteNovità^firstAnswerTracker) != () && greenhouse_cropsType hasnt ciclicità && greenhouse_cropsType hasnt novità:
                    {debug_cultivable: <i>L'intersezione tra prima scelta e piante ciclicità produce {pianteCiclicità^firstAnswerTracker}, quella tra prima scelta e piante novità produce {pianteNovità^firstAnswerTracker}.}
                    {debug_cultivable: <i>Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> second_question
                    - else:
                    {debug_cultivable: <i>Non ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                    {debug_cultivable: <i>L'intersezione tra prima scelta e piante ciclicità produce {pianteCiclicità^firstAnswerTracker}, quella tra prima scelta e piante novità produce {pianteNovità^firstAnswerTracker}.}
                            ~ randomCounter ++
                        ->random
                }
            
            }
            - else:
            {debug_cultivable: <i>Il valore di secondQuest è {secondQuest} e per questo torno a random.}
                        ~ randomCounter ++
                    -> random
        }


        
    - dice == 3 && pianteRicordo != () && pianteCancellazione != ():
        {
            - thirdQuest == false:
                {debug_cultivable: <i>Il valore di thirdQuest è {thirdQuest}. Piante Ricordo contiene: {pianteRicordo}. Piante Cancellazione contiene: {pianteCancellazione} e per questo vado alla domanda.}    
                    {
                - greenhouse_cropsType == ():
                {debug_cultivable: <i>Questa è la prima domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi vado direttamente alla domanda.}
                   -> third_question
                
                - else:
                {debug_cultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteRicordo^firstAnswerTracker) != () && LIST_RANDOM(pianteCancellazione^firstAnswerTracker) != () && greenhouse_cropsType hasnt ricordo && greenhouse_cropsType hasnt cancellazione:
                    {debug_cultivable: <i>L'intersezione tra prima scelta e piante ricordo produce {pianteRicordo^firstAnswerTracker}, quella tra prima scelta e piante cancellazione produce {pianteCancellazione^firstAnswerTracker}.}
                    {debug_cultivable: <i>Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}
                        -> third_question
                    - else:
                    {debug_cultivable: <i>Non ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}
                    {debug_cultivable: <i>L'intersezione tra prima scelta e piante cancellazione produce {pianteRicordo^firstAnswerTracker}, quella tra prima scelta e piante novità produce {pianteCancellazione^firstAnswerTracker}.}
                            ~ randomCounter ++
                        ->random
                }
            
            }
                
            - thirdQuest == true:
                {debug_cultivable: <i>Il valore di thirdQuest è {thirdQuest} e per questo torno a random.}
                        ~ randomCounter ++
                    -> random
        }


        - dice == 4 && pianteCollaborazione != () && pianteCiclicità != (): 
        {
            - fourthQuest == false:
            {
                - greenhouse_cropsType == ():
                    -> fourth_question
                
                - else:
                {debug_cultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.}                 
                {
                    - LIST_RANDOM(pianteCollaborazione^firstAnswerTracker) != () && LIST_RANDOM(pianteCiclicità^firstAnswerTracker) != () && greenhouse_cropsType hasnt collaborazione && greenhouse_cropsType hasnt ciclicità:
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
                - greenhouse_cropsType == ():
                    -> fifth_question
                
                - else:
                {debug_cultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteCollaborazione^firstAnswerTracker) != () && LIST_RANDOM(pianteRicordo^firstAnswerTracker) != () && greenhouse_cropsType hasnt collaborazione && greenhouse_cropsType hasnt ricordo:
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
                - greenhouse_cropsType == ():
                    -> sixth_question
                
                - else:
                {debug_cultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteCollaborazione^firstAnswerTracker) != () && LIST_RANDOM(pianteCancellazione^firstAnswerTracker) != () && greenhouse_cropsType hasnt collaborazione && greenhouse_cropsType hasnt cancellazione:
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
                - greenhouse_cropsType == ():
                    -> seventh_question
                
                - else:
                {debug_cultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteCiclicità^firstAnswerTracker) != () && LIST_RANDOM(pianteIndipendenza^firstAnswerTracker) != () && greenhouse_cropsType hasnt ciclicità && greenhouse_cropsType hasnt indipendenza:
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
                - greenhouse_cropsType == ():
                    -> eighth_question
                
                - else:
                {debug_cultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.}
                   {debug_cultivable: <i>L'intersezione tra prima scelta e piante ricordo produce {pianteCiclicità^firstAnswerTracker}, quella tra prima scelta e piante cancellazione produce {pianteRicordo^firstAnswerTracker}.}                
                {
                    - LIST_RANDOM(pianteCiclicità^firstAnswerTracker) != () && LIST_RANDOM(pianteRicordo^firstAnswerTracker) != () && greenhouse_cropsType hasnt ciclicità && greenhouse_cropsType hasnt ricordo:
                   
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
                - greenhouse_cropsType == ():
                    -> ninth_question
                
                - else:
                {debug_cultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteCiclicità^firstAnswerTracker) != () && LIST_RANDOM(pianteCancellazione^firstAnswerTracker) != () && greenhouse_cropsType hasnt ciclicità && greenhouse_cropsType hasnt cancellazione:
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
                - greenhouse_cropsType == ():
                    -> tenth_question
                
                - else:
                {debug_cultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteIndipendenza^firstAnswerTracker) != () && LIST_RANDOM(pianteNovità^firstAnswerTracker) != () && greenhouse_cropsType hasnt indipendenza && greenhouse_cropsType hasnt novità:
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
                - greenhouse_cropsType == ():
                    -> eleventh_question
                
                - else:
                {debug_cultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteIndipendenza^firstAnswerTracker) != () && LIST_RANDOM(pianteRicordo^firstAnswerTracker) != () && greenhouse_cropsType hasnt indipendenza && greenhouse_cropsType hasnt ricordo:
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
                - greenhouse_cropsType == ():
                    -> twelfth_question
                
                - else:
                {
                    - LIST_RANDOM(pianteIndipendenza^firstAnswerTracker) != () && LIST_RANDOM(pianteCancellazione^firstAnswerTracker) != () && greenhouse_cropsType hasnt indipendenza && greenhouse_cropsType hasnt cancellazione:
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
                - greenhouse_cropsType == ():
                    -> thirteenth_question
                
                - else:
                {debug_cultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteNovità^firstAnswerTracker) != () && LIST_RANDOM(pianteRicordo^firstAnswerTracker) != () && greenhouse_cropsType hasnt novità && greenhouse_cropsType hasnt ricordo:
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
                - greenhouse_cropsType == ():
                    -> fourteenth_question
                
                - else:
                {debug_cultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteNovità^firstAnswerTracker) != () && LIST_RANDOM(pianteCancellazione^firstAnswerTracker) != () && greenhouse_cropsType hasnt novità && greenhouse_cropsType hasnt cancellazione:
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
        {debug_cultivable: <i>Il dado ha valore {dice} e non ci sono condizioni valide per proporre una delle domande e per questo ritiro.}
                    -> random
}


/* ---------------------------------

QUESTIONS

 ----------------------------------*/



    = first_question
     ~ firstQuest = true
         {debug_cultivable: <i>Entro in first_question. {firstQuest: firstQuest ora = true|firstQuest = false}}
 
        <i>Le foglie...
            + [<i>{~ Si sfiorano|Si mescolano|Si proteggono le une con le altre}.]
                    ~ greenhouse_cropsType += collaborazione
                    ~ firstAnswerTracker = pianteCollaborazione
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}
            + [<i>{~ Si accumulano sulla soglia|Si dispongono in ordine attorno ai vasi|Resistono al vento}.]
                    ~ greenhouse_cropsType += indipendenza
                    ~ firstAnswerTracker = pianteIndipendenza
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test
    
    = second_question
    ~ secondQuest = true
        {debug_cultivable: <i>Entro in second_question. {secondQuest: SecondQuest ora = true|SecondQuest = false}}

        <i>L'aria...
            + [<i>{~ Insegue sé stessa|Crea mulinelli di foglie|Ruota e ruzzola portando odori inaspettati}.]
                    ~ greenhouse_cropsType += ciclicità
                    ~ firstAnswerTracker = pianteCiclicità
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [<i>{~ È scoppiettante|Freme, carica di elettricità|Corre in avanti, sempre}.]
                    ~ greenhouse_cropsType += novità
                    ~ firstAnswerTracker = pianteNovità
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test
    

    = third_question
     ~ thirdQuest = true
    {debug_cultivable:<i>Entro in third_question. {thirdQuest: thirdQuest ora = true|thirdQuest = false}.}
    
        <i>L'acqua...
            + [<i>{~ È mossa solo sulla superficie|È torbida|È piena di foglie e petali}.]
                    ~ greenhouse_cropsType += ricordo
                    ~ firstAnswerTracker = pianteRicordo
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [<i>{~ Scava, portando con sé ogni cosa|Schiaccia foglie e sassi|Rimbomba tra i vasi}.]
                    ~ greenhouse_cropsType += cancellazione
                    ~ firstAnswerTracker = pianteCancellazione
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test

    = fourth_question
     ~ fourthQuest = true
    {debug_cultivable: <i>Entro in fourthQuest. {fourthQuest: fourthQuest ora = true|fourthQuest = false}.}
    
        <i>Le api...
            + [<i>{~Proteggono la regina|Si scambiano direzioni|Si puliscono a vicenda}.]
                    ~ greenhouse_cropsType += collaborazione
                    ~ firstAnswerTracker = pianteCollaborazione 
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [<i>{~Danzano in sintonia|Cercano il sole|Spargono polline tra i fiori}.]
                    ~ greenhouse_cropsType += ciclicità
                    ~ firstAnswerTracker = pianteCiclicità
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test
    
    = fifth_question
     ~ fifthQuest = true
    {debug_cultivable: <i>Entro in fifthQuest. {fifthQuest: fifthQuest ora = true|fifthQuest = false}.}
    
        <i>Le formiche...
            + [<i>{~Lasciano tracce per le compagne|Accumulano cibo per l'inverno|Creano ponti di foglie}.]
                    ~ greenhouse_cropsType += collaborazione
                    ~ firstAnswerTracker = pianteCollaborazione 
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [<i>{~Pensano alle amiche perse|Ricordano ciò che non sono più|Si aggrappano ai sogni}.]
                    ~ greenhouse_cropsType += ricordo
                    ~ firstAnswerTracker = pianteRicordo
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test
                    
    = sixth_question
     ~ sixthQuest = true
    {debug_cultivable: Entro in sixfthQuest. {sixthQuest: <i>sixfthQuest ora = true|sixfthQuest = false}.}
    
        <i>I sassi...
            + [<i>{~Creano scale verso il cielo|Si fanno mura, protezione|Si scaldano fregandosi lentamente l'un l'altro}.]
                    ~ greenhouse_cropsType += collaborazione
                    ~ firstAnswerTracker = pianteCollaborazione 
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [<i>{~Lasciano pezzi di sè sul terreno|Si lanciano contro porte serrate|Schiacciano noci per gli scoiattoli}.]
                    ~ greenhouse_cropsType += cancellazione
                    ~ firstAnswerTracker = pianteCancellazione
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test
    
    = seventh_question
     ~ seventhQuest = true
    {debug_cultivable: <i>Entro in seventhQuest. {seventhQuest: seventhQuest ora = true|seventhQuest = false}.}
    
        <i>La terra..
            + [<i>{~Avanza massaggiando le radici nodose delle quercie|Scivola, trascinando con sé i rospi|Asciutta, rotola a valle}.]
                    ~ greenhouse_cropsType += ciclicità
                    ~ firstAnswerTracker = pianteCiclicità 
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [<i>{~Tentenna sulla cima della collina|Si accumula inquieta lungo la strada|Si solleva dall'acqua, facendosi diga}.]
                    ~ greenhouse_cropsType += indipendenza
                    ~ firstAnswerTracker = pianteIndipendenza
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test
                    
    = eighth_question
     ~ eighthQuest = true
    {debug_cultivable: <i>Entro in eighthQuest. {eighthQuest: eighthQuest ora = true|eighthQuest = false}.}
    
        <i>I cardellini...
            + [<i>{~Svolazzano in stormi sopra alla foresta|Saltellano tra i rami del salice}.]
                    ~ greenhouse_cropsType += ciclicità 
                    ~ firstAnswerTracker = pianteCiclicità 
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [<i>{~Cantano i nomi dei compagni persi|Ricostruiscono i nidi di chi non c'è più|Controllano le vecchie scorte dell'inverno}.]
                    ~ greenhouse_cropsType += ricordo
                    ~ firstAnswerTracker = pianteRicordo
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test                   

    = ninth_question
     ~ ninthQuest = true
    {debug_cultivable: <i>Entro in ninthQuest. {ninthQuest: ninthQuest ora = true|ninthQuest = false}.}
    
        <i>Il cervo volante...
            + [<i>{~Insegue l'odore di frutta matura|Scava nel legno lunghe gallerie|Trascina pensieri dimenticati}.]
                    ~ greenhouse_cropsType += ciclicità
                    ~ firstAnswerTracker = pianteCiclicità
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}
                    
            + [<i>{~Lotta temibile e inquieto|Spacca la crisalide, asciugandosi al vento}.]
                    ~ greenhouse_cropsType += cancellazione
                    ~ firstAnswerTracker = pianteCancellazione
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}
            -
                ~ greenhouse_questionsCounter ++
                    -> test                   
   
    = tenth_question
     ~ tenthQuest = true
    {debug_cultivable: <i>Entro in tenthQuest. {tenthQuest: tenthQuest ora = true|tenthQuest = false}.}
    
        <i>Il sole...
            + [<i>{~Mostra il cammino|Offre coraggio alle lucertole|Solleva goccie dalla palude silente}. ]
                    ~ greenhouse_cropsType += indipendenza  
                    ~ firstAnswerTracker = pianteIndipendenza 
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [<i>{~Accresce gli steli delle lenticchie selvatiche|Scalda le uova del fagiano|Carezza le foglie verdi di primavera}.]
                    ~ greenhouse_cropsType += novità
                    ~ firstAnswerTracker = pianteNovità
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test
    
    = eleventh_question
     ~ eleventhQuest = true
    {debug_cultivable: <i>Entro in eleventhQuest. {eleventhQuest: eleventhQuest ora = true|eleventhQuest = false}.}
    
        <i>La notte...
            + [<i>{~Nasconde i sotterfugi delle falene|Raccoglie i baci delle amanti|Accompagna i ghiri nello spazio del sogno}.]
                    ~ greenhouse_cropsType += indipendenza  
                    ~ firstAnswerTracker = pianteIndipendenza 
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [<i>{~Nasconde nomi amati tra le nuvole|Riempie di ricordi i sogni della lepre|Asciuga le lacrime tristi del riccio}.]
                    ~ greenhouse_cropsType += ricordo
                    ~ firstAnswerTracker = pianteRicordo
                {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test                     
 
     = twelfth_question
     ~ twelfthQuest = true
    {debug_cultivable: <i>Entro in twelfthQuest. {twelfthQuest: twelfthQuest ora = true|twelfthQuest = false}.}
    
        <i>La neve...
            + [<i>{~Nasconde allo stambecco il burrone|Spinge ai confini del parco|Piega le punte degli abeti più alti}.]
                    ~ greenhouse_cropsType += indipendenza  
                    ~ firstAnswerTracker = pianteIndipendenza 
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [<i>{~Schiaccia i nidi delle tortore|Tradisce il passo della volpe}.]
                    ~ greenhouse_cropsType += cancellazione
                    ~ firstAnswerTracker = pianteCancellazione
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test 
    
    = thirteenth_question
     ~ thirteenthQuest = true
    {debug_cultivable: <i>Entro in thirteenthQuest. {thirteenthQuest: thirteenthQuest ora = true|thirteenthQuest = false}.}
    
        {pronouns has him: <i>Il riscrittore...|{pronouns has her:<i>La riscrittora...|<i>Lə riscrittorə...}}
        
            + [<i>{~Assapora sulla lingua il sapore del cambiamento|Sente sulle mani un accesso di futuro|Freme nel lanciarsi verso ciò che arriverà}.]
                    ~ greenhouse_cropsType += novità
                    ~ firstAnswerTracker = pianteNovità
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [<i>{~Indugia su ciò che è stato|Trova conforto nel ricordo di ciò che era|Si chiede dove sia casa}.]
                    ~ greenhouse_cropsType += ricordo
                    ~ firstAnswerTracker = pianteRicordo
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test                    

    = fourteenth_question
     ~ fourteenthQuest = true
    {debug_cultivable: <i>Entro in fourteenthQuest. {fourteenthQuest: fourteenthQuest ora = true|fourteenthQuest = false}.}
    
        <i>La serra...
            + [<i>{~Brama la crescita di una nuova pianta|Gioisce per l'erbetta che cresce tra le travi|Spalanca le sue porte a nuove sementi}.]
                    ~ greenhouse_cropsType += novità   
                    ~ firstAnswerTracker = pianteNovità 
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            + [<i>{~Scaccia cimici e cavallette|Acceca il corvo ingordo}.]
                    ~ greenhouse_cropsType += cancellazione
                    ~ firstAnswerTracker = pianteCancellazione
                    {debug_cultivable: <i>greenhouse_cropsType contiene ora {greenhouse_cropsType}.}                    
            -   
                ~ greenhouse_questionsCounter ++
                    -> test
 
 ->->
 
 === results
{debug_cultivable: <i>Entro in results.}
{debug_cultivable: <i>Il valore di greenhouse_cropsType è {greenhouse_cropsType}.}
 
    {
    
    - greenhouse_cropsType == (collaborazione, ciclicità):{
        - LIST_RANDOM(pianteCollaborazione ^ pianteCiclicità) == ():
            {debug_cultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
            {debug_cultivable: <i>Il fungo proposto è {greenhouse_chosenCultivable}.}   
                -> remove_fungo_proposto
            
        - else: 
        {debug_cultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
                ~ greenhouse_chosenCultivable = LIST_RANDOM(pianteCollaborazione ^ pianteCiclicità)
                {
                    - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                    {debug_cultivable: <i>greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                        -> remove_fungo_proposto
                    //Questo è un check extra: non dovrebbe mai accadere, ma non si sa mai.    
                    - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                    {debug_cultivable: <i>greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                        -> results
                }
    }
        
        
    - greenhouse_cropsType == (collaborazione, novità): {
        - LIST_RANDOM(pianteCollaborazione ^ pianteNovità) == ():
            {debug_cultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.} 
                ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
            {debug_cultivable: <i> Il fungo proposto è {greenhouse_chosenCultivable}.}   
            -> remove_fungo_proposto
            
        - else:
        {debug_cultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
                ~ greenhouse_chosenCultivable = LIST_RANDOM(pianteCollaborazione ^ pianteNovità)
                {
                - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                {debug_cultivable: <i>greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                    -> remove_fungo_proposto
                - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                {debug_cultivable: <i> greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
        
    - greenhouse_cropsType == (collaborazione, cancellazione):{
        - LIST_RANDOM(pianteCollaborazione ^ pianteCancellazione) == ():
        {debug_cultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
            {debug_cultivable: <i>Il fungo proposto è {greenhouse_chosenCultivable}.}   
            -> remove_fungo_proposto
            
        - else:
        {debug_cultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(pianteCollaborazione ^ pianteCancellazione)
                {
                - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                {debug_cultivable: <i> greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                    -> remove_fungo_proposto
                - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                {debug_cultivable: <i> greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
        
    - greenhouse_cropsType == (collaborazione, ricordo):{
        - LIST_RANDOM(pianteCollaborazione ^ pianteRicordo) == ():
        {debug_cultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
            {debug_cultivable: <i>Il fungo proposto è {greenhouse_chosenCultivable}.}   
            -> remove_fungo_proposto
            
        - else:
        {debug_cultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(pianteCollaborazione ^ pianteRicordo)
                {
                - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                {debug_cultivable: <i>greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                    -> remove_fungo_proposto
                - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                {debug_cultivable:<i>greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
        
        
    - greenhouse_cropsType == (indipendenza, ciclicità):{
        - LIST_RANDOM(pianteIndipendenza ^ pianteCiclicità) == ():
       {debug_cultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
            {debug_cultivable: <i> Il fungo proposto è {greenhouse_chosenCultivable}.}   
            -> remove_fungo_proposto
            
        - else:
        {debug_cultivable: <i> Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(pianteIndipendenza ^ pianteCiclicità)
                {
                - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                {debug_cultivable: <i> greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                    -> remove_fungo_proposto
                - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                {debug_cultivable: <i>greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
                
    - greenhouse_cropsType == (indipendenza, novità):{
        - LIST_RANDOM(pianteIndipendenza ^ pianteNovità) == ():
        {debug_cultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
            {debug_cultivable: <i> Il fungo proposto è {greenhouse_chosenCultivable}.}   
            -> remove_fungo_proposto
            
        - else:
        {debug_cultivable: <i> Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(pianteIndipendenza ^ pianteNovità)
                {
                - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                {debug_cultivable: <i> greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                    -> remove_fungo_proposto
                - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                {debug_cultivable: <i> greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    - greenhouse_cropsType == (indipendenza, cancellazione): {
        - LIST_RANDOM(pianteIndipendenza ^ pianteCancellazione) == ():
        {debug_cultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
            {debug_cultivable: <i>Il fungo proposto è {greenhouse_chosenCultivable}.}   
            -> remove_fungo_proposto
        - else:
        {debug_cultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(pianteIndipendenza ^ pianteCancellazione)
                {
                - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                {debug_cultivable: <i>greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                    -> remove_fungo_proposto
                - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                {debug_cultivable: <i>greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
            }
        
    - greenhouse_cropsType == (indipendenza, ricordo): {
        - LIST_RANDOM(pianteIndipendenza ^ pianteRicordo) == ():
        {debug_cultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
            {debug_cultivable: <i>Il fungo proposto è {greenhouse_chosenCultivable}.}   
            -> remove_fungo_proposto
            
        - else:
        {debug_cultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(pianteIndipendenza ^ pianteRicordo)
                {
                - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                {debug_cultivable: <i>greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                    -> remove_fungo_proposto
                - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                {debug_cultivable: <i>greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    - greenhouse_cropsType == (ciclicità, cancellazione):{
        - LIST_RANDOM(pianteCiclicità ^ pianteCancellazione) == ():
        {debug_cultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
            {debug_cultivable: <i>Il fungo proposto è {greenhouse_chosenCultivable}.}   
            -> remove_fungo_proposto
            
        - else:
        {debug_cultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(pianteCiclicità ^ pianteCancellazione)
                {
                - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                {debug_cultivable: <i>greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                    -> remove_fungo_proposto
                - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                {debug_cultivable: <i>greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    - greenhouse_cropsType == (ciclicità, ricordo):{
        - LIST_RANDOM(pianteCiclicità ^ pianteRicordo) == ():
        {debug_cultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
         {debug_cultivable: <i>Il fungo proposto è {greenhouse_chosenCultivable}.}   
            -> remove_fungo_proposto
            
        - else:
        {debug_cultivable:<i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(pianteCiclicità ^ pianteRicordo)
                {
                - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                {debug_cultivable: <i>greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                    -> remove_fungo_proposto
                - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                {debug_cultivable: <i>greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    - greenhouse_cropsType == (novità, cancellazione):{
        - LIST_RANDOM(pianteCancellazione ^ pianteNovità) == ():
        {debug_cultivable:<i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
            {debug_cultivable: <i>Il fungo proposto è {greenhouse_chosenCultivable}.}   
            -> remove_fungo_proposto
            
        - else:
        {debug_cultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(pianteNovità ^ pianteCancellazione)
                {
                - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                {debug_cultivable: <i>greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                    -> remove_fungo_proposto
                - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                {debug_cultivable: <i>greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    - greenhouse_cropsType == (novità, ricordo): {
        - LIST_RANDOM(pianteRicordo ^ pianteNovità) == ():
        {debug_cultivable: <i>Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
            {debug_cultivable: <i>il fungo proposto è {greenhouse_chosenCultivable}.}   
            -> remove_fungo_proposto
            
        - else:
        {debug_cultivable: <i>Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}
            ~ greenhouse_chosenCultivable = LIST_RANDOM(pianteNovità ^ pianteRicordo)
                {
                - greenhouse_backupCultivable has greenhouse_chosenCultivable:
                {debug_cultivable: <i>greenhouse_backupCultivable contiene {greenhouse_chosenCultivable} e per questo lo rimuovo}
                    -> remove_fungo_proposto
                - greenhouse_backupCultivable hasnt greenhouse_chosenCultivable:
                {debug_cultivable: <i>greenhouse_backupCultivable non contiene {greenhouse_chosenCultivable} e per questo rilancio "results".}
                    -> results
                }
        }
        
    
    - else:
    {debug_cultivable: <i>Passo da else nella lista greenhouse_cropsType perché non c'è un fungo adatto.}
         ~ greenhouse_chosenCultivable = LIST_RANDOM(greenhouse_backupCultivable)
         ~ greenhouse_backupCultivable -= greenhouse_chosenCultivable
    {debug_cultivable: Il fungo proposto è {greenhouse_chosenCultivable}.}      
        -> remove_fungo_proposto
    
    }
    
 
 
-> da_lista_a_coltivazioni
 
 


=== da_lista_a_coltivazioni ===
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
    ~ greenhouse_questionsCounter = 0
    ~ greenhouse_cultivableGrowing = 1
    ~ firstAnswerTracker = ()
    ~ randomCounter = 0

 
{debug_cultivable: <i>Entro in da_lista_a_coltivazioni. Il valore di greenhouse_questionsCounter è {greenhouse_questionsCounter}, il valore di greenhouse_cultivableGrowing è {greenhouse_cultivableGrowing}. firstQuest è {firstQuest}, secondQuest è {secondQuest}, thirdQuest è {thirdQuest}.}
{debug_cultivable: <i>Gli elementi ancora coltivabili sono: {greenhouse_backupCultivable}.<i>}
{debug_cultivable: <i>Svuoto lista tipo Coltivazioni. Il contenuto di tipo Coltivazioni ora è {greenhouse_cropsType}.}
{debug_cultivable: <i>Svuoto lista firstAnswerTracker. Il contenuto di tipo firstAnswerTracker ora è {firstAnswerTracker==(): vuota|piena}.}
    -> chosen_cultivable

=chosen_cultivable
{greenhouse_chosenCultivable:
    - LicheneDegliAbissi:
        -> lichene_degli_abissi
    - MuschioDelleAmanti:
        -> edera_delle_amanti
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
{debug_cultivable: <i>Passo dalla funzione remove_fungo_proposto e rimuovo {greenhouse_chosenCultivable} da:}
{
    - pianteRicordo has greenhouse_chosenCultivable:
        ~ pianteRicordo -= greenhouse_chosenCultivable
        {debug_cultivable: <i>piante ricordo.}
}
{
    - pianteNovità has greenhouse_chosenCultivable:    
        ~ pianteNovità -= greenhouse_chosenCultivable
       {debug_cultivable: <i>piante novità.}        
}
{
    - pianteCollaborazione has greenhouse_chosenCultivable:
        ~ pianteCollaborazione -= greenhouse_chosenCultivable
    {debug_cultivable: <i>piante collaborazione.}    
}
{
    - pianteCiclicità has greenhouse_chosenCultivable:
        ~ pianteCiclicità -= greenhouse_chosenCultivable
    {debug_cultivable: <i>piante ciclicità.}    
}
{
    - pianteIndipendenza has greenhouse_chosenCultivable:
        ~ pianteIndipendenza -= greenhouse_chosenCultivable
    {debug_cultivable: <i>piante indipendenza.}    
}
{
    - pianteCancellazione has greenhouse_chosenCultivable:
        ~ pianteCancellazione -= greenhouse_chosenCultivable
    {debug_cultivable: <i>piante cancellazione.}    
}
{
    - greenhouse_backupCultivable has greenhouse_chosenCultivable:
        ~ greenhouse_backupCultivable -= greenhouse_chosenCultivable
    {debug_cultivable: <i>backup Coltivabili.}    
}
-> da_lista_a_coltivazioni
