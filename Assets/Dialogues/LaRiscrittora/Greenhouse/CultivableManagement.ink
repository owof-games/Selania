//VARIABILI PER LA GESTIONE DELLA CRESCITA DEI COLTIVABILI
LIST growStep = notStarted, stepZero, stepOne, stepTwo, stepThree

VAR statoCantoDelleCompagne = notStarted
VAR statoLicheneDegliAbissi = notStarted
VAR statoMuschioDelleAmanti = notStarted
VAR statoBrinaDellImpossibile = notStarted
VAR statoLaSpazzata = notStarted
VAR statoBaccaDellaAddolorata = notStarted
VAR statoNonTiScordarDiTe = notStarted

//Variabili per la gestione della serra
LIST tipoColtivazioni = collaborazione, ciclicità, novità, cancellazione, ricordo, indipendenza

//QUESTE LISTE HANNO UN VALORE CATALOGATIVO E PER LA GESTIONE DELLE DOMANDE
VAR pianteCollaborazione = (LicheneDegliAbissi, MuschioDelleAmanti, CantoDelleCompagne, BrinaDellImpossibile)
VAR pianteCiclicità = (LicheneDegliAbissi, CantoDelleCompagne, NonTiScordarDiTe)
VAR pianteIndipendenza = (LaSpazzata, BaccaDellaAddolorata, NonTiScordarDiTe)
VAR pianteNovità =(MuschioDelleAmanti,LaSpazzata, BaccaDellaAddolorata, BrinaDellImpossibile)
VAR pianteRicordo =(MuschioDelleAmanti, CantoDelleCompagne, NonTiScordarDiTe, BrinaDellImpossibile)
VAR pianteCancellazione =(LicheneDegliAbissi,LaSpazzata, BaccaDellaAddolorata)

//QUESTA LISTA LA USO PER GESTIRE LA PESCATA O MENO DEI COLTIVABILI
VAR backupCultivable = (LicheneDegliAbissi, NonTiScordarDiTe, MuschioDelleAmanti, CantoDelleCompagne, LaSpazzata, BaccaDellaAddolorata, BrinaDellImpossibile)

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

