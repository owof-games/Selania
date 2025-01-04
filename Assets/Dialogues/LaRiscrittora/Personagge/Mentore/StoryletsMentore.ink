=== storylets_mentore ===
{
//Introduzioni
    - inizio == 0:
        -> inizio
    
//Presentazione dei luoghi
    - are_entities_together_in(PG, Mentore, Funghi) && not prima_visita_funghi:
        -> prima_visita_funghi

    - are_entities_together_in(PG, Mentore, Biblioteca) && not prima_visita_biblioteca:
        -> prima_visita_biblioteca

    - are_entities_together_in(PG, Mentore, Sirene) && not prima_visita_sirene:
        -> prima_visita_sirene

    - are_entities_together_in(PG, Mentore, Falene) && not prima_visita_falene:
        -> prima_visita_falene

    - are_entities_together_in(PG, Mentore, Tisane) && not prima_visita_tisane:
        -> prima_visita_tisane

    - are_entities_together_in(PG, Mentore, Mausoleo) && not prima_visita_mausoleo:
        -> prima_visita_mausoleo
 
//Da creare: storylets per quando anime (non animelle) e Mentore sono assieme

    - else: ->->

}


//Passiamo da qui solo a inizio del gioco.
=== inizio
<>Qualcuno sembra attenderti, sereno e sorridente</i>
    + [Voglio parlargli]
        -> presentazioni
    -
    -> main

// STORYLETS PRESENTAZIONE DEI LUOGHI
=== prima_visita_funghi
    Mentore: Hai trovato le serre!
    Mentore: Qui puoi far crescere moltissime cose del sottobosco.
    Mentore: Tutte quelle cosine che tendiamo a ignorare ma sono fondamentali per la vita.
    Mentore: Sapevi ad esempio che i funghi sono il punto di contatto tra vita e morte?
    Mentore: Trasformano la materia inorganica e in decomposizione in sostanze fondamentali per i viventi.
    Mentore: Senza funghi la vita stessa sarebbe impensabile.
    Mentore: E poi hanno migliaia di odori diversi, per la gioia del mio nasino.
    Mentore: Qui svolgono anche un'altra funzione:
    Mentore: consegnando loro ciò che vogliamo che rimanga nel passato, ci offrono nutrimenti per il presente e il futuro.
    Mentore: Riscrivere è un lavoro faticoso, e per questo è importante che ogni {pronomi has maschili: riscrittore|{pronomi has femminili: riscrittora|riscrittorə}} abbia dei momenti per prendersi cura di sé.
    Mentore: Tornaci spesso: tutto nel giardino cambia spesso.
    {
    - doniTrovati hasnt BrinaDellImpossibile: Uh, e poi a volte qui crescono doni utili per parlare con gli spettri. Tieni questo pezzettino di Brina dell'Impossibile.
        <i>Le linee della tua mano si fanno trasparenti. Il vento le attraversa, eppure le dita funzionano correttamente e non senti dolore</i>
        ~ doniTrovati += BrinaDellImpossibile
    }

    -> main

=== prima_visita_mausoleo
    Mentore: Questo è il mausoleo.
    Mentore: Ehm, forse le tombe potevano darne una mezza idea.
    Mentore: Questo è un posto di ristoro e meditazione, e per questo motivo non incontrerai nessun altro a parte me e gli spettri.
    Mentore: Uno alla volta, per concedere loro la giusta intimità.
    Mentore: Anche per questo ho poco da dire: quello che conta sono le loro storie.

    -> main

=== prima_visita_falene

    -> main


=== prima_visita_biblioteca

    -> main


=== prima_visita_sirene

    -> main

=== prima_visita_tisane

    -> main
