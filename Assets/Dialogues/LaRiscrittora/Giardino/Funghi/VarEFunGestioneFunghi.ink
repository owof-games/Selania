//Variabili per la gestione della serra

//VAR coltivazioni = (LicheneDegliAbissi, MuschioDelleAmanti, CantoDelleCompagne, LaSpazzata, BaccaDellaAddolorata, NonTiScordarDiTe)

LIST tipoColtivazioni = collaborazione, ciclicità, novità, cancellazione, ricordo, indipendenza

VAR pianteCollaborazione = (LicheneDegliAbissi, MuschioDelleAmanti, CantoDelleCompagne, BrinaDellImpossibile)
VAR pianteCiclicità = (LicheneDegliAbissi, CantoDelleCompagne, NonTiScordarDiTe)
VAR pianteIndipendenza = (LaSpazzata, BaccaDellaAddolorata, NonTiScordarDiTe)
VAR pianteNovità =(MuschioDelleAmanti,LaSpazzata, BaccaDellaAddolorata, BrinaDellImpossibile)
VAR pianteRicordo =(MuschioDelleAmanti, CantoDelleCompagne, NonTiScordarDiTe, BrinaDellImpossibile)
VAR pianteCancellazione =(LicheneDegliAbissi,LaSpazzata, BaccaDellaAddolorata)

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
            {debug: Il valore di firstQuest è {firstQuest} e per questo vado alla domanda.}
                    -> first_question
            - firstQuest == true:
            {debug: Il valore di firstQuest è {firstQuest} e per questo torno a random.}
                    -> random
        }
    
        
    - dice == 2:
        {
            -secondQuest == false:
            {debug: Il valore di secondQuest è {secondQuest} e per questo vado alla domanda.}
                    -> second_question
            
            -secondQuest == true:
            {debug: Il valore di secondQuest è {secondQuest} e per questo torno a random.}    
                    -> random
        }


        
    - dice == 3:
        {
            - thirdQuest == false:
                {debug: Il valore di thirdQuest è {thirdQuest} e per questo vado alla domanda.}        
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
{debug: Entro in results}
 
    {
    - tipoColtivazioni == (collaborazione, ciclicità):
    {debug: il valore di tipoColtivazioni è {tipoColtivazioni}.}
        ~ fungoProposto = LIST_RANDOM(pianteCollaborazione ^ pianteCiclicità)
    {debug: il fungo proposto è {fungoProposto}.}
        -> da_lista_a_coltivazioni
        
    - tipoColtivazioni == (collaborazione, novità):
    {debug: il valore di tipoColtivazioni è {tipoColtivazioni}.}
        ~ fungoProposto = LIST_RANDOM(pianteCollaborazione ^ pianteNovità)
    {debug: il fungo proposto è {fungoProposto}.}    
        -> da_lista_a_coltivazioni    
        
    - tipoColtivazioni == (collaborazione, cancellazione):
    {debug: il valore di tipoColtivazioni è {tipoColtivazioni}.}
        ~ fungoProposto = LIST_RANDOM(pianteCollaborazione ^ pianteCancellazione)
    {debug: il fungo proposto è {fungoProposto}.}    
        -> da_lista_a_coltivazioni
        
    - tipoColtivazioni == (collaborazione, ricordo):
    {debug: il valore di tipoColtivazioni è {tipoColtivazioni}.}
        ~ fungoProposto = LIST_RANDOM(pianteCollaborazione ^ pianteRicordo)
    {debug: il fungo proposto è {fungoProposto}.}    
        -> da_lista_a_coltivazioni
        
        
    - tipoColtivazioni == (indipendenza, ciclicità):
    {debug: il valore di tipoColtivazioni è {tipoColtivazioni}.}
        ~ fungoProposto = LIST_RANDOM(pianteIndipendenza ^ pianteCiclicità)
    {debug: il fungo proposto è {fungoProposto}.}    
        -> da_lista_a_coltivazioni
                
    - tipoColtivazioni == (indipendenza, novità):
    {debug: il valore di tipoColtivazioni è {tipoColtivazioni}.}
        ~ fungoProposto = LIST_RANDOM(pianteIndipendenza ^ pianteNovità)
    {debug: il fungo proposto è {fungoProposto}.}    
        -> da_lista_a_coltivazioni
        
    - tipoColtivazioni == (indipendenza, cancellazione):
    {debug: il valore di tipoColtivazioni è {tipoColtivazioni}.}
            ~ fungoProposto = LIST_RANDOM(pianteIndipendenza ^ pianteCancellazione)
    {debug: il fungo proposto è {fungoProposto}.}    
        -> da_lista_a_coltivazioni
        
    - tipoColtivazioni == (indipendenza, ricordo):
    {debug: il valore di tipoColtivazioni è {tipoColtivazioni}.}
        ~ fungoProposto = LIST_RANDOM(pianteIndipendenza ^ pianteRicordo)
    {debug: il fungo proposto è {fungoProposto}.}    
        -> da_lista_a_coltivazioni
        
    - tipoColtivazioni == (ciclicità, cancellazione):
    {debug: il valore di tipoColtivazioni è {tipoColtivazioni}.}
        ~ fungoProposto = LIST_RANDOM(pianteCiclicità ^ pianteCancellazione)
    {debug: il fungo proposto è {fungoProposto}.}    
        -> da_lista_a_coltivazioni
        
    - tipoColtivazioni == (ciclicità, ricordo):
    {debug: il valore di tipoColtivazioni è {tipoColtivazioni}.}
        ~ fungoProposto = LIST_RANDOM(pianteCiclicità ^ pianteRicordo)
    {debug: il fungo proposto è {fungoProposto}.}    
        -> da_lista_a_coltivazioni
        
    - tipoColtivazioni == (novità, cancellazione):
    {debug: il valore di tipoColtivazioni è {tipoColtivazioni}.}
        ~ fungoProposto = LIST_RANDOM(pianteNovità ^ pianteCancellazione)
    {debug: il fungo proposto è {fungoProposto}.}    
        -> da_lista_a_coltivazioni
        
    - tipoColtivazioni == (novità, ricordo):
    {debug: il valore di tipoColtivazioni è {tipoColtivazioni}.}
        ~ fungoProposto = LIST_RANDOM(pianteNovità ^ pianteRicordo)
    {debug: il fungo proposto è {fungoProposto}.}    
        -> da_lista_a_coltivazioni    
        
    - else:
    {debug: Passo da else nella lista tipoColtivazioni perché non c'è un fungo adatto.}
         ~ fungoProposto = LIST_RANDOM(mushrooms)
    {debug: il fungo proposto è {fungoProposto}.}     
        -> da_lista_a_coltivazioni
    }
    
 
 
-> da_lista_a_coltivazioni
 
 


=== da_lista_a_coltivazioni ===
<i>Qualcosa sta crescendo. Torna tra un po'.</i>
 ~ tipoColtivazioni = ()
 ~ firstQuest = false
 ~ secondQuest = false
 ~ thirdQuest = false
 ~ counter = 0
 ~ inCrescita = 1
 {debug: Entro in da_lista_a_coltivazioni. Il valore di counter è {counter}, il valore di inCrescita è {inCrescita}. firstQuest è {firstQuest}, secondQuest è {secondQuest}, thirdQuest è {thirdQuest}}
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