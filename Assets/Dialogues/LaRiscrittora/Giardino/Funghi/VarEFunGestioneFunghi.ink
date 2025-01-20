//Variabili per la gestione della serra

//VAR coltivazioni = (LicheneDegliAbissi, MuschioDelleAmanti, CantoDelleCompagne, LaSpazzata, BaccaDellaAddolorata, NonTiScordarDiTe)

LIST tipoColtivazioni = collaborazione, ciclicità, novità, cancellazione, ricordo, indipendenza

VAR pianteCollaborazione = (LicheneDegliAbissi, MuschioDelleAmanti, CantoDelleCompagne, BrinaDellImpossibile)
VAR pianteCiclicità = (LicheneDegliAbissi, CantoDelleCompagne, NonTiScordarDiTe)
VAR pianteIndipendenza = (LaSpazzata, BaccaDellaAddolorata, NonTiScordarDiTe)
VAR pianteNovità =(MuschioDelleAmanti,LaSpazzata, BaccaDellaAddolorata, BrinaDellImpossibile)
VAR pianteRicordo =(MuschioDelleAmanti, CantoDelleCompagne, NonTiScordarDiTe, BrinaDellImpossibile)
VAR pianteCancellazione =(LicheneDegliAbissi,LaSpazzata, BaccaDellaAddolorata)

//Questa la uso per fare in modo che fintanto che c'è almeno un fungo pescabile, questo venga estratto.
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
{debug: Sono passato da <i>test</i>.}
{debug: Gli elementi ancora coltivabili sono: {backupColtivabili}}

{
    - counter < 2:
    {debug: Counter ha valore {counter} e per questo vado a Random.}
        -> random
    - counter == 2:
    {debug: Counter ha valore {counter} e per questo vado a Results.}
        -> results
}

