=== mentor_storylets ===
~ temp charName = uppercaseTranslator(seventhCharacterState)
TODO: adatta questa parte alla nuova struttura, e snellisci
{
//Introduzioni

    - welcome == 0:
        -> welcome
    - gifts_and_ink == 0:
                -> gifts_and_ink
        
    - not questions:
        {
            - first_story_gift.ink_outcome:
                -> questions
            - else: {charName}:  Fai la tua offerta e poi torna da me.
                -> main
        }
        
    - not first_character_feedback:
        {
            - firstStory == Ended:
                -> first_character_feedback
            - else:
                ->->

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

    - else:
        -> main

}



// STORYLETS PRESENTAZIONE DEI LUOGHI
=== first_greenhouse_visit
~ temp charName = uppercaseTranslator(seventhCharacterState)
    {charName}: Hai trovato le serre!
    {charName}: Qui puoi far crescere moltissime cose del sottobosco.
    {charName}: Tutte quelle cosine che tendiamo a ignorare ma sono fondamentali per la vita.
    {charName}: Sapevi ad esempio che i funghi sono il punto di contatto tra vita e morte?
    {charName}: Trasformano la materia inorganica e in decomposizione in sostanze fondamentali per i viventi.
    {charName}: Senza funghi la vita stessa sarebbe impensabile.
    {charName}: E poi hanno migliaia di odori diversi, per la gioia del mio nasino.
    {charName}: Qui svolgono anche un'altra funzione:
    {charName}: consegnando loro ciò che vogliamo che rimanga nel passato, ci offrono nutrimenti per il presente e il futuro.
    {charName}: Riscrivere è un lavoro faticoso, e per questo è importante che ogni {pronouns has him: riscrittore|{pronouns has her: riscrittora|riscrittorə}} abbia dei momenti per prendersi cura di sé.
    {charName}: Tornaci spesso: tutto nel giardino cambia spesso.

    
        + [Opzione che aumenta il blu]
            ~ seventhBlue ++
        + [Opzione che aumenta il giallo]
            ~ seventhYellow ++
        + [Opzione che aumenta il rosso]
            ~ seventhRed ++
        + [Opzione che aumenta il verde]
            ~ seventhGreen ++
        + [Opzione che aumenta il viola]
            ~ seventhPurple ++
        -         
    -> main

=== first_bus_stop_visit
~ temp charName = uppercaseTranslator(seventhCharacterState)
    {charName}: Questa è la fermata del bus.
    {charName}: Ehm, forse le tombe potevano darne una mezza idea.
    {charName}: Questo è un posto di ristoro e meditazione, e per questo motivo non incontrerai nessun altro a parte me e gli spettri.
    {charName}: Uno alla volta, per concedere loro la giusta intimità.
    {charName}: Anche per questo ho poco da dire: quello che conta sono le loro storie.
        + [Opzione che aumenta il blu]
            ~ seventhBlue ++
        + [Opzione che aumenta il giallo]
            ~ seventhYellow ++
        + [Opzione che aumenta il rosso]
            ~ seventhRed ++
        + [Opzione che aumenta il verde]
            ~ seventhGreen ++
        + [Opzione che aumenta il viola]
            ~ seventhPurple ++
        - 

    -> main

=== first_nest_visit
~ temp charName = uppercaseTranslator(seventhCharacterState)

    -> main


=== first_library_visit
~ temp charName = uppercaseTranslator(seventhCharacterState)

    -> main


=== first_laboratory_visit
~ temp charName = uppercaseTranslator(seventhCharacterState)

    -> main
