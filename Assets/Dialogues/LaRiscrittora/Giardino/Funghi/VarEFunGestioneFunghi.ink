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
VAR firstQuest = false
VAR secondQuest = false
VAR thirdQuest = false

//Variabili monitoraggio stato vegetali
VAR inCrescita = 0    

=== test_coltivazioni ===
<i>Sassi, foglie e acqua hanno qualcosa da raccontarti.</i>
<i>L'aria si muove tra le fronde, portandoti storie lontane.</i>
    -> test

=== test
<i>{debug: Sono passato da <i>test</i>.}</i>
<i>{debug: Gli elementi ancora coltivabili sono: {backupColtivabili}}</i>

{
    - counter < 2:
    <i>{debug: Counter ha valore {counter} e per questo vado a Random.}</i>
        -> random
    - counter == 2:
    <i>{debug: Counter ha valore {counter} e per questo vado a Results.}</i>
        -> results
}

= random
~ temp dice = RANDOM(1,3)
<i>{debug: Il dado ha valore {dice}}</i>
{
    - dice == 1: 
        {
            - firstQuest == false:
            <i>{debug: Il valore di firstQuest è {firstQuest}. Piante Collaborazione contiene: {pianteCollaborazione}. Piante Indipendenza contiene: {pianteIndipendenza} e per questo vado alla domanda.}</i>
                    -> first_question
            - else:
            {debug: Torno a random.}
                    -> random
        }
    
        
    - dice == 2:
        {
            -secondQuest == false:
            <i>{debug: Il valore di secondQuest è {secondQuest}. Piante Ciclicità contiene: {pianteCiclicità}. Piante Novità contiene: {pianteNovità} e per questo vado alla domanda.}</i>
                    -> second_question
            
            -secondQuest == true:
            {debug: Il valore di secondQuest è {secondQuest} e per questo torno a random.}
                    -> random
        }


        
    - dice == 3:
        {
            - thirdQuest == false:
                <i>{debug: Il valore di thirdQuest è {thirdQuest}. Piante Ricordo contiene: {pianteRicordo}. Piante Cancellazione contiene: {pianteCancellazione} e per questo vado alla domanda.}</i>    
                    -> third_question
                
            - thirdQuest == true:
                <i>{debug: Il valore di thirdQuest è {thirdQuest} e per questo torno a random.}</i>      
                    -> random
        }


    - else:
        <i>{debug: Il dado ha valore {dice} e non ci sono condizioni valide per proporre una delle tre domande, per cui vado a random.}</i>
                    -> random
}


    = first_question
     ~ firstQuest = true
         <i>{debug: Entro in first_question. {firstQuest: firstQuest ora = true|firstQuest = false}}</i>
 
        <i>Sul terreno le foglie e i sassi...</i>
            + [{~ Si sfiorano|Si perdono gli uni nelle altre}.]
                    ~ tipoColtivazioni += collaborazione
                    <i>{debug: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>
            + [{~ Si osservano distaccati|Difendono i propri confini}.]
                    ~ tipoColtivazioni += indipendenza
                    <i>{debug: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            -   
                ~ counter ++
                    -> test
    
    = second_question
    ~ secondQuest = true
        <i>{debug: Entro in second_question. {secondQuest: SecondQuest ora = true|SecondQuest = false}}</i>

        <i>L'aria...</i>
            + [{~ Insegue sé stessa, gioca con le foglie creando mulinelli|Ruota e ruzzola portando odori dal passato}.]
                    ~ tipoColtivazioni += ciclicità
                    <i>{debug: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            + [{~ È scoppiettante, fremente, carica di elettricità|Esplora cautamente ogni angolo della serra}.]
                    ~ tipoColtivazioni += novità
                    <i>{debug: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            -   
                ~ counter ++
                    -> test
    

    = third_question
     ~ thirdQuest = true
    <i>{debug: Entro in third_question. {thirdQuest: thirdQuest ora = true|thirdQuest = false}.}</i>
    
        <i>L'acqua...</i>
            + [{~ È ferma, mossa solo sulla superficie|È torbida|È piena di foglie e petali}.]
                    ~ tipoColtivazioni += ricordo
                    <i>{debug: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            + [{~ Scava, portando con sé il terriccio|Schiaccia foglie e sassi|La sua voce è potente}.]
                    ~ tipoColtivazioni += cancellazione
                    <i>{debug: tipoColtivazioni contiene ora {tipoColtivazioni}.}</i>                    
            -   
                ~ counter ++
                    -> test



 
 === results
<i>{debug: Entro in results.}</i>
<i>{debug: il valore di tipoColtivazioni è {tipoColtivazioni}.}</i>
 
    {
    - tipoColtivazioni == (collaborazione, ciclicità):{
    
        - pianteCollaborazione == () or pianteCiclicità == ():
            <i>{debug: Una delle liste è vuota, e quindi pesco il coltivabile dal backup.}</i>
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            <i>{debug: Il fungo proposto è {fungoProposto}.}</i>   
                -> remove_fungo_proposto
            
        - else: 
        <i>{debug: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}</i>
                ~ fungoProposto = LIST_RANDOM(pianteCollaborazione ^ pianteCiclicità)
                {
                    - backupColtivabili has fungoProposto:
                    <i>{debug: backupColtivabili contiene {fungoProposto} e per questo lo rimuovo}</i>
                        -> remove_fungo_proposto
                    //Questo è un check extra: non dovrebbe mai accadere, ma non si sa mai.    
                    - backupColtivabili hasnt fungoProposto:
                    <i>{debug: backupColtivabili non contiene {fungoProposto} e per questo rilancio "results".}</i>
                        -> results
                }
    }
        
        
    - tipoColtivazioni == (collaborazione, novità): {
        - pianteCollaborazione == () or pianteNovità == ():
            <i>{debug: Una delle liste è vuota, e quindi pesco il coltivabile dal backup.}</i>         
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            <i>{debug: Il fungo proposto è {fungoProposto}.}</i>   
            -> remove_fungo_proposto
            
        - else:
        <i>{debug: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}</i>
                ~ fungoProposto = LIST_RANDOM(pianteCollaborazione ^ pianteNovità)
                {
                - backupColtivabili has fungoProposto:
                <i>{debug: backupColtivabili contiene {fungoProposto} e per questo lo rimuovo}</i>
                    -> remove_fungo_proposto
                - backupColtivabili hasnt fungoProposto:
                <i>{debug: backupColtivabili non contiene {fungoProposto} e per questo rilancio "results".}</i>
                    -> results
                }
        }
        
        
    - tipoColtivazioni == (collaborazione, cancellazione):{
        - pianteCollaborazione == () or pianteCancellazione == ():
        <i>{debug: Una delle liste è vuota, e quindi pesco il coltivabile dal backup.}</i>
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            <i>{debug: Il fungo proposto è {fungoProposto}.}</i>   
            -> remove_fungo_proposto
            
        - else:
        <i>{debug: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}</i>
            ~ fungoProposto = LIST_RANDOM(pianteCollaborazione ^ pianteCancellazione)
                {
                - backupColtivabili has fungoProposto:
                <i>{debug: backupColtivabili contiene {fungoProposto} e per questo lo rimuovo}</i>
                    -> remove_fungo_proposto
                - backupColtivabili hasnt fungoProposto:
                <i>{debug: backupColtivabili non contiene {fungoProposto} e per questo rilancio "results".}</i>
                    -> results
                }
        }
        
        
    - tipoColtivazioni == (collaborazione, ricordo):{
        - pianteCollaborazione == () or pianteRicordo == ():
        <i>{debug: Una delle liste è vuota, e quindi pesco il coltivabile dal backup.}</i>
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            <i>{debug: Il fungo proposto è {fungoProposto}.}</i>   
            -> remove_fungo_proposto
            
        - else:
        <i>{debug: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}</i>
            ~ fungoProposto = LIST_RANDOM(pianteCollaborazione ^ pianteRicordo)
                {
                - backupColtivabili has fungoProposto:
                <i>{debug: backupColtivabili contiene {fungoProposto} e per questo lo rimuovo}</i>
                    -> remove_fungo_proposto
                - backupColtivabili hasnt fungoProposto:
                <i>{debug: backupColtivabili non contiene {fungoProposto} e per questo rilancio "results".}</i>
                    -> results
                }
        }
        
        
        
    - tipoColtivazioni == (indipendenza, ciclicità):{
        - pianteIndipendenza == () or pianteCiclicità == ():
        <i>{debug: Una delle liste è vuota, e quindi pesco il coltivabile dal backup.}</i>
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            <i>{debug: Il fungo proposto è {fungoProposto}.}</i>   
            -> remove_fungo_proposto
            
        - else:
        <i>{debug: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}</i>
            ~ fungoProposto = LIST_RANDOM(pianteIndipendenza ^ pianteCiclicità)
                {
                - backupColtivabili has fungoProposto:
                <i>{debug: backupColtivabili contiene {fungoProposto} e per questo lo rimuovo}</i>
                    -> remove_fungo_proposto
                - backupColtivabili hasnt fungoProposto:
                <i>{debug: backupColtivabili non contiene {fungoProposto} e per questo rilancio "results".}</i>
                    -> results
                }
        }
                
    - tipoColtivazioni == (indipendenza, novità):{
        - pianteIndipendenza == () or pianteNovità == ():
        <i>{debug: Una delle liste è vuota, e quindi pesco il coltivabile dal backup.}</i>
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            <i>{debug: Il fungo proposto è {fungoProposto}.}</i>   
            -> remove_fungo_proposto
            
        - else:
        <i>{debug: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}</i>
            ~ fungoProposto = LIST_RANDOM(pianteIndipendenza ^ pianteNovità)
                {
                - backupColtivabili has fungoProposto:
                <i>{debug: backupColtivabili contiene {fungoProposto} e per questo lo rimuovo}</i>
                    -> remove_fungo_proposto
                - backupColtivabili hasnt fungoProposto:
                <i>{debug: backupColtivabili non contiene {fungoProposto} e per questo rilancio "results".}</i>
                    -> results
                }
        }
        
    - tipoColtivazioni == (indipendenza, cancellazione): {
        - pianteCancellazione == () or pianteIndipendenza == ():
        <i>{debug: Una delle liste è vuota, e quindi pesco il coltivabile dal backup.}</i>
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            <i>{debug: Il fungo proposto è {fungoProposto}.}</i>   
            -> remove_fungo_proposto
        - else:
        <i>{debug: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}</i>
            ~ fungoProposto = LIST_RANDOM(pianteIndipendenza ^ pianteCancellazione)
                {
                - backupColtivabili has fungoProposto:
                <i>{debug: backupColtivabili contiene {fungoProposto} e per questo lo rimuovo}</i>
                    -> remove_fungo_proposto
                - backupColtivabili hasnt fungoProposto:
                <i>{debug: backupColtivabili non contiene {fungoProposto} e per questo rilancio "results".}</i>
                    -> results
                }
            }
        
    - tipoColtivazioni == (indipendenza, ricordo): {
        - pianteRicordo == () or pianteIndipendenza == ():
        <i>{debug: Una delle liste è vuota, e quindi pesco il coltivabile dal backup.}</i>
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            <i>{debug: Il fungo proposto è {fungoProposto}.}</i>   
            -> remove_fungo_proposto
            
        - else:
        <i>{debug: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}</i>
            ~ fungoProposto = LIST_RANDOM(pianteIndipendenza ^ pianteRicordo)
                {
                - backupColtivabili has fungoProposto:
                <i>{debug: backupColtivabili contiene {fungoProposto} e per questo lo rimuovo}</i>
                    -> remove_fungo_proposto
                - backupColtivabili hasnt fungoProposto:
                <i>{debug: backupColtivabili non contiene {fungoProposto} e per questo rilancio "results".}</i>
                    -> results
                }
        }
        
    - tipoColtivazioni == (ciclicità, cancellazione):{
        - pianteCancellazione == () or pianteCiclicità == ():
        <i>{debug: Una delle liste è vuota, e quindi pesco il coltivabile dal backup.}</i>
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            <i>{debug: Il fungo proposto è {fungoProposto}.}</i>   
            -> remove_fungo_proposto
            
        - else:
        <i>{debug: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}</i>
            ~ fungoProposto = LIST_RANDOM(pianteCiclicità ^ pianteCancellazione)
                {
                - backupColtivabili has fungoProposto:
                <i>{debug: backupColtivabili contiene {fungoProposto} e per questo lo rimuovo}</i>
                    -> remove_fungo_proposto
                - backupColtivabili hasnt fungoProposto:
                <i>{debug: backupColtivabili non contiene {fungoProposto} e per questo rilancio "results".}</i>
                    -> results
                }
        }
        
    - tipoColtivazioni == (ciclicità, ricordo):{
        - pianteRicordo == () or pianteCiclicità == ():
        <i>{debug: Una delle liste è vuota, e quindi pesco il coltivabile dal backup.}</i>
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            <i>{debug: Il fungo proposto è {fungoProposto}.}</i>   
            -> remove_fungo_proposto
            
        - else:
        <i>{debug: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}</i>
            ~ fungoProposto = LIST_RANDOM(pianteCiclicità ^ pianteRicordo)
                {
                - backupColtivabili has fungoProposto:
                <i>{debug: backupColtivabili contiene {fungoProposto} e per questo lo rimuovo}</i>
                    -> remove_fungo_proposto
                - backupColtivabili hasnt fungoProposto:
                <i>{debug: backupColtivabili non contiene {fungoProposto} e per questo rilancio "results".}</i>
                    -> results
                }
        }
        
    - tipoColtivazioni == (novità, cancellazione):{
        - pianteCancellazione == () or pianteNovità == ():
        <i>{debug: Una delle liste è vuota, e quindi pesco il coltivabile dal backup.}</i>
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            <i>{debug: Il fungo proposto è {fungoProposto}.}</i>   
            -> remove_fungo_proposto
            
        - else:
        <i>{debug: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}</i>
            ~ fungoProposto = LIST_RANDOM(pianteNovità ^ pianteCancellazione)
                {
                - backupColtivabili has fungoProposto:
                <i>{debug: backupColtivabili contiene {fungoProposto} e per questo lo rimuovo}</i>
                    -> remove_fungo_proposto
                - backupColtivabili hasnt fungoProposto:
                <i>{debug: backupColtivabili non contiene {fungoProposto} e per questo rilancio "results".}</i>
                    -> results
                }
        }
        
    - tipoColtivazioni == (novità, ricordo): {
        - pianteRicordo == () or pianteNovità == ():
        <i>{debug: Una delle liste è vuota, e quindi pesco il coltivabile dal backup.}</i>
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            <i>{debug: il fungo proposto è {fungoProposto}.}</i>   
            -> remove_fungo_proposto
            
        - else:
        <i>{debug: Le due liste hanno ancora elementi coltivabili, e per questo pesco dalla loro intersezione.}</i>
            ~ fungoProposto = LIST_RANDOM(pianteNovità ^ pianteRicordo)
                {
                - backupColtivabili has fungoProposto:
                <i>{debug: backupColtivabili contiene {fungoProposto} e per questo lo rimuovo}</i>
                    -> remove_fungo_proposto
                - backupColtivabili hasnt fungoProposto:
                <i>{debug: backupColtivabili non contiene {fungoProposto} e per questo rilancio "results".}</i>
                    -> results
                }
        }
        
    
    - else:
    <i>{debug: Passo da else nella lista tipoColtivazioni perché non c'è un fungo adatto.}</i>
         ~ fungoProposto = LIST_RANDOM(backupColtivabili)
         ~ backupColtivabili -= fungoProposto
    <i>{debug: Il fungo proposto è {fungoProposto}.}</i>      
        -> remove_fungo_proposto
    
    }
    
 
 
-> da_lista_a_coltivazioni
 
 


=== da_lista_a_coltivazioni ===
 ~ tipoColtivazioni = ()
 ~ firstQuest = false
 ~ secondQuest = false
 ~ thirdQuest = false
 ~ counter = 0
 ~ inCrescita = 1
 <i>{debug: Entro in da_lista_a_coltivazioni. Il valore di counter è {counter}, il valore di inCrescita è {inCrescita}. firstQuest è {firstQuest}, secondQuest è {secondQuest}, thirdQuest è {thirdQuest}.}</i>
<i>{debug: Gli elementi ancora coltivabili sono: {backupColtivabili}.}</i>
<i>{debug: Svuoto lista tipo Coltivazioni. Il contenuto di tipo Coltivazioni ora è {tipoColtivazioni}.}</i>

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
<i>{debug: Passo dalla funzione remove_fungo_proposto e rimuovo {fungoProposto} da tutte le liste che lo contengono}
{
    - pianteRicordo has fungoProposto:
        ~ pianteRicordo -= fungoProposto
    - pianteNovità has fungoProposto:    
        ~ pianteNovità -= fungoProposto
    - pianteCollaborazione has fungoProposto:
        ~ pianteCollaborazione -= fungoProposto
    - pianteCiclicità has fungoProposto:
        ~ pianteCiclicità -= fungoProposto
    - pianteIndipendenza has fungoProposto:
        ~ pianteIndipendenza -= fungoProposto
    - pianteCancellazione has fungoProposto:
        ~ pianteCancellazione -= fungoProposto
    - backupColtivabili has fungoProposto:
        ~ backupColtivabili -= fungoProposto
}
-> da_lista_a_coltivazioni