=== storylets_mentore ===
{
//Introduzioni
    - presentazioni == 0:
        -> presentazioni
    - dono_e_inchiostro == 0:
                -> dono_e_inchiostro
        
    - not domande_e_obiettivo:
        {
            - dono_storia_uno.esito_inchiostro:
                -> domande_e_obiettivo
            - else: Mentore: Fai la tua offerta e poi torna da me.
                -> main
        }
        
    - not feedback_personaggia_uno:
        {
            - storiaUno == Conclusa:
                -> feedback_personaggia_uno

        }
        
    
//Presentazione dei luoghi
    - are_entities_together_in(PG, Mentore, Greenhouse) && not prima_visita_funghi:
        -> prima_visita_funghi

    - are_entities_together_in(PG, Mentore, Libary) && not prima_visita_Libary:
        -> prima_visita_Libary

    - are_entities_together_in(PG, Mentore, Nest) && not prima_visita_Nest:
        -> prima_visita_Nest

    - are_entities_together_in(PG, Mentore, Laboratory) && not prima_visita_Laboratory:
        -> prima_visita_Laboratory

    - are_entities_together_in(PG, Mentore, BusStop) && not prima_visita_bus_stop:
        -> prima_visita_bus_stop
 
//Da creare: storylets per quando anime (non animelle) e Mentore sono assieme

    - else: ->->

}


//Passiamo da qui solo a inizio del gioco.
=== inizio
<i>Qualcuno sembra attenderti, sereno e sorridente.</i>
    + [Voglio parlargli.]
        -> presentazioni
    + [Preferisco continuare a curiosare in giro.]
        -> main
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
    Mentore: Riscrivere è un lavoro faticoso, e per questo è importante che ogni {pronouns has maschili: riscrittore|{pronouns has femminili: riscrittora|riscrittorə}} abbia dei momenti per prendersi cura di sé.
    Mentore: Tornaci spesso: tutto nel giardino cambia spesso.
    {
    - doniTrovati hasnt BrinaDellImpossibile: Uh, e poi a volte qui crescono doni utili per parlare con gli spettri. Tieni questo pezzettino di Brina dell'Impossibile.
        <i>Le linee della tua mano si fanno trasparenti. Il vento le attraversa, eppure le dita funzionano correttamente e non senti dolore.</i>
        ~ doniTrovati += BrinaDellImpossibile
    }

    -> main

=== prima_visita_bus_stop
    Mentore: Questa è la fermata del bus.
    Mentore: Ehm, forse le tombe potevano darne una mezza idea.
    Mentore: Questo è un posto di ristoro e meditazione, e per questo motivo non incontrerai nessun altro a parte me e gli spettri.
    Mentore: Uno alla volta, per concedere loro la giusta intimità.
    Mentore: Anche per questo ho poco da dire: quello che conta sono le loro storie.

    -> main

=== prima_visita_Nest

    -> main


=== prima_visita_Libary

    -> main


=== prima_visita_sirene

    -> main

=== prima_visita_Laboratory

    -> main
