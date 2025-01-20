//Variabili per la gestione della serra

//VAR coltivazioni = (LicheneDegliAbissi, MuschioDelleAmanti, CantoDelleCompagne, LaSpazzata, BaccaDellaAddolorata, NonTiScordarDiTe)

LIST tipoColtivazioni = collaborazione, ciclicità, novità, cancellazione, ricordo, indipendenza

//QUESTE LISTE HANNO UN VALORE CATALOGATIVO E PER LA GESTIONE DELLE DOMANDE
VAR pianteCollaborazione = (LicheneDegliAbissi, MuschioDelleAmanti, CantoDelleCompagne, BrinaDellImpossibile)
VAR pianteCiclicità = (LicheneDegliAbissi, CantoDelleCompagne, NonTiScordarDiTe)
VAR pianteIndipendenza = (LaSpazzata, BaccaDellaAddolorata, NonTiScordarDiTe)
VAR pianteNovità =(MuschioDelleAmanti,LaSpazzata, BaccaDellaAddolorata, BrinaDellImpossibile)
VAR pianteRicordo =(MuschioDelleAmanti, CantoDelleCompagne, NonTiScordarDiTe, BrinaDellImpossibile)
VAR pianteCancellazione =(LicheneDegliAbissi,LaSpazzata, BaccaDellaAddolorata)

//QUESTA LISTA LA USO PER GESTIRE LA PESCATA O MENO DEI COLTIVABILI
VAR backupColtivabili = (LicheneDegliAbissi, NonTiScordarDiTe, MuschioDelleAmanti, CantoDelleCompagne, LaSpazzata, BaccaDellaAddolorata, BrinaDellImpossibile)

    //Pianta che verrà proposta. La uso anche per tracking dello stato delle piante.
    VAR fungoProposto = ()
    
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
VAR maxRandomCounter = 50

//Variabili monitoraggio stato vegetali
VAR inCrescita = 0    

=== test_coltivazioni ===
<i>Sassi, foglie e acqua hanno qualcosa da raccontarti.</i>
<i>L'aria si muove tra le fronde, portandoti storie lontane.</i>
    -> test

=== test
<i>{debugColtivabili: Sono passato da <i>test</i>.}</i>
<i>{debugColtivabili: Gli elementi ancora coltivabili sono: {backupColtivabili}.}</i>

{
    - counter < 2:
    <i>{debugColtivabili: Counter ha valore {counter} e per questo vado a Random.}</i>
        -> random
    - counter == 2:
    <i>{debugColtivabili: Counter ha valore {counter} e per questo vado a Results.}</i>
        -> results
}

= random
~ temp dice = RANDOM(1,14)