=== test_coltivazioni ===
<i>Sassi, foglie e acqua hanno qualcosa da raccontarti.
<i>L'aria si muove tra le fronde, portandoti storie lontane.
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
    - else:
        <i>In questo momento non è possibile coltivare altro.
            -> main
    
    }

    - dice == 1 && pianteCollaborazione != () && pianteIndipendenza != (): 
        {
            - firstQuest == false:
            {debugCultivable: <i>Il valore di firstQuest è {firstQuest}. Piante Collaborazione contiene: {pianteCollaborazione}. Piante Indipendenza contiene: {pianteIndipendenza}.}
            {
                - tipoColtivazioni == ():
                {debugCultivable: <i>Questa è la prima domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi vado direttamente alla domanda.}
                    -> first_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.}
                {
                    - LIST_RANDOM(pianteCollaborazione^firstAnswerTracker) != () && LIST_RANDOM(pianteIndipendenza^firstAnswerTracker) != () && tipoColtivazioni hasnt collaborazione && tipoColtivazioni hasnt indipendenza:
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
                - tipoColtivazioni == ():
                {debugCultivable: <i>Questa è la prima domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi vado direttamente alla domanda.}
                   -> second_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.}
                {
                    - LIST_RANDOM(pianteCiclicità^firstAnswerTracker) != () && LIST_RANDOM(pianteNovità^firstAnswerTracker) != () && tipoColtivazioni hasnt ciclicità && tipoColtivazioni hasnt novità:
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
                - tipoColtivazioni == ():
                {debugCultivable: <i>Questa è la prima domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi vado direttamente alla domanda.}
                   -> third_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteRicordo^firstAnswerTracker) != () && LIST_RANDOM(pianteCancellazione^firstAnswerTracker) != () && tipoColtivazioni hasnt ricordo && tipoColtivazioni hasnt cancellazione:
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
                - tipoColtivazioni == ():
                    -> fourth_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.}                 
                {
                    - LIST_RANDOM(pianteCollaborazione^firstAnswerTracker) != () && LIST_RANDOM(pianteCiclicità^firstAnswerTracker) != () && tipoColtivazioni hasnt collaborazione && tipoColtivazioni hasnt ciclicità:
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
                - tipoColtivazioni == ():
                    -> fifth_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteCollaborazione^firstAnswerTracker) != () && LIST_RANDOM(pianteRicordo^firstAnswerTracker) != () && tipoColtivazioni hasnt collaborazione && tipoColtivazioni hasnt ricordo:
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
                - tipoColtivazioni == ():
                    -> sixth_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteCollaborazione^firstAnswerTracker) != () && LIST_RANDOM(pianteCancellazione^firstAnswerTracker) != () && tipoColtivazioni hasnt collaborazione && tipoColtivazioni hasnt cancellazione:
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
                - tipoColtivazioni == ():
                    -> seventh_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteCiclicità^firstAnswerTracker) != () && LIST_RANDOM(pianteIndipendenza^firstAnswerTracker) != () && tipoColtivazioni hasnt ciclicità && tipoColtivazioni hasnt indipendenza:
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
                - tipoColtivazioni == ():
                    -> eighth_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.}
                   {debugCultivable: <i>L'intersezione tra prima scelta e piante ricordo produce {pianteCiclicità^firstAnswerTracker}, quella tra prima scelta e piante cancellazione produce {pianteRicordo^firstAnswerTracker}.}                
                {
                    - LIST_RANDOM(pianteCiclicità^firstAnswerTracker) != () && LIST_RANDOM(pianteRicordo^firstAnswerTracker) != () && tipoColtivazioni hasnt ciclicità && tipoColtivazioni hasnt ricordo:
                   
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
                - tipoColtivazioni == ():
                    -> ninth_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteCiclicità^firstAnswerTracker) != () && LIST_RANDOM(pianteCancellazione^firstAnswerTracker) != () && tipoColtivazioni hasnt ciclicità && tipoColtivazioni hasnt cancellazione:
                        -> ninth_question
                    - else:
                        ~ randomCounter ++
                        ->random
                }
            }
        }
        
        - dice == 10 && pianteIndipendenza != () && pianteNovità != (): 
        {
            - tenthQuest == false:
            {
                - tipoColtivazioni == ():
                    -> tenth_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteIndipendenza^firstAnswerTracker) != () && LIST_RANDOM(pianteNovità^firstAnswerTracker) != () && tipoColtivazioni hasnt indipendenza && tipoColtivazioni hasnt novità:
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
                - tipoColtivazioni == ():
                    -> eleventh_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteIndipendenza^firstAnswerTracker) != () && LIST_RANDOM(pianteRicordo^firstAnswerTracker) != () && tipoColtivazioni hasnt indipendenza && tipoColtivazioni hasnt ricordo:
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
                - tipoColtivazioni == ():
                    -> twelfth_question
                
                - else:
                {
                    - LIST_RANDOM(pianteIndipendenza^firstAnswerTracker) != () && LIST_RANDOM(pianteCancellazione^firstAnswerTracker) != () && tipoColtivazioni hasnt indipendenza && tipoColtivazioni hasnt cancellazione:
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
                - tipoColtivazioni == ():
                    -> thirteenth_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteNovità^firstAnswerTracker) != () && LIST_RANDOM(pianteRicordo^firstAnswerTracker) != () && tipoColtivazioni hasnt novità && tipoColtivazioni hasnt ricordo:
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
                - tipoColtivazioni == ():
                    -> fourteenth_question
                
                - else:
                {debugCultivable: <i>Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} 
                {
                    - LIST_RANDOM(pianteNovità^firstAnswerTracker) != () && LIST_RANDOM(pianteCancellazione^firstAnswerTracker) != () && tipoColtivazioni hasnt novità && tipoColtivazioni hasnt cancellazione:
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
 
        <i>Sul terreno le foglie e i sassi...
            + [{~ Si sfiorano|Si perdono gli uni nelle altre}.]
                    ~ tipoColtivazioni += collaborazione
                    ~ firstAnswerTracker = pianteCollaborazione
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}
            + [{~ Si osservano distaccati|Difendono i propri confini}.]
                    ~ tipoColtivazioni += indipendenza
                    ~ firstAnswerTracker = pianteIndipendenza
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            -   
                ~ counter ++
                    -> test
    
    = second_question
    ~ secondQuest = true
        {debugCultivable: <i>Entro in second_question. {secondQuest: SecondQuest ora = true|SecondQuest = false}}

        <i>L'aria...
            + [{~ Insegue sé stessa, gioca con le foglie creando mulinelli|Ruota e ruzzola portando odori dal passato}.]
                    ~ tipoColtivazioni += ciclicità
                    ~ firstAnswerTracker = pianteCiclicità
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            + [{~ È scoppiettante, fremente, carica di elettricità|Esplora cautamente ogni angolo della serra}.]
                    ~ tipoColtivazioni += novità
                    ~ firstAnswerTracker = pianteNovità
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            -   
                ~ counter ++
                    -> test
    

    = third_question
     ~ thirdQuest = true
    {debugCultivable:<i>Entro in third_question. {thirdQuest: thirdQuest ora = true|thirdQuest = false}.}
    
        <i>L'acqua...
            + [{~ È ferma, mossa solo sulla superficie|È torbida|È piena di foglie e petali}.]
                    ~ tipoColtivazioni += ricordo
                    ~ firstAnswerTracker = pianteRicordo
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            + [{~ Scava, portando con sé il terriccio|Schiaccia foglie e sassi|La sua voce è potente}.]
                    ~ tipoColtivazioni += cancellazione
                    ~ firstAnswerTracker = pianteCancellazione
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            -   
                ~ counter ++
                    -> test

    = fourth_question
     ~ fourthQuest = true
    {debugCultivable: <i>Entro in fourthQuest. {fourthQuest: fourthQuest ora = true|fourthQuest = false}.}
    
        <i>Domanda..
            + [Collaborazione]
                    ~ tipoColtivazioni += collaborazione
                    ~ firstAnswerTracker = pianteCollaborazione 
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            + [Ciclicità]
                    ~ tipoColtivazioni += ciclicità
                    ~ firstAnswerTracker = pianteCiclicità
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            -   
                ~ counter ++
                    -> test
    
    = fifth_question
     ~ fifthQuest = true
    {debugCultivable: <i>Entro in fifthQuest. {fifthQuest: fifthQuest ora = true|fifthQuest = false}.}
    
        <i>Domanda..
            + [collaborazione]
                    ~ tipoColtivazioni += collaborazione
                    ~ firstAnswerTracker = pianteCollaborazione 
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            + [ricordo]
                    ~ tipoColtivazioni += ricordo
                    ~ firstAnswerTracker = pianteRicordo
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            -   
                ~ counter ++
                    -> test
                    
    = sixth_question
     ~ sixthQuest = true
    {debugCultivable: Entro in sixfthQuest. {sixthQuest: <i>sixfthQuest ora = true|sixfthQuest = false}.}
    
        <i>Domanda..
            + [collaborazione]
                    ~ tipoColtivazioni += collaborazione
                    ~ firstAnswerTracker = pianteCollaborazione 
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            + [cancellazione]
                    ~ tipoColtivazioni += cancellazione
                    ~ firstAnswerTracker = pianteCancellazione
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            -   
                ~ counter ++
                    -> test
    
    = seventh_question
     ~ seventhQuest = true
    {debugCultivable: <i>Entro in seventhQuest. {seventhQuest: seventhQuest ora = true|seventhQuest = false}.}
    
        <i>Domanda..
            + [ciclicità]
                    ~ tipoColtivazioni += ciclicità
                    ~ firstAnswerTracker = pianteCiclicità 
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            + [indipendenza]
                    ~ tipoColtivazioni += indipendenza
                    ~ firstAnswerTracker = pianteIndipendenza
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            -   
                ~ counter ++
                    -> test
                    
    = eighth_question
     ~ eighthQuest = true
    {debugCultivable: <i>Entro in eighthQuest. {eighthQuest: eighthQuest ora = true|eighthQuest = false}.}
    
        <i>Domanda..
            + [ciclicità]
                    ~ tipoColtivazioni += ciclicità 
                    ~ firstAnswerTracker = pianteCiclicità 
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            + [ricordo]
                    ~ tipoColtivazioni += ricordo
                    ~ firstAnswerTracker = pianteRicordo
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            -   
                ~ counter ++
                    -> test                   

    = ninth_question
     ~ ninthQuest = true
    {debugCultivable: <i>Entro in ninthQuest. {ninthQuest: ninthQuest ora = true|ninthQuest = false}.}
    
        <i>Domanda..
            + [ciclicità]
                    ~ tipoColtivazioni += ciclicità 
                    ~ firstAnswerTracker = pianteCiclicità 
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            + [cancellazione]
                    ~ tipoColtivazioni += cancellazione
                    ~ firstAnswerTracker = pianteCancellazione
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            -   
                ~ counter ++
                    -> test                   
   
    = tenth_question
     ~ tenthQuest = true
    {debugCultivable: <i>Entro in tenthQuest. {tenthQuest: tenthQuest ora = true|tenthQuest = false}.}
    
        <i>Domanda..
            + [indipendenza ]
                    ~ tipoColtivazioni += indipendenza  
                    ~ firstAnswerTracker = pianteIndipendenza 
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            + [novità]
                    ~ tipoColtivazioni += novità
                    ~ firstAnswerTracker = pianteNovità
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            -   
                ~ counter ++
                    -> test
    = eleventh_question
     ~ eleventhQuest = true
    {debugCultivable: <i>Entro in eleventhQuest. {eleventhQuest: eleventhQuest ora = true|eleventhQuest = false}.}
    
        <i>Domanda..
            + [indipendenza]
                    ~ tipoColtivazioni += indipendenza  
                    ~ firstAnswerTracker = pianteIndipendenza 
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            + [ricordo]
                    ~ tipoColtivazioni += ricordo
                    ~ firstAnswerTracker = pianteRicordo
                {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            -   
                ~ counter ++
                    -> test                     
 
     = twelfth_question
     ~ twelfthQuest = true
    {debugCultivable: <i>Entro in twelfthQuest. {twelfthQuest: twelfthQuest ora = true|twelfthQuest = false}.}
    
        <i>Domanda..
            + [indipendenza]
                    ~ tipoColtivazioni += indipendenza  
                    ~ firstAnswerTracker = pianteIndipendenza 
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            + [cancellazione]
                    ~ tipoColtivazioni += cancellazione
                    ~ firstAnswerTracker = pianteCancellazione
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            -   
                ~ counter ++
                    -> test 
    
    = thirteenth_question
     ~ thirteenthQuest = true
    {debugCultivable: <i>Entro in thirteenthQuest. {thirteenthQuest: thirteenthQuest ora = true|thirteenthQuest = false}.}
    
        <i>Domanda..
            + [novità]
                    ~ tipoColtivazioni += novità   
                    ~ firstAnswerTracker = pianteNovità 
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            + [ricordo]
                    ~ tipoColtivazioni += ricordo
                    ~ firstAnswerTracker = pianteRicordo
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            -   
                ~ counter ++
                    -> test                    

    = fourteenth_question
     ~ fourteenthQuest = true
    {debugCultivable: <i>Entro in fourteenthQuest. {fourteenthQuest: fourteenthQuest ora = true|fourteenthQuest = false}.}
    
        <i>Domanda..
            + [novità]
                    ~ tipoColtivazioni += novità   
                    ~ firstAnswerTracker = pianteNovità 
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            + [cancellazione]
                    ~ tipoColtivazioni += cancellazione
                    ~ firstAnswerTracker = pianteCancellazione
                    {debugCultivable: <i>tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            -   
                ~ counter ++
                    -> test
 === results
{debugCultivable: <i>Entro in results.}
{debugCultivable: <i>Il valore di tipoColtivazioni è {tipoColtivazioni}.}
 
    {
    - tipoColtivazioni == (collaborazione, ciclicità):{
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
        
        
    - tipoColtivazioni == (collaborazione, novità): {
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
        
        
    - tipoColtivazioni == (collaborazione, cancellazione):{
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
        
        
    - tipoColtivazioni == (collaborazione, ricordo):{
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
        
        
        
    - tipoColtivazioni == (indipendenza, ciclicità):{
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
                
    - tipoColtivazioni == (indipendenza, novità):{
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
        
    - tipoColtivazioni == (indipendenza, cancellazione): {
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
        
    - tipoColtivazioni == (indipendenza, ricordo): {
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
        
    - tipoColtivazioni == (ciclicità, cancellazione):{
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
        
    - tipoColtivazioni == (ciclicità, ricordo):{
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
        
    - tipoColtivazioni == (novità, cancellazione):{
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
        
    - tipoColtivazioni == (novità, ricordo): {
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
    {debugCultivable: <i>Passo da else nella lista tipoColtivazioni perché non c'è un fungo adatto.}
         ~ chosenCultivable = LIST_RANDOM(backupCultivable)
         ~ backupCultivable -= chosenCultivable
    {debugCultivable: Il fungo proposto è {chosenCultivable}.}      
        -> remove_fungo_proposto
    
    }
    
 
 
-> da_lista_a_coltivazioni
 
 


=== da_lista_a_coltivazioni ===
    ~ tipoColtivazioni = ()
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
{debugCultivable: <i>Svuoto lista tipo Coltivazioni. Il contenuto di tipo Coltivazioni ora è {tipoColtivazioni}.}
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
        {
        //Se il trigger warning sul mourning è stato dichiarato, allora prendo un altro risultato.
            - mourning == true:
                -> non_ti_scordar_di_te
            - mourning == false:
                -> canto_delle_compagne
        }
        
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