= random
~ temp dice = RANDOM(1,3)
{debug: Il dado ha valore {dice}}
{
    - dice == 1: 
        {
            - firstQuest == false:
            {debug: Il valore di firstQuest è {firstQuest} {pianteCollaborazione} e {pianteIndipendenza} e per questo vado alla domanda.}
                    -> first_question
            - else:
            {debug: Torno a random.}
                    -> random
        }
    
        
    - dice == 2:
        {
            -secondQuest == false:
            {debug: Il valore di secondQuest è {secondQuest} e {pianteCiclicità} e {pianteNovità} e per questo vado alla domanda.}
                    -> second_question
            
            -secondQuest == true:
            {debug: Il valore di secondQuest è {secondQuest} e per questo torno a random.}    
                    -> random
        }


        
    - dice == 3:
        {
            - thirdQuest == false:
                {debug: Il valore di thirdQuest è {thirdQuest} e {pianteRicordo} e {pianteCancellazione} e per questo vado alla domanda.}        
                    -> third_question
                
            - thirdQuest == true:
                {debug: Il valore di thirdQuest è {thirdQuest} e per questo torno a random.}           
                    -> random
        }


    - else:
        {debug: Il dado ha valore {dice} e non ci sono condizioni valide per proporre una delle tre domande, per cui vado a random.}
                    -> random
}


    = first_question
     ~ firstQuest = true
         {debug: Entro in first_question. {firstQuest: firstQuest ora = true|firstQuest = false}}
 
        <i>Sul terreno le foglie e i sassi...</i>
            + [{~ Si sfiorano|Si perdono gli uni nelle altre}.]
                    ~ tipoColtivazioni += collaborazione
                    {debug: tipoColtivazioni contiene ora {tipoColtivazioni}.}
            + [{~ Si osservano distaccati|Difendono i propri confini}.]
                    ~ tipoColtivazioni += indipendenza
                    {debug: tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            -   
                ~ counter ++
                    -> test
    
    = second_question
    ~ secondQuest = true
        {debug: Entro in second_question. {secondQuest: SecondQuest ora = true|SecondQuest = false}}

        <i>L'aria...</i>
            + [{~ Insegue sé stessa, gioca con le foglie creando mulinelli|Ruota e ruzzola portando odori dal passato}.]
                    ~ tipoColtivazioni += ciclicità
                    {debug: tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            + [{~ È scoppiettante, fremente, carica di elettricità|Esplora cautamente ogni angolo della serra}.]
                    ~ tipoColtivazioni += novità
                    {debug: tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            -   
                ~ counter ++
                    -> test
    

    = third_question
     ~ thirdQuest = true
    {debug: Entro in third_question. {thirdQuest: thirdQuest ora = true|thirdQuest = false}.}
    
        <i>L'acqua...</i>
            + [{~ È ferma, mossa solo sulla superficie|È torbida|È piena di foglie e petali}.]
                    ~ tipoColtivazioni += ricordo
                    {debug: tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            + [{~ Scava, portando con sé il terriccio|Schiaccia foglie e sassi|La sua voce è potente}.]
                    ~ tipoColtivazioni += cancellazione
                    {debug: tipoColtivazioni contiene ora {tipoColtivazioni}.}                    
            -   
                ~ counter ++
                    -> test



 
 === results
{debug: <i>Entro in results</i>}
 
    {
    - tipoColtivazioni == (collaborazione, ciclicità):{
        - pianteCollaborazione == () or pianteCiclicità == ():
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            ~ backupColtivabili -= fungoProposto
            {
            //In questo modo evito di levarlo dal backup ma non dalle singole liste, portando al rischio di riproporlo
                - pianteCollaborazione has fungoProposto:
                    ~ pianteCollaborazione -= fungoProposto
                - pianteCiclicità has fungoProposto:
                    ~ pianteCiclicità -= fungoProposto                    
            }
            -> da_lista_a_coltivazioni
        - else: 
        {debug: il valore di tipoColtivazioni è {tipoColtivazioni}.}
            ~ fungoProposto = LIST_RANDOM(pianteCollaborazione ^ pianteCiclicità)
            ~ pianteCollaborazione -= fungoProposto
            ~ pianteCiclicità -= fungoProposto
            ~ backupColtivabili -= fungoProposto
        {debug: il fungo proposto è {fungoProposto}.}
        -> da_lista_a_coltivazioni
        }
        
        
    - tipoColtivazioni == (collaborazione, novità): {
        - pianteCollaborazione == () or pianteNovità == ():
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            ~ backupColtivabili -= fungoProposto
            {
                - pianteCollaborazione has fungoProposto:
                    ~ pianteCollaborazione -= fungoProposto
                - pianteNovità has fungoProposto:
                    ~ pianteNovità -= fungoProposto 
            }            
            -> da_lista_a_coltivazioni
        - else: 
            {debug: il valore di tipoColtivazioni è {tipoColtivazioni}.}
                ~ fungoProposto = LIST_RANDOM(pianteCollaborazione ^ pianteNovità)
                ~ pianteCollaborazione -= fungoProposto
                ~ pianteNovità -= fungoProposto
                ~ backupColtivabili -= fungoProposto
            {debug: il fungo proposto è {fungoProposto}.}    
                -> da_lista_a_coltivazioni
        }
        
        
    - tipoColtivazioni == (collaborazione, cancellazione):{
        - pianteCollaborazione == () or pianteCancellazione == ():
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            ~ backupColtivabili -= fungoProposto
            {
                - pianteCollaborazione has fungoProposto:
                    ~ pianteCollaborazione -= fungoProposto
                - pianteCancellazione has fungoProposto:
                    ~ pianteCancellazione -= fungoProposto          
            }            
            -> da_lista_a_coltivazioni
        - else: 
        {debug: il valore di tipoColtivazioni è {tipoColtivazioni}.}
            ~ fungoProposto = LIST_RANDOM(pianteCollaborazione ^ pianteCancellazione)
            ~ pianteCollaborazione -= fungoProposto
            ~ pianteCancellazione -= fungoProposto
            ~ backupColtivabili -= fungoProposto
    {debug: il fungo proposto è {fungoProposto}.}    
        -> da_lista_a_coltivazioni
        }
        
        
    - tipoColtivazioni == (collaborazione, ricordo):{
        - pianteCollaborazione == () or pianteRicordo == ():
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            ~ backupColtivabili -= fungoProposto
            {
                - pianteCollaborazione has fungoProposto:
                    ~ pianteCollaborazione -= fungoProposto
                - pianteRicordo has fungoProposto:
                    ~ pianteRicordo -= fungoProposto          
            }              
            -> da_lista_a_coltivazioni
        - else: 
        {debug: il valore di tipoColtivazioni è {tipoColtivazioni}.}
            ~ fungoProposto = LIST_RANDOM(pianteCollaborazione ^ pianteRicordo)
            ~ pianteCollaborazione -= fungoProposto
            ~ pianteRicordo -= fungoProposto
            ~ backupColtivabili -= fungoProposto
        {debug: il fungo proposto è {fungoProposto}.}    
            -> da_lista_a_coltivazioni
        }
        
        
        
    - tipoColtivazioni == (indipendenza, ciclicità):{
        - pianteIndipendenza == () or pianteCiclicità == ():
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            ~ backupColtivabili -= fungoProposto
                {
                - pianteIndipendenza has fungoProposto:
                    ~ pianteIndipendenza -= fungoProposto
                - pianteCiclicità has fungoProposto:
                    ~ pianteCiclicità -= fungoProposto          
            }          
            -> da_lista_a_coltivazioni
        - else: 
        {debug: il valore di tipoColtivazioni è {tipoColtivazioni}.}
            ~ fungoProposto = LIST_RANDOM(pianteIndipendenza ^ pianteCiclicità)
            ~ pianteCiclicità -= fungoProposto
            ~ pianteIndipendenza -= fungoProposto
            ~ backupColtivabili -= fungoProposto
        {debug: il fungo proposto è {fungoProposto}.}    
            -> da_lista_a_coltivazioni
        }
                
    - tipoColtivazioni == (indipendenza, novità):{
        - pianteIndipendenza == () or pianteNovità == ():
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            ~ backupColtivabili -= fungoProposto
            {
                - pianteIndipendenza has fungoProposto:
                    ~ pianteIndipendenza -= fungoProposto
                - pianteNovità has fungoProposto:
                    ~ pianteNovità -= fungoProposto          
            }              
            -> da_lista_a_coltivazioni
        - else: 
        {debug: il valore di tipoColtivazioni è {tipoColtivazioni}.}
            ~ fungoProposto = LIST_RANDOM(pianteIndipendenza ^ pianteNovità)
            ~ pianteNovità -= fungoProposto
            ~ pianteIndipendenza -= fungoProposto
            ~ backupColtivabili -= fungoProposto
        {debug: il fungo proposto è {fungoProposto}.}    
            -> da_lista_a_coltivazioni
        }
        
    - tipoColtivazioni == (indipendenza, cancellazione): {
        - pianteCancellazione == () or pianteIndipendenza == ():
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            ~ backupColtivabili -= fungoProposto
            {
                - pianteIndipendenza has fungoProposto:
                    ~ pianteIndipendenza -= fungoProposto
                - pianteCancellazione has fungoProposto:
                    ~ pianteCancellazione -= fungoProposto          
            }              
            -> da_lista_a_coltivazioni
        - else: 
        {debug: il valore di tipoColtivazioni è {tipoColtivazioni}.}
            ~ fungoProposto = LIST_RANDOM(pianteIndipendenza ^ pianteCancellazione)
            ~ pianteCancellazione -= fungoProposto  
            ~ pianteIndipendenza -= fungoProposto
            ~ backupColtivabili -= fungoProposto
        {debug: il fungo proposto è {fungoProposto}.}    
            -> da_lista_a_coltivazioni
        }
        
    - tipoColtivazioni == (indipendenza, ricordo): {
        - pianteRicordo == () or pianteIndipendenza == ():
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            ~ backupColtivabili -= fungoProposto
            {
                - pianteIndipendenza has fungoProposto:
                    ~ pianteIndipendenza -= fungoProposto
                - pianteRicordo has fungoProposto:
                    ~ pianteRicordo -= fungoProposto          
            }              
            -> da_lista_a_coltivazioni
        - else: 
        {debug: il valore di tipoColtivazioni è {tipoColtivazioni}.}
            ~ fungoProposto = LIST_RANDOM(pianteIndipendenza ^ pianteRicordo)
            ~ pianteIndipendenza -= fungoProposto
            ~ pianteRicordo -= fungoProposto
            ~ backupColtivabili -= fungoProposto
        {debug: il fungo proposto è {fungoProposto}.}    
        -> da_lista_a_coltivazioni
        }
        
    - tipoColtivazioni == (ciclicità, cancellazione):{
        - pianteCancellazione == () or pianteCiclicità == ():
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            ~ backupColtivabili -= fungoProposto
            {
                - pianteCancellazione has fungoProposto:
                    ~ pianteCancellazione -= fungoProposto
                - pianteCiclicità has fungoProposto:
                    ~ pianteCiclicità -= fungoProposto          
            }              
            -> da_lista_a_coltivazioni
        - else: 
        {debug: il valore di tipoColtivazioni è {tipoColtivazioni}.}
            ~ fungoProposto = LIST_RANDOM(pianteCiclicità ^ pianteCancellazione)
            ~ pianteCancellazione -= fungoProposto
            ~ pianteCiclicità -= fungoProposto
            ~ backupColtivabili -= fungoProposto
        {debug: il fungo proposto è {fungoProposto}.}    
        -> da_lista_a_coltivazioni
        }
        
    - tipoColtivazioni == (ciclicità, ricordo):{
        - pianteRicordo == () or pianteCiclicità == ():
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            ~ backupColtivabili -= fungoProposto
            {
                - pianteRicordo has fungoProposto:
                    ~ pianteRicordo -= fungoProposto
                - pianteCiclicità has fungoProposto:
                    ~ pianteCiclicità -= fungoProposto          
            }              
            -> da_lista_a_coltivazioni
        - else: 
        {debug: il valore di tipoColtivazioni è {tipoColtivazioni}.}
            ~ fungoProposto = LIST_RANDOM(pianteCiclicità ^ pianteRicordo)
            ~ pianteRicordo -= fungoProposto
            ~ pianteCiclicità -= fungoProposto
            ~ backupColtivabili -= fungoProposto
        {debug: il fungo proposto è {fungoProposto}.}    
        -> da_lista_a_coltivazioni
        }
        
    - tipoColtivazioni == (novità, cancellazione):{
        - pianteCancellazione == () or pianteNovità == ():
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            ~ backupColtivabili -= fungoProposto
                {
                - pianteCancellazione has fungoProposto:
                    ~ pianteCancellazione -= fungoProposto
                - pianteNovità has fungoProposto:
                    ~ pianteNovità -= fungoProposto          
            }          
            -> da_lista_a_coltivazioni
        - else: 
        {debug: il valore di tipoColtivazioni è {tipoColtivazioni}.}
            ~ fungoProposto = LIST_RANDOM(pianteNovità ^ pianteCancellazione)
            ~ pianteCancellazione -= fungoProposto
            ~ pianteNovità -= fungoProposto
            ~ backupColtivabili -= fungoProposto
        {debug: il fungo proposto è {fungoProposto}.}    
            -> da_lista_a_coltivazioni
        }
        
    - tipoColtivazioni == (novità, ricordo): {
        - pianteRicordo == () or pianteNovità == ():
            ~ fungoProposto = LIST_RANDOM(backupColtivabili)
            ~ backupColtivabili -= fungoProposto
            {
                - pianteRicordo has fungoProposto:
                    ~ pianteRicordo -= fungoProposto
                - pianteCiclicità has fungoProposto:
                    ~ pianteNovità -= fungoProposto          
            }              
            -> da_lista_a_coltivazioni
        - else: 
        {debug: il valore di tipoColtivazioni è {tipoColtivazioni}.}
            ~ fungoProposto = LIST_RANDOM(pianteNovità ^ pianteRicordo)
            ~ pianteRicordo -= fungoProposto
            ~ pianteNovità -= fungoProposto
            ~ backupColtivabili -= fungoProposto
        {debug: il fungo proposto è {fungoProposto}.}    
        -> da_lista_a_coltivazioni    
        }
        
    
    - else:
    {debug: Passo da else nella lista tipoColtivazioni perché non c'è un fungo adatto.}
         ~ fungoProposto = LIST_RANDOM(backupColtivabili)
         ~ backupColtivabili -= fungoProposto
    {debug: il fungo proposto è {fungoProposto}.}     
        -> da_lista_a_coltivazioni
    
    }
    
 
 
-> da_lista_a_coltivazioni
 
 


=== da_lista_a_coltivazioni ===
 ~ tipoColtivazioni = ()
 ~ firstQuest = false
 ~ secondQuest = false
 ~ thirdQuest = false
 ~ counter = 0
 ~ inCrescita = 1
 {debug: Entro in da_lista_a_coltivazioni. Il valore di counter è {counter}, il valore di inCrescita è {inCrescita}. firstQuest è {firstQuest}, secondQuest è {secondQuest}, thirdQuest è {thirdQuest}}
{debug: Gli elementi ancora coltivabili sono: {backupColtivabili}}
{debug: Svuoto lista tipo Coltivazioni. Il contenuto di tipo Coltivazioni ora è {tipoColtivazioni}}

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