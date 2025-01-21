=== mentor_storylets ===
{
//Introduzioni
    - welcome == 0:
        -> welcome
    - gifts_and_ink == 0:
                -> gifts_and_ink
        
    - not questions:
        {
            - dono_storia_uno.esito_inchiostro:
                -> questions
            - else: Mentore: Fai la tua offerta e poi torna da me.
                -> main
        }
        
    - not first_character_feedback:
        {
            - firstStory == Ended:
                -> first_character_feedback

        }
        
    
//Presentazione dei luoghi
    - are_entities_together_in(PG, Mentor, Greenhouse) && not first_greenhouse_visit:
        -> first_greenhouse_visit

    - are_entities_together_in(PG, Mentor, Libary) && not first_library_visit:
        -> first_library_visit

    - are_entities_together_in(PG, Mentor, Nest) && not first_nest_visit:
        -> first_nest_visit

    - are_entities_together_in(PG, Mentor, Laboratory) && not first_laboratory_visit:
        -> first_laboratory_visit

    - are_entities_together_in(PG, Mentor, BusStop) && not first_bus_stop_visit:
        -> first_bus_stop_visit
 
//Da creare: storylets per quando anime (non animelle) e Mentor sono assieme

    - else: ->->

}



// STORYLETS PRESENTAZIONE DEI LUOGHI
=== first_greenhouse_visit
    Mentore: Hai trovato le serre!
    Mentore: Qui puoi far crescere moltissime cose del sottobosco.
    Mentore: Tutte quelle cosine che tendiamo a ignorare ma sono fondamentali per la vita.
    Mentore: Sapevi ad esempio che i funghi sono il punto di contatto tra vita e morte?
    Mentore: Trasformano la materia inorganica e in decomposizione in sostanze fondamentali per i viventi.
    Mentore: Senza funghi la vita stessa sarebbe impensabile.
    Mentor: E poi hanno migliaia di odori diversi, per la gioia del mio nasino.
    Mentor: Qui svolgono anche un'altra funzione:
    Mentor: consegnando loro ciò che vogliamo che rimanga nel passato, ci offrono nutrimenti per il presente e il futuro.
    Mentor: Riscrivere è un lavoro faticoso, e per questo è importante che ogni {pronouns has him: riscrittore|{pronouns has her: riscrittora|riscrittorə}} abbia dei momenti per prendersi cura di sé.
    Mentor: Tornaci spesso: tutto nel giardino cambia spesso.
    {
    - findedGifts hasnt BrinaDellImpossibile: Uh, e poi a volte qui crescono doni utili per parlare con gli spettri. Tieni questo pezzettino di Brina dell'Impossibile.
        <i>Le linee della tua mano si fanno trasparenti. Il vento le attraversa, eppure le dita funzionano correttamente e non senti dolore.</i>
        ~ findedGifts += BrinaDellImpossibile
    }

    -> main

=== first_bus_stop_visit
    Mentor: Questa è la fermata del bus.
    Mentor: Ehm, forse le tombe potevano darne una mezza idea.
    Mentor: Questo è un posto di ristoro e meditazione, e per questo motivo non incontrerai nessun altro a parte me e gli spettri.
    Mentor: Uno alla volta, per concedere loro la giusta intimità.
    Mentor: Anche per questo ho poco da dire: quello che conta sono le loro storie.

    -> main

=== first_nest_visit

    -> main


=== first_library_visit

    -> main


=== first_laboratory_visit

    -> main
