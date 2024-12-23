=== storylets_mentore ===
{
//Introduzioni
    - inizio == 0:
    -> inizio
    //- presentazioni == 0: -> presentazioni
    - tutorial == 0:
    -> tutorial

//Presentazione dei luoghi
    - are_entities_together_in(PG, Mentore, Funghi) && not prima_visita_funghi: -> prima_visita_funghi

    - are_entities_together_in(PG, Mentore, Biblioteca) && not prima_visita_biblioteca:
    -> prima_visita_biblioteca

    - are_entities_together_in(PG, Mentore, Sirene) && not prima_visita_sirene: -> prima_visita_sirene

    - are_entities_together_in(PG, Mentore, Falene) && not prima_visita_falene: -> prima_visita_falene

    - are_entities_together_in(PG, Mentore, Tisane) && not prima_visita_tisane: -> prima_visita_tisane

    - are_entities_together_in(PG, Mentore, Mausoleo) && not prima_visita_mausoleo:
    -> prima_visita_mausoleo
 
//Da creare: storylets per quando anime (non animelle) e Mentore sono assieme

- else: ->->

}

+ ->
-> DONE

//Passiamo da qui solo a inizio del gioco.
=== inizio
La storia inizia ora
    + Qualcuno ti osserva: gli parli
        -> presentazioni
    -
-> main

// STORYLETS PRESENTAZIONE DEI LUOGHI
=== prima_visita_funghi
    Mentore: Hai trovato il nostro orto, il regno degli odori.
    Mentore: Questo è un posto speciale.
    Mentore: Sapevi che i funghi sono il punto di contatto tra vita e morte?
    Mentore: Trasformano la materia inorganica e in decomposizione in sostanze fondamentali per i viventi.
    Mentore: Senza funghi la vita stessa sarebbe impensabile.
    Mentore: E poi hanno migliaia di odori diversi, per la gioia del mio nasino.
    Mentore: Qui svolgono anche un'altra funzione:
    Mentore: consegnando loro ciò che vogliamo che rimanga nel passato, ci offrono nutrimenti per il presente e il futuro.
    Mentore: Riscrivere è un lavoro faticoso, e per questo è importante che ogni {pronomi has maschili: riscrittore|{pronomi has femminili: riscrittora|riscrittorə}} abbia dei momenti per prendersi cura di sé.
    Mentore: Tornaci spesso: tutto nel giardino cambia spesso.

-> main

=== prima_visita_mausoleo

-> main

=== prima_visita_falene

-> main


=== prima_visita_biblioteca

-> main


=== prima_visita_sirene

-> main

=== prima_visita_tisane

-> main

TODO: Da creare: storylets per quando anime (non animelle) e Mentore sono assieme