<i>{debugColtivabili: Il dado ha valore {dice}}</i>
{

    - randomCounter == maxRandomCounter:
    {debugColtivabili: randomCounter {randomCounter} ha raggiunto il livello massimo {maxRandomCounter}.}
        <i>In questo momento non è possibile coltivare altro</i>
            -> main
    - dice == 1: 
        {
            - firstQuest == false:
            <i>{debugColtivabili: Il valore di firstQuest è {firstQuest}. Piante Collaborazione contiene: {pianteCollaborazione}. Piante Indipendenza contiene: {pianteIndipendenza}.}</i>
            {
                - tipoColtivazioni == ():
                <i>{debugColtivabili: Questa è la prima domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi vado direttamente alla domanda.}</i>
                    -> first_question
                
                - else:
                <i>{debugColtivabili: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.}</i>
                {
                    - LIST_RANDOM(pianteCollaborazione^firstAnswerTracker) != () && LIST_RANDOM(pianteIndipendenza^firstAnswerTracker) != ():
                    <i>{debugColtivabili: L'intersezione tra prima scelta e piantecollaborazione produce {pianteCollaborazione^firstAnswerTracker}, quella tra prima scelta e piante Indipendenza produce {pianteIndipendenza^firstAnswerTracker}}</i>
                    <i>{debugColtivabili: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}</i>
                        -> first_question
                    - else:
                    <i>{debugColtivabili: Non ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}</i>
                    <i>{debugColtivabili: L'intersezione tra prima scelta e piantecollaborazione produce {pianteCollaborazione^firstAnswerTracker}, quella tra prima scelta e piante Indipendenza produce {pianteIndipendenza^firstAnswerTracker}}</i>
                        ~ randomCounter ++
                        ->random
                }
                }
                    
            - else:
             {debugColtivabili: Il valore di firstQuest è {firstQuest} e per questo torno a random.}
                    ~ randomCounter ++
                    -> random
        }
    
        
    - dice == 2:
        {
            -secondQuest == false:
            <i>{debugColtivabili: Il valore di secondQuest è {secondQuest}. Piante Ciclicità contiene: {pianteCiclicità}. Piante Novità contiene: {pianteNovità} e per questo vado alla domanda.}</i>
            {
                - tipoColtivazioni == ():
                <i>{debugColtivabili: Questa è la prima domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi vado direttamente alla domanda.}</i>
                   -> second_question
                
                - else:
                <i>{debugColtivabili: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.}</i>
                {
                    - LIST_RANDOM(pianteCiclicità^firstAnswerTracker) != () && LIST_RANDOM(pianteNovità^firstAnswerTracker) != ():
                    <i>{debugColtivabili: L'intersezione tra prima scelta e piante ciclicità produce {pianteCiclicità^firstAnswerTracker}, quella tra prima scelta e piante novità produce {pianteNovità^firstAnswerTracker}.}</i>
                    <i>{debugColtivabili: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}</i>
                        -> second_question
                    - else:
                    <i>{debugColtivabili: Non ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}</i>
                    <i>{debugColtivabili: L'intersezione tra prima scelta e piante ciclicità produce {pianteCiclicità^firstAnswerTracker}, quella tra prima scelta e piante novità produce {pianteNovità^firstAnswerTracker}.}</i>
                            ~ randomCounter ++
                        ->random
                }
            
            }
            - else:
            {debugColtivabili: Il valore di secondQuest è {secondQuest} e per questo torno a random.}
                        ~ randomCounter ++
                    -> random
        }


        
    - dice == 3:
        {
            - thirdQuest == false:
                <i>{debugColtivabili: Il valore di thirdQuest è {thirdQuest}. Piante Ricordo contiene: {pianteRicordo}. Piante Cancellazione contiene: {pianteCancellazione} e per questo vado alla domanda.}</i>    
                    {
                - tipoColtivazioni == ():
                <i>{debugColtivabili: Questa è la prima domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi vado direttamente alla domanda.}</i>
                   -> third_question
                
                - else:
                <i>{debugColtivabili: Questa è la seconda domanda (firstAnswerTracker uguale a {firstAnswerTracker} e quindi procedo con le verifiche.} </i>
                {
                    - LIST_RANDOM(pianteRicordo^firstAnswerTracker) != () && LIST_RANDOM(pianteCancellazione^firstAnswerTracker) != ():
                    <i>{debugColtivabili: L'intersezione tra prima scelta e piante ricordo produce {pianteRicordo^firstAnswerTracker}, quella tra prima scelta e piante cancellazione produce {pianteCancellazione^firstAnswerTracker}.}</i>
                    <i>{debugColtivabili: Ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e gli altri due di questa, per cui procedo con la domanda.}</i>
                        -> third_question
                    - else:
                    <i>{debugColtivabili: Non ci sono elementi di intersezione tra il gruppo scelto nella prima domanda e entrambi gli altri due di questa, per cui provo a randomizzare di nuovo.}</i>
                    <i>{debugColtivabili: L'intersezione tra prima scelta e piante cancellazione produce {pianteRicordo^firstAnswerTracker}, quella tra prima scelta e piante novità produce {pianteCancellazione^firstAnswerTracker}.}</i>
                            ~ randomCounter ++
                        ->random
                }
            
            }
                
            - thirdQuest == true:
                <i>{debugColtivabili: Il valore di thirdQuest è {thirdQuest} e per questo torno a random.}</i>
                        ~ randomCounter ++
                    -> random
        }


    - else:
        <i>{debugColtivabili: Il dado ha valore {dice} e non ci sono condizioni valide per proporre una delle tre domande, per offro una risposta negativa.}</i>
        <i>In questo momento non è possibile coltivare nulla</i>
                    -> main
}


    = first_question
     ~ firstQuest = true
         <i>{debugColtivabili: Entro in first_question. {firstQuest: firstQuest ora = true|firstQuest = false}}</i>
 
        <i>Sul terreno le foglie e i sassi...</i>
            + [{~ Si sfiorano|Si perdono gli uni nelle altre}.]
                    ~ tipoColtivazioni += collaborazione
                    ~ firstAnswerTracker = pianteCollaborazione
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>
            + [{~ Si osservano distaccati|Difendono i propri confini}.]
                    ~ tipoColtivazioni += indipendenza
                    ~ firstAnswerTracker = pianteIndipendenza
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            -   
                ~ counter ++
                    -> test
    
    = second_question
    ~ secondQuest = true
        <i>{debugColtivabili: Entro in second_question. {secondQuest: SecondQuest ora = true|SecondQuest = false}}</i>

        <i>L'aria...</i>
            + [{~ Insegue sé stessa, gioca con le foglie creando mulinelli|Ruota e ruzzola portando odori dal passato}.]
                    ~ tipoColtivazioni += ciclicità
                    ~ firstAnswerTracker = pianteCiclicità
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            + [{~ È scoppiettante, fremente, carica di elettricità|Esplora cautamente ogni angolo della serra}.]
                    ~ tipoColtivazioni += novità
                    ~ firstAnswerTracker = pianteNovità
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            -   
                ~ counter ++
                    -> test
    

    = third_question
     ~ thirdQuest = true
    <i>{debugColtivabili: Entro in third_question. {thirdQuest: thirdQuest ora = true|thirdQuest = false}.}</i>
    
        <i>L'acqua...</i>
            + [{~ È ferma, mossa solo sulla superficie|È torbida|È piena di foglie e petali}.]
                    ~ tipoColtivazioni += ricordo
                    ~ firstAnswerTracker = pianteRicordo
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            + [{~ Scava, portando con sé il terriccio|Schiaccia foglie e sassi|La sua voce è potente}.]
                    ~ tipoColtivazioni += cancellazione
                    ~ firstAnswerTracker = pianteCancellazione
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            -   
                ~ counter ++
                    -> test

    = fourth_question
     ~ fourthQuest = true
    <i>{debugColtivabili: Entro in fourthQuest. {fourthQuest: fourthQuest ora = true|fourthQuest = false}.}</i>
    
        <i>Domanda..</i>
            + [Collaborazione]
                    ~ tipoColtivazioni += collaborazione
                    ~ firstAnswerTracker = pianteCollaborazione 
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            + [Ciclicità]
                    ~ tipoColtivazioni += ciclicità
                    ~ firstAnswerTracker = pianteCiclicità
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            -   
                ~ counter ++
                    -> test
    
    = fifth_question
     ~ fifthQuest = true
    <i>{debugColtivabili: Entro in fifthQuest. {fifthQuest: fifthQuest ora = true|fifthQuest = false}.}</i>
    
        <i>Domanda..</i>
            + [collaborazione]
                    ~ tipoColtivazioni += collaborazione
                    ~ firstAnswerTracker = pianteCollaborazione 
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            + [ricordo]
                    ~ tipoColtivazioni += ricordo
                    ~ firstAnswerTracker = pianteRicordo
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            -   
                ~ counter ++
                    -> test
                    
    = sixth_question
     ~ sixthQuest = true
    <i>{debugColtivabili: Entro in sixfthQuest. {sixthQuest: sixfthQuest ora = true|sixfthQuest = false}.}</i>
    
        <i>Domanda..</i>
            + [collaborazione]
                    ~ tipoColtivazioni += collaborazione
                    ~ firstAnswerTracker = pianteCollaborazione 
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            + [cancellazione]
                    ~ tipoColtivazioni += cancellazione
                    ~ firstAnswerTracker = pianteCancellazione
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            -   
                ~ counter ++
                    -> test
    
    = seventh_question
     ~ seventhQuest = true
    <i>{debugColtivabili: Entro in seventhQuest. {seventhQuest: seventhQuest ora = true|seventhQuest = false}.}</i>
    
        <i>Domanda..</i>
            + [ciclicità]
                    ~ tipoColtivazioni += ciclicità 
                    ~ firstAnswerTracker = pianteCiclicità 
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            + [indipendenza]
                    ~ tipoColtivazioni += indipendenza
                    ~ firstAnswerTracker = pianteIndipendenza
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            -   
                ~ counter ++
                    -> test
                    
    = eighth_question
     ~ eighthQuest = true
    <i>{debugColtivabili: Entro in eighthQuest. {eighthQuest: eighthQuest ora = true|eighthQuest = false}.}</i>
    
        <i>Domanda..</i>
            + [ciclicità]
                    ~ tipoColtivazioni += ciclicità 
                    ~ firstAnswerTracker = pianteCiclicità 
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            + [ricordo]
                    ~ tipoColtivazioni += ricordo
                    ~ firstAnswerTracker = pianteRicordo
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            -   
                ~ counter ++
                    -> test                   

    = ninth_question
     ~ ninthQuest = true
    <i>{debugColtivabili: Entro in ninthQuest. {ninthQuest: ninthQuest ora = true|ninthQuest = false}.}</i>
    
        <i>Domanda..</i>
            + [ciclicità]
                    ~ tipoColtivazioni += ciclicità 
                    ~ firstAnswerTracker = pianteCiclicità 
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            + [cancellazione]
                    ~ tipoColtivazioni += cancellazione
                    ~ firstAnswerTracker = pianteCancellazione
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            -   
                ~ counter ++
                    -> test                   
   
    = tenth_question
     ~ tenthQuest = true
    <i>{debugColtivabili: Entro in tenthQuest. {tenthQuest: tenthQuest ora = true|tenthQuest = false}.}</i>
    
        <i>Domanda..</i>
            + [indipendenza ]
                    ~ tipoColtivazioni += indipendenza  
                    ~ firstAnswerTracker = pianteIndipendenza 
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            + [novità]
                    ~ tipoColtivazioni += novità
                    ~ firstAnswerTracker = pianteNovità
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            -   
                ~ counter ++
                    -> test
    = eleventh_question
     ~ eleventhQuest = true
    <i>{debugColtivabili: Entro in eleventhQuest. {eleventhQuest: eleventhQuest ora = true|eleventhQuest = false}.}</i>
    
        <i>Domanda..</i>
            + [indipendenza ]
                    ~ tipoColtivazioni += indipendenza  
                    ~ firstAnswerTracker = pianteIndipendenza 
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            + [ricordo]
                    ~ tipoColtivazioni += ricordo
                    ~ firstAnswerTracker = pianteRicordo
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            -   
                ~ counter ++
                    -> test                     
 
     = twelfth_question
     ~ twelfthQuest = true
    <i>{debugColtivabili: Entro in twelfthQuest. {twelfthQuest: twelfthQuest ora = true|twelfthQuest = false}.}</i>
    
        <i>Domanda..</i>
            + [indipendenza ]
                    ~ tipoColtivazioni += indipendenza  
                    ~ firstAnswerTracker = pianteIndipendenza 
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            + [cancellazione]
                    ~ tipoColtivazioni += cancellazione
                    ~ firstAnswerTracker = pianteCancellazione
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            -   
                ~ counter ++
                    -> test 
    
    = thirteenth_question
     ~ thirteenthQuest = true
    <i>{debugColtivabili: Entro in thirteenthQuest. {thirteenthQuest: thirteenthQuest ora = true|thirteenthQuest = false}.}</i>
    
        <i>Domanda..</i>
            + [novità  ]
                    ~ tipoColtivazioni += novità   
                    ~ firstAnswerTracker = pianteNovità 
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            + [ricordo]
                    ~ tipoColtivazioni += ricordo
                    ~ firstAnswerTracker = pianteRicordo
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            -   
                ~ counter ++
                    -> test                    

    = fourteenth_question
     ~ fourteenthQuest = true
    <i>{debugColtivabili: Entro in fourteenthQuest. {fourteenthQuest: fourteenthQuest ora = true|fourteenthQuest = false}.}</i>
    
        <i>Domanda..</i>
            + [novità  ]
                    ~ tipoColtivazioni += novità   
                    ~ firstAnswerTracker = pianteNovità 
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            + [cancellazione]
                    ~ tipoColtivazioni += cancellazione
                    ~ firstAnswerTracker = pianteCancellazione
                    <i>{debugColtivabili: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            -   
                ~ counter ++
                    -> test
 === results
<i>{debugColtivabili: Entro in results.}</i>
<i>{debugColtivabili: il valore di tipoColtivazioni è {tipoColtivazioni}.}</i>
 
    {
    - tipoColtivazioni == (collaborazione, ciclicità):{
        - LIST_RANDOM(pianteCollaborazione ^ pianteCiclicità) == ():
            <i>{debugColtivabili: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}</i>
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            <i>{debugColtivabili: Il fungo proposto è {fungoProposto}.}</i>   
                -> remove_fungo_proposto
            
        - else: 
        <i>{debugColtivabili: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}</i>
                ~ fungoProposto = LIST_RANDOM(pianteCollaborazione ^ pianteCiclicità)
                {
                    - backupColtivabili has fungoProposto:
                    <i>{debugColtivabili: backupColtivabili contiene {fungoProposto} e per questo lo rimuovo}</i>
                        -> remove_fungo_proposto
                    //Questo è un check extra: non dovrebbe mai accadere, ma non si sa mai.    
                    - backupColtivabili hasnt fungoProposto:
                    <i>{debugColtivabili: backupColtivabili non contiene {fungoProposto} e per questo rilancio "results".}</i>
                        -> results
                }
    }
        
        
    - tipoColtivazioni == (collaborazione, novità): {
        - LIST_RANDOM(pianteCollaborazione ^ pianteNovità) == ():
            <i>{debugColtivabili: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}</i>       
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            <i>{debugColtivabili: Il fungo proposto è {fungoProposto}.}</i>   
            -> remove_fungo_proposto
            
        - else:
        <i>{debugColtivabili: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}</i>
                ~ fungoProposto = LIST_RANDOM(pianteCollaborazione ^ pianteNovità)
                {
                - backupColtivabili has fungoProposto:
                <i>{debugColtivabili: backupColtivabili contiene {fungoProposto} e per questo lo rimuovo}</i>
                    -> remove_fungo_proposto
                - backupColtivabili hasnt fungoProposto:
                <i>{debugColtivabili: backupColtivabili non contiene {fungoProposto} e per questo rilancio "results".}</i>
                    -> results
                }
        }
        
        
    - tipoColtivazioni == (collaborazione, cancellazione):{
        - LIST_RANDOM(pianteCollaborazione ^ pianteCancellazione) == ():
        <i>{debugColtivabili: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}</i>
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            <i>{debugColtivabili: Il fungo proposto è {fungoProposto}.}</i>   
            -> remove_fungo_proposto
            
        - else:
        <i>{debugColtivabili: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}</i>
            ~ fungoProposto = LIST_RANDOM(pianteCollaborazione ^ pianteCancellazione)
                {
                - backupColtivabili has fungoProposto:
                <i>{debugColtivabili: backupColtivabili contiene {fungoProposto} e per questo lo rimuovo}</i>
                    -> remove_fungo_proposto
                - backupColtivabili hasnt fungoProposto:
                <i>{debugColtivabili: backupColtivabili non contiene {fungoProposto} e per questo rilancio "results".}</i>
                    -> results
                }
        }
        
        
    - tipoColtivazioni == (collaborazione, ricordo):{
        - LIST_RANDOM(pianteCollaborazione ^ pianteRicordo) == ():
        <i>{debugColtivabili: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}</i>
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            <i>{debugColtivabili: Il fungo proposto è {fungoProposto}.}</i>   
            -> remove_fungo_proposto
            
        - else:
        <i>{debugColtivabili: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}</i>
            ~ fungoProposto = LIST_RANDOM(pianteCollaborazione ^ pianteRicordo)
                {
                - backupColtivabili has fungoProposto:
                <i>{debugColtivabili: backupColtivabili contiene {fungoProposto} e per questo lo rimuovo}</i>
                    -> remove_fungo_proposto
                - backupColtivabili hasnt fungoProposto:
                <i>{debugColtivabili: backupColtivabili non contiene {fungoProposto} e per questo rilancio "results".}</i>
                    -> results
                }
        }
        
        
        
    - tipoColtivazioni == (indipendenza, ciclicità):{
        - LIST_RANDOM(pianteIndipendenza ^ pianteCiclicità) == ():
       <i>{debugColtivabili: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}</i>
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            <i>{debugColtivabili: Il fungo proposto è {fungoProposto}.}</i>   
            -> remove_fungo_proposto
            
        - else:
        <i>{debugColtivabili: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}</i>
            ~ fungoProposto = LIST_RANDOM(pianteIndipendenza ^ pianteCiclicità)
                {
                - backupColtivabili has fungoProposto:
                <i>{debugColtivabili: backupColtivabili contiene {fungoProposto} e per questo lo rimuovo}</i>
                    -> remove_fungo_proposto
                - backupColtivabili hasnt fungoProposto:
                <i>{debugColtivabili: backupColtivabili non contiene {fungoProposto} e per questo rilancio "results".}</i>
                    -> results
                }
        }
                
    - tipoColtivazioni == (indipendenza, novità):{
        - LIST_RANDOM(pianteIndipendenza ^ pianteNovità) == ():
        <i>{debugColtivabili: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}</i>
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            <i>{debugColtivabili: Il fungo proposto è {fungoProposto}.}</i>   
            -> remove_fungo_proposto
            
        - else:
        <i>{debugColtivabili: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}</i>
            ~ fungoProposto = LIST_RANDOM(pianteIndipendenza ^ pianteNovità)
                {
                - backupColtivabili has fungoProposto:
                <i>{debugColtivabili: backupColtivabili contiene {fungoProposto} e per questo lo rimuovo}</i>
                    -> remove_fungo_proposto
                - backupColtivabili hasnt fungoProposto:
                <i>{debugColtivabili: backupColtivabili non contiene {fungoProposto} e per questo rilancio "results".}</i>
                    -> results
                }
        }
        
    - tipoColtivazioni == (indipendenza, cancellazione): {
        - LIST_RANDOM(pianteIndipendenza ^ pianteCancellazione) == ():
        <i>{debugColtivabili: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}</i>
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            <i>{debugColtivabili: Il fungo proposto è {fungoProposto}.}</i>   
            -> remove_fungo_proposto
        - else:
        <i>{debugColtivabili: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}</i>
            ~ fungoProposto = LIST_RANDOM(pianteIndipendenza ^ pianteCancellazione)
                {
                - backupColtivabili has fungoProposto:
                <i>{debugColtivabili: backupColtivabili contiene {fungoProposto} e per questo lo rimuovo}</i>
                    -> remove_fungo_proposto
                - backupColtivabili hasnt fungoProposto:
                <i>{debugColtivabili: backupColtivabili non contiene {fungoProposto} e per questo rilancio "results".}</i>
                    -> results
                }
            }
        
    - tipoColtivazioni == (indipendenza, ricordo): {
        - LIST_RANDOM(pianteIndipendenza ^ pianteRicordo) == ():
        <i>{debugColtivabili: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}</i>
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            <i>{debugColtivabili: Il fungo proposto è {fungoProposto}.}</i>   
            -> remove_fungo_proposto
            
        - else:
        <i>{debugColtivabili: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}</i>
            ~ fungoProposto = LIST_RANDOM(pianteIndipendenza ^ pianteRicordo)
                {
                - backupColtivabili has fungoProposto:
                <i>{debugColtivabili: backupColtivabili contiene {fungoProposto} e per questo lo rimuovo}</i>
                    -> remove_fungo_proposto
                - backupColtivabili hasnt fungoProposto:
                <i>{debugColtivabili: backupColtivabili non contiene {fungoProposto} e per questo rilancio "results".}</i>
                    -> results
                }
        }
        
    - tipoColtivazioni == (ciclicità, cancellazione):{
        - LIST_RANDOM(pianteCiclicità ^ pianteCancellazione) == ():
        <i>{debugColtivabili: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}</i>
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            <i>{debugColtivabili: Il fungo proposto è {fungoProposto}.}</i>   
            -> remove_fungo_proposto
            
        - else:
        <i>{debugColtivabili: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}</i>
            ~ fungoProposto = LIST_RANDOM(pianteCiclicità ^ pianteCancellazione)
                {
                - backupColtivabili has fungoProposto:
                <i>{debugColtivabili: backupColtivabili contiene {fungoProposto} e per questo lo rimuovo}</i>
                    -> remove_fungo_proposto
                - backupColtivabili hasnt fungoProposto:
                <i>{debugColtivabili: backupColtivabili non contiene {fungoProposto} e per questo rilancio "results".}</i>
                    -> results
                }
        }
        
    - tipoColtivazioni == (ciclicità, ricordo):{
        - LIST_RANDOM(pianteCiclicità ^ pianteRicordo) == ():
        <i>{debugColtivabili: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}</i>
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            <i>{debugColtivabili: Il fungo proposto è {fungoProposto}.}</i>   
            -> remove_fungo_proposto
            
        - else:
        <i>{debugColtivabili: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}</i>
            ~ fungoProposto = LIST_RANDOM(pianteCiclicità ^ pianteRicordo)
                {
                - backupColtivabili has fungoProposto:
                <i>{debugColtivabili: backupColtivabili contiene {fungoProposto} e per questo lo rimuovo}</i>
                    -> remove_fungo_proposto
                - backupColtivabili hasnt fungoProposto:
                <i>{debugColtivabili: backupColtivabili non contiene {fungoProposto} e per questo rilancio "results".}</i>
                    -> results
                }
        }
        
    - tipoColtivazioni == (novità, cancellazione):{
        - LIST_RANDOM(pianteCancellazione ^ pianteNovità) == ():
        <i>{debugColtivabili: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}</i>
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            <i>{debugColtivabili: Il fungo proposto è {fungoProposto}.}</i>   
            -> remove_fungo_proposto
            
        - else:
        <i>{debugColtivabili: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}</i>
            ~ fungoProposto = LIST_RANDOM(pianteNovità ^ pianteCancellazione)
                {
                - backupColtivabili has fungoProposto:
                <i>{debugColtivabili: backupColtivabili contiene {fungoProposto} e per questo lo rimuovo}</i>
                    -> remove_fungo_proposto
                - backupColtivabili hasnt fungoProposto:
                <i>{debugColtivabili: backupColtivabili non contiene {fungoProposto} e per questo rilancio "results".}</i>
                    -> results
                }
        }
        
    - tipoColtivazioni == (novità, ricordo): {
        - LIST_RANDOM(pianteRicordo ^ pianteNovità) == ():
        <i>{debugColtivabili: Non ci sono elementi in comune tra le liste o una delle liste è vuota, e quindi pesco il coltivabile dal backup.}</i>
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            <i>{debugColtivabili: il fungo proposto è {fungoProposto}.}</i>   
            -> remove_fungo_proposto
            
        - else:
        <i>{debugColtivabili: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}</i>
            ~ fungoProposto = LIST_RANDOM(pianteNovità ^ pianteRicordo)
                {
                - backupColtivabili has fungoProposto:
                <i>{debugColtivabili: backupColtivabili contiene {fungoProposto} e per questo lo rimuovo}</i>
                    -> remove_fungo_proposto
                - backupColtivabili hasnt fungoProposto:
                <i>{debugColtivabili: backupColtivabili non contiene {fungoProposto} e per questo rilancio "results".}</i>
                    -> results
                }
        }
        
    
    - else:
    <i>{debugColtivabili: Passo da else nella lista tipoColtivazioni perché non c'è un fungo adatto.}</i>
         ~ fungoProposto = LIST_RANDOM(backupColtivabili)
         ~ backupColtivabili -= fungoProposto
    <i>{debugColtivabili: Il fungo proposto è {fungoProposto}.}</i>      
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
    ~ inCrescita = 1
    ~ firstAnswerTracker = ()
    ~ randomCounter = 0

 
 <i>{debugColtivabili: Entro in da_lista_a_coltivazioni. Il valore di counter è {counter}, il valore di inCrescita è {inCrescita}. firstQuest è {firstQuest}, secondQuest è {secondQuest}, thirdQuest è {thirdQuest}.}</i>
<i>{debugColtivabili: Gli elementi ancora coltivabili sono: {backupColtivabili}.}</i>
<i>{debugColtivabili: Svuoto lista tipo Coltivazioni. Il contenuto di tipo Coltivazioni ora è {tipoColtivazioni}.}</i>
<i>{debugColtivabili: Svuoto lista firstAnswerTracker. Il contenuto di tipo firstAnswerTracker ora è {firstAnswerTracker}.}</i>

{fungoProposto:
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
        //Se il trigger warning sul lutto è stato dichiarato, allora prendo un altro risultato.
            - lutto == true:
                -> non_ti_scordar_di_te
            - lutto == false:
                -> canto_delle_compagne
        }
        
}


-> main


=== remove_fungo_proposto
//Questa azione mi permette di rimuovere il fungo selezionato da ogni lista che lo può contenere. E dato che col tempo le liste possono aumentare, devo solo mettere un remove qui e non OVUNQUE XD
<i>{debugColtivabili: Passo dalla funzione remove_fungo_proposto e rimuovo {fungoProposto} da:}</i>
{
    - pianteRicordo has fungoProposto:
        ~ pianteRicordo -= fungoProposto
        <i>{debugColtivabili: piante ricordo.}</i>
}
{
    - pianteNovità has fungoProposto:    
        ~ pianteNovità -= fungoProposto
        <i>{debugColtivabili: piante novità.}</i>        
}
{
    - pianteCollaborazione has fungoProposto:
        ~ pianteCollaborazione -= fungoProposto
    <i>{debugColtivabili: piante collaborazione.}</i>    
}
{
    - pianteCiclicità has fungoProposto:
        ~ pianteCiclicità -= fungoProposto
    <i>{debugColtivabili: piante ciclicità.}</i>    
}
{
    - pianteIndipendenza has fungoProposto:
        ~ pianteIndipendenza -= fungoProposto
    <i>{debugColtivabili: piante indipendenza.}</i>    
}
{
    - pianteCancellazione has fungoProposto:
        ~ pianteCancellazione -= fungoProposto
    <i>{debugColtivabili: piante cancellazione.}</i>    
}
{
    - backupColtivabili has fungoProposto:
        ~ backupColtivabili -= fungoProposto
    <i>{debugColtivabili: backup Coltivabili.}</i>    
}
-> da_lista_a_coltivazioni