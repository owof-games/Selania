//Variabili per la gestione della serra
LIST coltivazioni = licheneDegliAbissi, muschioDelleAmanti, cantoDelleCompagne, laSpazzata, baccaDellaAddolorata, nonTiScordarDiTe

LIST tipoColtivazioni = collaborazione, ciclicità, novità, cancellazione, ricordo, indipendenza

VAR pianteCollaborazione = (licheneDegliAbissi, muschioDelleAmanti, cantoDelleCompagne)
VAR pianteCiclicità = (licheneDegliAbissi, cantoDelleCompagne, nonTiScordarDiTe)
VAR pianteIndipendenza = (laSpazzata, baccaDellaAddolorata, nonTiScordarDiTe)
VAR pianteNovità =(muschioDelleAmanti,laSpazzata, baccaDellaAddolorata)
VAR pianteRicordo =(muschioDelleAmanti, cantoDelleCompagne, nonTiScordarDiTe)
VAR pianteCancellazione =(licheneDegliAbissi,laSpazzata, baccaDellaAddolorata)

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
Sassi, foglie e acqua ha qualcosa da raccontarti.
L'aria si muove tra le fronde, portandoti storie lontane.
    -> test

=== test
{
    - counter < 2: -> random
    - counter == 2: -> results
}

= random
~ temp dice = RANDOM(1,3)
{dice:
    - 1 && !firstQuest:
        -> first_question
    - 2 && !secondQuest: 
        -> second_question
    - 3 && !thirdQuest:
        -> third_question
    - else:
        -> random
}


    = first_question
     ~ firstQuest = true
 
        Sul terreno le foglie e i sassi...
            + [{~ Si sfiorano|Si perdono gli uni nelle altre}]
                ~ tipoColtivazioni += collaborazione
            + [{~ Si osservano distaccati|Difendono i propri confini}]
                ~ tipoColtivazioni += indipendenza    
            -   
            ~ counter ++
            -> test
    
    = second_question
    ~ secondQuest = true

        L'aria...
            + [{~ Insegue sé stessa, gioca con le foglie creando mulinelli|Ruota e ruzzola portando odori dal passato}]
                ~ tipoColtivazioni += ciclicità
            + [{~ È scoppiettante, fremente, carica di elettricità|Esplora cautamente ogni angolo della serra}]
                ~ tipoColtivazioni += novità    
            -   
            ~ counter ++
            -> test
    

    = third_question
     ~ thirdQuest = true
        L'acqua...
            + [{~ È ferma, mossa solo sulla superficie|È torbida|È piena di foglie e petali}]
                ~ tipoColtivazioni += ricordo
            + [{~ Scava, portando con sé il terriccio|Schiaccia foglie e sassi|La sua voce è potente}]
                ~ tipoColtivazioni += cancellazione    
            -   
            ~ counter ++
            -> test



 
 === results
 ~ firstQuest = false
 ~ secondQuest = false
 ~ thirdQuest = false
 ~ counter = 0
 ~ inCrescita = 1
{~ Qualcosa sta crescendo|Qualcosa è cambiato|Ora, devi solo aspettare}.
    
    {
    - tipoColtivazioni == (collaborazione, ciclicità):
        ~ fungoProposto = LIST_RANDOM(pianteCollaborazione ^ pianteCiclicità)
        -> da_lista_a_coltivazioni
        
    - tipoColtivazioni == (collaborazione, novità):
        ~ fungoProposto = LIST_RANDOM(pianteCollaborazione ^ pianteNovità)
        -> da_lista_a_coltivazioni    
        
    - tipoColtivazioni == (collaborazione, cancellazione):
        ~ fungoProposto = LIST_RANDOM(pianteCollaborazione ^ pianteCancellazione)
        -> da_lista_a_coltivazioni
        
    - tipoColtivazioni == (collaborazione, ricordo):
        ~ fungoProposto = LIST_RANDOM(pianteCollaborazione ^ pianteRicordo)
        -> da_lista_a_coltivazioni
        
        
    - tipoColtivazioni == (indipendenza, ciclicità):
        ~ fungoProposto = LIST_RANDOM(pianteIndipendenza ^ pianteCiclicità)
        -> da_lista_a_coltivazioni
                
    - tipoColtivazioni == (indipendenza, novità):
        ~ fungoProposto = LIST_RANDOM(pianteIndipendenza ^ pianteNovità)
        -> da_lista_a_coltivazioni
        
    - tipoColtivazioni == (indipendenza, cancellazione):
            ~ fungoProposto = LIST_RANDOM(pianteIndipendenza ^ pianteCancellazione)
        -> da_lista_a_coltivazioni
        
    - tipoColtivazioni == (indipendenza, ricordo):
        ~ fungoProposto = LIST_RANDOM(pianteIndipendenza ^ pianteRicordo)
        -> da_lista_a_coltivazioni
        
    - tipoColtivazioni == (ciclicità, cancellazione):
        ~ fungoProposto = LIST_RANDOM(pianteCiclicità ^ pianteCancellazione)
        -> da_lista_a_coltivazioni
        
    - tipoColtivazioni == (ciclicità, ricordo):
        ~ fungoProposto = LIST_RANDOM(pianteCiclicità ^ pianteRicordo)
        -> da_lista_a_coltivazioni
        
    - tipoColtivazioni == (novità, cancellazione):
        ~ fungoProposto = LIST_RANDOM(pianteNovità ^ pianteCancellazione)
        -> da_lista_a_coltivazioni
        
    - tipoColtivazioni == (novità, ricordo):
        ~ fungoProposto = LIST_RANDOM(pianteNovità ^ pianteRicordo)
        -> da_lista_a_coltivazioni    
        
    - else: 
         ~ LIST_RANDOM(tipoColtivazioni)
        -> da_lista_a_coltivazioni
    }
    
 
 
-> da_lista_a_coltivazioni
 
 


=== da_lista_a_coltivazioni ===
{fungoProposto:
    - licheneDegliAbissi:
        -> lichene_degli_abissi
    - muschioDelleAmanti:
        -> muschio_delle_amanti
    - cantoDelleCompagne:
        -> canto_delle_compagne
    - laSpazzata:
        -> la_spazzata
    - baccaDellaAddolorata:
        -> bacca_della_addolorata
    - nonTiScordarDiTe:
        -> non_ti_scordar_di_te
}


-> main